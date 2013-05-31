<?php if (theme_get_setting('tm_slideshow') == 0) { ?>
<div id="feature-wrap">
<div id="feature-info">
	<?php $no = node_load(22); ?>
	<h3><?php print $no->title; ?></h3>
	<?php print $no->body; ?>
</div>
<div id="slider-wrap">
<div id="slider" class="nivoSlider">
	<?php foreach ($rows as $id => $row) { print $row; } ?>
</div>
</div>
<div class="clear"></div>
</div>
<?php } elseif (theme_get_setting('tm_slideshow') == 1) { ?>
<div id="slider-wrap-wide">
<div id="slider" class="nivoSlider">
	<?php foreach ($rows as $id => $row) { print $row; } ?>
</div>
</div>
<?php } else { ?>
<div id="slider-wrap-wide">
<div id="slider" class="nivoSlider">
	<?php foreach ($rows as $id => $row) { print $row; } ?>
</div>
</div>
<?php } ?>