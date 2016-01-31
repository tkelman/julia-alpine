FROM alpine:edge

RUN apk update && apk add git
RUN git clone git://git.sv.gnu.org/libunwind.git /home/libunwind
WORKDIR /home/libunwind
RUN apk add autoconf automake libtool gcc libc-dev
RUN ./autogen.sh
RUN apk add make linux-headers
# linux-headers for asm/unistd.h, libexecinfo-dev for execinfo.h
RUN apk add libexecinfo-dev --update-cache \
      --repository http://dl-4.alpinelinux.org/alpine/edge/testing/
RUN make
