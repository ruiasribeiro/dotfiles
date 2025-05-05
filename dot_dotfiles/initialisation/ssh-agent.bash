eval "$(ssh-agent -s)"
ssh-add -k ~/.ssh/id.rsa
ssh -T git@github.com
