FROM alpine:3.7

# xz and python and cmake to build llvm
# perl to build openblas (also needed in julia's own makefiles)
# gfortran to build openblas or arpack
# linux-headers to build openblas
# m4 to build gmp
# libexecinfo-dev to build libunwind
RUN apk add --update git make tar patch g++ xz python cmake \
    perl gfortran linux-headers m4 libexecinfo-dev
RUN git clone -b tk/fix-alpine-build https://github.com/tkelman/julia /tmp/julia
WORKDIR /tmp/julia
RUN make -j4
#RUN make testall1
