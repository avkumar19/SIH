<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com -->
  <title>
     <?php
            if(isset($title)) echo $title;
            else        echo 'Connect Startup With Corporate';
        ?>
  </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="<?= base_url() ?>assets/js/home.js" type="text/javascript"></script>
  <link href="<?= base_url() ?>assets/css/home.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">
            <? global $CONF; ?>
            function base_url() { return "<?= base_url()?>"; }
            function site_url(uri) { return base_url() + "index.php/" + uri; }
            var time = <?=$CONF['refresh_rate']?>;
        </script>
      <?php if(isset($javascript)) echo $javascript; ?>

  <style>
  <?php if(isset($css)) echo $css; ?>
    body {
    font: 400 15px Lato, sans-serif;
    line-height: 1.8;
    color: #818181;
    /*background-color: grey;*/
    background-image:url('<?=base_url('assets/img')?>/back.gif');
    height:100%;
    width:100%;
  }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<?=base_url()?>">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      	
        <?
          if($login=='true')
          {?>
            <li><a href="<?= site_url('home/dashboard')?>">DASHBOARD</a></li>
             <li><a href="#logout">LOGOUT</a></li>
          <?}
          else{?>
              <li><a href="<?=site_url('login')?>">LOGIN</a></li>
              <li><a href="<?=site_url('registration')?>">REGISTER</a></li>
          <?}
        ?>
      </ul>
    </div>
  </div>
</nav>



<!-- Container (About Section) -->
<div  class="container-fluid">
  <div class="row">
     <?
     	if(count($list)>0){
			foreach ($list as $item) {
	?>	
				<div class="col-md-4">
					<div class="well" style="color:black;">
						
						
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
	<?		}
     	}
     	else
     	{?>
     			<h1>No Results Found</h1>
     	<?}
     ?>
</div>
</div>






</body>
</html>
