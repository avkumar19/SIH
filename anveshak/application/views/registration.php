<?
$ui=new UI();
    $ui=new UI();
    $cact_array = array();
    $cat_array[] = $ui->option()->value(0)->disabled()->text('Select Category')->selected();

    $cats=['abc','def','ghi'];
    if(isset($cats)){
        foreach ($cats as $cat) {
            $cat_array[] = $ui->option()->value($cat)->text($cat);
        }
    }
?>
<!DOCTYPE html>
<html>
<head>
  <title></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style >
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
   
    padding:1%; 
    background:white;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-1 h3{
    text-align: center;
    margin-bottom:12%;
    color:#fff;
}
.login-form-2{
    padding: 1%;
    background: white;
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


<div class="container login-container" style="margin-top: 0px">
            <div class="row">
                <div class="col-md-6 login-form-1">
                   <a href="<?= base_url() ?>"><button style="float:left" class="btn btn-primary">Home</button></a>
                    <h3>Startup Registration</h3>
                     <?
                   $box = $ui->box()->title("Register as Startup")->solid()->uiType('success')->open();
                    $form = $ui->form()->action(current_url().'/reg_form_submit/startup')->open();   
                        $row = $ui->row()->open();

                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('startup_name')->label('Name of Your Startup <span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->required()->name('cin_no')->label('CIN No<span class="require">*</span>')->placeholder('')->show();
                         $col->close();

                          $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('roc_no')->label('ROC Registration No <span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->datePicker()->name('date')->required()->label('Incorporate_date  <span class="require">*</span> ')->show();
                         $col->close();

                          $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('worth')->label('Worth <span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->required()->name('recog_no')->label('Recogination No <span class="require">*</span>')->placeholder('')->show();
                         $col->close();

                          $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('website')->label('Website <span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->type('email')->required()->name('email')->label('Email <span class="require">*</span>')->placeholder('')->show();
                         $col->close();

                          $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->name('contact')->label('Contact No')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->required()->name('mobile')->label('Mobile No <span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                         
                        $row->close();
                        $ui->button()
                    ->name('startup_reg_submit')
                    ->type('submit')
                    ->value('Register')
                    ->uitype('success')
                    ->classes('form-control')
                    ->show();
                    $form->close();    
                     $box->close();    
                  ?>
                </div>
                <div class="col-md-6 login-form-2">
                    <a href="<?= site_url('login') ?>"><button style="float: left" class="btn btn-primary">Login</button></a>
                    <h3>Corporate Registration</h3>
                     <? 
                        $box = $ui->box()->title("Register as Corporate")->solid()->uiType('success')->open();
                    $form = $ui->form()->action(current_url().'/reg_form_submit/corporate')->open();  
                        $row = $ui->row()->open();

                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('corp_name')->label('Name of Your Corporate <span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->required()->name('cin_no')->label('CIN No<span class="require">*</span>')->placeholder('')->show();
                         $col->close();

                          $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('roc_no')->label('ROC Registration No <span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->datePicker()->name('date')->required()->label('Incorporate_date  <span class="require">*</span> ')->show();
                         $col->close();

                          $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->select()
                                ->label('Category')
                                ->name('category')
                                ->options($cat_array)
                                ->required()
                                ->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         
                         $col->close();

                          $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('website')->label('Website <span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->type('email')->required()->name('email')->label('Email <span class="require">*</span>')->placeholder('')->show();
                         $col->close();

                          $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->name('contact')->label('Contact No')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->required()->name('mobile')->label('Mobile No <span class="require">*</span>')->placeholder('')->show();
                         $col->close();

                        $row->close();
                        $ui->button()
                    ->name('corporate_reg_submit')
                    ->type('submit')
                    ->value('Register')
                    ->uitype('success')
                    ->classes('form-control')
                    ->show();
                    $form->close();    
                     $box->close();    
                      ?>
                </div>
            </div>
        </div>
</body>
</html>