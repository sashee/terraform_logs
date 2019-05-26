* terraform apply
* watch './logs.sh aws_lambda_function.function | tail -n $(($LINES - 2))'
* curl -s $(terraform output | awk '{print $3}')
* terraform destroy
