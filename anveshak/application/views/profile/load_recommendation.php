<div  class="container">
  <div class="row">
     <?
     $i=0;
     	if(count($list)>0){
			foreach ($list as $item) {
	?>		
				<div class="col-md-4">
					<div class="well" style="color:black; min-height: 200px; background-color: tomato;">
						
						
					    <?
					    	if($type=="startup"){
					    ?>
					    <h1 style="text-align: center;"> <?= $item['startup_name']?></h1>
					    <center>
							<a href="<?=site_url('home/profile/'.$item['startup_id']."/startup")?>"><button class="btn btn-primary">View Profile </button> </a>
						</center>	
						<?}else{?>
							<h1 style="text-align: center;"> <?= $item['corp_name']?></h1>
						<center>
							<a href="<?=site_url('home/profile/'.$item['corp_id']."/corp")?>"><button class="btn btn-primary">View Profile </button> </a>
						</center>	
						<?}?>	
						
					</div>

				</div>
	<?	

		}
     	}
     	else
     	{?>
     			<h1>No Results Found</h1>
     	<?}
     ?>
</div>
</div>