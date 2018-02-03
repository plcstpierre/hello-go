FROM scratch

ADD dist/hello /

CMD ["/hello"]