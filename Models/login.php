<?php
require_once ("model.php");
class Login extends Model
{
    var $conn;
    function __construct()
    {
        $conn_obj = new Connection();
        $this->conn = $conn_obj->conn;
    }
    function login_action($data)
    {
        $query = "SELECT * from nguoidung  WHERE taikhoan = '" . $data['taikhoan'] . "' AND matkhau = '" . $data['matkhau'] . "' AND trangthai = 1";

        $login = $this->conn->query($query)->fetch_assoc();
        if ($login !== NULL) {
            if ($login['MaQuyen'] == 2) {
                $_SESSION['isLogin_Admin'] = true;
                $_SESSION['login'] = $login;
            } else {
                if ($login['MaQuyen'] == 3) {
                    $_SESSION['isLogin_Nhanvien'] = true;
                    $_SESSION['login'] = $login;
                } else {
                    $_SESSION['isLogin'] = true;
                    $_SESSION['login'] = $login;
                }
            }
            header('Location: ?mod=login');
        } else {
            setcookie('msg1', 'Đăng nhập không thành công', time() + 5);
            header('Location: ?act=taikhoan#dangnhap');
        }

    }
    function logout()
    {
        if (isset($_SESSION['isLogin_Admin'])) {
            unset($_SESSION['isLogin_Admin']);
            unset($_SESSION['login']);
        }
        if (isset($_SESSION['isLogin_Nhanvien'])) {
            unset($_SESSION['isLogin_Nhanvien']);
            unset($_SESSION['login']);
        }
        if (isset($_SESSION['isLogin'])) {
            unset($_SESSION['isLogin']);
            unset($_SESSION['login']);
        }
        header('location: ?act=home');
    }
    function check_account()
    {
        $query = "SELECT * from NguoiDung";

        require ("result.php");

        return $data;
    }
    function dangky_action($data, $check1, $check2)
    {
        if ($check1 == 0) {
            if ($check2 == 0) {
                $f = "";
                $v = "";
                foreach ($data as $key => $value) {
                    $f .= $key . ",";
                    $v .= "'" . $value . "',";
                }
                $f = trim($f, ",");
                $v = trim($v, ",");
                $query = "INSERT INTO NguoiDung($f) VALUES ($v);";

                $status = $this->conn->query($query);
                if ($status == true) {
                    setcookie('msg', 'Đăng ký thành công', time() + 2);
                } else {
                    setcookie('msg', 'Đăng ký không thành công', time() + 2);
                }
            } else {
                setcookie('msg', 'Mật khẩu không trùng nhau', time() + 2);
            }
        } else {
            setcookie('msg', 'Tên tài khoản hoặc Email  đã tồn tại', time() + 2);
        }
        header('Location: ?act=taikhoan#dangky');
    }
    function account()
    {
        $id = $_SESSION['login']['MaND'];
        return $this->conn->query("SELECT * from NguoiDung where MaND = $id")->fetch_assoc();
    }
    function update_account($data)
    {
        $v = "";
        foreach ($data as $key => $value) {
            $v .= $key . "='" . $value . "',";
        }
        $v = trim($v, ",");

        $query = "UPDATE NguoiDung SET  $v   WHERE  MaND = " . $_SESSION['login']['MaND'];

        $result = $this->conn->query($query);

        if ($result == true) {
            setcookie('doimk', 'Cập nhật tài khoản thành công', time() + 2);
            header('Location: ?act=taikhoan&xuli=account#doitk');
        } else {
            setcookie('doimk', 'Mật khẩu xác nhận không đúng', time() + 2);
            header('Location: ?act=taikhoan&xuli=account#doitk');
        }
    }
    function error()
    {
        header('location: ?act=errors');
    }

    public function store_reset_token($email, $token)
    {
        // Xóa token cũ nếu có
        $this->conn->query("DELETE FROM password_resets WHERE email = '$email'");

        // Lưu token mới
        $query = "INSERT INTO password_resets (email, token, created_at) VALUES ('$email', '$token', NOW())";
        $this->conn->query($query);
    }

    public function verify_reset_token($token)
    {
        // Kiểm tra token có hợp lệ và chưa hết hạn (1 giờ)
        $query = "SELECT email FROM password_resets WHERE token = '$token' AND created_at > NOW() - INTERVAL 1 HOUR";
        $result = $this->conn->query($query);
        if ($result->num_rows > 0) {
            return $result->fetch_assoc()['email'];
        }
        return false;
    }

    public function update_password($email, $new_password)
    {
        // Cập nhật mật khẩu mới cho người dùng
        $query = "UPDATE nguoidung SET matkhau = '$new_password' WHERE email = '$email'";
        $this->conn->query($query);

        // Xóa token sau khi mật khẩu được cập nhật
        $this->conn->query("DELETE FROM password_resets WHERE email = '$email'");
    }

    function reset_password($token, $new_password)
    {
        // Giả sử bạn lưu trữ token trong bảng password_resets
        $query = "SELECT email FROM password_resets WHERE token = '$token'";
        $result = $this->conn->query($query);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $email = $row['email'];

            // Cập nhật mật khẩu mới
            $update_query = "UPDATE nguoidung SET matkhau = '$new_password' WHERE email = '$email'";
            $this->conn->query($update_query);

            // Xóa token sau khi sử dụng
            $delete_query = "DELETE FROM password_resets WHERE token = '$token'";
            $this->conn->query($delete_query);

            return true;
        } else {
            return false;
        }
    }

}
