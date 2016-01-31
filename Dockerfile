FROM alpine:edge

RUN apk add --update build-base cmake git python
RUN git clone http://llvm.org/git/llvm.git -b release_38 /home/llvm
WORKDIR /home/llvm/build
RUN cmake .. && make -j4
