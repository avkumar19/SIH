<?php

	$ui = new UI();
	
	
	$vert_array[] = $ui->option()->value(0)->disabled()->text('Select Verticals')->selected();

	if(isset($verts)){
		foreach ($verts as $vert) {
			$vert_array[] = $ui->option()->value($vert['vertical_id'])->text($vert['vertical_name']);
		}
	}
	//print_r($vert_array);
	
	
	$R = $ui->row()->open();
		$fake = $ui->col()->width(3)->m_width(0)->t_width(0)->open()->close();
		$main_content = $ui->col()->width(6)->m_width(12)->t_width(0)->open();
			$box = $ui->box()->uiType('primary')->title('Add Verticals')->solid(true)->open();
				$form = $ui->form()->action(site_url('profile/submit_verticals'))->open();
					$R1 = $ui->row()->open();
						$R1C1 = $ui->col()->width(12)->m_width(12)->t_width(12)->open();
							 $ui->select()
								->label('Verticals (<span style="color:green;"> Press CTRL To Select Multiple Verticals </span>)')
								->name('verts[]')
								->multiple()
								->options($vert_array)
								->required()
								->show();
							 $ui->button()
								->type('submit')
								->name('add_verticals')
								->classes("form-control")
								->uiType('primary')
								->value('Save')
								->show();
						$R1C1->close();
					$R1->close();
				$form->close();
			$box->close();				
	$R->close();



?>