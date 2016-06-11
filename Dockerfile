FROM alpine:edge

RUN cd /home && wget http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.5.3.tar.gz && \
      tar -xzf SuiteSparse-4.5.3.tar.gz
WORKDIR /home/SuiteSparse
RUN apk add --update make cmake g++ openblas \
      --repository http://dl-4.alpinelinux.org/alpine/edge/testing
RUN make
# CC=clang CXX=clang++
