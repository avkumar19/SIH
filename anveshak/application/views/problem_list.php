<?php 
$ui =new UI();

    $tags_array = array();
    $tag_array[] = $ui->option()->value('0')->text('Select Tag')->selected();


    if(isset($tags)){
        foreach ($tags as $tag) {
            $tag_array[] = $ui->option()->value($tag['vertical_id'])->text($tag['vertical_name']);
        }
    }

    $box = $ui->box()->title("Filter Problem Statement")->solid()->uiType('success')->open();
        $form = $ui->form()->action(site_url().'/startup/filter_problem')->open();   
            $row = $ui->row()->open();
	            $col = $ui->col()->width(6)->t_width(6)->m_width(12)->open();
		         	 $ui->select()
		                ->label('Filter By Tags')
		                ->name('tags[]')
		                ->multiple()
		                ->options($tag_array)
		                ->show();
	         	$col->close();
	            $col = $ui->col()->width(6)->t_width(6)->m_width(12)->open();
		            $ui->input()
		                ->label('Filter By Region')
		                ->name('region')
		                ->show();
		                 $ui->button()
				        ->name('problem_filter')
				        ->type('submit')
				        ->value('Filter')
				        ->uitype('success')
				        ->classes('form-control')
				        ->show();
		         $col->close();
		         
            $row->close();
           
        $form->close();    
    $box->close(); 
  
    //print_r($problem);
    foreach ($problem as $key) {
    	$url=site_url('home/profile/'.$key['corp_id'].'/corp');
    	$box = $ui->box()->title("Posted By <a href='".$url."'>".ucfirst($key['corp_name']."</a> ".$key['post_date']))->solid()->uiType('primary')->open();
    	echo $key['problem_statement'];
    	$box->close();
    }
    ?>
