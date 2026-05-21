# Use a stable Debian base
FROM debian:bookworm-slim

# Install build dependencies  
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    libgpiod-dev \
    libmosquittopp-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone the aquaticus repository
RUN git clone https://github.com/aquaticus/nexus433 /nexus433
# OR 
# RUN git clone https://github.com/georgi-doychev/nexus433 /nexus433

# Build the project using CMake with the build type defined
RUN cd /nexus433 && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=RELEASE .. && \
    make

# Copy your run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
