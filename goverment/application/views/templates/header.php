    <?php $ui = new UI(); ?>
    <body class="skin-blue">
        <header class="header">
            <a href="<?= site_url("") ?>" class="logo">
                LOGO
            </a>

            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>Goverment<i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                       <p>
                                            <?= $this->session->userdata('name') ?>
                                            <small>
                                                <?php
                                               	echo "LOGO"; 
                                            // The above appears in Change Password BOX on right corner
                                               ?>
                                           </small>
                                        </p>
                                 </li>
                           <!-- Menu Footer-->
                               <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="<?= site_url('change_password') ?>" class="btn btn-default btn-flat">Change Password</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="<?= site_url('login/logout') ?>" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                             </ul>
                         </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">

                        <!-- Sidebar user panel The user image was not displaying due case issue of folder name hence all converted to lower case as in line 27-28 above -->
                        <div class="pull-left info">
                            <p><?= $this->session->userdata('username'); ?></p>

                            <a href="#"><i class="glyphicon glyphicon-user"></i> <?= $this->session->userdata('id'); ?></a>
                        </div>
                    </div>

                    <ul class="sidebar-menu">
                        <li><a href="#"><i class="fa fa-book"></i> <span>Dashboard</span></a></li>
                    <?if($type=='gov'){?>
                        <li class="treeview ">
                            <a href="#">
                                <i class="fa fa-angle-right pull-right"></i>Manage Startup
                            </a>
                            <ul class="treeview-menu">
                                <li >
                                    <a href="<?=site_url('startup/startup_control/verify_startup')?>">
                                       Verify Startup
                                    </a>
                                    
                                </li>

                                  <li >
                                    <a href="<?=site_url('startup/startup_control/view_startup')?>">
                                       View Registered Starup
                                    </a>
                                </li>
                               
                            </ul>
                        </li>

                         <li class="treeview ">
                            <a href="#">
                                <i class="fa fa-angle-right pull-right"></i>Manage Corporate
                            </a>
                            <ul class="treeview-menu">
                                <li >
                                    <a href="<?=site_url('corporate/corporate_control/verify_corporate')?>">
                                       Verify Corporate
                                    </a>
                                    
                                </li>
                                
                                  <li >
                                    <a href="<?=site_url('corporate/corporate_control/view_corporate')?>">
                                       View Registered Corporate
                                    </a>
                                </li>
                               
                            </ul>
                        </li>
                    <?
                    }
                   

                    ?>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>



            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        <?= $title ?>
                        <small><?= $subtitle ?></small>
                    </h1>
                </section>

                <!-- Main content -->
                <section class="content">

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