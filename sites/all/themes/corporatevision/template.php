<?php
// $Id$

if (!variable_get('corporatevision_first_start', false)) {
	variable_set('corporatevision_first_start', 1);
	corporatevision_taxonomy_menu_insert_link_items(1);
} 

function corporatevision_taxonomy_menu_insert_link_items($vid) {
  _taxonomy_menu_delete_all($vid);
  $terms = taxonomy_get_tree($vid);
  $menu_name = variable_get('taxonomy_menu_vocab_menu_'. $vid, FALSE);  
  foreach ($terms as $data) {
    $args = array(
      'term' => $data,
      'menu_name' => $menu_name,
    );
    $mlid = taxonomy_menu_handler('insert', $args);
  }
}

switch (theme_get_setting('tm_skin')) {
	case 0:
		drupal_add_css(drupal_get_path('theme', 'corporatevision') . '/style_blue.css', 'theme');
		break;
	case 1:
		drupal_add_css(drupal_get_path('theme', 'corporatevision') . '/style_darkwood.css', 'theme');
		break;
	case 2:
		drupal_add_css(drupal_get_path('theme', 'corporatevision') . '/style_green.css', 'theme');
		break;
	case 3:
		drupal_add_css(drupal_get_path('theme', 'corporatevision') . '/style_modern.css', 'theme');
		break;
	case 4:
		drupal_add_css(drupal_get_path('theme', 'corporatevision') . '/style_orange.css', 'theme');
		break;
	case 5:
		drupal_add_css(drupal_get_path('theme', 'corporatevision') . '/style_red.css', 'theme');
		break;
	default:
		drupal_add_css(drupal_get_path('theme', 'corporatevision') . '/style_blue.css', 'theme');
}

//drupal_add_js(drupal_get_path('theme', 'corporatevision') . '/inc/js/jquery.1.4.2.js');
drupal_add_js(drupal_get_path('theme', 'corporatevision') . '/inc/js/superfish.js');
drupal_add_js(drupal_get_path('theme', 'corporatevision') . '/inc/js/hoverIntent.js.js');
drupal_add_js(drupal_get_path('theme', 'corporatevision') . '/inc/js/jquery.nivo.slider.js');
drupal_add_js(drupal_get_path('theme', 'corporatevision') . '/inc/js/cufon-yui.js');
drupal_add_js(drupal_get_path('theme', 'corporatevision') . '/inc/js/liberation-sans.js');
drupal_add_js(drupal_get_path('theme', 'corporatevision') . '/inc/js/digitonik.js');


drupal_add_css(drupal_get_path('theme', 'corporatevision') . '/inc/prettyPhoto/css/prettyPhoto.css', 'theme');
drupal_add_js(drupal_get_path('theme', 'corporatevision') . '/inc/prettyPhoto/js/jquery.prettyPhoto.js');

drupal_add_js('Cufon.replace(\'h1, h2, h3, h4, h5, h6, .copyright,\', { hover: true, });Cufon.replace(\'#feature-info h3, #feature-info p,\', { textShadow: \'1px 1px #8b8b8b\', });', 'inline');
drupal_add_js('$(window).load(function() {$(\'#slider\').nivoSlider();});', 'inline');

/* Top Menu */
function corporatevision_tree_top($menu_name = 'primary-links', $type = 'hp-menu') {
  static $menu_output = array();

  if (!isset($menu_output[$menu_name])) {
    $tree = menu_tree_page_data($menu_name);
//	if (!$tree and arg(0) != 'batch') {
//	  if (!menu_tree_page_data('menu-cat-menu')) _taxonomy_menu_rebuild(2);
//	  if (!menu_tree_page_data('secondary-links')) _taxonomy_menu_rebuild(1);
//	  $tree = menu_tree_page_data($menu_name);
//	}
    $menu_output[$menu_name] = corporatevision_tree_output_top($tree,$type);
  }
  return $menu_output[$menu_name];
}


function corporatevision_tree_output_top($tree,$type) {
  $output = '';
  $items = array();

  foreach ($tree as $data) {
    if (!$data['link']['hidden']) {
      $items[] = $data;
    }
  }

  $num_items = count($items);
  $s = '';
  foreach ($items as $i => $data) {
	  //drupal_set_message('<pre>'. check_plain(print_r($data, 1)) .'</pre>');
	  //$s .= '<pre>'. check_plain(print_r($data, 1)) .'</pre>';
	  if ($data['link']['in_active_trail']) $a = ' class="toplevel"'; else $a = ' class="toplevel"';
    if ($data['below']) {
	  $output .= '<li'.$a.'><a href="'.url($data['link']['href']).'">'.$data['link']['title'].'</a>' . corporatevision_tree_output2_top($data['below']) ."</li>";
    }
    else {
	  $output .= '<li'.$a.'><a href="'.url($data['link']['href']).'">'.$data['link']['title'].'</a>'."</li>";
    }
  }
  return $output ? '<ul class="'.$type.'">'. $output .'</ul>'.$s : '';
}

