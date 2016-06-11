FROM alpine:edge

RUN apk add --update build-base git llvm clang llvm-dev clang-dev \
      perl-dev flex zlib-dev indent
RUN cpan -i 'Exporter::Lite' && \
      cpan -i 'File::Which' && \
      cpan -i 'Getopt::Tabular' && \
      cpan -i 'Regexp::Common'
#      cpan -i 'Term::ReadKey' # fails tests when installed non-interactively?
#      cpan -i 'Sys::CPU' # does not build on alpine, sys/unistd.h
RUN git clone https://github.com/csmith-project/creduce /tmp/creduce
RUN mkdir /tmp/creduce/build && cd /tmp/creduce/build && ../configure && \
      make -j4 && make install
