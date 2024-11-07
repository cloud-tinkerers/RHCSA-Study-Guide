FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git \
    curl \
    gnupg \
    software-properties-common \
    lsb-release \
    wget \
    unzip \
    zsh

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg arch=amd64] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/hashicorp.list

RUN apt-get update && apt-get install -y terraform

# Install terraform-docs
RUN curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.19.0/terraform-docs-v0.19.0-$(uname)-amd64.tar.gz \
    && tar -xzf terraform-docs.tar.gz \
    && chmod +x terraform-docs \
    && mv terraform-docs /usr/local/bin/terraform-docs

RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc > /etc/apt/trusted.gpg.d/microsoft.asc \
    && ver=22.04 \
    && apt-add-repository https://packages.microsoft.com/ubuntu/${ver}/prod \
    && apt-get update && apt-get install -y aztfexport

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# Expose necessary ports for HashiCorp products to access from local machine
EXPOSE 8200 8500 4646 9200 18000 8080 22

CMD ["/bin/zsh"]
