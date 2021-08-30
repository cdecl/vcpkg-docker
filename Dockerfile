FROM ubuntu:20.10

ENV DEBIAN_FRONTEND=noninteractive; 
RUN apt update && apt install tzdata g++ make cmake git curl unzip tar zip pkg-config -y

RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && echo "Asia/Seoul" > /etc/timezone

RUN git clone https://github.com/Microsoft/vcpkg.git /opt/vcpkg

WORKDIR /opt/vcpkg
RUN ./bootstrap-vcpkg.sh && ./vcpkg integrate install && ./vcpkg integrate bash && echo 'export PATH=$PATH:/opt/vcpkg' >>~/.bashrc

WORKDIR /root
CMD ["bash"]

