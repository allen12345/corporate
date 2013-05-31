<?php

function phptemplate_settings($saved_settings) {

 $defaults = array(
    'tm_skin' => 0,
	'tm_slideshow' => 0,
    'tm_category' => 0,
	'tm_portfolio' => 0,
	'tm_page' => 0,
  );
  
  $settings = array_merge($defaults, $saved_settings);
  
  $form['tm_skin'] = array(
    '#type' => 'select',
    '#title' => t('Theme Skin'),
    '#default_value' => $settings['tm_skin'],
    '#options' => array (
      0 => t('Blue'),
	  1 => t('Dark Wood'),
	  2 => t('Green'),
	  3 => t('Modern'),
	  4 => t('Orange'),
	  5 => t('Red'),
    ),
  );

  $form['tm_slideshow'] = array(
    '#type' => 'select',
    '#title' => t('Home Page'),
    '#default_value' => $settings['tm_slideshow'],
    '#options' => array (
      0 => t('Style 1'),
	  1 => t('Style 2'),
	  2 => t('Style 3'),
    ),
  );
  
  $form['tm_title'] = array(
    '#type' => 'textfield',
    '#title' => t('Title'),
    '#description' => t(''),
    '#default_value' => $settings['tm_title'],
  );

  $form['tm_intro_title'] = array(
    '#type' => 'textfield',
    '#title' => t('Intro Title'),
    '#description' => t(''),
    '#default_value' => $settings['tm_intro_title'],
  );

  $form['tm_intro'] = array(
    '#type' => 'textarea',
    '#title' => t('Intro'),
    '#description' => t(''),
    '#default_value' => $settings['tm_intro'],
  );
/*
  $form['tm_category'] = array(
    '#type' => 'select',
    '#title' => t('Category'),
    '#default_value' => $settings['tm_category'],
    '#options' => array (
      0 => t('1 Column'),
	  1 => t('2 Columns'),
    ),
  );
*/
  $form['tm_portfolio'] = array(
    '#type' => 'select',
    '#title' => t('Portfolio'),
    '#default_value' => $settings['tm_portfolio'],
    '#options' => array (
      0 => t('2 Columns'),
	  1 => t('3 Columns (Full Width)'),
    ),
  );
 
  $form['tm_page'] = array(
    '#type' => 'select',
    '#title' => t('Page'),
    '#default_value' => $settings['tm_page'],
    '#options' => array (
      0 => t('1 Sidebar'),
	  1 => t('1 Columns (Full Width)'),
  	  2 => t('2 Columns (Full Width)'),
  	  3 => t('3 Columns (Full Width)'),
    ),
  );
  
  return $form;
}