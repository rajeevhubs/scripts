sudo apt-get update

# Installing build essentials
sudo apt-get install -y build-essential libssl-dev

# Git - a version control system
sudo apt-get update
sudo apt-get install -y git xclip

# Vim, Curl, Python - Some random useful stuff
sudo apt-get install -y vim curl python-software-properties
sudo apt-get install -y python-dev, python-pip
sudo apt-get install -y libkrb5-dev

# Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
# Docker-compose
sudo pip install docker-compose

# Atom 
curl -L https://atom.io/download/deb -o atom-amd64.deb
sudo dpkg -i atom-amd64.deb
sudo apt-get -f install

# install dependencies,it's easy here
sudo apt install -y cmake
# install basic tools
sudo apt install -y build-essential autoconf libtool pkg-config

# clone from github and install it,I installed v1.34.1 here
git clone --recurse-submodules -b v1.34.1 https://github.com/grpc/grpc
cd grpc

# use Bazel to build
# Failed to use cmake build at last time

# install Bazel
sudo apt install curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" \
| sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update && sudo apt install bazel
sudo apt update && sudo apt full-upgrade
sudo apt install openjdk-11-jdk

# Build gRPC
bazel build :all
bazel test --config=dbg //test/...

# Install
cmake -DgRPC_INSTALL=ON \ ./

make 
make install 
