<?php
require_once ("model.php");

class Checkout extends Model
{
  function save($data)
  {
    $f = "";
    $v = "";
    foreach ($data as $key => $value) {
      $f .= $key . ",";
      $v .= "'" . $value . "',";
    }
    $f = trim($f, ",");
    $v = trim($v, ",");

    // Kiểm tra số lượng sản phẩm trong giỏ hàng
    $all_products_available = true; // Biến để kiểm tra nếu tất cả sản phẩm đều có đủ số lượng

    foreach ($_SESSION['sanpham'] as $value) {
      $MaSP = $value['MaSP'];
      $SoLuong = $value['SoLuong'];

      // Kiểm tra tồn tại sản phẩm và số lượng đủ để bán
      $query_sl = "SELECT SoLuong FROM sanpham WHERE MaSP = $MaSP";
      $data_sl = $this->conn->query($query_sl)->fetch_assoc();

      if (!$data_sl || $data_sl['SoLuong'] < $SoLuong) {
        $all_products_available = false; // Sản phẩm không tồn tại hoặc không đủ số lượng
        break; // Ngừng kiểm tra ngay khi phát hiện một sản phẩm không đủ số lượng
      }
    }

    if ($all_products_available) {
      // Nếu tất cả sản phẩm đều có đủ số lượng, tiến hành thêm hóa đơn
      $query = "INSERT INTO HoaDon($f) VALUES ($v);";
      $status = $this->conn->query($query);

      if ($status) {
        // Lấy MaHD của hóa đơn vừa thêm
        $query_mahd = "SELECT MaHD FROM hoadon ORDER BY NgayLap DESC LIMIT 1";
        $data_mahd = $this->conn->query($query_mahd)->fetch_assoc();
        $MaHD = $data_mahd['MaHD'];
        $status_ct = true; // Khởi tạo biến kiểm tra tình trạng thêm chi tiết hóa đơn

        foreach ($_SESSION['sanpham'] as $value) {
          $MaSP = $value['MaSP'];
          $SoLuong = $value['SoLuong'];
          $DonGia = $value['DonGia'];

          // Thêm vào chi tiết hóa đơn
          $query_ct = "INSERT INTO chitiethoadon(MaHD, MaSP, SoLuong, DonGia) VALUES ($MaHD, $MaSP, $SoLuong, $DonGia)";
          $status_ct = $this->conn->query($query_ct);

          // Cập nhật số lượng sản phẩm nếu thêm chi tiết hóa đơn thành công
          if ($status_ct) {
            $query_update = "UPDATE sanpham SET SoLuong = SoLuong - $SoLuong WHERE MaSP = $MaSP";
            $this->conn->query($query_update);
          }
        }

        if ($status_ct) {
          setcookie('msg', 'Đăng ký thành công', time() + 2);
          header('Location: ?act=checkout&xuli=order_complete');
          exit(); // Đảm bảo script dừng lại sau khi điều hướng
        } else {
          setcookie('msg', 'Đăng ký không thành công: Lỗi khi thêm chi tiết hóa đơn', time() + 2);
          header('Location: ?act=checkout');
          exit();
        }
      } else {
        setcookie('msg', 'Đăng ký không thành công: Không thể thêm hóa đơn', time() + 2);
        header('Location: ?act=checkout');
        exit();
      }
    } else {
      // Nếu không có đủ số lượng sản phẩm, hiển thị thông báo lỗi
      setcookie('msg', 'Sản phẩm không đủ số lượng hoặc không tồn tại', time() + 2);
      header('Location: ?act=cart');
      exit(); // Đảm bảo script dừng lại sau khi điều hướng
    }
  }
}
