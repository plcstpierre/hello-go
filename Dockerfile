FROM scratch

ADD dist/hello-go /

CMD ["/hello-go"]