<div class="pages-title section-padding">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="pages-title-text text-center">
                    <h2>Quên mật khẩu</h2>
                    <ul class="text-left">
                        <li><a href="?act=home">Trang chủ</a></li>
                        <li class="color1"><span> </span>Quên mật khẩu</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="pages login-page section-padding">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="main-input padding60">
                    <div class="log-title">
                        <h3><strong>Quên mật khẩu</strong></h3>
                    </div>
                    <div class="login-text">
                        <div class="custom-input">
                            <p>Vui lòng nhập địa chỉ email của bạn để nhận liên kết đặt lại mật khẩu.</p>
                            <?php if (isset($_COOKIE['msg_forgot'])) { ?>
                                <div class="alert alert-success">
                                    <strong>Thông báo</strong> <?= $_COOKIE['msg_forgot'] ?>
                                </div>
                            <?php } ?>
                            <form action="?act=login&xuli=forgot_password_action" method="post">
                                <input type="email" name="email" placeholder="Địa chỉ Email" required />
                                <div class="submit-text">
                                    <button type="submit">Gửi yêu cầu</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- forgot_password.php -->