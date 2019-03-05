<?

    $ui=new UI();
    $tags_array = array();
    $tag_array[] = $ui->option()->value(0)->disabled()->text('Select Tag')->selected();


    if(isset($tags)){
        foreach ($tags as $tag) {
            $tag_array[] = $ui->option()->value($tag['vertical_id'])->text($tag['vertical_name']);
        }
    }
 	$box = $ui->box()->title("Post Your Problem")->solid()->uiType('success')->open();
        $form = $ui->form()->action(site_url().'/corporate/submit_problem')->open();   
            $row = $ui->row()->open();
	            $col = $ui->col()->width(12)->t_width(12)->m_width(12)->open();
		         	$ui->textarea()
					   ->name('problem')
					   ->classes('form-control')
					   ->placeholder('Give Problem Description, Max upto 250 characters')
					   ->required()
					   ->extras("maxlength=250")
					   ->label('Give Problem Description<span class="require">*</span>')
					   ->placeholder('')
					   ->show();
	         	$col->close();
	            $col = $ui->col()->width(12)->t_width(12)->m_width(12)->open();
		            $ui->select()
		                ->label('Tag Your Problem')
		                ->name('tags[]')
		                ->multiple()
		                ->options($tag_array)
		                ->required()
		                ->show();
		         $col->close();
            $row->close();
            $ui->button()
        ->name('problem_submit')
        ->type('submit')
        ->value('Post')
        ->uitype('success')
        ->classes('form-control')
        ->show();
        $form->close();    
    $box->close();    
?>