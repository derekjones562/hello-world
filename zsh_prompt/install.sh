#!/usr/bin/env bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

cp ./zshrc ~/
cp ./p10k.zsh ~/
read -p "GOPRIVATE domain: " goPrivate
echo GOPRIVATE="$goPrivate" >> ~/.zshrc
echo GOPATH="$GOPATH:/usr/local/opt/go/libexec/bin/go" >> ~/.zshrc
echo GO111MODULE=on >> ~/.zshrc
echo KUBECONFIG=~/.kube/config >> ~/.zshrc

##########
#git config
##########
git config --global url.ssh://git@github.com/.insteadOf https://github.com/
git config --global url.ssh://git@bitbucket.org/.insteadOf https://bitbucket.org/
git config --global url.ssh://git@gitlab.com/.insteadOf https://gitlab.com/

read -p 'Git Domain (format-- github.com):' gitDomain
read -p 'Git Username: ' gitUsername
read -p 'Git Email: ' gitEmail
read -p 'Git Access Token: ' gitAccessToken
git config --global user.name $gitUsername
git config --global user.email $gitEmail


########
#ssh config
########
mkdir ~/.ssh
touch ~/.ssh/config
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""

echo "
  Host *
    StrictHostKeyChecking no
    UseKeychain yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_rsa

  Host $gitDomain
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/${gitDomain}_rsa

  # Private GitLab instance
  # Host gitlab.company.com
    # PreferredAuthentications publickey
    # IdentityFile ~/.ssh/example_com_rsa
" >> ~/.ssh/config

ssh-add -k ~/.ssh/id_rsa
ssh -T git@gitlab.com

# https://docs.gitlab.com/ee/user/ssh.html#configure-ssh-to-point-to-a-different-directory


##########
#  ~/.netrc
#########
touch ~/.netrc

echo "machine $gitDomain
  login $gitUsername
  # personal access token generated on $gitDomain
  # https://go.dev/doc/faq#git_https
  password $gitAccessToken" >> ~/.netrc
