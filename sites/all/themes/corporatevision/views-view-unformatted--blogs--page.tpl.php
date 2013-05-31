<?php 
$t = theme_get_setting('tm_category');
$i = true;
//if ($t == 1) print '<div class="col-wrap">';
foreach ($rows as $id => $row) {
if ($t == 1) { 
if ($i) { $d = '<div class="col-wrap"><div class="col-2">'; $f = '</div>'; $i = false; } else { $d = '<div class="col-2 last">'; $f = '</div><div class="clear"></div></div>'; $i = true; }
print $d.$row.$f;
} else print $row;

}
if ($t == 1 and !$i) print '</div>';
?>