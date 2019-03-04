# 3D-Popup-jQuery-Plugin

<p>To use the Plugin, include in your document popup.css before your own stylesheet file. Include also popup.js right after jQuery.</p>
```html
<link rel="stylesheet" type="text/css" href="css/popup.css" />

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/popup.js"></script>
```
<p>In your HTML file, use this structure :</p>
```html
<a id="click" rel="popup_name" href="#">Show popup</a>

<div class="popup">
  <div id="popup_name" class="popup_block">
    <div class="popup_head">
      <!-- Content -->
    </div>
    <div class="popup_body">
      <!-- Content -->
    </div>
  </div>
</div>
```
<p>Don't forget to change to "rel" value and the "id" of the "popup_block" if you want to use more than 1 Popup !</p>
<p>In your own JS file, start the fonction "popup" with an event.</p>

<p>For example :</p>
<pre>
$(document).ready(function() {
	$("#click").click(popup);
});
</pre>
<p>To change the color of the popup, change the value of the "background-color" of the class "popup_head" and the "border-color" of the class "popup_block".</p>
