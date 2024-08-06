<!-- reset_password.php -->
<div class="pages-title section-padding">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="pages-title-text text-center">
                    <h2>Đặt lại mật khẩu</h2>
                    <ul class="text-left">
                        <li><a href="?act=home">Trang chủ</a></li>
                        <li><span> // </span>Đặt lại mật khẩu</li>
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
                        <h3><strong>Đặt lại mật khẩu</strong></h3>
                    </div>
                    <div class="login-text">
                        <div class="custom-input">
                            <p>Vui lòng nhập mật khẩu mới của bạn.</p>
                            <?php if (isset($_COOKIE['msg_reset'])) { ?>
                                <div class="alert alert-success">
                                    <strong>Thông báo</strong> <?= $_COOKIE['msg_reset'] ?>
                                </div>
                            <?php } ?>
                            <form action="?act=login&xuli=reset_password_action" method="post">
                                <input type="hidden" name="token" value="<?php echo $_GET['token']; ?>" />
                                <input type="password" name="new_password" placeholder="Mật khẩu mới" required
                                    minlength="6" />
                                <input type="password" name="confirm_password" placeholder="Xác nhận mật khẩu mới"
                                    required minlength="6" />
                                <div class="submit-text">
                                    <button type="submit">Đặt lại mật khẩu</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>