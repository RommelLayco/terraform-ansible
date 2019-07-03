FROM python:3.7


ENV ANSIBLE_VERSION=2.7.6
ENV TERRAFORM_VERSION=0.11.13

# Install ansible
RUN pip install ansible==${ANSIBLE_VERSION}

# Do not do strict host key checking for ansible-galaxy or ansible playbooks
COPY ssh_config /root/.ssh/config

# Install terraform
RUN curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip -d /usr/bin terraform_${TERRAFORM_VERSION}_linux_amd64.zip

CMD ["/bin/bash"]
