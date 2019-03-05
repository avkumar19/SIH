<style type="text/css">
	
	.require{
		color: tomato;
	}
</style>
<?
$ui=new UI();	
if($first)
{

	$url=site_url('profile/vision_submit/first');
}
else
{
	
	$url=site_url('profile/vision_submit');
}
//print_r($vision);
$row_box = $ui->row()->open();
 	$col = $ui->col()->width(3)->t_width(12)->m_width(12)->open();
 	$col->close();
 	$col_box = $ui->col()->width(6)->t_width(12)->m_width(12)->open();
 		$box = $ui->box()->title("Enter Details")->solid()->uiType('primary')->open();
 			$form = $ui->form()->action($url)->open();   
	    		$row = $ui->row()->open();
	        	 	$col = $ui->col()->width(12)->t_width(12)->m_width(12)->open();
			         	$ui->textarea()
						   ->id('desc')
						   ->name('desc')
						   ->classes('form-control')
						   ->placeholder('Give Short Description, Max upto 150 characters')
						   ->required()
						   ->extras("maxlength=150")
						   ->value($vision['short_desc'])
						   ->label('Write Short Description<span class="require">*</span>')
						   ->placeholder('')
						   ->show();
		         $col->close();
			   
			    
			     $col = $ui->col()->width(12)->t_width(12)->m_width(12)->open();
			         	$ui->textarea()
						   ->id('vision')
						   ->name('vision')
						   ->classes('form-control')
						   ->placeholder('Enter Your Vision, Max upto 450 characters')
						   ->required()
						   ->extras("maxlength=450")
						   ->value($vision['vision'])
						   ->label('Enter Your Vision<span class="require">*</span>')
						   ->placeholder('')
						   ->show();
		         $col->close();
		   		if($type=='startup')
			    {
			     	$col = $ui->col()->width(12)->t_width(12)->m_width(12)->open();
			     		 $ui->input()->type('number')->required()->value($vision['no_of_emp'])->name('emp')->label('No of Employee<span class="require">*</span>')->placeholder('')->show();
			        $col->close();
			    }
	   			$col=$ui->col()->width(12)->m_width(12)->t_width(6)->open();
   		       		$ui->button()
   		       			  ->type('submit')
   		       			  ->name('update_vision')
   		       			  ->uitype('success')
   		       			  ->value('Update')
   		       			  ->uitype('primary')
   		       			  ->classes('form-control')
   		       			  ->show();
	       		$col->close();	

	    $row->close();  
	$form->close();      
 $box->close();   
  $col_box->close(); 
 $col = $ui->col()->width(3)->t_width(12)->m_width(12)->open();
 $col->close();
 $row->close();    
?>
<script type="text/javascript">
	
	$('#desc').keyup(function () {
		max = this.getAttribute("maxlength");
		var len = $(this).val().length;
		if (len >= max) {
			$(this).next().text(' you have reached the limit');
			$(this).next().css('color', 'red');
		} else {
			$(this).next().css('color', 'green');
			var char = max - len;
			$(this).next().text(char + ' characters left');
		}
	});

	$('#vision').keyup(function () {
		max = this.getAttribute("maxlength");
		var len = $(this).val().length;
		if (len >= max) {
			$(this).next().text(' you have reached the limit');
			$(this).next().css('color', 'red');
		} else {
			$(this).next().css('color', 'green');
			var char = max - len;
			$(this).next().text(char + ' characters left');
		}
	});
</script>