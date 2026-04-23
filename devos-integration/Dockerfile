FROM alpine:3.19

RUN apk add --no-cache curl bash

COPY test.sh /test.sh
RUN chmod +x /test.sh

CMD ["/bin/sh", "/test.sh"]
