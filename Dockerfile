FROM alpine:edge

# xz if building llvm
# perl if building openblas (also needed in julia's own makefiles)
# cmake and openssl-dev if building libgit2
# python if building libgit2 or llvm or docs
# linux-headers if building libunwind (also need libexecinfo and a patch)
# gfortran if building openblas or arpack or openspecfun
# m4 if building gmp
#RUN apk add --update git make tar patch xz perl \
RUN apk add --update git make tar patch perl \
    cmake openssl-dev python linux-headers gfortran m4
RUN apk add --update libexecinfo-dev --repository http://dl-4.alpinelinux.org/alpine/edge/testing
RUN git clone https://github.com/JuliaLang/julia /tmp/julia
WORKDIR /tmp/julia
RUN apk add wget g++ llvm-dev
#RUN apk add build-base clang libc-dev
RUN make -j4 USE_SYSTEM_LLVM=1 \
    OPENBLAS_BRANCH=develop OPENBLAS_SHA1=f04af36ad0e85b64f || \
    make USE_SYSTEM_LLVM=1 OPENBLAS_BRANCH=develop OPENBLAS_SHA1=f04af36ad0e85b64f
# USECLANG=1
