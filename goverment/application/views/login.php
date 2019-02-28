<?php
$ui=new UI();
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
           
        </div>
        <div class="col-md-6 register-right">
          
            <?
             $box = $ui->box()->title("Goverment")->solid()->uiType('primary')->open();
                $form = $ui->form()->action(base_url().'index.php/login/login_form_submit')->open();
                  $row = $ui->row()->open();

                    $col = $ui->col()->width(12)->t_width(12)->m_width(12)->open();
                       $ui->input()
                          ->required()
                          ->name('login_id')
                          ->label('Username<span class="require">*</span>')
                          ->placeholder('')
                          ->show();
                    $col->close();

                   
                    $col = $ui->col()->width(12)->t_width(12)->m_width(12)->open();
                      $ui->input()
                         ->type('password')
                         ->required()->name('password')
                         ->label('Password<span class="require">*</span>')
                         ->placeholder('')
                         ->show();
                    $col->close();

                  $row->close();
                $ui->button()
                   ->name('gov_login_submit')
                   ->type('submit')
                   ->value('Login')
                   ->uitype('success')
                   ->classes('form-control')
                   ->show();
              $form->close();    
           $box->close();    
        ?>

      </div>
       <div class="col-md-3 ">

        </div>
    </div>
  </div>
</body>
</html>