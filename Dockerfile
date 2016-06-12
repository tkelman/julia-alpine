FROM alpine:edge

RUN apk add --update build-base git llvm-dev clang-dev flex zlib-dev \
      perl clang llvm-libs && \
    cpan -i 'Exporter::Lite' && \
    cpan -i 'File::Which' && \
    cpan -i 'Getopt::Tabular' && \
    cpan -i 'Regexp::Common' && \
    git clone https://github.com/csmith-project/creduce /tmp/creduce && \
    mkdir /tmp/creduce/build && \
    cd /tmp/creduce/build && \
    ../configure && \
    make -j4 && \
    make install && \
    rm -rf /tmp/creduce && \
    apk del -r --purge build-base git llvm-dev clang-dev flex zlib-dev
# don't remove perl, clang(-format), or llvm-libs since they're runtime dependencies

# indent (optional)
#    cpan -i 'Term::ReadKey' # fails tests when installed non-interactively?
#    cpan -i 'Sys::CPU' # does not build on alpine, sys/unistd.h
