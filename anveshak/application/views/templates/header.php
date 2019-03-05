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
                        <a href="#"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>
                    <h3 class="menu-title"><?= $this->session->userdata('name') ?></h3><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-user"></i>Profile</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-puzzle-piece"></i> <a href="<?=site_url('profile/view_profile')?>">
                                        View Your Profile
                                    </a>
                            </li>
                            <li><i class="fa fa-id-badge"></i>
                                <a href="<?=site_url('profile/update_vision')?>">
                                       Update Vision
                                </a>
                            </li>
                            <li><i class="fa fa-bars"></i>
                                <a href="<?=site_url('profile/update_contact_detail')?>">
                                      Update Contact Detail
                                 </a>
                            </li>
                            <li><i class="fa fa-share-square-o"></i>
                                <a href="<?=site_url('profile/change_username')?>">
                                      Change Username
                                </a>
                            </li>
                            <li><i class="fa fa-id-card-o"></i>
                                <a href="<?=site_url('profile/add_verticals ')?>">
                                      Add Verticals
                                    </a>
                            </li>
                        </ul>
                    </li>
                    
                    
                    <li class="active">
                        <a href="<?=base_url('IdeaPitch')?>"> <i class="menu-icon fa fa-dashboard"></i>Pitch And Snitch </a>
                    </li>
                    <li class="active">
                        <a href="<?=base_url('ShoutOut')?>"> <i class="menu-icon fa fa-dashboard"></i>Shoutout</a>
                    </li>
                    <li class="active">
                        <a href="<?=base_url('community')?>"> <i class="menu-icon fa fa-dashboard"></i>Community Support</a>
                    </li>
                    <?if($type=='corp'){?>


                    <li class="active">
                        <a href="<?=site_url('profile/find_recommendation')?>"> <i class="menu-icon fa fa-dashboard"></i>Your Recommendation</a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-user"></i>Manage Project</a>
                        <ul class="sub-menu children dropdown-menu">
                           
                            <li><i class="fa fa-id-badge"></i>
                                <a href="<?=site_url('profile/assign_project')?>">
                                       Request Project
                                </a>
                            </li>
                            <li><i class="fa fa-bars"></i>
                                <a href="<?=site_url('profile/view_status')?>">
                                      View Running Project status
                                 </a>
                            </li>
                           
                        </ul>
                    </li>
                    <li class="active">
                        <a href="<?=site_url('corporate/post_problem')?>"> <i class="menu-icon fa fa-dashboard"></i>Post Problem</a>
                    </li>
                    <?}else{?>

                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-user"></i>Manage Projects</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-puzzle-piece"></i> <a href="<?=site_url('profile/requested')?>">
                                        See Requested Project
                                    </a>
                            </li>
                            <li><i class="fa fa-id-badge"></i>
                                <a href="<?=site_url('profile/change_status')?>">
                                       Update Status
                                </a>
                            </li>
                            <li><i class="fa fa-bars"></i>
                                <a href="<?=site_url('profile/view_status')?>">
                                      View Running project Status
                                 </a>
                            </li>
                        </ul>
                    </li>
                    <li class="active">
                        <a href="<?=site_url('startup/view_problem_statement')?>"> <i class="menu-icon fa fa-dashboard"></i>View problem</a>
                    </li>
                    <?}?>

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
                        <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger">5</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="notification">
                                <p class="red">You have 3 Notification</p>
                                <a class="dropdown-item media bg-flat-color-1" href="#">
                                <i class="fa fa-check"></i>
                                <p>Server #1 overloaded.</p>
                            </a>
                                <a class="dropdown-item media bg-flat-color-4" href="#">
                                <i class="fa fa-info"></i>
                                <p>Server #2 overloaded.</p>
                            </a>
                                <a class="dropdown-item media bg-flat-color-5" href="#">
                                <i class="fa fa-warning"></i>
                                <p>Server #3 overloaded.</p>
                            </a>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-sm-5">
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="<?=base_url()?>assets/dashboard/images/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa-user"></i> My Profile</a>
                            <a class="nav-link" href="#"><i class="fa fa-cog"></i> Change Password</a>

                            <a href="<?= site_url('login/logout') ?>" ><i class="fa fa-power-off"></i> Logout</a>
                        </div>
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
        
