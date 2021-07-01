FROM debian:buster

RUN apt-get update && apt-get install -y apt-transport-https curl gnupg &&\
    llvmRepository="\n\
deb http://apt.llvm.org/buster/ llvm-toolchain-buster main\n\
deb-src http://apt.llvm.org/buster/ llvm-toolchain-buster main\n" &&\
    echo $llvmRepository >> /etc/apt/sources.list && \
    curl -L https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -


# Maybe add
# deb http://apt.llvm.org/buster/ llvm-toolchain-buster-${LLVM_VERSION} main\n\
# deb-src http://apt.llvm.org/buster/ llvm-toolchain-buster-${LLVM_VERSION} main\n


RUN apt update
RUN apt install -y \
    git \ 
    make \ 
    gnupg2 \
    tree \
    apt-transport-https \
    clang \
    lld \
    libaio-dev \
    libapparmor-dev \
    libattr1-dev \
    libbsd-dev \
    libcap-dev \
    libgcrypt-dev \
    libipsec-mb-dev \
    libjudy-dev \
    libkeyutils-dev \
    libsctp-dev \
    libatomic1 \
    zlib1g-dev 

RUN git clone https://github.com/ColinIanKing/stress-ng \
    && cd stress-ng \
    && make clean \
    && STATIC=1 make -j$(nproc)
