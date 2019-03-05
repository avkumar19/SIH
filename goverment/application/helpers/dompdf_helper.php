<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
function pdf_create($html, $filename='',  $paper='', $stream=TRUE) 
{
    require_once("dompdf/dompdf_config.inc.php");
	ini_set("max_execution_time","-1");
	ini_set('memory_limit', '-1');
    $dompdf = new DOMPDF();
	if($paper == 'L'){
		$dompdf->set_paper("a4", "landscape" ); 
	}
    $dompdf->load_html($html);
    $dompdf->render();
    if ($stream) {
        $dompdf->stream($filename.".pdf");
    } else {
        return $dompdf->output();
    }
}
?>