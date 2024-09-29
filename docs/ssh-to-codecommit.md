Dưới đây là hướng dẫn chi tiết cách thiết lập SSH public keys cho AWS CodeCommit:

## Thiết lập SSH public keys cho AWS CodeCommit

### Bước 1: Tạo cặp khóa SSH

1. Mở terminal trên máy tính của bạn.

2. Chạy lệnh sau để tạo cặp khóa SSH:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

3. Nhấn Enter để lưu khóa vào vị trí mặc định (~/.ssh/id_rsa).

4. Nhập passphrase nếu muốn (khuyến khích để tăng tính bảo mật).

### Bước 2: Lấy nội dung public key

Chạy lệnh sau để hiển thị nội dung public key:

```
cat ~/.ssh/id_rsa.pub
```

Sao chép toàn bộ nội dung hiển thị.

### Bước 3: Thêm public key vào AWS IAM

1. Đăng nhập vào AWS Management Console.

2. Truy cập vào dịch vụ IAM.

3. Chọn "Users" từ menu bên trái, sau đó chọn user của bạn.

4. Chọn tab "Security credentials".

5. Cuộn xuống phần "SSH keys for AWS CodeCommit", chọn "Upload SSH public key".

6. Dán nội dung public key vào ô và chọn "Upload SSH public key".

7. Lưu lại SSH key ID được hiển thị.

### Bước 4: Cấu hình SSH config

1. Tạo hoặc mở file ~/.ssh/config.

2. Thêm cấu hình sau vào file:

```
Host git-codecommit.*.amazonaws.com
  User YOUR_SSH_KEY_ID
  IdentityFile ~/.ssh/id_rsa
```

Thay YOUR_SSH_KEY_ID bằng SSH key ID đã lưu ở bước 3.

### Bước 5: Kiểm tra kết nối

Chạy lệnh sau để kiểm tra kết nối:

```
ssh git-codecommit.us-east-1.amazonaws.com
```

Nếu thành công, bạn sẽ thấy thông báo xác nhận kết nối.

Bây giờ bạn đã có thể sử dụng SSH để truy cập các repository trên AWS CodeCommit[1][2][4].

Citations:
[1] https://monzim.com/blogs/how-to-configure-aws-codecommit
[2] https://github.com/miztiik/setup-aws-code-commit
[3] https://forum.caeruxlab.com/d/106-huong-dan-cai-dat-va-su-dung-aws-codecommit
[4] https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-ssh-unixes.html
[5] https://www.youtube.com/watch?v=84WAdd9phZg
[6] https://onetech.vn/blog/huong-dan-trien-khai-ci-cd-tren-aws-va-jenkins-13918
[7] https://gist.github.com/samson-sham/d409b6b868acc5e6fff24c4bdae112ad
