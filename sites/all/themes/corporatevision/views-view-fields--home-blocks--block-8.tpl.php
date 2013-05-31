<?php if (theme_get_setting('tm_slideshow') == 0) { ?>
<div class="reviews">
<h3><?php print theme_get_setting('tm_title'); ?> <span class="headline-reg">&#125; <?php print $fields['title']->content; ?></span></h3>
<p class="review-text"><?php print node_teaser(strip_tags($fields['body']->content, '<a><b><i><u>'), NULL, 300).'... ' ?></p>
<?php if ($fields['field_image_fid']->content) { ?><a href="<?php print $fields['path']->content; ?>"><?php print theme('imagecache', 'home_top_first', $fields['field_image_fid']->content, '', '', array('class' => 'quoted-pic'));?></a><?php } ?>
<ul class="quoted-info">
<li><h4><?php print $fields['name']->content; ?></h4></li>
<li class="small"><a href="<?php print $fields['path']->content; ?>"><?php print t('more &rarr;'); ?></a></li>
</ul>
</div>
<?php } elseif (theme_get_setting('tm_slideshow') == 1) { ?>
<h3 id="intro"><?php print theme_get_setting('tm_intro_title'); ?> <span class="headline-reg">&#125; <?php print theme_get_setting('tm_intro'); ?></span></h3>
<div class="reviews">
<h3><?php print theme_get_setting('tm_title'); ?> <span class="headline-reg">&#125; <?php print $fields['title']->content; ?></span></h3>
<p class="review-text"><?php print node_teaser(strip_tags($fields['body']->content, '<a><b><i><u>'), NULL, 300).'... ' ?></p>
<?php if ($fields['field_image_fid']->content) { ?><a href="<?php print $fields['path']->content; ?>"><?php print theme('imagecache', 'home_top_first', $fields['field_image_fid']->content, '', '', array('class' => 'quoted-pic'));?></a><?php } ?>
<ul class="quoted-info">
<li><h4><?php print $fields['name']->content; ?></h4></li>
<li class="small"><a href="<?php print $fields['path']->content; ?>"><?php print t('more &rarr;'); ?></a></li>
</ul>
</div>
<?php } else { ?>
<div class="welcome-buzz">
<h3><?php print theme_get_setting('tm_title'); ?> <span class="headline-reg">&#125; <?php print $fields['title']->content; ?></span></h3>
<p><?php print $fields['body']->content; ?></p>
<a href="<?php print $fields['path']->content; ?>"><?php print t('Learn more &rarr;'); ?></a>	
</div>
<?php } ?>