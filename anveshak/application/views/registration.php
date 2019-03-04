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
             <a href="<?= site_url('login') ?>"><button class="btn btn-primary ">Login</button></a><br/>
        </div>
        <div class="col-md-9 register-right">
           <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
              <li class="active"><a data-toggle="tab" href="#startup">Startup</a></li>
              <li><a data-toggle="tab" href="#corp">Corporate</a></li>
            </ul>

            <div class="tab-content" style="padding-top:10px;">
                <div id="startup" class="tab-pane fade in active">
                  <?
                   $box = $ui->box()->title("Register as Startup")->solid()->uiType('primary')->open();
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
              <div id="corp" class="tab-pane fade">
                <?
                    $box = $ui->box()->title("Register as Corporate")->solid()->uiType('primary')->open();
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
    </div>

</div>
</body>
</html>