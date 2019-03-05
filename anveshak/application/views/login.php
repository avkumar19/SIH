<?
$ui=new UI();
?>
<!DOCTYPE html>
<html>
<head>
  <title></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style >
      .login-container{
    margin-top: 5%;
    margin-bottom: 5%;
}
.login-logo{
    position: relative;
    margin-left: -41.5%;
}
.login-logo img{
    position: absolute;
    width: 20%;
    margin-top: 19%;
    background: #282726;
    border-radius: 4.5rem;
    padding: 5%;
}
.login-form-1{
    padding: 9%;
    background:#282726;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-1 h3{
    text-align: center;
    margin-bottom:12%;
    color:#fff;
}
.login-form-2{
    padding: 9%;
    background: #f05837;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-2 h3{
    text-align: center;
    margin-bottom:12%;
    color: #fff;
}
.btnSubmit{
    font-weight: 600;
    width: 50%;
    color: #282726;
    background-color: #fff;
    border: none;
    border-radius: 1.5rem;
    padding:2%;
}
.btnForgetPwd{
    color: #fff;
    font-weight: 600;
    text-decoration: none;
}
.btnForgetPwd:hover{
    text-decoration:none;
    color:#fff;
}
    </style>
</head>
<body>

<!------ Include the above in your HEAD tag ---------->


<div class="container login-container">
            <div class="row">
                <div class="col-md-6 login-form-1">
                   <center><a href="<?= base_url() ?>"><button class="btn btn-danger">Home</button></a></center><br/>
                    <h3>Startup Login</h3>
                     <?$form = $ui->form()->action(base_url().'index.php/login/login_form_submit/startup')->open();   ?>
                        <div class="form-group">
                            <input type="text" class="form-control" name ="login_id" placeholder="username" value="" required/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name ="password" placeholder="Your Password" value="" required/>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="startup_login_submit" class="btnSubmit" value="Login" />
                        </div>
                        <div class="form-group">
                            <a href="#" class="btnForgetPwd">Forget Password?</a>
                        </div>
                     <?= $form->close(); ?>
                </div>
                <div class="col-md-6 login-form-2">
                     <center><a href="<?= site_url('registration') ?>"><button class="btn btn-danger">Register</button></a></center><br/>
                    <h3>Corporate Login</h3>
                     <?$form = $ui->form()->action(base_url().'index.php/login/login_form_submit/corporate')->open();  ?>
                        <div class="form-group">
                            <input type="text" class="form-control" name ="login_id" placeholder="username" value="" required/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name ="password" placeholder="Your Password" value="" required/>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="corporate_login_submit" class="btnSubmit" value="Login" />
                        </div>
                        <div class="form-group">
                            <a href="#" class="btnForgetPwd">Forget Password?</a>
                        </div>
                    <?= $form->close(); ?>
                </div>
            </div>
        </div>
</body>
</html>