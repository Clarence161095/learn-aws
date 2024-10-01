1. App này sử dụng được build bằng AWS SAM và sử dụng codebuild với pipeline để deploy.
2. Về chức năng của app này như sau:
   - Mỗi khi có một file mới được upload lên s3 thì sẽ trigger một lambda function để xử lý file đó.
   - Lambda function sẽ đọc file đó và lấy thông tin sau đó tạo một message mới và push vào SQS.
   - Sẽ có 2 Bucket s3, có tên là rc và ac và sẽ có 2 lambda function tương ứng với 2 bucket đó nếu file được upload lên bucket rc thì sẽ trigger lambda function rc và ngược lại và gửi thông tin tới 1 queue duy nhất nhưng với thông tin message tương ứng với file nhận được của từng lambda function. (Lambda sử dụng nodejs 18.x)
3. Cách deploy là đầu tiên tôi sẽ push code lên code commit ở 1 repo. Sau đó khi tôi tạo tags mới trên repo đó thì sẽ trigger codebuild để build và deploy app lên aws.

Tôi chỉ có 1 repo có tên như sau: s3-lambda-sqs-demo và account id của tôi là 108782097001.
cấu trú repo như sau:

```
s3-lambda-sqs-demo
|_ src
|  |_ rcHandler.js
|  |_ acHandler.js
|_ template.yaml
|_ buildspec.yml
|_ package.json
|_ samconfig.toml
|_ README.md
```

tôi muốn trong file package.json có 2 script sau:
```
build: "sam build"
deploy: "sam deploy --no-confirm-changeset --no-fail-on-empty-changeset"
```

Hãy dùng dụng Cloudformation để tạo toàn bộ các resource để hoàn thành app trên.

Chúng ta sẽ làm thành 2 bước:

Bước 1: tạo toàn bộ các file cho s3-lambda-sqs-demo
Bước 2: tạo file cloudformation.yaml để tạo tôi sử dụng aws cli để tạo stack. (file cloudformation.yaml này sẽ được lưu ở local của tôi và không được push lên repo)

Giờ hãy hoàn thành bước 2 giúp tôi.