FROM alpine:edge

RUN apk add --update build-base cmake git
RUN git clone http://llvm.org/git/llvm.git -b release_37
WORKDIR /home/llvm
RUN cmake . && make -j4
