FROM alpine:edge

RUN apk update && apk add build-base cmake
RUN cd /home && wget http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.5.1.tar.gz && \
      tar -xzf SuiteSparse-4.5.1.tar.gz
WORKDIR /home/SuiteSparse
RUN make
