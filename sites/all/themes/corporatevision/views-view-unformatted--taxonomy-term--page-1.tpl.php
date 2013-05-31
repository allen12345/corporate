<?php 
$t = theme_get_setting('tm_portfolio');
$i = 0;
foreach ($rows as $id => $row) {
	if ($t == 0) { 
		if ($i === 0) { $d = '<div class="portfolio-row"><div class="column portfolio-item">'; $f = '</div>'; $i = 1; } else { $d = '<div class="column portfolio-item last">'; $f = '</div></div>'; $i = 0; }
		print $d.$row.$f;
	} else {
		if ($i === 0) { $d = '<div class="portfolio-row"><div class="column portfolio-item">'; $f = '</div>'; $i = 1; } elseif ($i === 1) { $d = '<div class="column portfolio-item">'; $f = '</div>'; $i = 2; } else { $d = '<div class="column portfolio-item last">'; $f = '</div></div>'; $i = 0; }
		print $d.$row.$f;
	}
}
if (($t === 0 and $i != 0 ) or ($t == 1 and $i != 0 )) print '</div>';
?>