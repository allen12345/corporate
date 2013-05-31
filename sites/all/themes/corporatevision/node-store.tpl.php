<?php if ($page == 0) { ?>
<div class="post-entry col-left">
<h2><a href="<?php print $node_url ?>" title="<?php print $title ?>"><?php print $title ?></a></h2>
<p class="post-meta"><?php print $date; ?> <?php print t('by !name', array('!name' => theme('username',$node->name))) ?> | <a href="" >Inspiration</a> | <a href="<?php print url("node/$node->nid", array('fragment' => 'comments')) ?>"><?php print format_plural($node->comment_count, '1 Comment', '@count Comments') ?></a></p>
<?php if ($node->field_image[0]) { ?><div class="post-image image_load"><a href="<?php print $node_url ?>"><?php print theme('imagecache', 'blog_teaser_0', $node->field_image[0]['filepath'], $node->field_image[0]['data']['alt'], $node->field_image[0]['data']['title'], array('class' => 'post-entry-img col-left'));?></a></div><?php } ?>
<?php print node_teaser($content, NULL, 200).'... ' ?>
<a class="more-link" href="<?php print $node_url ?>" title="<?php print $title ?>"><?php print t('Read More') ?></a>
</div>
<?php } else { 
if ($node->field_style[0]['value'] != '') {
	$ss = $node->field_style[0]['value'];
} else {
	$ss = theme_get_setting('tm_page');
}
$pp = $ss;
if ($pp > 1) $pp = 1;	
?>
<div id="post" class="post-entry col-left">
<p class="post-meta"><?php print $date; ?> <?php print t('by !name', array('!name' => theme('username',$node->name))) ?> | <a href="<?php print url("node/$node->nid", array('fragment' => 'comments')) ?>"><?php print format_plural($node->comment_count, '1 Comment', '@count Comments') ?></a></p>
<?php if ($node->field_image[0]) { ?><p><span class="image_load preview-image"><a href="<?php print $GLOBALS['base_url'].'/'.$node->field_image[0]['filepath'] ?>" rel="prettyPhoto[pp_gal]" title="<?php print $title ?>" class="gim"><?php print theme('imagecache', 'blog_body_'.$pp, $node->field_image[0]['filepath'], $node->field_image[0]['data']['alt'], $node->field_image[0]['data']['title'],array('class' => 'post-entry-img col-left')); ?></a></span></p><?php } ?>
<?php 
if ($ss < 2) {
print $content;
} elseif ($ss == 2) { 
$l = floor(drupal_strlen($content)/2)+20;
print '<div class="one-half">'.corporatevision_truncate_utf8($content, $l, true, false, $ll).'</div>';
print '<div class="one-half-last"><p>'.drupal_substr($content, $ll).'</div>';
} elseif ($ss == 3) {
$l = floor(drupal_strlen($content)/3)+20;
print '<div class="one-third">'.corporatevision_truncate_utf8($content, $l, true, false, $ll).'</div>';
$tt = drupal_substr($content, $ll);
$l = floor(drupal_strlen($tt)/2)+20;
print '<div class="one-third"><p>'.corporatevision_truncate_utf8($tt, $l, true, false, $ll).'</div>';
print '<div class="one-third-last"><p>'.drupal_substr($tt, $ll).'</div>';
} else {
print $content;
} ?>
<div class="clear"></div>
<?php 
foreach ($taxonomy as $key => $value) {
$aa[] = l($value['title'], $value['href']);
}
if (count($aa)) {
	print '<p class="tags"><strong>'.t('Tags').'</strong> &#125; '.implode(",", $aa).'</p>';
}
?>
<?php if ($links): ?>
<div class="tlinks"><?php print $links; ?></div>
<?php endif; ?>
</div>
<div class="clear"></div>
<?php } ?>

<?php //print '<pre>'. check_plain(print_r($ac, 1)) .'</pre>'; ?>