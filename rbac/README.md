- Đánh giá nguyên tắc Least Privilege ("Đủ nhưng không thừa"):
+ Quyền đã cấp là ĐỦ:
  * Lập trình viên nhóm Frontend (developer-frontend) được cấp đầy đủ các động từ (verbs: get, list, watch, create, update, patch, delete) trên các tài nguyên thiết yếu gồm Pods, Pod Logs, Services, ConfigMaps, Deployments và ReplicaSets trong phạm vi namespace frontend.
  * Mức quyền này đáp ứng trọn vẹn nhu cầu triển khai ứng dụng, cập nhật cấu hình môi trường và xem nhật ký lỗi (logs) để gỡ lỗi trong suốt vòng đời phát triển phần mềm mà không gặp trở ngại.

+ Quyền không bị THỪA:
  * Loại bỏ hoàn toàn quyền đọc Secret: Bảo vệ an toàn tuyệt đối cho các thông tin nhạy cảm, chứng chỉ và mật khẩu kết nối database không bị lập trình viên vô tình hay cố ý khai thác.
  * Tước bỏ mọi quyền thao tác cấp độ cụm (Cluster-wide): Lập trình viên không thể xóa Namespace, không can thiệp vào Node, PersistentVolume hay Custom Resource Definition (CRD).
  * Phạm vi phân quyền bị đóng khung tuyệt đối trong namespace frontend: Ngăn chặn triệt để hành vi can thiệp chéo sang các phân vùng dịch vụ khác như backend hay database, đảm bảo thu hẹp tối đa vùng ảnh hưởng sự cố (Blast Radius).
