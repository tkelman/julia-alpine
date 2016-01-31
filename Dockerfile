FROM alpine:edge

RUN apk update && apk add git curl build-base
RUN curl -L http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.5.1.tar.gz | \
      tar -xf -C /home -
WORKDIR /home/SuiteSparse-4.5.1
RUN make
