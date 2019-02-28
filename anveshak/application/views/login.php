<?php
    $ui=new UI();
    $cat_array = array();
    $cat_array[] = $ui->option()->value(0)->disabled()->text('Select Category')->selected();

    $cats=['abc','def','ghi'];
    if(isset($cats)){
        foreach ($cats as $cat) {
            $cat_array[] = $ui->option()->value($cat)->text($cat);
        }
    }

?>
<body>
<div class="container register">
     <a href="<?= base_url()?>">
    <h1><span class="glyphicon glyphicon-home" style="color:blue;"></span></h1>
    </a>
    <div class="row">

        <div class="col-md-3 register-left">
            <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
            <h3>Welcome</h3>
            <p>You are 30 seconds away from earning your own money!</p>
            <a href="<?= site_url('registration') ?>"><button class="btn btn-primary ">Register</button></a><br/>
        </div>
        <div class="col-md-9 register-right">
           <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
              <li class="active"><a data-toggle="tab" href="#startup">Startup</a></li>
              <li><a data-toggle="tab" href="#corp">Corporate</a></li>
            </ul>

            <div class="tab-content" style="padding-top:10px;">
                <div id="startup" class="tab-pane fade in active">
                  <?
                   $box = $ui->box()->title("Login as Startup")->solid()->uiType('primary')->open();
                    $form = $ui->form()->action(base_url().'index.php/login/login_form_submit/startup')->open();   
                        $row = $ui->row()->open();

                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('login_id')->label('Username<span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->type('password')->required()->name('password')->label('Password<span class="require">*</span>')->placeholder('')->show();
                         $col->close();

                          
                         
                        $row->close();
                        $ui->button()
                    ->name('startup_login_submit')
                    ->type('submit')
                    ->value('Login')
                    ->uitype('success')
                    ->classes('form-control')
                    ->show();
                    $form->close();    
                     $box->close();    
                  ?>
              </div>
              <div id="corp" class="tab-pane fade">
                <?
                    $box = $ui->box()->title("Login as Corporate")->solid()->uiType('primary')->open();
                    $form = $ui->form()->action(base_url().'index.php/login/login_form_submit/corporate')->open();  
                        $row = $ui->row()->open();

                            $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('login_id')->label('Username<span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->type('password')->required()->name('password')->label('Password<span class="require">*</span>')->placeholder('')->show();
                         $col->close();
                        $row->close();
                        $ui->button()
                    ->name('corporate_login_submit')
                    ->type('submit')
                    ->value('Login')
                    ->uitype('success')
                    ->classes('form-control')
                    ->show();
                    $form->close();    
                     $box->close();    
                   
                  ?>
              </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>