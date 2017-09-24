FROM alpine:edge

RUN printf -- "#!/bin/sh\n\"\$@\"">/exe && chmod +x /exe
ENTRYPOINT ["/exe"]

CMD ["echo","That's all folks!"]
