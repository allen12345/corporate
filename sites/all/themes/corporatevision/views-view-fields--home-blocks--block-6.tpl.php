<div class="item">
<?php if ($fields['field_image_fid']->content) { ?><span><a href="<?php print $fields['path']->content; ?>"><?php print theme('imagecache', 'block_thumb', $fields['field_image_fid']->content, '', '');?></a></span><?php } ?>
<h4><?php print $fields['title']->content; ?></h4>
<p><?php print $fields['body']->content; ?></p>
</div>