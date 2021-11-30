FROM perl

WORKDIR /root
COPY init.sh init.sh
COPY kubeconfig kubeconfig
RUN chmod +x init.sh

RUN apt-get clean && apt-get update && apt-get install -y jq locales git
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
WORKDIR /training-entando
RUN git clone https://github.com/entando-samples/ent-project-template.git .
