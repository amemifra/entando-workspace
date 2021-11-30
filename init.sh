#!/bin/sh

echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen en_US.UTF-8

cd /root
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
curl -L https://get.entando.org/cli | bash
bash <(curl -sfL https://get.entando.org/cli) --update --release="v6.3.2" --cli-version="v6.3.2+5"
source "$HOME/.entando/activate"

printf "\n\n\n\n\n" | ent check-env develop
KUBEPATH=$(which kubectl)
ent kubectl-cmd "${KUBEPATH}"
ent attach-kubeconfig /root/kubeconfig
ent auto-align-kubectl