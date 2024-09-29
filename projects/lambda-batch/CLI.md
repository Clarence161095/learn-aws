# create stack

```bash
aws cloudformation create-stack --stack-name s3-lambda-sqs-demo --template-body file://cloudformation.yaml --capabilities CAPABILITY_NAMED_IAM
```

delete stack

```bash
aws cloudformation delete-stack --stack-name s3-lambda-sqs-demo
```

```bash
aws cloudformation create-change-set \
  --stack-name s3-lambda-sqs-demo \
  --template-body file://cloudformation.yaml \
  --change-set-name update-roles-and-permissions \
  --capabilities CAPABILITY_NAMED_IAM
```

```bash
aws cloudformation describe-change-set \
  --stack-name s3-lambda-sqs-demo \
  --change-set-name update-roles-and-permissions
```

```bash
aws cloudformation execute-change-set \
  --stack-name s3-lambda-sqs-demo \
  --change-set-name update-roles-and-permissions
```
