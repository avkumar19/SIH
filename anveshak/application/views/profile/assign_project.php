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

<?
$row_box = $ui->row()->open();
    $col = $ui->col()->width(3)->t_width(12)->m_width(12)->open();
    $col->close();
    $col_box = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
    $box = $ui->box()->title("change your username")->solid()->uiType('primary')->open();
        $form = $ui->form()->action(site_url().'/profile/update_assign_project/'.$startup_id)->open();
            $row = $ui->row()->open();
                 $col = $ui->col()->width(12)->t_width(12)->m_width(12)->open();
                    $ui->input()->required()->name('outsource_desc')->label('Enter the crisp project description<span class="require">*</span>')->placeholder('')->show();
                 $col->close();
                 $col = $ui->col()->width(12)->t_width(12)->m_width(12)->open();
                    $ui->input()->required()->name('outsource_duration')->label('Enter the anticipated duration<span class="require">*</span>')->placeholder('')->show();
                 $col->close();
            $row->close();
        $ui->button()
        ->name('update_username_submit')
        ->type('submit')
        ->value('Send')
        ->uitype('success')
        ->classes('form-control')
        ->show();
    $form->close();
    $box->close();
        $col_box->close();
         $col = $ui->col()->width(3)->t_width(12)->m_width(12)->open();
    $col->close();
    $row_box->close();

                  ?>
