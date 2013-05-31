<div class="news-entry">
<h2><?php print $fields['title']->content; ?></h2>
<p><?php print $fields['body']->content; ?></p>
<p class="small-news"><strong><?php print $fields['created']->content; ?></strong> - <a href="<?php print $fields['path']->content; ?>"><?php print t('Read more &rarr;'); ?></a></p>
</div>