FROM alpine:edge

RUN apk add --update build-base cmake git python
RUN git clone git://github.com/tkelman/llvm -b tk/muslfix /home/llvm
WORKDIR /home/llvm/build
RUN cmake .. && make -j4