function corporatevision_tree_output2_top($tree) {
  $output = '';
  $items = array();

  foreach ($tree as $data) {
    if (!$data['link']['hidden']) {
      $items[] = $data;
    }
  }
  $num_items = count($items);
  foreach ($items as $i => $data) {
	 // if ($data['link']['in_active_trail']) $a = ' class="current_page_item"'; else $a = '';
	 $a = '';
	if ($data['below']) {
		$output .= '<li'.$a.'><a href="'.url($data['link']['href']).'">'.$data['link']['title'].'</a>'.corporatevision_tree_output2_top($data['below'])."</li>";
	}
    else {
	  $output .= '<li'.$a.'><a href="'.url($data['link']['href']).'">'.$data['link']['title'].'</a>'."</li>";
    }
  }
  return $output ? '<ul>'. $output .'</ul>' : '';
}

/* Bottom Menu */
function corporatevision_tree_bottom($menu_name = 'secondary-links', $type = 'sf-menu') {
  static $menu_output = array();

  if (!isset($menu_output[$menu_name])) {
    $tree = menu_tree_page_data($menu_name);
//	if (!$tree and arg(0) != 'batch') {
//	  if (!menu_tree_page_data('menu-cat-menu')) _taxonomy_menu_rebuild(2);
//	  if (!menu_tree_page_data('secondary-links')) _taxonomy_menu_rebuild(1);
//	  $tree = menu_tree_page_data($menu_name);
//	}
    $menu_output[$menu_name] = corporatevision_tree_output_bottom($tree,$type);
  }
  return $menu_output[$menu_name];
}


function corporatevision_tree_output_bottom($tree,$type) {
  $output = '';
  $items = array();

  foreach ($tree as $data) {
    if (!$data['link']['hidden']) {
      $items[] = $data;
    }
  }

  $num_items = count($items);
  $s = '';
  foreach ($items as $i => $data) {
	  //drupal_set_message('<pre>'. check_plain(print_r($data, 1)) .'</pre>');
	  //$s .= '<pre>'. check_plain(print_r($data, 1)) .'</pre>';
	  if ($data['link']['in_active_trail']) $a = ' class="current_page_item"'; else $a = '';
	  $output .= '<li'.$a.'><a href="'.url($data['link']['href']).'">'.$data['link']['title'].'</a>'."</li>";
  }
  return $output ? '<ul>'. $output .'</ul>'.$s : '';
}




function corporatevision_menu_tree($tree) {
  return '<ul>'. $tree .'</ul>';
}

/**
 * Generate the HTML output for a menu item and submenu.
 *
 * @ingroup themeable
 */
function corporatevision_menu_item($link, $has_children, $menu = '', $in_active_trail = FALSE, $extra_class = NULL) {
  return '<li>'. $link . $menu ."</li>\n";
}

/* Node */
function corporatevision_get_node($type = 'type') {
	static $node = false;
	if (!$node and arg(0) == 'node' and is_numeric(arg(1))){
		$node = db_fetch_array(db_query('SELECT * FROM {node} where nid = %d',arg(1)));
	}	
  return $node[$type];
}

function corporatevision_get_node_style() {
	static $node = false;
	if (!$node and arg(0) == 'node' and is_numeric(arg(1)) and !arg(2)){
		$node = node_load(arg(1));
		return $node->field_style[0]['value'];
	} else {
		return 'n';
	} 
}

function corporatevision_get_tax_link($vid = 1) {
	$out = '';
	$result = db_query('SELECT * FROM {term_data} where vid = %d',$vid);
	while ($term = db_fetch_object($result)) {
		$out .= l($term->name, 'taxonomy/term/'.$term->tid).' ';
	}	
  return $out;
}

function corporatevision_truncate_utf8($string, $len, $wordsafe = FALSE, $dots = FALSE, &$ll = 0) {

  if (drupal_strlen($string) <= $len) {
    return $string;
  }

  if ($dots) {
    $len -= 4;
  }

  if ($wordsafe) {
    $string = drupal_substr($string, 0, $len + 1); // leave one more character
    if ($last_space = strrpos($string, ' ')) { // space exists AND is not on position 0
      $string = substr($string, 0, $last_space);
      $ll = $last_space;
    }
    else {
      $string = drupal_substr($string, 0, $len);
	  $ll = $len;
    }
  }
  else {
    $string = drupal_substr($string, 0, $len);
	$ll = $len;
  }

  if ($dots) {
    $string .= ' ...';
  }

  return $string;
}