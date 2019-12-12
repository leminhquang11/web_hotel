Project WEBSITE ĐẶT PHÒNG KHÁCH SẠN (BTL môn lập trình web)
```sh
I.Cài đặt môi trường
    "rails", "~> 5.0.7", ">= 5.0.7.2"
     ruby 2.5.5
    "sqlite3", "~> 1.3", "< 1.4"
    
II.FOLLOW THIS STEP TO RUN PROJECT( các câu lệnh trên terminal)
        * clone project về( hoặc tải về)
        * cd/web_hotel 
        * bundle install (hoặc : bundle update )
        * rake assets:clean 
        * rake assets:precompile
        * rake db:migrate
        * rake db:seed
        * rails s
        * vào trình duyệt nhập : http://localhost:3000/

III.Các chức năng của trang web
    1. Chức năng của người dùng khi chưa đăng nhập
        - Xem danh sách các khách sạn
        - Xem chi tiết thông tin khách sạn
        - Xem review về khách sạn
        - Tìm kiếm khách sạn theo tên
        - Đăng ký tài khoản
    2. Chức năng của người dùng khi đã đăng nhập 
    Note : bên cạnh các chức năng cơ bản như khi chưa đăng nhập, sau khi đăng nhậ người dùng có thể : 
        - Đặt phòng khách sạn
        - Thanh toán
        - Viết và sửa ,xóa review về khách sạn của bản thân
        - Xem thông tin của bản thân và sửa thông tin cá nhân
        - Tạo lịch trình cá nhân cho bản thân
    3. Chức năng của Admin
        - Quản lý người dùng
        - Qản lý khách sạn
        - Quản lý các phòng
        - Quản lý đặt phòng
```
