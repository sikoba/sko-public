FROM golang:1.14.6
# install go
WORKDIR /go
COPY . .
# Installing various dependencies below
RUN apt-get update -y
# install apt-utils
RUN apt-get install -y apt-utils
# install zip
RUN apt-get install -y zip
# install nano
RUN apt install nano
# install gox
RUN go get github.com/mitchellh/gox
# installing babble
RUN mkdir -p /go/src/github.com/sikoba/
WORKDIR /go/src/github.com/sikoba
RUN git clone https://github.com/sikoba/babble.git
WORKDIR /go/src/github.com/sikoba/babble/
RUN ./scripts/dist_build.sh
RUN echo "export PATH=$PATH:/go/src/github.com/sikoba/babble/build/pkg/linux_amd64" >> ~/.bashrc
RUN . ~/.profile
WORKDIR /go/src/github.com/sikoba/babble/build/pkg/linux_amd64
