FROM alpine:edge

RUN apk add --update make cmake clang openblas
RUN cd /home && wget http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.5.1.tar.gz && \
      tar -xzf SuiteSparse-4.5.1.tar.gz
WORKDIR /home/SuiteSparse
RUN make CC=clang CXX=clang++
