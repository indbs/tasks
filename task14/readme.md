#key need this fixes
chmod 400 ~/.ssh/aws3.pem
test -z $SSH_AGENT_PID; echo $?
eval $(ssh-agent -s)
test -z $SSH_AGENT_PID; echo $?
ssh-add ~/.ssh/aws3.pem

terraform init
terraform plan
terraform apply -var "pvt_key=~/.ssh/aws3.pem"