FROM alpine

RUN apk update && apk add git
RUN git clone https://tkelman@github.com/JuliaLang/julia /tmp/julia
WORKDIR /tmp/julia
RUN apk add build-base m4 bash tar curl
RUN make -j4 -C deps compile-gmp
# buggy:
#RUN make -C deps install-gmp
