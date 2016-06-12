FROM quay.io/tkelman/julia-alpine:creduce

RUN wget -O /tmp/SS.tgz http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.5.3.tar.gz && \
    tar -C /tmp -xzf /tmp/SS.tgz && \
    rm /tmp/SS.tgz && \
    apk add --update make g++ && \
    make -C /tmp/SuiteSparse || echo failed but exiting to save the container here
# cmake openblas --repository http://dl-4.alpinelinux.org/alpine/edge/testing && \
# CC=clang CXX=clang++
