FROM centos:7

ENV ANSIBLE_VERSION=2.7.6
ENV TERRAFORM_VERSION=0.11.13

# Install git
RUN yum install -y git

# Install ansible
RUN yum install epel-release unzip -y && yum install python-pip -y
RUN pip install ansible==${ANSIBLE_VERSION}

# Do not do strict host key checking for ansible-galaxy or ansible playbooks
COPY ssh_config /root/.ssh/config

# Install packer
RUN curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip -d /usr/bin terraform_${TERRAFORM_VERSION}_linux_amd64.zip

CMD ["/bin/bash"]
