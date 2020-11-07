<!DOCTYPE html>
<html>
    <head>
        <title>
        <?php
            if(isset($title))	echo $title;
            else				echo 'Connect Startup With Corporate';
        ?>
        </title>

        <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
        <meta content="utf-8" http-equiv="encoding">
 	    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

        
        <link href="<?= base_url() ?>assets/core/ionicons.min.css" rel="stylesheet" type="text/css" />
        <link href="<?= base_url() ?>assets/core/adminLTE/css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <link href="<?= base_url() ?>assets/core/adminLTE/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="<?= base_url() ?>assets/core/adminLTE/css/datatables/fixedColumns.bootstrap.min.css" rel="stylesheet" type="text/css" />
    	<link href="<?= base_url() ?>assets/core/adminLTE/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css">
    	<link href="<?= base_url() ?>assets/core/adminLTE/css/timepicker/bootstrap-timepicker.css" rel="stylesheet" type="text/css">
        <link href="<?= base_url() ?>assets/core/img_upload/upload_image.css" rel="stylesheet" type="text/css" />
        <link href="<?= base_url() ?>assets/core/adminLTE/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css">
        <link href="<?= base_url() ?>assets/core/adminLTE/css/ionslider/ion.rangeSlider.css" rel="stylesheet" type="text/css">
		<link href="<?= base_url() ?>assets/core/adminLTE/css/ionslider/ion.rangeSlider.skinFlat.css" rel="stylesheet" type="text/css">
        <link href="<?= base_url() ?>assets/core/adminLTE/css/ionslider/ion.rangeSlider.skinNice.css" rel="stylesheet" type="text/css">
        <link href="<?= base_url() ?>assets/core/notification-layout.css" rel="stylesheet" type="text/css">
        <link href="<?= base_url() ?>assets/core/mis-extension.css" rel="stylesheet" type="text/css">

        <link rel="apple-touch-icon" href="apple-icon.png">
        <link rel="shortcut icon" href="favicon.ico">

        <link rel="stylesheet" href="<?= base_url() ?>assets/dashboard/vendors/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="<?= base_url() ?>assets/dashboard/vendors/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<?= base_url() ?>assets/dashboard/vendors/themify-icons/css/themify-icons.css">
        <link rel="stylesheet" href="<?= base_url() ?>assets/dashboard/vendors/flag-icon-css/css/flag-icon.min.css">
        <link rel="stylesheet" href="<?= base_url() ?>assets/dashboard/vendors/selectFX/css/cs-skin-elastic.css">
        <link rel="stylesheet" href="<?= base_url() ?>assets/dashboard/vendors/jqvmap/dist/jqvmap.min.css">


        <link rel="stylesheet" href="<?= base_url() ?>assets/dashboard/assets/css/style.css">

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

		<?php if(isset($css)) echo $css; ?>

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script src="<?= base_url() ?>assets/core/jquery.min.js" type="text/javascript"></script>
        <script src="<?= base_url() ?>assets/core/jquery-ui.min.js" type="text/javascript"></script>
        <script src="<?= base_url() ?>assets/core/bootstrap-3.3.2/dist/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="<?= base_url() ?>assets/core/adminLTE/js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
		<script src="<?= base_url() ?>assets/core/adminLTE/js/plugins/timepicker/bootstrap-timepicker.js" type="text/javascript"></script>
        <script src="<?= base_url() ?>assets/core/adminLTE/js/AdminLTE/app.js" type="text/javascript"></script>
		<script src="<?= base_url() ?>assets/core/adminLTE/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
                <script src="<?= base_url() ?>assets/core/adminLTE/js/plugins/datatables/dataTables.fixedColumns.min.js" type="text/javascript"></script>
		<script src="<?= base_url() ?>assets/core/adminLTE/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
   		<script src="<?= base_url() ?>assets/core/moment.js" type="text/javascript"></script>
        <script src="<?= base_url() ?>assets/core/adminLTE/js/plugins/ionslider/ion.rangeSlider.min.js" type="text/javascript"></script>
   		<script src="<?= base_url() ?>assets/core/mis-extension.js" type="text/javascript"></script>
        


    <script src="<?= base_url() ?>assets/dashboard/vendors/jquery/dist/jquery.min.js"></script>
    <script src="<?= base_url() ?>assets/dashboard/vendors/popper.js/dist/umd/popper.min.js"></script>
    <script src="<?= base_url() ?>assets/dashboard/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<?= base_url() ?>assets/dashboard/assets/js/main.js"></script>


    <script src="<?= base_url() ?>assets/dashboard/vendors/chart.js/dist/Chart.bundle.min.js"></script>
    <script src="<?= base_url() ?>assets/dashboard/assets/js/dashboard.js"></script>
    <script src="<?= base_url() ?>assets/dashboard/assets/js/widgets.js"></script>
    <script src="<?= base_url() ?>assets/dashboard/vendors/jqvmap/dist/jquery.vmap.min.js"></script>
    <script src="<?= base_url() ?>assets/dashboard/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <script src="<?= base_url() ?>assets/dashboard/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script>
        (function($) {
            "use strict";

            jQuery('#vmap').vectorMap({
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: ['#1de9b6', '#03a9f5'],
                normalizeFunction: 'polynomial'
            });
        })(jQuery);
    </script>


		<script type="text/javascript">
            <? global $CONF; ?>
            function base_url()	{ return "<?= base_url()?>"; }
            function site_url(uri) { return base_url() + "index.php/" + uri; }
            var time = <?=$CONF['refresh_rate']?>;
        </script>
	    <?php if(isset($javascript)) echo $javascript; ?>
       
    </head>