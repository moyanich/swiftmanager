<?php require APPROOT . '/views/inc/header.php'; ?>

<section class="login-page section--form">
        <div class="container">
            <div class="row">   
                <div class="col-md-6 offset-md-3 reg-form section--form_inner">
                    <?php flashMessage('register_sucess'); ?>
                    <h3>Register User</h3>

                    <form id="reg-form" name="reg-form" action="<?php echo URLROOT; ?>/users/login" method="POST">

                        <div class="form-group">
                            <label for="inputUsername">Username<sup>*</sup></label>
                            <input type="text" name="username" class="form-control <?php echo (!empty($data['username_err'])) ? 'is-invalid' : '' ; ?>" value="<?php echo $data['username']; ?>" value="<?php echo $data['username']; ?>" />
                            <?php echo (!empty($data['username_err'])) ? '<span class="invalid-feedback">' . $data['username_err'] . '</span>' : '' ; ?>
                        </div>

                        <div class="form-group">
                            <label for="inputPassword">Password<sup>*</sup></label>
                            <input type="password" name="password" class="form-control <?php echo (!empty($data['password_err'])) ? 'is-invalid' : '' ; ?>" value="<?php echo $data['password']; ?>" />
                            <?php echo (!empty($data['password_err'])) ? '<span class="invalid-feedback">' . $data['password_err'] . '</span>' : '' ; ?>
                        </div>
                        
                        <div class="form-group text-center">
                            <input type="submit" name="btn-login" class="btn btn-primary" value="Login" />
                        </div>

                        <div class="form-group">
                            <a href="<?php echo URLROOT; ?>/users/register" class="text-white value="Login">Don't have an account? Register</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>

</section>

<?php require APPROOT . '/views/inc/footer.php'; ?>