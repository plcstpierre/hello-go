# https://gist.github.com/subfuzion/0bd969d08fe0d8b5cc4b23c795854a13

SHELL := /bin/bash

# The name of the executable (default is current directory name)
TARGET := $(shell echo $${PWD\#\#*/})
.DEFAULT_GOAL: $(TARGET)

# These will be provided to the target
VERSION := 0.0.1
BUILD := `git rev-parse HEAD`

# Use linker flags to provide version/build settings to the target
LDFLAGS=-ldflags "-X=main.Version=$(VERSION) -X=main.Build=$(BUILD)"
DIST_LDFLAGS=-ldflags "-X=main.Version=$(VERSION) -X=main.Build=$(BUILD) -extldflags '-static'"

DIST_VAR=CGO_ENABLED=0 GOOS=linux

# go source files, ignore vendor directory
SRC = $(shell find . -type f -name '*.go' -not -path "./vendor/*")

.PHONY: build dist clean

all: build

build:
	@dep ensure
	@go build $(LDFLAGS) -o bin/$(TARGET)

dist:
	@${DIST_VAR} go build -a $(DIST_LDFLAGS) -o dist/$(TARGET)

clean:
	@rm -f bin/$(TARGET)
	@rm -f dist/$(TARGET)
