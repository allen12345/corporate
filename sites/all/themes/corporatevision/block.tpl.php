<?php 
$out = '';
if ($block->region == 'footer_first' or $block->region == 'footer_second' or $block->region == 'footer_third' or $block->region == 'footer_fourth') { 
	if ($block->subject) $out .= '<h3>'.$block->subject.'</h3>';
	$out .= str_replace(array('class="form-submit"', 'class="form-text required"'), array('class="submit"', 'class="input_small"'), $block->content);
} elseif ($block->region == 'home_quarter_first' or $block->region == 'home_quarter_second' or $block->region == 'home_quarter_third' or $block->region == 'home_quarter_fourth') {
	$out .= $block->content;
} elseif ($block->region == 'home_top_first' or $block->region == 'home_top_second' or $block->region == 'home_bottom_first' or $block->region == 'home_bottom_second' or $block->region == 'home_bottom_third') {
	if ($block->subject) $out .= '<h3>'.$block->subject.'</h3>';
	$out .= $block->content;
} elseif ($block->region == 'home_quarter_first' or $block->region == 'home_quarter_second' or $block->region == 'home_quarter_third' or $block->region == 'home_quarter_fourth') {
	if ($block->subject) $out .= '<h3>'.$block->subject.'</h3>';
	$out .= $block->content;
} else {
	$out .= '<div class="widget">';
	if ($block->subject) $out .= '<h3 class="widgettitle">'.$block->subject.'</h3>';
	$out .= ''.str_replace(array(' class="item-list"'), '', $block->content).'';
	$out .= '<div class="clear"></div></div>';
}
print $out; 
//print '<pre>'. check_plain(print_r($block, 1)) .'</pre>';
?>