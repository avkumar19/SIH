<body>


    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
               
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="<?=base_url()?>"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>
                    <h3 class="menu-title"><?= $this->session->userdata('name') ?></h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-user"></i>Manage Corporate</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-puzzle-piece"></i>
                                 <a href="<?=site_url('corporate/corporate_control/verify_corporate')?>">
                                       Verify Corporate
                                    </a>
                            <li><i class="fa fa-id-badge"></i>
                                 <a href="<?=site_url('corporate/corporate_control/view_corporate')?>">
                                       View  Corporate
                                    </a>
                            </li>
                           
                        </ul>
                    </li>
                     <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-user"></i>Manage Startup</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-puzzle-piece"></i> 
                                <a href="<?=site_url('startup/startup_control/verify_startup')?>">
                                       Verify Startup
                                </a>
                            </li>
                            <li><i class="fa fa-id-badge"></i>
                                <a href="<?=site_url('startup/startup_control/view_startup')?>">
                                       View Registered Starup
                                </a>
                            </li>
                           
                            
                        </ul>
                    </li>
                    
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    <div class="header-left">
                        

                    </div>
                </div>

                <div class="col-sm-5">
                    <div class="float-right">
                        <a href="<?= site_url('login/logout') ?>"><i class="fa fa-power-off"></i> Logout</a>         
                    </div>

                   
                </div>
            </div>

        </header><!-- /header -->
        <!-- Header-->

       <section class="content" id="startup_back" style="min-height:400px;">

                    <div class="flash-data">
                        <?php
                        $ui = new UI();
                        if($this->session->flashdata('flashSuccess'))
                            $ui->alert()->uiType("success")->desc($this->session->flashdata('flashSuccess'))->show();
                        if($this->session->flashdata('flashError'))
                            $ui->alert()->uiType("error")->desc($this->session->flashdata('flashError'))->show();
                        if($this->session->flashdata('flashInfo'))
                            $ui->alert()->uiType("info")->desc($this->session->flashdata('flashInfo'))->show();
                        if($this->session->flashdata('flashWarning'))
                            $ui->alert()->uiType("warning")->desc($this->session->flashdata('flashWarning'))->show();
                        ?>
                    </div>
        
