<?php 
$cc = 'comments_full';
if (theme_get_setting('tm_page') == 1) $cc = 'comments_twosidebars';
elseif (theme_get_setting('tm_page') == 2) $cc = 'comments_fullwidth';
?>
<div id="comments">
<?php if ($node->comment_count) { ?>
<h3><?php print t('!count', array('!count' => format_plural($node->comment_count, '1 <span class="headline-reg">&#125; Comment</span>', '@count <span class="headline-reg">&#125; Comments</span>'))); ?></h3>
<?php } ?>
<div class="comment_c"><?php print $content; ?></div>
</div>
<?php //print '<pre>'. check_plain(print_r($node, 1)) .'</pre>' ?>
