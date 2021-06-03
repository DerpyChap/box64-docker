FROM arm32v7/debian:latest

RUN apt update && apt -y install git \
    build-essential \
    cmake \
    python3

RUN git clone https://github.com/ptitSeb/box86 && \
    cd box86/ && mkdir build && cd build && \
    cmake .. -DARM_DYNAREC=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo && make -j$(nproc) && \
    make install && \
    cd / && rm -rf /box86/ && \
    apt -y purge git build-essential cmake python3 && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
