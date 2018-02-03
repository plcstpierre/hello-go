package main

import (
	"os"

	log "github.com/sirupsen/logrus"
)

func init() {
	log.SetFormatter(&log.JSONFormatter{})
	log.SetOutput(os.Stdout)
}

func main() {
	log.WithFields(log.Fields{
		"hello": "world",
	}).Info("Hello world!")
}
