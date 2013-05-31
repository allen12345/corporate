<h6><?php print $fields['title']->content; ?></h6>
<span class="date"><?php print t('Posted on !date', array('!date' => $fields['created']->content)); ?></span>
<p><?php print $fields['body']->content; ?> <a href="<?php print $fields['path']->content; ?>"><?php print t('Read More') ?></a></p>