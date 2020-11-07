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
     
    <div class="row">

        <div class="col-md-9 register-right">
           

            <div class="tab-content" style="padding-top:10px;">
                <div id="startup" class="tab-pane fade in active">
                  <?
                   $box = $ui->box()->title("Change Contact Details")->solid()->uiType('primary')->open();
                    $form = $ui->form()->action(site_url().'/profile/update_contact')->open();   
                        $row = $ui->row()->open();

                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('Website')->label('Website<span class="require">*</span>')->placeholder($contact['website'])->value($contact['website'])->show();
                         $col->close();

                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->type('Email')->required()->name('Email')->label('Email<span class="require">*</span>')->placeholder($contact['email'])->value($contact['email'])->show();
                         $col->close();

                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                            $ui->input()->required()->name('Mobile')->label('Mobile<span class="require">*</span>')->placeholder($contact['mobile'])->value($contact['mobile'])->show();
                         $col->close();

                         $col = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
                         $ui->input()->required()->name('Phone')->label('Phone<span    class="require">*</span>')->placeholder($contact['phone'])->value($contact['phone'])->show();
                         $col->close();

                          
                         
                        $row->close();
                        $ui->button()
                    ->name('Save details')
                    ->type('submit')
                    ->value('Save')
                    ->uitype('success')
                    ->classes('form-control')
                    ->show();
                    $form->close();    
                     $box->close();    
                  ?>
              </div>
              
</body>
</html>