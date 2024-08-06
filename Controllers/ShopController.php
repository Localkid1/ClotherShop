<?php
require_once ("Models/shop.php");

class ShopController
{
    var $shop_model;

    public function __construct()
    {
        $this->shop_model = new Shop();
    }

    function list()
    {
        $data_danhmuc = $this->shop_model->danhmuc();
        $data_loaisp = $this->shop_model->loaisp(0, 8);
        $data_chitietDM = array();

        for ($i = 1; $i <= count($data_danhmuc); $i++) {
            $data_chitietDM[$i] = $this->shop_model->chitietdanhmuc($i);
        }

        $data = [];
        $data_noibat = [];
        $data_tong = 0;

        if (isset($_GET['trang'])) {
            $this->handleTrang($data, $data_noibat, $data_tong);
        } else if (isset($_GET['sp']) && isset($_GET['loai'])) {
            $this->handleLoai($data, $data_noibat, $data_tong);
        } else if (isset($_GET['sp'])) {
            $this->handleDanhMuc($data, $data_noibat, $data_tong);
        } else if (isset($_POST['shop'])) {
            $this->handleShopPost($data, $data_tong);
        } else if (isset($_POST['keyword'])) {
            $this->handleKeywordPost($data, $data_noibat, $data_tong);
        } else {
            $this->handleDefault($data, $data_noibat, $data_tong);
        }

        require_once ('Views/index.php');
    }

    private function handleTrang(&$data, &$data_noibat, &$data_tong)
    {
        $id = $_GET['trang'];
        $limit = 9;
        $start = ($id - 1) * $limit;
        $data = $this->shop_model->limit($start, $limit);
        $data_noibat = $this->shop_model->sanpham_noibat();
        $data_tong = $this->shop_model->count_sp()['tong'];
    }

    private function handleLoai(&$data, &$data_noibat, &$data_tong)
    {
        $data_loai = $this->shop_model->chitiet_loai($_GET['loai'], $_GET['sp']);
        if ($data_loai != null) {
            $data = $this->shop_model->chitiet($data_loai[0]['MaLSP'], $_GET['sp']);
            $data_noibat = $this->shop_model->sanpham_noibat();
            $data_count = $this->shop_model->count_sp_ctdm($_GET['sp'], $data_loai[0]['MaLSP']);
            $data_tong = $data_count['tong'];
        }
    }

    private function handleDanhMuc(&$data, &$data_noibat, &$data_tong)
    {
        $data = $this->shop_model->sanpham_danhmuc(0, 9, $_GET['sp']);
        $data_noibat = $this->shop_model->sanpham_noibat();
        $data_count = $this->shop_model->count_sp_dm($_GET['sp']);
        $data_tong = $data_count['tong'];
    }

    private function handleShopPost(&$data, &$data_tong)
    {
        $chuoi = $_POST['shop'];
        $arr = explode("-", $chuoi);
        $data = $this->shop_model->dongia($arr['0'], $arr['1']);
        $data_tong = count($data);
    }

    private function handleKeywordPost(&$data, &$data_noibat, &$data_tong)
    {
        $data = $this->shop_model->keywork($_POST['keyword']);
        $data_noibat = $this->shop_model->sanpham_noibat();
        $data_tong = count($data);
    }

    private function handleDefault(&$data, &$data_noibat, &$data_tong)
    {
        $id = isset($_GET['trang']) ? $_GET['trang'] : 1;
        $limit = 9;
        $start = ($id - 1) * $limit;
        $data = $this->shop_model->limit($start, $limit);
        $data_noibat = $this->shop_model->sanpham_noibat();
        $data_tong = $this->shop_model->count_sp()['tong'];
    }
}
?>