<div class="post-entry col-left">
<h2><?php print $fields['title']->content; ?></h2>
<p class="post-meta"><?php print $fields['created']->content; ?> by <?php print $fields['name']->content; ?> | <a href="<?php print url($fields['path']->content, array('fragment' => 'comments')) ?>"><?php print format_plural($fields['comment_count']->content, '1 Comment', '@count Comments') ?></a></p>
<?php if ($fields['field_image_fid']->content) { ?><a href="<?php print $fields['path']->content; ?>"><?php print theme('imagecache', 'blog_teaser_0', $fields['field_image_fid']->content, '', '', array('class' => 'post-entry-img col-left'));?></a><?php } ?>
<p><?php print $fields['body']->content; ?></p>
<a class="more-link" href="<?php print $fields['path']->content; ?>"><?php print t('Read More &rarr;') ?></a>
</div>