# sample usage:

## cloning repo with ssh key
`sh git.sh -i ~/.ssh/<ssh-private-key> clone ssh://git@<repo url> .`
  
## hard reset repo with specific branch
`sh git.sh -i ~/.ssh/<ssh-private-key> reset --hard origin/<branch> .`
  
## pull latest changes from repo with specific branch
`sh git.sh -i ~/.ssh/<ssh-private-key> pull origin <branch> .`
  
### Assumptions
_* assuming remote server is `origin`_
