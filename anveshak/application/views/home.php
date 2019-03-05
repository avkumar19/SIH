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
    /*background-color: black;*/
    /*background-image:url('<?=base_url('assets/img')?>/back.gif') repeat-y 100% 100% fixed;*/
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
      <a class="navbar-brand" href="#myPage">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">ABOUT</a></li>
        <li><a href="#startup">STARTUP</a></li>
        <li><a href="#corp">CORPORATE</a></li>
        <li><a href="#services">SERVICES</a></li>
       
        <?
          if($login=='true')
          {?>
            <li><a href="<?= site_url('home/dashboard')?>">DASHBOARD</a></li>
             <li><a href="<?= site_url('login/logout') ?>">LOGOUT</a></li>
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
<div id="about" class="container-fluid" style="min-height: 100vh;">
  <div class="row">
    <div class="col-sm-8" >
      <h2>Introduction</h2><br>
      <h4>
       Our goal is to provide a productive space for interaction between various startups and corporates. The startups generally face issues with proper funding and investments because of not so efficient dissemination of information and geographical barriers. Also, project assistance, outsourcing and development becomes a tedious task for any standalone startup no matter how good the funding is. Thus, our aim is to build an ecosystem which closely ties the startups, corporates and individual investors to come at a common place and work together for betterment of them all and the economy of the country as a whole. 
     </h4> 

      
      
    </div>
    <div class="col-sm-4" >
      <span class="glyphicon glyphicon-signal logo"></span>
    </div>  
  </div>
</div>
<div id="startup" class="container-fluid text-center" style="min-height: 100vh;">
   <div class="jumbotron text-center" style="height: 90%;">
      <div class="navbar navbar-default">
         <ul class="nav navbar-nav">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">LET ME HELP TO SEARCH<span class="caret"></span></a>
             <ul class="dropdown-menu" role="menu">
                <?
                     
                    if(isset($verticals)){
                       $i=1;
                      foreach ($verticals as $vert) {
                      ?>
                        <li><a href=" <?= site_url('result/startup_filter_by_category/'.$vert['vertical_id']) ?>"><?= $vert['vertical_name']
                          ?></a></li>

                      <? 
                      if($i==6)
                        break;
                         $i++;
                      }
                    }
                ?>
               
              </ul>
          </li>
        </ul>
      </div>
   
      <h1>STARTUP</h1> 
       <p>Powered by FINDER : A Cognitive neural search engine</p>
       <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
      <form method="GET" action="<?=site_url('result/search_startup')?>">
        <div class="input-group">
          <input name="search"  type="search" class="form-control" size="50" placeholder="Search Startup" required>
          <div class="input-group-btn">
            <button type="submit" class="btn btn-danger">Search</button>
          </div>
        </div>
      </form>
      </div>
      <div class="col-md-2"></div>
      </div>
    </div>
  </div>
<div id="corp" class="container-fluid text-center" style="min-height: 100vh;">

    <div class="jumbotron text-center" style="height: 90%;">

       <div class="navbar navbar-default">
         <ul class="nav navbar-nav">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">LET ME HELP TO SEARCH<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <?
                     
                    if(isset($verticals)){
                       $i=1;
                      foreach ($verticals as $vert) {
                      ?>
                        <li><a href=" <?= site_url('result/corp_filter_by_category/'.$vert['vertical_id']) ?>"><?= $vert['vertical_name']
                          ?></a></li>

                      <? 
                      if($i==6)
                        break;
                         $i++;
                      }
                    }
                ?>
               
              </ul>
          </li>
        </ul>
      </div>
      <?= br(5)?>
      <h1>Corporate</h1> 
      <p></p> 
      <form>
      
    </div>
  </div>
<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center" style="min-height: 100vh;">
  <h2>SERVICES</h2>
  <h4>What we offer</h4>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-search logo-small"></span>
      <h4>FINDER</h4>
      <p>Cognitively advanced neural based search engine</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-bullhorn logo-small"></span>
      <h4>SHOUTOUT</h4>
      <p>Get yourself heard to the world</p>
    </div>
    <div class="col-sm-4">
      <a href="<?=base_url()?>"></a>
      <span class="glyphicon glyphicon-edit logo-small"></span>
      <h4>PITCH AND SNITCH</h4>
      <p>Showcase your idea and break the deal</p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-leaf logo-small"></span>
      <h4>FORUM</h4>
      <p>An open ended communicational platform</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-comment logo-small"></span>
      <h4>MESSAGING PLATFORM</h4>
      <p>An end to end encrypted messaging platform</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart logo-small"></span>
      <h4 style="color:#303030;">RECOMMENDATION</h4>
      <p>Get artificial and automated suggestion of startup</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-file logo-small"></span>
      <h4 style="color:#303030;">TRACK YOUR PROJECT</h4>
      <p>Get real time tracking of running projects</p>
    </div>
    <div class="col-sm-4">
      <a href="<?=base_url('Recent_buzz/')?>">
      <span class="glyphicon glyphicon-th logo-small"></span>
      <h4 style="color:#303030;">RECENT BUZZ</h4>
      </a>
      <p>Get Notified about all the offline events hosted by government/non-government orgnisations</p>
    </div>
  </div>
</div>


<!-- Image of location/map -->
<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
</footer>



</body>
</html>
