<?php require APPROOT . '/views/inc/header.php'; ?>

<section class="login-page section--form">
        <div class="container">
            <div class="row">   
                <div class="col-md-6 offset-md-3 reg-form section--form_inner">
                    <h3>Register User</h3>

                    <form id="reg-form" name="reg-form" action="<?php echo URLROOT; ?>/users/register" method="POST">
                        <div class="form-group">
                            <label for="inputUsername">Username</label>
                            <input type="text" name="username" class="form-control <?php echo (!empty($data['username_err'])) ? 'is-invalid' : '' ; ?>" value="<?php echo $data['username']; ?>" value="<?php echo $data['username']; ?>" />
                            <?php echo (!empty($data['username_err'])) ? '<span class="invalid-feedback">' . $data['username_err'] . '</span>' : '' ; ?>
                          
                        </div>

                        <div class="form-group">
                            <label for="inputEmail">Email address</label>
                            <input type="email" name="email" class="form-control <?php echo (!empty($data['email_err'])) ? 'is-invalid' : '' ; ?>" value="<?php echo $data['email']; ?>" />
                            <?php echo (!empty($data['email_err'])) ? '<span class="invalid-feedback">' . $data['email_err'] . '</span>' : '' ; ?>
                        </div>
                        
                        <hr/>

                        <div class="form-group">
                            <label for="inputPassword">Password</label>
                            <input type="password" name="password" class="form-control <?php echo (!empty($data['password_err'])) ? 'is-invalid' : '' ; ?>" value="<?php echo $data['password']; ?>" />
                            <?php echo (!empty($data['password_err'])) ? '<span class="invalid-feedback">' . $data['password_err'] . '</span>' : '' ; ?>
                        </div>
                        
                        <div class="form-group">
                            <label for="inputConfirmPassword">Confirm password</label>
                            <input type="password" name="passwordConfirm" class="form-control <?php echo (!empty($data['confirm_password_err'])) ? 'is-invalid' : '' ; ?>" value="<?php echo $data['confirm_password']; ?>"/>
                            <?php echo (!empty($data['confirm_password_err'])) ? '<span class="invalid-feedback">' . $data['confirm_password_err'] . '</span>' : '' ; ?>
                        </div>

                        <div class="form-group text-center">
                            <input type="submit" name="btn-register" class="btn btn-primary" value="Register" />
                        </div>

                        <div class="form-group">
                            <a href="<?php echo URLROOT; ?>/users/login" class="text-white value="Login">Already have an account? Sign In</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>

</section>

<?php require APPROOT . '/views/inc/footer.php'; ?>