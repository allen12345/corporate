<h3>Blog <span class="headline-reg">&#125; What We're Saying</span></h3>
<h4><a href="<?php print url('blog/'.$fields['uid']->content); ?>"><?php print t('Read the blog'); ?></a></h4>
<?php if ($fields['field_image_fid']->content) { ?><a href="<?php print $fields['path']->content; ?>"><?php print theme('imagecache', 'home_bottom_first', $fields['field_image_fid']->content, '', '', array('class' => 'post-img col-left'));?></a><?php } ?>
<div class="clear"></div>
<h2><?php print $fields['title']->content; ?></h2>
<p><?php print $fields['body']->content; ?></p>
<a class="more-link" href="<?php print $fields['path']->content; ?>"><?php print t('Read more &rarr;'); ?></a>