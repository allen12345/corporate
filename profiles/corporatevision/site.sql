
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `aid` int(11) NOT NULL auto_increment,
  `mask` varchar(255) NOT NULL default '',
  `type` varchar(255) NOT NULL default '',
  `status` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `aid` varchar(255) NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  `callback` varchar(255) NOT NULL default '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL default '0',
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `actions` VALUES ('comment_publish_action', 'comment', 'comment_publish_action', '', 'Publish comment');
INSERT INTO `actions` VALUES ('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment');
INSERT INTO `actions` VALUES ('node_publish_action', 'node', 'node_publish_action', '', 'Publish post');
INSERT INTO `actions` VALUES ('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish post');
INSERT INTO `actions` VALUES ('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make post sticky');
INSERT INTO `actions` VALUES ('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make post unsticky');
INSERT INTO `actions` VALUES ('node_promote_action', 'node', 'node_promote_action', '', 'Promote post to front page');
INSERT INTO `actions` VALUES ('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove post from front page');
INSERT INTO `actions` VALUES ('node_save_action', 'node', 'node_save_action', '', 'Save post');
INSERT INTO `actions` VALUES ('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user');
INSERT INTO `actions` VALUES ('user_block_ip_action', 'user', 'user_block_ip_action', '', 'Ban IP address of current user');
DROP TABLE IF EXISTS `actions_aid`;
CREATE TABLE `actions_aid` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
DROP TABLE IF EXISTS `authmap`;
CREATE TABLE `authmap` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `authname` varchar(128) NOT NULL default '',
  `module` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext,
  PRIMARY KEY  (`bid`),
  KEY `token` (`token`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;
DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks` (
  `bid` int(11) NOT NULL auto_increment,
  `module` varchar(64) NOT NULL default '',
  `delta` varchar(32) NOT NULL default '0',
  `theme` varchar(64) NOT NULL default '',
  `status` tinyint(4) NOT NULL default '0',
  `weight` tinyint(4) NOT NULL default '0',
  `region` varchar(64) NOT NULL default '',
  `custom` tinyint(4) NOT NULL default '0',
  `throttle` tinyint(4) NOT NULL default '0',
  `visibility` tinyint(4) NOT NULL default '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL default '',
  `cache` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;
INSERT INTO `blocks` VALUES (1, 'user', '0', 'garland', 1, 0, 'left', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (2, 'user', '1', 'garland', 1, 0, 'left', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (3, 'system', '0', 'garland', 1, 10, 'footer', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (4, 'system', '0', 'modernbusiness', 0, -15, '', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (5, 'user', '0', 'modernbusiness', 1, -12, 'sidebar_right_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (6, 'user', '1', 'modernbusiness', 0, -10, '', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (7, 'comment', '0', 'modernbusiness', 0, -12, '', 0, 0, 0, '', '', 1);
INSERT INTO `blocks` VALUES (8, 'menu', 'primary-links', 'modernbusiness', 0, -14, '', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (9, 'menu', 'secondary-links', 'modernbusiness', 0, -12, '', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (10, 'node', '0', 'modernbusiness', 0, -11, '', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (11, 'search', '0', 'modernbusiness', 1, -15, 'sidebar_right_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (12, 'user', '2', 'modernbusiness', 1, -13, 'sidebar_right_second', 0, 0, 0, '', '', 1);
INSERT INTO `blocks` VALUES (13, 'user', '3', 'modernbusiness', 1, -12, 'sidebar_right_second', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (14, 'blog', '0', 'modernbusiness', 0, -13, '', 0, 0, 0, '', '', 1);
INSERT INTO `blocks` VALUES (20, 'block', '1', 'modernbusiness', 1, -14, 'sidebar_right_second', 0, 0, 0, '', 'Bestest Buddies', -1);
INSERT INTO `blocks` VALUES (15, 'menu', 'menu-about', 'modernbusiness', 1, 0, 'footer_second', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (66, 'views', 'home_blocks-block_8', 'corporatevision', 1, 0, 'home_top_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (17, 'menu', 'menu-features', 'modernbusiness', 1, 0, 'footer_third', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (19, 'views', 'blogs-block_1', 'modernbusiness', 1, -14, 'sidebar_right_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (21, 'simplenews', '5', 'modernbusiness', 1, 0, 'footer_first', 0, 0, 0, '', 'Doubtfire Newsletter', -1);
INSERT INTO `blocks` VALUES (22, 'views', 'home_blocks-block_1', 'modernbusiness', 1, 0, 'home_quarter_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (23, 'views', 'home_blocks-block_2', 'modernbusiness', 1, -4, 'home_quarter_second', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (24, 'views', 'home_blocks-block_3', 'modernbusiness', 1, -4, 'home_quarter_third', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (25, 'views', 'home_blocks-block_4', 'modernbusiness', 1, 0, 'home_quarter_fourth', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (28, 'block', '4', 'modernbusiness', 1, 0, 'home_bottom_second', 0, 0, 0, '', 'Follow us on', -1);
INSERT INTO `blocks` VALUES (29, 'views', 'home_blocks-block_5', 'modernbusiness', 1, 0, 'home_bottom_first', 0, 0, 0, '', 'New Blogs', -1);
INSERT INTO `blocks` VALUES (30, 'views', 'home_blocks-block_6', 'modernbusiness', 1, 0, 'home_bottom_third', 0, 0, 0, '', 'Portfolio', -1);
INSERT INTO `blocks` VALUES (31, 'views', 'home_blocks-block_7', 'modernbusiness', 1, 0, 'slide_show', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (32, 'views', 'comments-block_1', 'modernbusiness', 1, -13, 'sidebar_right_first', 0, 0, 0, '', 'Recent comments', -1);
INSERT INTO `blocks` VALUES (33, 'block', '1', 'corporatevision', 1, -14, 'sidebar_right_first', 0, 0, 0, '', 'Bestest Buddies', -1);
INSERT INTO `blocks` VALUES (36, 'block', '4', 'corporatevision', 1, -15, 'home_bottom_third', 0, 0, 0, '', 'Follow us on', -1);
INSERT INTO `blocks` VALUES (37, 'blog', '0', 'corporatevision', 0, -14, '', 0, 0, 0, '', '', 1);
INSERT INTO `blocks` VALUES (38, 'comment', '0', 'corporatevision', 0, -15, '', 0, 0, 0, '', '', 1);
INSERT INTO `blocks` VALUES (39, 'menu', 'menu-about', 'corporatevision', 1, 0, 'footer_second', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (65, 'menu', 'menu-categories', 'corporatevision', 1, -13, 'sidebar_right_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (41, 'menu', 'menu-features', 'corporatevision', 1, 0, 'footer_third', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (43, 'menu', 'primary-links', 'corporatevision', 0, -8, '', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (44, 'menu', 'secondary-links', 'corporatevision', 0, -7, '', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (45, 'node', '0', 'corporatevision', 0, -13, '', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (46, 'search', '0', 'corporatevision', 1, -15, 'sidebar_right_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (48, 'system', '0', 'corporatevision', 0, -10, '', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (49, 'user', '0', 'corporatevision', 1, -10, 'sidebar_right_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (50, 'user', '1', 'corporatevision', 1, -5, 'sidebar_right_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (51, 'user', '2', 'corporatevision', 0, -11, '', 0, 0, 0, '', '', 1);
INSERT INTO `blocks` VALUES (52, 'user', '3', 'corporatevision', 0, -12, '', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (53, 'views', 'blogs-block_1', 'corporatevision', 1, -12, 'sidebar_right_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (54, 'views', 'comments-block_1', 'corporatevision', 1, -11, 'sidebar_right_first', 0, 0, 0, '', 'Recent comments', -1);
INSERT INTO `blocks` VALUES (55, 'views', 'home_blocks-block_1', 'corporatevision', 1, 0, 'home_quarter_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (56, 'views', 'home_blocks-block_2', 'corporatevision', 1, -4, 'home_quarter_second', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (57, 'views', 'home_blocks-block_3', 'corporatevision', 1, -4, 'home_quarter_third', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (58, 'views', 'home_blocks-block_4', 'corporatevision', 1, 0, 'home_quarter_fourth', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (59, 'views', 'home_blocks-block_5', 'corporatevision', 1, 0, 'home_bottom_first', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (61, 'views', 'home_blocks-block_7', 'corporatevision', 1, 0, 'slide_show', 0, 0, 0, '', '', -1);
INSERT INTO `blocks` VALUES (62, 'block', '5', 'corporatevision', 1, -15, 'footer_first', 0, 0, 0, '', 'Find us here', -1);
INSERT INTO `blocks` VALUES (63, 'block', '6', 'corporatevision', 1, -15, 'footer_first', 0, 0, 0, '', 'Contact Us', -1);
INSERT INTO `blocks` VALUES (64, 'block', '7', 'corporatevision', 1, 0, 'footer_fourth', 0, 0, 0, '', 'Get to know Sprout', -1);
INSERT INTO `blocks` VALUES (67, 'views', 'home_blocks-block_9', 'corporatevision', 1, 0, 'home_bottom_second', 0, 0, 0, '', '', -1);
DROP TABLE IF EXISTS `blocks_roles`;
CREATE TABLE `blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `boxes`;
CREATE TABLE `boxes` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `body` longtext,
  `info` varchar(128) NOT NULL default '',
  `format` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;
INSERT INTO `boxes` VALUES (1, '<a href="#" class="big-ad col-left"><img src="/sites/all/themes/corporatevision/style/images/demo/d5.jpg" alt="video hive" /></a>\r\n<a href="#" class="big-ad col-left"><img src="/sites/all/themes/corporatevision/style/images/demo/d5.jpg" alt="video hive" /></a>', 'Bestest Buddies', 2);
INSERT INTO `boxes` VALUES (4, '<a class="social-icon" href="#"><img src="/sites/all/themes/corporatevision/style/images/twitter.png" alt="Twitter" /></a><a class="social-icon" href="#"><img src="/sites/all/themes/corporatevision/style/images/facebook.png" alt="Facebook" /></a><a class="social-icon" href="#"><img src="/sites/all/themes/corporatevision/style/images/linkedin.png" alt="Linked In" /></a><a class="social-icon" href="#"><img src="/sites/all/themes/corporatevision/style/images/behance.png" alt="Behance" /></a><a class="social-icon" href="#"><img src="/sites/all/themes/corporatevision/style/images/flickr.png" alt="Flickr" /></a><a class="social-icon" href="#"><img src="/sites/all/themes/corporatevision/style/images/rss.png" alt="rss" /></a>', 'Follow us on', 2);
INSERT INTO `boxes` VALUES (5, '<ul>\r\n<li>410 Townsend St</li>\r\n<li>San Francisco, CA 94107</li>\r\n</ul>', 'Find us here', 2);
INSERT INTO `boxes` VALUES (6, '<ul>\r\n<li>support@sprouttheme.com</li>\r\n<li>214-555-5379</li>\r\n</ul>', 'Contact Us', 2);
INSERT INTO `boxes` VALUES (7, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s. Very nice.', 'Get to know Sprout', 2);
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `cache_block`;
CREATE TABLE `cache_block` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `cache_content`;
CREATE TABLE `cache_content` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `cache_filter`;
CREATE TABLE `cache_filter` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `cache_form`;
CREATE TABLE `cache_form` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `cache_menu`;
CREATE TABLE `cache_menu` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `cache_page`;
CREATE TABLE `cache_page` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `cache_views`;
CREATE TABLE `cache_views` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `cache_views_data`;
CREATE TABLE `cache_views_data` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '1',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `cid` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL default '0',
  `nid` int(11) NOT NULL default '0',
  `uid` int(11) NOT NULL default '0',
  `subject` varchar(64) NOT NULL default '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  `format` smallint(6) NOT NULL default '0',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) default NULL,
  `mail` varchar(64) default NULL,
  `homepage` varchar(255) default NULL,
  PRIMARY KEY  (`cid`),
  KEY `pid` (`pid`),
  KEY `nid` (`nid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;
INSERT INTO `comments` VALUES (1, 0, 10, 1, 'Lorem ipsum dolor sit amet,', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, 3dt labore et dolore magna aliqua.', '127.0.0.1', 1282569880, 0, 1, '01/', 'admin', '', '');
INSERT INTO `comments` VALUES (2, 0, 10, 1, 'Ut enim ad minim veniam, quis', 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '127.0.0.1', 1282569895, 0, 1, '02/', 'admin', '', '');
INSERT INTO `comments` VALUES (3, 0, 10, 1, 'Nisi ut aliquip ex ea commodo', 'Nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, ut labore et dolore magna aliqua', '127.0.0.1', 1282569906, 0, 1, '03/', 'admin', '', '');
INSERT INTO `comments` VALUES (4, 2, 10, 1, 'Nisi ut aliquip ex ea commodo', 'Nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, ut labore et dolore magna aliqua', '127.0.0.1', 1282569928, 0, 1, '02.00/', 'admin', '', '');
INSERT INTO `comments` VALUES (5, 4, 10, 1, 'Nisi ut aliquip ex ea commodo', 'Nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, ut labore et dolore magna aliqua', '127.0.0.1', 1282569938, 0, 1, '02.00.00/', 'admin', '', '');
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `cid` int(10) unsigned NOT NULL auto_increment,
  `category` varchar(255) NOT NULL default '',
  `recipients` longtext NOT NULL,
  `reply` longtext NOT NULL,
  `weight` tinyint(4) NOT NULL default '0',
  `selected` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  UNIQUE KEY `category` (`category`),
  KEY `list` (`weight`,`category`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;
INSERT INTO `contact` VALUES (1, 'website feedback', 'me@localhost.com', '', 0, 0);
DROP TABLE IF EXISTS `content_field_image`;
CREATE TABLE `content_field_image` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `field_image_fid` int(11) default NULL,
  `field_image_list` tinyint(4) default NULL,
  `field_image_data` text,
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_field_image` VALUES (9, 9, 1, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (8, 8, 2, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (7, 7, 3, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (6, 6, 4, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (10, 10, 6, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (14, 14, 7, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (15, 15, 8, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (16, 16, 9, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (17, 17, 10, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (18, 18, 11, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (19, 19, 12, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (20, 20, 14, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (21, 21, 15, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (23, 23, 16, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (22, 22, NULL, NULL, NULL);
INSERT INTO `content_field_image` VALUES (24, 24, 17, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (25, 25, 18, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (26, 26, 19, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (27, 27, 20, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (28, 28, 21, 1, 'a:2:{s:3:"alt";s:0:"";s:5:"title";s:0:"";}');
INSERT INTO `content_field_image` VALUES (1, 1, NULL, NULL, NULL);
DROP TABLE IF EXISTS `content_field_quarterfirst`;
CREATE TABLE `content_field_quarterfirst` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `field_quarterfirst_value` longtext,
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_field_quarterfirst` VALUES (8, 8, 'y');
INSERT INTO `content_field_quarterfirst` VALUES (10, 10, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (9, 9, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (7, 7, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (14, 14, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (15, 15, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (16, 16, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (17, 17, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (18, 18, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (19, 19, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (20, 20, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (21, 21, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (24, 24, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (25, 25, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (26, 26, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (27, 27, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (28, 28, 'n');
INSERT INTO `content_field_quarterfirst` VALUES (6, 6, 'n');
DROP TABLE IF EXISTS `content_field_quarterfourth`;
CREATE TABLE `content_field_quarterfourth` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `field_quarterfourth_value` longtext,
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_field_quarterfourth` VALUES (8, 8, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (10, 10, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (9, 9, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (7, 7, 'y');
INSERT INTO `content_field_quarterfourth` VALUES (14, 14, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (15, 15, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (16, 16, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (17, 17, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (18, 18, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (19, 19, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (20, 20, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (21, 21, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (24, 24, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (25, 25, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (26, 26, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (27, 27, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (28, 28, 'n');
INSERT INTO `content_field_quarterfourth` VALUES (6, 6, 'n');
DROP TABLE IF EXISTS `content_field_quartersecond`;
CREATE TABLE `content_field_quartersecond` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `field_quartersecond_value` longtext,
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_field_quartersecond` VALUES (8, 8, 'n');
INSERT INTO `content_field_quartersecond` VALUES (10, 10, 'y');
INSERT INTO `content_field_quartersecond` VALUES (9, 9, 'n');
INSERT INTO `content_field_quartersecond` VALUES (7, 7, 'n');
INSERT INTO `content_field_quartersecond` VALUES (14, 14, 'n');
INSERT INTO `content_field_quartersecond` VALUES (15, 15, 'n');
INSERT INTO `content_field_quartersecond` VALUES (16, 16, 'n');
INSERT INTO `content_field_quartersecond` VALUES (17, 17, 'n');
INSERT INTO `content_field_quartersecond` VALUES (18, 18, 'n');
INSERT INTO `content_field_quartersecond` VALUES (19, 19, 'n');
INSERT INTO `content_field_quartersecond` VALUES (20, 20, 'n');
INSERT INTO `content_field_quartersecond` VALUES (21, 21, 'n');
INSERT INTO `content_field_quartersecond` VALUES (24, 24, 'n');
INSERT INTO `content_field_quartersecond` VALUES (25, 25, 'n');
INSERT INTO `content_field_quartersecond` VALUES (26, 26, 'n');
INSERT INTO `content_field_quartersecond` VALUES (27, 27, 'n');
INSERT INTO `content_field_quartersecond` VALUES (28, 28, 'n');
INSERT INTO `content_field_quartersecond` VALUES (6, 6, 'n');
DROP TABLE IF EXISTS `content_field_quarterthird`;
CREATE TABLE `content_field_quarterthird` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `field_quarterthird_value` longtext,
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_field_quarterthird` VALUES (8, 8, 'n');
INSERT INTO `content_field_quarterthird` VALUES (10, 10, 'n');
INSERT INTO `content_field_quarterthird` VALUES (9, 9, 'y');
INSERT INTO `content_field_quarterthird` VALUES (7, 7, 'n');
INSERT INTO `content_field_quarterthird` VALUES (14, 14, 'n');
INSERT INTO `content_field_quarterthird` VALUES (15, 15, 'n');
INSERT INTO `content_field_quarterthird` VALUES (16, 16, 'n');
INSERT INTO `content_field_quarterthird` VALUES (17, 17, 'n');
INSERT INTO `content_field_quarterthird` VALUES (18, 18, 'n');
INSERT INTO `content_field_quarterthird` VALUES (19, 19, 'n');
INSERT INTO `content_field_quarterthird` VALUES (20, 20, 'n');
INSERT INTO `content_field_quarterthird` VALUES (21, 21, 'n');
INSERT INTO `content_field_quarterthird` VALUES (24, 24, 'n');
INSERT INTO `content_field_quarterthird` VALUES (25, 25, 'n');
INSERT INTO `content_field_quarterthird` VALUES (26, 26, 'n');
INSERT INTO `content_field_quarterthird` VALUES (27, 27, 'n');
INSERT INTO `content_field_quarterthird` VALUES (28, 28, 'n');
INSERT INTO `content_field_quarterthird` VALUES (6, 6, 'n');
DROP TABLE IF EXISTS `content_field_slideshow`;
CREATE TABLE `content_field_slideshow` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `field_slideshow_value` longtext,
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_field_slideshow` VALUES (8, 8, 'n');
INSERT INTO `content_field_slideshow` VALUES (10, 10, 'n');
INSERT INTO `content_field_slideshow` VALUES (9, 9, 'n');
INSERT INTO `content_field_slideshow` VALUES (7, 7, 'n');
INSERT INTO `content_field_slideshow` VALUES (14, 14, 'y');
INSERT INTO `content_field_slideshow` VALUES (15, 15, 'y');
INSERT INTO `content_field_slideshow` VALUES (16, 16, 'y');
INSERT INTO `content_field_slideshow` VALUES (17, 17, 'y');
INSERT INTO `content_field_slideshow` VALUES (18, 18, 'y');
INSERT INTO `content_field_slideshow` VALUES (19, 19, 'y');
INSERT INTO `content_field_slideshow` VALUES (20, 20, 'y');
INSERT INTO `content_field_slideshow` VALUES (21, 21, 'y');
INSERT INTO `content_field_slideshow` VALUES (24, 24, 'n');
INSERT INTO `content_field_slideshow` VALUES (25, 25, 'n');
INSERT INTO `content_field_slideshow` VALUES (26, 26, 'n');
INSERT INTO `content_field_slideshow` VALUES (27, 27, 'n');
INSERT INTO `content_field_slideshow` VALUES (28, 28, 'n');
INSERT INTO `content_field_slideshow` VALUES (6, 6, 'n');
DROP TABLE IF EXISTS `content_field_style`;
CREATE TABLE `content_field_style` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `field_style_value` longtext,
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_field_style` VALUES (9, 9, NULL);
INSERT INTO `content_field_style` VALUES (8, 8, NULL);
INSERT INTO `content_field_style` VALUES (7, 7, NULL);
INSERT INTO `content_field_style` VALUES (6, 6, NULL);
INSERT INTO `content_field_style` VALUES (10, 10, NULL);
INSERT INTO `content_field_style` VALUES (24, 24, NULL);
INSERT INTO `content_field_style` VALUES (25, 25, NULL);
INSERT INTO `content_field_style` VALUES (23, 23, '0');
DROP TABLE IF EXISTS `content_node_field`;
CREATE TABLE `content_node_field` (
  `field_name` varchar(32) NOT NULL default '',
  `type` varchar(127) NOT NULL default '',
  `global_settings` mediumtext NOT NULL,
  `required` tinyint(4) NOT NULL default '0',
  `multiple` tinyint(4) NOT NULL default '0',
  `db_storage` tinyint(4) NOT NULL default '1',
  `module` varchar(127) NOT NULL default '',
  `db_columns` mediumtext NOT NULL,
  `active` tinyint(4) NOT NULL default '0',
  `locked` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_node_field` VALUES ('field_image', 'filefield', 'a:3:{s:10:"list_field";s:1:"0";s:12:"list_default";i:1;s:17:"description_field";s:1:"0";}', 0, 0, 0, 'filefield', 'a:3:{s:3:"fid";a:3:{s:4:"type";s:3:"int";s:8:"not null";b:0;s:5:"views";b:1;}s:4:"list";a:4:{s:4:"type";s:3:"int";s:4:"size";s:4:"tiny";s:8:"not null";b:0;s:5:"views";b:1;}s:4:"data";a:3:{s:4:"type";s:4:"text";s:9:"serialize";b:1;s:5:"views";b:1;}}', 1, 0);
INSERT INTO `content_node_field` VALUES ('field_slideshow', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:0:"";s:14:"allowed_values";s:15:"n\r\ny|Slide Show";s:18:"allowed_values_php";s:0:"";}', 0, 0, 0, 'text', 'a:1:{s:5:"value";a:5:{s:4:"type";s:4:"text";s:4:"size";s:3:"big";s:8:"not null";b:0;s:8:"sortable";b:1;s:5:"views";b:1;}}', 1, 0);
INSERT INTO `content_node_field` VALUES ('field_quarterfirst', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:0:"";s:14:"allowed_values";s:23:"n\r\ny|Home quarter first";s:18:"allowed_values_php";s:0:"";}', 0, 0, 0, 'text', 'a:1:{s:5:"value";a:5:{s:4:"type";s:4:"text";s:4:"size";s:3:"big";s:8:"not null";b:0;s:8:"sortable";b:1;s:5:"views";b:1;}}', 1, 0);
INSERT INTO `content_node_field` VALUES ('field_quartersecond', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:0:"";s:14:"allowed_values";s:24:"n\r\ny|Home quarter second";s:18:"allowed_values_php";s:0:"";}', 0, 0, 0, 'text', 'a:1:{s:5:"value";a:5:{s:4:"type";s:4:"text";s:4:"size";s:3:"big";s:8:"not null";b:0;s:8:"sortable";b:1;s:5:"views";b:1;}}', 1, 0);
INSERT INTO `content_node_field` VALUES ('field_quarterthird', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:0:"";s:14:"allowed_values";s:23:"n\r\ny|Home quarter third";s:18:"allowed_values_php";s:0:"";}', 0, 0, 0, 'text', 'a:1:{s:5:"value";a:5:{s:4:"type";s:4:"text";s:4:"size";s:3:"big";s:8:"not null";b:0;s:8:"sortable";b:1;s:5:"views";b:1;}}', 1, 0);
INSERT INTO `content_node_field` VALUES ('field_quarterfourth', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:0:"";s:14:"allowed_values";s:24:"n\r\ny|Home quarter fourth";s:18:"allowed_values_php";s:0:"";}', 0, 0, 0, 'text', 'a:1:{s:5:"value";a:5:{s:4:"type";s:4:"text";s:4:"size";s:3:"big";s:8:"not null";b:0;s:8:"sortable";b:1;s:5:"views";b:1;}}', 1, 0);
INSERT INTO `content_node_field` VALUES ('field_topfirst', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:0:"";s:14:"allowed_values";s:22:"off\r\non|Home top first";s:18:"allowed_values_php";s:0:"";}', 0, 0, 1, 'text', 'a:1:{s:5:"value";a:5:{s:4:"type";s:4:"text";s:4:"size";s:3:"big";s:8:"not null";b:0;s:8:"sortable";b:1;s:5:"views";b:1;}}', 1, 0);
INSERT INTO `content_node_field` VALUES ('field_style', 'text', 'a:4:{s:15:"text_processing";s:1:"0";s:10:"max_length";s:0:"";s:14:"allowed_values";s:89:"0|1 Sidebar\r\n1|1 Columns (Full Width)\r\n2|2 Columns (Full Width)\r\n3|3 Columns (Full Width)";s:18:"allowed_values_php";s:0:"";}', 0, 0, 0, 'text', 'a:1:{s:5:"value";a:5:{s:4:"type";s:4:"text";s:4:"size";s:3:"big";s:8:"not null";b:0;s:8:"sortable";b:1;s:5:"views";b:1;}}', 1, 0);
DROP TABLE IF EXISTS `content_node_field_instance`;
CREATE TABLE `content_node_field_instance` (
  `field_name` varchar(32) NOT NULL default '',
  `type_name` varchar(32) NOT NULL default '',
  `weight` int(11) NOT NULL default '0',
  `label` varchar(255) NOT NULL default '',
  `widget_type` varchar(32) NOT NULL default '',
  `widget_settings` mediumtext NOT NULL,
  `display_settings` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `widget_module` varchar(127) NOT NULL default '',
  `widget_active` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`field_name`,`type_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_node_field_instance` VALUES ('field_image', 'blog', -2, 'Image', 'imagefield_widget', 'a:14:{s:15:"file_extensions";s:16:"png gif jpg jpeg";s:9:"file_path";s:6:"images";s:18:"progress_indicator";s:3:"bar";s:21:"max_filesize_per_file";s:0:"";s:21:"max_filesize_per_node";s:0:"";s:14:"max_resolution";s:1:"0";s:14:"min_resolution";s:1:"0";s:3:"alt";s:0:"";s:10:"custom_alt";i:1;s:5:"title";s:0:"";s:12:"custom_title";i:1;s:10:"title_type";s:9:"textfield";s:13:"default_image";N;s:17:"use_default_image";i:0;}', 'a:8:{s:6:"weight";s:2:"-2";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}}', '', 'imagefield', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_image', 'portfolio', -3, 'Image', 'imagefield_widget', 'a:14:{s:15:"file_extensions";s:16:"png gif jpg jpeg";s:9:"file_path";s:6:"images";s:18:"progress_indicator";s:3:"bar";s:21:"max_filesize_per_file";s:0:"";s:21:"max_filesize_per_node";s:0:"";s:14:"max_resolution";s:1:"0";s:14:"min_resolution";s:1:"0";s:3:"alt";s:0:"";s:10:"custom_alt";i:1;s:5:"title";s:0:"";s:12:"custom_title";i:1;s:10:"title_type";s:9:"textfield";s:13:"default_image";N;s:17:"use_default_image";i:0;}', 'a:8:{s:6:"weight";s:2:"-3";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}}', '', 'imagefield', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_image', 'story', -3, 'Image', 'imagefield_widget', 'a:14:{s:15:"file_extensions";s:16:"png gif jpg jpeg";s:9:"file_path";s:6:"images";s:18:"progress_indicator";s:3:"bar";s:21:"max_filesize_per_file";s:0:"";s:21:"max_filesize_per_node";s:0:"";s:14:"max_resolution";s:1:"0";s:14:"min_resolution";s:1:"0";s:3:"alt";s:0:"";s:10:"custom_alt";i:1;s:5:"title";s:0:"";s:12:"custom_title";i:1;s:10:"title_type";s:9:"textfield";s:13:"default_image";N;s:17:"use_default_image";i:0;}', 'a:8:{s:6:"weight";s:2:"-3";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}}', '', 'imagefield', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_slideshow', 'story', -1, 'Slide Show', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";N;}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:2:"-1";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quarterfirst', 'story', 0, 'Home quarter first', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";N;}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";i:0;s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quartersecond', 'story', 1, 'Home quarter second', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";N;}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"1";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quarterthird', 'story', 2, 'Home quarter third', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";N;}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"2";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quarterfourth', 'story', 3, 'Home quarter fourth', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";N;}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"3";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quarterfirst', 'blog', 2, 'Home quarter first', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:1:"n";}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"2";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quarterfourth', 'blog', 5, 'Home quarter fourth', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:1:"n";}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"5";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quartersecond', 'blog', 3, 'Home quarter second', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:1:"n";}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"3";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quarterthird', 'blog', 4, 'Home quarter third', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:1:"n";}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"4";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_slideshow', 'blog', 0, 'Slide Show', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:1:"n";}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";i:0;s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quarterfirst', 'portfolio', 0, 'Home quarter first', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:1:"n";}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";i:0;s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quarterfourth', 'portfolio', 3, 'Home quarter fourth', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:1:"n";}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"3";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quartersecond', 'portfolio', 1, 'Home quarter second', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:1:"n";}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"1";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_quarterthird', 'portfolio', 2, 'Home quarter third', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:1:"n";}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"2";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_slideshow', 'portfolio', -1, 'Slide Show', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:1:"n";}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:2:"-1";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_image', 'page', -3, 'Image', 'imagefield_widget', 'a:14:{s:15:"file_extensions";s:16:"png gif jpg jpeg";s:9:"file_path";s:6:"images";s:18:"progress_indicator";s:3:"bar";s:21:"max_filesize_per_file";s:0:"";s:21:"max_filesize_per_node";s:0:"";s:14:"max_resolution";s:1:"0";s:14:"min_resolution";s:1:"0";s:3:"alt";s:0:"";s:10:"custom_alt";i:1;s:5:"title";s:0:"";s:12:"custom_title";i:1;s:10:"title_type";s:9:"textfield";s:13:"default_image";N;s:17:"use_default_image";i:0;}', 'a:8:{s:6:"weight";s:2:"-3";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:11:"image_plain";s:7:"exclude";i:0;}}', '', 'imagefield', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_topfirst', 'blog', 1, 'Home top first', 'optionwidgets_onoff', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";N;}}s:17:"default_value_php";N;}', 'a:10:{s:6:"weight";s:1:"1";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:11:"email_plain";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}s:10:"email_html";a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_style', 'blog', 6, 'Syle', 'optionwidgets_select', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:0:"";}}s:17:"default_value_php";N;}', 'a:8:{s:6:"weight";s:1:"6";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_style', 'page', -1, 'Syle', 'optionwidgets_select', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:0:"";}}s:17:"default_value_php";N;}', 'a:8:{s:6:"weight";s:1:"6";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_style', 'portfolio', 4, 'Syle', 'optionwidgets_select', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:0:"";}}s:17:"default_value_php";N;}', 'a:8:{s:6:"weight";s:1:"6";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
INSERT INTO `content_node_field_instance` VALUES ('field_style', 'story', 4, 'Syle', 'optionwidgets_select', 'a:2:{s:13:"default_value";a:1:{i:0;a:1:{s:5:"value";s:0:"";}}s:17:"default_value_php";N;}', 'a:8:{s:6:"weight";s:1:"6";s:6:"parent";s:0:"";s:5:"label";a:1:{s:6:"format";s:6:"hidden";}s:6:"teaser";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}s:4:"full";a:2:{s:6:"format";s:6:"hidden";s:7:"exclude";i:0;}i:4;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:2;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}i:3;a:2:{s:6:"format";s:7:"default";s:7:"exclude";i:0;}}', '', 'optionwidgets', 1);
DROP TABLE IF EXISTS `content_type_blog`;
CREATE TABLE `content_type_blog` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `field_topfirst_value` longtext,
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_type_blog` VALUES (9, 9, 'off');
INSERT INTO `content_type_blog` VALUES (8, 8, 'off');
INSERT INTO `content_type_blog` VALUES (7, 7, 'off');
INSERT INTO `content_type_blog` VALUES (6, 6, 'off');
INSERT INTO `content_type_blog` VALUES (10, 10, 'off');
INSERT INTO `content_type_blog` VALUES (24, 24, 'on');
INSERT INTO `content_type_blog` VALUES (25, 25, 'off');
DROP TABLE IF EXISTS `content_type_page`;
CREATE TABLE `content_type_page` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_type_page` VALUES (23, 23);
INSERT INTO `content_type_page` VALUES (22, 22);
INSERT INTO `content_type_page` VALUES (1, 1);
DROP TABLE IF EXISTS `content_type_portfolio`;
CREATE TABLE `content_type_portfolio` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_type_portfolio` VALUES (14, 14);
INSERT INTO `content_type_portfolio` VALUES (15, 15);
INSERT INTO `content_type_portfolio` VALUES (16, 16);
INSERT INTO `content_type_portfolio` VALUES (17, 17);
INSERT INTO `content_type_portfolio` VALUES (18, 18);
INSERT INTO `content_type_portfolio` VALUES (19, 19);
INSERT INTO `content_type_portfolio` VALUES (20, 20);
INSERT INTO `content_type_portfolio` VALUES (21, 21);
DROP TABLE IF EXISTS `content_type_story`;
CREATE TABLE `content_type_story` (
  `vid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `content_type_story` VALUES (26, 26);
INSERT INTO `content_type_story` VALUES (27, 27);
INSERT INTO `content_type_story` VALUES (28, 28);
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `fid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `filemime` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `status` int(11) NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;
INSERT INTO `files` VALUES (1, 1, '003.jpg', 'sites/default/files/images/003.jpg', 'image/jpeg', 179950, 1, 1282316937);
INSERT INTO `files` VALUES (2, 1, '010.jpg', 'sites/default/files/images/010.jpg', 'image/jpeg', 124524, 1, 1282317166);
INSERT INTO `files` VALUES (3, 1, '024.jpg', 'sites/default/files/images/024.jpg', 'image/jpeg', 70747, 1, 1282317226);
INSERT INTO `files` VALUES (4, 1, '025.jpg', 'sites/default/files/images/025.jpg', 'image/jpeg', 198677, 1, 1282317271);
INSERT INTO `files` VALUES (7, 1, '061.jpg', 'sites/default/files/images/061.jpg', 'image/jpeg', 136014, 1, 1282585599);
INSERT INTO `files` VALUES (6, 1, '030.jpg', 'sites/default/files/images/030.jpg', 'image/jpeg', 159732, 1, 1282333272);
INSERT INTO `files` VALUES (8, 1, '053.jpg', 'sites/default/files/images/053.jpg', 'image/jpeg', 326691, 1, 1282585808);
INSERT INTO `files` VALUES (9, 1, '049.jpg', 'sites/default/files/images/049.jpg', 'image/jpeg', 152097, 1, 1282585856);
INSERT INTO `files` VALUES (10, 1, '048.jpg', 'sites/default/files/images/048.jpg', 'image/jpeg', 129620, 1, 1282585910);
INSERT INTO `files` VALUES (11, 1, '041.jpg', 'sites/default/files/images/041.jpg', 'image/jpeg', 173668, 1, 1282585988);
INSERT INTO `files` VALUES (12, 1, '037.jpg', 'sites/default/files/images/037.jpg', 'image/jpeg', 138840, 1, 1282586059);
INSERT INTO `files` VALUES (15, 1, '024.jpg', 'sites/default/files/images/024_0.jpg', 'image/jpeg', 147428, 1, 1282586286);
INSERT INTO `files` VALUES (14, 1, '033.jpg', 'sites/default/files/images/033.jpg', 'image/jpeg', 144214, 1, 1282586203);
INSERT INTO `files` VALUES (16, 1, '025.jpg', 'sites/default/files/images/025_0.jpg', 'image/jpeg', 198677, 1, 1285262994);
INSERT INTO `files` VALUES (17, 1, '68.jpg', 'sites/default/files/images/68.jpg', 'image/jpeg', 56271, 1, 1285576598);
INSERT INTO `files` VALUES (18, 1, '009.jpg', 'sites/default/files/images/009.jpg', 'image/jpeg', 168501, 1, 1285583757);
INSERT INTO `files` VALUES (19, 1, '001.jpg', 'sites/default/files/images/001.jpg', 'image/jpeg', 71044, 1, 1285586779);
INSERT INTO `files` VALUES (20, 1, '003.jpg', 'sites/default/files/images/003_0.jpg', 'image/jpeg', 179950, 1, 1285586857);
INSERT INTO `files` VALUES (21, 1, '012.jpg', 'sites/default/files/images/012.jpg', 'image/jpeg', 87319, 1, 1285586938);
DROP TABLE IF EXISTS `filter_formats`;
CREATE TABLE `filter_formats` (
  `format` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `roles` varchar(255) NOT NULL default '',
  `cache` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;
INSERT INTO `filter_formats` VALUES (1, 'Filtered HTML', ',1,2,', 1);
INSERT INTO `filter_formats` VALUES (2, 'Full HTML', '', 1);
DROP TABLE IF EXISTS `filters`;
CREATE TABLE `filters` (
  `fid` int(11) NOT NULL auto_increment,
  `format` int(11) NOT NULL default '0',
  `module` varchar(64) NOT NULL default '',
  `delta` tinyint(4) NOT NULL default '0',
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;
INSERT INTO `filters` VALUES (1, 1, 'filter', 2, 0);
INSERT INTO `filters` VALUES (2, 1, 'filter', 0, 1);
INSERT INTO `filters` VALUES (3, 1, 'filter', 1, 2);
INSERT INTO `filters` VALUES (4, 1, 'filter', 3, 10);
INSERT INTO `filters` VALUES (5, 2, 'filter', 2, 0);
INSERT INTO `filters` VALUES (6, 2, 'filter', 1, 1);
INSERT INTO `filters` VALUES (7, 2, 'filter', 3, 10);
DROP TABLE IF EXISTS `flood`;
CREATE TABLE `flood` (
  `fid` int(11) NOT NULL auto_increment,
  `event` varchar(64) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  KEY `allow` (`event`,`hostname`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `uid` int(11) NOT NULL default '0',
  `nid` int(11) NOT NULL default '0',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `history` VALUES (1, 1, 1285620532);
INSERT INTO `history` VALUES (1, 10, 1285686735);
INSERT INTO `history` VALUES (1, 17, 1285687732);
INSERT INTO `history` VALUES (1, 21, 1285688679);
INSERT INTO `history` VALUES (1, 14, 1285694427);
INSERT INTO `history` VALUES (1, 20, 1285694315);
INSERT INTO `history` VALUES (1, 28, 1285586943);
INSERT INTO `history` VALUES (1, 27, 1285588238);
INSERT INTO `history` VALUES (1, 26, 1285586788);
INSERT INTO `history` VALUES (1, 19, 1285573065);
INSERT INTO `history` VALUES (1, 25, 1285694079);
INSERT INTO `history` VALUES (1, 24, 1285588328);
INSERT INTO `history` VALUES (1, 16, 1285573071);
INSERT INTO `history` VALUES (1, 23, 1285684969);
DROP TABLE IF EXISTS `imagecache_action`;
CREATE TABLE `imagecache_action` (
  `actionid` int(10) unsigned NOT NULL auto_increment,
  `presetid` int(10) unsigned NOT NULL default '0',
  `weight` int(11) NOT NULL default '0',
  `module` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY  (`actionid`),
  KEY `presetid` (`presetid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;
INSERT INTO `imagecache_action` VALUES (1, 1, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:3:"600";s:6:"height";s:3:"250";}');
INSERT INTO `imagecache_action` VALUES (2, 2, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:3:"268";s:6:"height";s:3:"170";}');
INSERT INTO `imagecache_action` VALUES (3, 3, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:3:"600";s:6:"height";s:3:"204";}');
INSERT INTO `imagecache_action` VALUES (4, 4, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:3:"920";s:6:"height";s:3:"400";}');
INSERT INTO `imagecache_action` VALUES (5, 5, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:3:"935";s:6:"height";s:3:"300";}');
INSERT INTO `imagecache_action` VALUES (6, 6, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:2:"48";s:6:"height";s:2:"48";}');
INSERT INTO `imagecache_action` VALUES (7, 7, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:3:"491";s:6:"height";s:3:"267";}');
INSERT INTO `imagecache_action` VALUES (8, 8, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:3:"940";s:6:"height";s:3:"283";}');
INSERT INTO `imagecache_action` VALUES (9, 9, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:3:"940";s:6:"height";s:3:"283";}');
INSERT INTO `imagecache_action` VALUES (10, 10, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:2:"58";s:6:"height";s:2:"42";}');
INSERT INTO `imagecache_action` VALUES (11, 11, 0, 'imagecache', 'imagecache_scale_and_crop', 'a:2:{s:5:"width";s:3:"614";s:6:"height";s:3:"204";}');
DROP TABLE IF EXISTS `imagecache_preset`;
CREATE TABLE `imagecache_preset` (
  `presetid` int(10) unsigned NOT NULL auto_increment,
  `presetname` varchar(255) NOT NULL,
  PRIMARY KEY  (`presetid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;
INSERT INTO `imagecache_preset` VALUES (1, 'blog_body_0');
INSERT INTO `imagecache_preset` VALUES (2, 'blog_teaser_1');
INSERT INTO `imagecache_preset` VALUES (3, 'blog_teaser_0');
INSERT INTO `imagecache_preset` VALUES (4, 'blog_body_2');
INSERT INTO `imagecache_preset` VALUES (5, 'blog_body_1');
INSERT INTO `imagecache_preset` VALUES (6, 'block_thumb');
INSERT INTO `imagecache_preset` VALUES (7, 'slide_show_0');
INSERT INTO `imagecache_preset` VALUES (8, 'slide_show_1');
INSERT INTO `imagecache_preset` VALUES (9, 'slide_show_2');
INSERT INTO `imagecache_preset` VALUES (10, 'home_top_first');
INSERT INTO `imagecache_preset` VALUES (11, 'home_bottom_first');
DROP TABLE IF EXISTS `menu_custom`;
CREATE TABLE `menu_custom` (
  `menu_name` varchar(32) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` text,
  PRIMARY KEY  (`menu_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `menu_custom` VALUES ('navigation', 'Navigation', 'The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.');
INSERT INTO `menu_custom` VALUES ('primary-links', 'Primary links', 'Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.');
INSERT INTO `menu_custom` VALUES ('secondary-links', 'Secondary links', 'Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links');
INSERT INTO `menu_custom` VALUES ('menu-about', 'Sprout''n Around', '');
INSERT INTO `menu_custom` VALUES ('menu-features', 'Around Sprout', '');
INSERT INTO `menu_custom` VALUES ('menu-categories', 'Categories', '');
DROP TABLE IF EXISTS `menu_links`;
CREATE TABLE `menu_links` (
  `menu_name` varchar(32) NOT NULL default '',
  `mlid` int(10) unsigned NOT NULL auto_increment,
  `plid` int(10) unsigned NOT NULL default '0',
  `link_path` varchar(255) NOT NULL default '',
  `router_path` varchar(255) NOT NULL default '',
  `link_title` varchar(255) NOT NULL default '',
  `options` text,
  `module` varchar(255) NOT NULL default 'system',
  `hidden` smallint(6) NOT NULL default '0',
  `external` smallint(6) NOT NULL default '0',
  `has_children` smallint(6) NOT NULL default '0',
  `expanded` smallint(6) NOT NULL default '0',
  `weight` int(11) NOT NULL default '0',
  `depth` smallint(6) NOT NULL default '0',
  `customized` smallint(6) NOT NULL default '0',
  `p1` int(10) unsigned NOT NULL default '0',
  `p2` int(10) unsigned NOT NULL default '0',
  `p3` int(10) unsigned NOT NULL default '0',
  `p4` int(10) unsigned NOT NULL default '0',
  `p5` int(10) unsigned NOT NULL default '0',
  `p6` int(10) unsigned NOT NULL default '0',
  `p7` int(10) unsigned NOT NULL default '0',
  `p8` int(10) unsigned NOT NULL default '0',
  `p9` int(10) unsigned NOT NULL default '0',
  `updated` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=MyISAM AUTO_INCREMENT=950 DEFAULT CHARSET=utf8 AUTO_INCREMENT=950 ;
INSERT INTO `menu_links` VALUES ('navigation', 1, 0, 'batch', 'batch', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 2, 0, 'admin', 'admin', 'Administer', 'a:0:{}', 'system', 0, 0, 1, 0, 9, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 3, 0, 'node', 'node', 'Content', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 4, 0, 'logout', 'logout', 'Log out', 'a:0:{}', 'system', 0, 0, 0, 0, 10, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 5, 0, 'rss.xml', 'rss.xml', 'RSS feed', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 6, 0, 'user', 'user', 'User account', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 7, 0, 'node/%', 'node/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 8, 2, 'admin/compact', 'admin/compact', 'Compact mode', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 8, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 9, 0, 'filter/tips', 'filter/tips', 'Compose tips', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 10, 2, 'admin/content', 'admin/content', 'Content management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Manage your site''s content.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 11, 0, 'node/add', 'node/add', 'Create content', 'a:0:{}', 'system', 0, 0, 1, 0, 1, 1, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 739, 0, 'admin/content/node-type/portfolio/fields/field_quarterfourth/remove', 'admin/content/node-type/portfolio/fields/field_quarterfourth/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 739, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 14, 0, 'system/files', 'system/files', 'File download', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 16, 2, 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"View reports from system logs and other status information.";}}', 'system', 0, 0, 1, 0, 5, 2, 0, 2, 16, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 17, 2, 'admin/build', 'admin/build', 'Site building', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:38:"Control how your site looks and feels.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 2, 17, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 18, 2, 'admin/settings', 'admin/settings', 'Site configuration', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:40:"Adjust basic site configuration options.";}}', 'system', 0, 0, 1, 0, -5, 2, 0, 2, 18, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 19, 0, 'user/autocomplete', 'user/autocomplete', 'User autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 20, 2, 'admin/user', 'admin/user', 'User management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"Manage your site''s users, groups and access to site features.";}}', 'system', 0, 0, 1, 0, 0, 2, 0, 2, 20, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 21, 0, 'user/%', 'user/%', 'My account', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 22, 20, 'admin/user/rules', 'admin/user/rules', 'Access rules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:80:"List and create rules to disallow usernames, e-mail addresses, and IP addresses.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 22, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 23, 18, 'admin/settings/actions', 'admin/settings/actions', 'Actions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"Manage the actions defined for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 23, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 24, 18, 'admin/settings/admin', 'admin/settings/admin', 'Administration theme', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:55:"Settings for how your administrative pages should look.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 24, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 25, 17, 'admin/build/block', 'admin/build/block', 'Blocks', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:79:"Configure what block content appears in your site''s sidebars and other regions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 25, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 26, 18, 'admin/settings/clean-urls', 'admin/settings/clean-urls', 'Clean URLs', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Enable or disable clean URLs for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 26, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 802, 760, 'admin/content/taxonomy/add/vocabulary', 'admin/content/taxonomy/add/vocabulary', 'Add vocabulary', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 141, 760, 802, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 28, 10, 'admin/content/node', 'admin/content/node', 'Content', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View, edit, and delete your site''s content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 28, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 29, 10, 'admin/content/types', 'admin/content/types', 'Content types', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Manage posts by content type, including default status, front page promotion, etc.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 29, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 30, 18, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:89:"Settings for how Drupal displays date and time, as well as the system''s default timezone.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 30, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 31, 0, 'node/%/delete', 'node/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 1, 1, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 32, 21, 'user/%/delete', 'user/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 21, 32, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 33, 18, 'admin/settings/error-reporting', 'admin/settings/error-reporting', 'Error reporting', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:93:"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 33, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 34, 18, 'admin/settings/file-system', 'admin/settings/file-system', 'File system', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:68:"Tell Drupal where to store uploaded files and how they are accessed.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 34, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 35, 18, 'admin/settings/image-toolkit', 'admin/settings/image-toolkit', 'Image toolkit', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Choose which image toolkit to use if you have installed optional toolkits.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 35, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 36, 18, 'admin/settings/filters', 'admin/settings/filters', 'Input formats', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:127:"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 36, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 37, 18, 'admin/settings/logging', 'admin/settings/logging', 'Logging and alerts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:156:"Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 18, 37, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 801, 792, 'admin/build/views/tools/basic', 'admin/build/views/tools/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 4, 0, 144, 765, 792, 801, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 39, 17, 'admin/build/modules', 'admin/build/modules', 'Modules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Enable or disable add-on modules for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 39, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 40, 18, 'admin/settings/performance', 'admin/settings/performance', 'Performance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 40, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 41, 20, 'admin/user/permissions', 'admin/user/permissions', 'Permissions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:64:"Determine access to features by selecting permissions for roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 41, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 42, 10, 'admin/content/node-settings', 'admin/content/node-settings', 'Post settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:126:"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 43, 10, 'admin/content/rss-publishing', 'admin/content/rss-publishing', 'RSS publishing', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:92:"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 43, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 45, 20, 'admin/user/roles', 'admin/user/roles', 'Roles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"List, edit, or add user roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 45, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 46, 18, 'admin/settings/site-information', 'admin/settings/site-information', 'Site information', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:107:"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 46, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 47, 18, 'admin/settings/site-maintenance', 'admin/settings/site-maintenance', 'Site maintenance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"Take the site off-line for maintenance or bring it back online.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 47, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 48, 16, 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Get a status report about your site''s operation and any detected problems.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 2, 16, 48, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 49, 17, 'admin/build/themes', 'admin/build/themes', 'Themes', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:57:"Change which theme your site uses or allows users to set.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 49, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 50, 20, 'admin/user/settings', 'admin/user/settings', 'User settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Configure default behavior of users, including registration requirements, e-mails, and user pictures.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 50, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 51, 20, 'admin/user/user', 'admin/user/user', 'Users', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"List, add, and edit users.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 20, 51, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 61, 36, 'admin/settings/filters/%', 'admin/settings/filters/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 36, 61, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 62, 26, 'admin/settings/clean-urls/check', 'admin/settings/clean-urls/check', 'Clean URL check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 26, 62, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 63, 23, 'admin/settings/actions/configure', 'admin/settings/actions/configure', 'Configure an advanced action', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 63, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 64, 25, 'admin/build/block/configure', 'admin/build/block/configure', 'Configure block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 64, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 66, 30, 'admin/settings/date-time/lookup', 'admin/settings/date-time/lookup', 'Date and time lookup', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 30, 66, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 67, 25, 'admin/build/block/delete', 'admin/build/block/delete', 'Delete block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 67, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 68, 36, 'admin/settings/filters/delete', 'admin/settings/filters/delete', 'Delete input format', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 36, 68, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 69, 22, 'admin/user/rules/delete', 'admin/user/rules/delete', 'Delete rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 22, 69, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 70, 45, 'admin/user/roles/edit', 'admin/user/roles/edit', 'Edit role', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 45, 70, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 71, 22, 'admin/user/rules/edit', 'admin/user/rules/edit', 'Edit rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 20, 22, 71, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 72, 48, 'admin/reports/status/php', 'admin/reports/status/php', 'PHP', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 72, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 73, 42, 'admin/content/node-settings/rebuild', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 42, 73, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 74, 23, 'admin/settings/actions/orphan', 'admin/settings/actions/orphan', 'Remove orphans', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 74, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 75, 48, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 75, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 76, 48, 'admin/reports/status/sql', 'admin/reports/status/sql', 'SQL', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 16, 48, 76, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 77, 23, 'admin/settings/actions/delete/%', 'admin/settings/actions/delete/%', 'Delete action', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Delete an action.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 23, 77, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 738, 0, 'admin/content/node-type/portfolio/fields/field_quarterfirst/remove', 'admin/content/node-type/portfolio/fields/field_quarterfirst/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 738, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 79, 25, 'admin/build/block/list/js', 'admin/build/block/list/js', 'JavaScript List Form', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 25, 79, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 80, 39, 'admin/build/modules/list/confirm', 'admin/build/modules/list/confirm', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 39, 80, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 81, 0, 'user/reset/%/%/%', 'user/reset/%/%/%', 'Reset password', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 82, 39, 'admin/build/modules/uninstall/confirm', 'admin/build/modules/uninstall/confirm', 'Uninstall', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 39, 82, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 83, 0, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 84, 0, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 85, 0, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 736, 0, 'admin/content/node-type/blog/fields/field_slideshow/remove', 'admin/content/node-type/blog/fields/field_slideshow/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 736, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 737, 0, 'admin/content/node-type/portfolio/fields/field_image/remove', 'admin/content/node-type/portfolio/fields/field_image/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 737, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 726, 673, 'admin/build/views/%/analyze/%', 'admin/build/views/%/analyze/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 726, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 728, 673, 'admin/build/views/%/details/%', 'admin/build/views/%/details/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 728, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 730, 673, 'admin/build/views/%/preview/%', 'admin/build/views/%/preview/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 730, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 731, 0, 'admin/content/node-type/blog/fields/field_image/remove', 'admin/content/node-type/blog/fields/field_image/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 731, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 732, 0, 'admin/content/node-type/blog/fields/field_quarterfirst/remove', 'admin/content/node-type/blog/fields/field_quarterfirst/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 732, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 733, 0, 'admin/content/node-type/blog/fields/field_quarterfourth/remove', 'admin/content/node-type/blog/fields/field_quarterfourth/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 733, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 734, 0, 'admin/content/node-type/blog/fields/field_quartersecond/remove', 'admin/content/node-type/blog/fields/field_quartersecond/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 734, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 735, 0, 'admin/content/node-type/blog/fields/field_quarterthird/remove', 'admin/content/node-type/blog/fields/field_quarterthird/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 735, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 105, 11, 'node/add/page', 'node/add/page', 'Page', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 105, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 106, 11, 'node/add/story', 'node/add/story', 'Story', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 106, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 107, 10, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Page', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 107, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 108, 10, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Story', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 108, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 109, 0, 'admin/content/node-type/page/delete', 'admin/content/node-type/page/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 109, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 110, 0, 'admin/content/node-type/story/delete', 'admin/content/node-type/story/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 110, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 725, 673, 'admin/build/views/%/%/%', 'admin/build/views/%/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 725, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 724, 653, 'admin/content/taxonomy/edit/vocabulary/%', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 653, 724, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 714, 673, 'admin/build/views/enable/%', 'admin/build/views/enable/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 714, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 715, 673, 'admin/build/views/delete/%', 'admin/build/views/delete/%', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 715, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 716, 0, 'taxonomy/term/%/%/feed', 'taxonomy/term/%/%/feed', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 716, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 717, 0, 'admin/build/imagecache/%/add/%', 'admin/build/imagecache/%/add/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 717, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 718, 0, 'admin/build/imagecache/%/%/delete', 'admin/build/imagecache/%/%/delete', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 718, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 719, 647, 'admin/build/menu/item/%/delete', 'admin/build/menu/item/%/delete', 'Delete menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 647, 719, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 720, 647, 'admin/build/menu/item/%/edit', 'admin/build/menu/item/%/edit', 'Edit menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 647, 720, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 721, 647, 'admin/build/menu/item/%/reset', 'admin/build/menu/item/%/reset', 'Reset menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 647, 721, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 723, 673, 'admin/build/views/%/add-display/%', 'admin/build/views/%/add-display/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 723, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 703, 644, 'admin/build/contact/delete/%', 'admin/build/contact/delete/%', 'Delete contact', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 644, 703, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 704, 0, 'filefield/ahah/%/%/%', 'filefield/ahah/%/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 704, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 705, 2, 'admin/views/ajax/autocomplete/tag', 'admin/views/ajax/autocomplete/tag', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 705, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 706, 0, 'admin/build/menu-customize/%/delete', 'admin/build/menu-customize/%/delete', 'Delete menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 706, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 707, 2, 'admin/views/ajax/autocomplete/user', 'admin/views/ajax/autocomplete/user', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 2, 707, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 708, 673, 'admin/build/views/disable/%', 'admin/build/views/disable/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 708, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 709, 644, 'admin/build/contact/edit/%', 'admin/build/contact/edit/%', 'Edit contact category', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 644, 709, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 710, 653, 'admin/content/taxonomy/edit/term', 'admin/content/taxonomy/edit/term', 'Edit term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 653, 710, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 711, 673, 'admin/build/views/export/%', 'admin/build/views/export/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 711, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 712, 673, 'admin/build/views/clone/%', 'admin/build/views/clone/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 712, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 713, 673, 'admin/build/views/break-lock/%', 'admin/build/views/break-lock/%', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 673, 713, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 138, 0, '<front>', '', '<img class="admin-menu-icon" src="/sites/all/themes/corporatevision/favicon.ico" width="16" height="16" alt="Home" />', 'a:3:{s:11:"extra class";s:15:"admin-menu-icon";s:4:"html";b:1;s:5:"alter";b:1;}', 'admin_menu', 0, 1, 1, 0, -100, 1, 0, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 139, 0, 'logout', 'logout', 'Log out @username', 'a:3:{s:11:"extra class";s:35:"admin-menu-action admin-menu-logout";s:1:"t";a:0:{}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -100, 1, 0, 139, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 140, 0, 'user', 'user', 'icon_users', 'a:3:{s:11:"extra class";s:50:"admin-menu-action admin-menu-icon admin-menu-users";s:4:"html";b:1;s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -90, 1, 0, 140, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 141, 0, 'admin/content', 'admin/content', 'Content management', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -10, 1, 0, 141, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 701, 0, 'admin/build/imagecache/%/%', 'admin/build/imagecache/%/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 701, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 143, 0, 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 5, 1, 0, 143, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 144, 0, 'admin/build', 'admin/build', 'Site building', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -10, 1, 0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 145, 0, 'admin/settings', 'admin/settings', 'Site configuration', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -5, 1, 0, 145, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 146, 0, 'admin/user', 'admin/user', 'User management', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 1, 0, 146, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 147, 146, 'admin/user/rules', 'admin/user/rules', 'Access rules', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 146, 147, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 148, 145, 'admin/settings/actions', 'admin/settings/actions', 'Actions', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 145, 148, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 771, 161, 'admin/settings/logging/dblog', 'admin/settings/logging/dblog', 'Database logging', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 145, 161, 771, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 150, 145, 'admin/settings/admin', 'admin/settings/admin', 'Administration theme', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 150, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 151, 144, 'admin/build/block', 'admin/build/block', 'Blocks', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 144, 151, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 152, 145, 'admin/settings/clean-urls', 'admin/settings/clean-urls', 'Clean URLs', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 152, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 770, 753, 'admin/settings/imageapi/config', 'admin/settings/imageapi/config', 'Configure', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 145, 753, 770, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 154, 141, 'admin/content/node', 'admin/content/node', 'Content', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 141, 154, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 155, 141, 'admin/content/types', 'admin/content/types', 'Content types', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 141, 155, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 156, 145, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 156, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 157, 145, 'admin/settings/error-reporting', 'admin/settings/error-reporting', 'Error reporting', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 157, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 158, 145, 'admin/settings/file-system', 'admin/settings/file-system', 'File system', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 158, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 159, 145, 'admin/settings/image-toolkit', 'admin/settings/image-toolkit', 'Image toolkit', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 159, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 160, 145, 'admin/settings/filters', 'admin/settings/filters', 'Input formats', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 145, 160, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 161, 145, 'admin/settings/logging', 'admin/settings/logging', 'Logging and alerts', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 145, 161, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 163, 144, 'admin/build/modules', 'admin/build/modules', 'Modules', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 144, 163, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 164, 145, 'admin/settings/performance', 'admin/settings/performance', 'Performance', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 164, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 165, 146, 'admin/user/permissions', 'admin/user/permissions', 'Permissions', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 146, 165, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 166, 141, 'admin/content/node-settings', 'admin/content/node-settings', 'Post settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 141, 166, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 167, 141, 'admin/content/rss-publishing', 'admin/content/rss-publishing', 'RSS publishing', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 141, 167, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 769, 751, 'admin/content/comment/approval', 'admin/content/comment/approval', 'Approval queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 141, 751, 769, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 169, 146, 'admin/user/roles', 'admin/user/roles', 'Roles', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 146, 169, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 170, 145, 'admin/settings/site-information', 'admin/settings/site-information', 'Site information', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 170, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 171, 145, 'admin/settings/site-maintenance', 'admin/settings/site-maintenance', 'Site maintenance', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 171, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 172, 143, 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 10, 2, 0, 143, 172, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 768, 754, 'admin/build/imagecache/add', 'admin/build/imagecache/add', 'Add new preset', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 144, 754, 768, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 174, 144, 'admin/build/themes', 'admin/build/themes', 'Themes', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 144, 174, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 767, 755, 'admin/build/menu/add', 'admin/build/menu/add', 'Add menu', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 144, 755, 767, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 766, 752, 'admin/build/contact/add', 'admin/build/contact/add', 'Add category', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 3, 0, 144, 752, 766, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 177, 146, 'admin/user/settings', 'admin/user/settings', 'User settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 146, 177, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 178, 146, 'admin/user/user', 'admin/user/user', 'Users', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 146, 178, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 765, 144, 'admin/build/views', 'admin/build/views', 'Views', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 144, 765, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 181, 151, 'admin/build/block/add', 'admin/build/block/add', 'Add block', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 144, 151, 181, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 182, 155, 'admin/content/types/add', 'admin/content/types/add', 'Add content type', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 141, 155, 182, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 183, 160, 'admin/settings/filters/add', 'admin/settings/filters/add', 'Add input format', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 3, 0, 145, 160, 183, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 795, 792, 'admin/build/views/tools/convert', 'admin/build/views/tools/convert', 'Convert', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 4, 0, 144, 765, 792, 795, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 185, 147, 'admin/user/rules/add', 'admin/user/rules/add', 'Add rule', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 146, 147, 185, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 186, 178, 'admin/user/user/create', 'admin/user/user/create', 'Add user', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 146, 178, 186, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 188, 147, 'admin/user/rules/check', 'admin/user/rules/check', 'Check rules', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 146, 147, 188, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 189, 174, 'admin/build/themes/settings', 'admin/build/themes/settings', 'Configure', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 144, 174, 189, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 793, 770, 'admin/settings/imageapi/config/imageapi_gd', 'admin/settings/imageapi/config/imageapi_gd', '@name', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 145, 753, 770, 793, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 792, 765, 'admin/build/views/tools', 'admin/build/views/tools', 'Tools', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 144, 765, 792, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 193, 151, 'admin/build/block/list', 'admin/build/block/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, -10, 3, 0, 144, 151, 193, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 194, 154, 'admin/content/node/overview', 'admin/content/node/overview', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 141, 154, 194, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 196, 155, 'admin/content/types/list', 'admin/content/types/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 141, 155, 196, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 197, 147, 'admin/user/rules/list', 'admin/user/rules/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 146, 147, 197, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 199, 178, 'admin/user/user/list', 'admin/user/user/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 146, 178, 199, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 200, 163, 'admin/build/modules/list', 'admin/build/modules/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 144, 163, 200, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 201, 174, 'admin/build/themes/select', 'admin/build/themes/select', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 3, 0, 144, 174, 201, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 203, 160, 'admin/settings/filters/list', 'admin/settings/filters/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 145, 160, 203, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 789, 755, 'admin/build/menu/settings', 'admin/build/menu/settings', 'Settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 5, 3, 0, 144, 755, 789, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 205, 148, 'admin/settings/actions/manage', 'admin/settings/actions/manage', 'Manage actions', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -2, 3, 0, 145, 148, 205, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 788, 752, 'admin/build/contact/settings', 'admin/build/contact/settings', 'Settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 2, 3, 0, 144, 752, 788, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 209, 163, 'admin/build/modules/uninstall', 'admin/build/modules/uninstall', 'Uninstall', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 144, 163, 209, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 210, 193, 'admin/build/block/list/bluemarine', 'admin/build/block/list/bluemarine', 'Bluemarine', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 151, 193, 210, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 211, 189, 'admin/build/themes/settings/bluemarine', 'admin/build/themes/settings/bluemarine', 'Bluemarine', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 174, 189, 211, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 212, 193, 'admin/build/block/list/chameleon', 'admin/build/block/list/chameleon', 'Chameleon', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 151, 193, 212, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 213, 189, 'admin/build/themes/settings/chameleon', 'admin/build/themes/settings/chameleon', 'Chameleon', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 174, 189, 213, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 214, 193, 'admin/build/block/list/garland', 'admin/build/block/list/garland', 'Garland', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 151, 193, 214, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 215, 189, 'admin/build/themes/settings/garland', 'admin/build/themes/settings/garland', 'Garland', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 174, 189, 215, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 216, 189, 'admin/build/themes/settings/global', 'admin/build/themes/settings/global', 'Global settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 4, 0, 144, 174, 189, 216, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 217, 193, 'admin/build/block/list/marvin', 'admin/build/block/list/marvin', 'Marvin', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 151, 193, 217, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 218, 189, 'admin/build/themes/settings/marvin', 'admin/build/themes/settings/marvin', 'Marvin', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 174, 189, 218, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 219, 193, 'admin/build/block/list/minnelli', 'admin/build/block/list/minnelli', 'Minnelli', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 151, 193, 219, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-categories', 893, 0, 'taxonomy/term/6', 'taxonomy/term/%', 'Fun Projects', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:12:"Fun Projects";}}', 'taxonomy_menu', 0, 0, 0, 1, 0, 1, 0, 893, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 222, 193, 'admin/build/block/list/pushbutton', 'admin/build/block/list/pushbutton', 'Pushbutton', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 151, 193, 222, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 833, 827, 'admin/content/node-type/portfolio/fields/field_slideshow', 'admin/content/node-type/portfolio/fields/field_slideshow', 'Slide Show', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 395, 827, 833, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 224, 189, 'admin/build/themes/settings/minnelli', 'admin/build/themes/settings/minnelli', 'Minnelli', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 174, 189, 224, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 880, 647, 'admin/build/menu-customize/menu-categories', 'admin/build/menu-customize/%', 'Categories', 'a:0:{}', 'menu', 0, 0, 0, 0, 0, 4, 0, 2, 17, 647, 880, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 226, 189, 'admin/build/themes/settings/pushbutton', 'admin/build/themes/settings/pushbutton', 'Pushbutton', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 174, 189, 226, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 228, 138, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 50, 2, 0, 138, 228, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 764, 145, 'admin/settings/jquery_update', 'admin/settings/jquery_update', 'jQuery Update', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 764, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 230, 145, 'admin/by-module', 'admin/by-module', 'By module', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 2, 0, 145, 230, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 231, 138, 'http://drupal.org', '', 'Drupal.org', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 1, 0, 100, 2, 0, 138, 231, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 232, 231, 'http://drupal.org/project/issues/drupal', '', 'Drupal issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, -10, 3, 0, 138, 231, 232, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 233, 231, 'http://drupal.org/project/issues/admin_menu', '', 'Administration menu issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 138, 231, 233, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 234, 231, 'http://drupal.org/project/issues/cck', '', 'Content issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 138, 231, 234, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 235, 231, 'http://drupal.org/project/issues/filefield', '', 'FileField issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 138, 231, 235, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 236, 231, 'http://drupal.org/project/issues/imagefield', '', 'ImageField issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 138, 231, 236, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 237, 231, 'http://drupal.org/project/issues/jquery_update', '', 'jQuery Update issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 138, 231, 237, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 238, 231, 'http://drupal.org/project/issues/views', '', 'Views issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 138, 231, 238, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 239, 141, 'node/add', 'node/add', 'Create content', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 141, 239, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 240, 239, 'node/add/page', 'node/add/page', 'Page', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 141, 239, 240, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 241, 239, 'node/add/story', 'node/add/story', 'Story', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 141, 239, 241, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 242, 155, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:4:"Page";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 141, 155, 242, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 831, 827, 'admin/content/node-type/portfolio/fields/field_quartersecond', 'admin/content/node-type/portfolio/fields/field_quartersecond', 'Home quarter second', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 395, 827, 831, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 832, 827, 'admin/content/node-type/portfolio/fields/field_quarterthird', 'admin/content/node-type/portfolio/fields/field_quarterthird', 'Home quarter third', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 395, 827, 832, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 247, 155, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:5:"Story";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 141, 155, 247, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 828, 827, 'admin/content/node-type/portfolio/fields/field_image', 'admin/content/node-type/portfolio/fields/field_image', 'Image', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 395, 827, 828, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 829, 827, 'admin/content/node-type/portfolio/fields/field_quarterfirst', 'admin/content/node-type/portfolio/fields/field_quarterfirst', 'Home quarter first', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 395, 827, 829, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 830, 827, 'admin/content/node-type/portfolio/fields/field_quarterfourth', 'admin/content/node-type/portfolio/fields/field_quarterfourth', 'Home quarter fourth', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 395, 827, 830, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 827, 395, 'admin/content/node-type/portfolio/fields', 'admin/content/node-type/portfolio/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 4, 0, 141, 155, 395, 827, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 757, 143, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log entries', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 2, 0, 143, 757, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 758, 145, 'admin/settings/search', 'admin/settings/search', 'Search settings', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 758, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 760, 141, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Taxonomy', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 141, 760, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 761, 143, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 143, 761, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 762, 143, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 143, 762, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 763, 143, 'admin/reports/search', 'admin/reports/search', 'Top search phrases', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 143, 763, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 696, 0, 'taxonomy/term/%/feed', 'taxonomy/term/%/feed', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 696, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 697, 0, 'admin/build/imagecache/%/delete', 'admin/build/imagecache/%/delete', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 697, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 698, 0, 'admin/build/imagecache/%/export', 'admin/build/imagecache/%/export', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 698, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 699, 0, 'admin/build/imagecache/%/flush', 'admin/build/imagecache/%/flush', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 699, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 700, 0, 'admin/build/imagecache/%/override', 'admin/build/imagecache/%/override', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 700, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 689, 653, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List terms', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 10, 653, 689, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 280, 231, 'http://drupal.org/project/issues/imageapi', '', 'ImageAPI issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 138, 231, 280, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 281, 231, 'http://drupal.org/project/issues/imagecache', '', 'ImageCache issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 138, 231, 281, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 283, 0, '<front>', '', 'Home', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 1, 0, 0, -50, 1, 1, 283, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 284, 0, 'node/1', 'node/%', 'About', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:8:"About Us";}}', 'menu', 0, 0, 0, 0, -49, 1, 1, 284, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 285, 0, 'contact', 'contact', 'Contact', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'system', 0, 0, 0, 0, -45, 1, 1, 285, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 785, 751, 'admin/content/comment/new', 'admin/content/comment/new', 'Published comments', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 141, 751, 785, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 782, 755, 'admin/build/menu/list', 'admin/build/menu/list', 'List menus', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 144, 755, 782, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 781, 765, 'admin/build/views/list', 'admin/build/views/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 3, 0, 144, 765, 781, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 755, 144, 'admin/build/menu', 'admin/build/menu', 'Menus', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 144, 755, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 295, 0, '<front>', '', 'level 1', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 1, 1, 1, -48, 1, 1, 295, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 296, 295, '<front>', '', 'level 2', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 1, 0, 1, 0, 2, 1, 295, 296, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 297, 295, '<front>', '', 'level 2', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 1, 1, 1, 0, 2, 1, 295, 297, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 298, 295, '<front>', '', 'level 2', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 1, 0, 1, 0, 2, 1, 295, 298, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 299, 297, '<front>', '', 'level 3', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 1, 0, 1, 0, 3, 1, 295, 297, 299, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 300, 297, '<front>', '', 'level 3', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 1, 0, 1, 0, 3, 1, 295, 297, 300, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 301, 297, '<front>', '', 'level 3', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 1, 0, 1, 0, 3, 1, 295, 297, 301, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('secondary-links', 304, 0, 'node/2', 'node/%', 'Privacy Policy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:14:"Privacy Policy";}}', 'menu', 0, 0, 0, 0, -50, 1, 1, 304, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('secondary-links', 305, 0, 'node/3', 'node/%', 'Terms and Conditions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Terms and Conditions";}}', 'menu', 0, 0, 0, 0, -49, 1, 1, 305, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('secondary-links', 306, 0, 'node/4', 'node/%', 'Environmental Policy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:20:"Environmental Policy";}}', 'menu', 0, 0, 0, 0, -48, 1, 1, 306, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('secondary-links', 307, 0, 'node/5', 'node/%', 'Equal Opportunities Policy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"Equal Opportunities Policy";}}', 'menu', 0, 0, 0, 0, -47, 1, 1, 307, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 683, 17, 'admin/build/views1/convert', 'admin/build/views1/convert', 'Convert view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 683, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 684, 17, 'admin/build/views1/delete', 'admin/build/views1/delete', 'Delete view', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 684, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 685, 17, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Customize menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 17, 685, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 686, 16, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 16, 686, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 390, 11, 'node/add/portfolio', 'node/add/portfolio', 'Portfolio', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 390, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 328, 239, 'node/add/blog', 'node/add/blog', 'Blog entry', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 141, 239, 328, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 319, 0, 'blog', 'blog', 'Blogs', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'system', 0, 0, 0, 0, -46, 1, 1, 319, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 754, 144, 'admin/build/imagecache', 'admin/build/imagecache', 'ImageCache', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 144, 754, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 321, 319, 'blog/%', 'blog/%', 'My blog', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 2, 1, 319, 321, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 322, 11, 'node/add/blog', 'node/add/blog', 'Blog entry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:78:"A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 322, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 780, 765, 'admin/build/views/add', 'admin/build/views/add', 'Add', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 144, 765, 780, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 325, 10, 'admin/content/node-type/blog', 'admin/content/node-type/blog', 'Blog entry', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 325, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 326, 0, 'admin/content/node-type/blog/delete', 'admin/content/node-type/blog/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 326, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 329, 155, 'admin/content/node-type/blog', 'admin/content/node-type/blog', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:10:"Blog entry";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 141, 155, 329, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 824, 822, 'admin/content/node-type/portfolio/display/rss', 'admin/content/node-type/portfolio/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 141, 155, 395, 822, 824, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 825, 822, 'admin/content/node-type/portfolio/display/search', 'admin/content/node-type/portfolio/display/search', 'Search', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 141, 155, 395, 822, 825, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 823, 822, 'admin/content/node-type/portfolio/display/basic', 'admin/content/node-type/portfolio/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 395, 822, 823, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 680, 0, 'sites/default/files/imagecache', 'sites/default/files/imagecache', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 680, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 681, 651, 'admin/settings/search/wipe', 'admin/settings/search/wipe', 'Clear index', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 18, 651, 681, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 682, 37, 'admin/settings/logging/dblog', 'admin/settings/logging/dblog', 'Database logging', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:169:"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.";}}', 'system', 0, 0, 0, 0, 0, 4, 0, 2, 18, 37, 682, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 678, 0, 'taxonomy/term/%', 'taxonomy/term/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 678, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 679, 646, 'admin/build/imagecache/%', 'admin/build/imagecache/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 2, 17, 646, 679, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-about', 355, 0, 'node/11', 'node/%', 'Customer Testimonials', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Customer Testimonials";}}', 'menu', 0, 0, 0, 0, -50, 1, 1, 355, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-about', 356, 0, 'node/12', 'node/%', 'Our Workplace', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:13:"Our Workplace";}}', 'menu', 0, 0, 0, 0, -49, 1, 1, 356, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-about', 357, 0, 'node/13', 'node/%', 'Network & Connectivity', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Network & Connectivity";}}', 'menu', 0, 0, 0, 0, -47, 1, 1, 357, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-about', 358, 0, 'node/1', 'node/%', 'About Us', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 0, 0, -48, 1, 1, 358, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-about', 359, 0, 'node/11', 'node/%', 'Customer Testimonials', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Customer Testimonials";}}', 'menu', 0, 0, 0, 0, 0, 1, 1, 359, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-features', 361, 0, 'node/11', 'node/%', 'Customer Testimonials', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Customer Testimonials";}}', 'menu', 0, 0, 0, 0, -50, 1, 1, 361, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-features', 362, 0, 'node/12', 'node/%', 'Our Workplace', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:13:"Our Workplace";}}', 'menu', 0, 0, 0, 0, -49, 1, 1, 362, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-features', 363, 0, 'node/1', 'node/%', 'About Us', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:8:"About Us";}}', 'menu', 0, 0, 0, 0, -48, 1, 1, 363, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-features', 364, 0, 'node/13', 'node/%', 'Network & Connectivity', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:22:"Network & Connectivity";}}', 'menu', 0, 0, 0, 0, -47, 1, 1, 364, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-features', 365, 0, 'node/11', 'node/%', 'Customer Testimonials', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:21:"Customer Testimonials";}}', 'menu', 0, 0, 0, 0, -46, 1, 1, 365, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 822, 395, 'admin/content/node-type/portfolio/display', 'admin/content/node-type/portfolio/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 141, 155, 395, 822, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-categories', 892, 0, 'taxonomy/term/3', 'taxonomy/term/%', 'Daily Life', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:10:"Daily Life";}}', 'taxonomy_menu', 0, 0, 0, 1, 0, 1, 0, 892, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 821, 242, 'admin/content/node-type/page/fields', 'admin/content/node-type/page/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 4, 0, 141, 155, 242, 821, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 869, 821, 'admin/content/node-type/page/fields/field_image', 'admin/content/node-type/page/fields/field_image', 'Image', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 242, 821, 869, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 867, 0, 'admin/content/node-type/page/fields/field_image/remove', 'admin/content/node-type/page/fields/field_image/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 867, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 753, 145, 'admin/settings/imageapi', 'admin/settings/imageapi', 'ImageAPI', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 145, 753, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 391, 10, 'admin/content/node-type/portfolio', 'admin/content/node-type/portfolio', 'Portfolio', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 10, 391, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 392, 0, 'admin/content/node-type/portfolio/delete', 'admin/content/node-type/portfolio/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 392, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 394, 239, 'node/add/portfolio', 'node/add/portfolio', 'Portfolio', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 141, 239, 394, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 395, 155, 'admin/content/node-type/portfolio', 'admin/content/node-type/portfolio', 'Edit !content-type', 'a:2:{s:1:"t";a:1:{s:13:"!content-type";s:9:"Portfolio";}s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 3, 0, 141, 155, 395, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 817, 816, 'admin/content/node-type/page/display/basic', 'admin/content/node-type/page/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 242, 816, 817, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 818, 816, 'admin/content/node-type/page/display/rss', 'admin/content/node-type/page/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 141, 155, 242, 816, 818, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 819, 816, 'admin/content/node-type/page/display/search', 'admin/content/node-type/page/display/search', 'Search', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 141, 155, 242, 816, 819, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 816, 242, 'admin/content/node-type/page/display', 'admin/content/node-type/page/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 141, 155, 242, 816, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 674, 637, 'admin/help/system', 'admin/help/system', 'system', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 674, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 675, 637, 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 675, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 676, 637, 'admin/help/user', 'admin/help/user', 'user', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 676, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 677, 637, 'admin/help/views_ui', 'admin/help/views_ui', 'views_ui', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 677, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 404, 0, 'portfolio', 'portfolio', 'Portfolio', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:0:"";}}', 'menu', 0, 0, 1, 1, -47, 1, 1, 404, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 406, 231, 'http://drupal.org/project/issues/taxonomy_menu', '', 'Taxonomy Menu issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 138, 231, 406, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 673, 17, 'admin/build/views', 'admin/build/views', 'Views', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:144:"Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 673, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 669, 637, 'admin/help/menu', 'admin/help/menu', 'menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 669, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 670, 637, 'admin/help/node', 'admin/help/node', 'node', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 670, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 671, 637, 'admin/help/search', 'admin/help/search', 'search', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 671, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 943, 821, 'admin/content/node-type/page/fields/field_style', 'admin/content/node-type/page/fields/field_style', 'Syle', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 242, 821, 943, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 779, 753, 'admin/settings/imageapi/list', 'admin/settings/imageapi/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -1, 3, 0, 145, 753, 779, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 777, 752, 'admin/build/contact/list', 'admin/build/contact/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 144, 752, 777, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 778, 760, 'admin/content/taxonomy/list', 'admin/content/taxonomy/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 141, 760, 778, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 773, 155, 'admin/content/types/fields', 'admin/content/types/fields', 'Fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 141, 155, 773, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 775, 765, 'admin/build/views/import', 'admin/build/views/import', 'Import', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 144, 765, 775, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 776, 754, 'admin/build/imagecache/list', 'admin/build/imagecache/list', 'List', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 3, 0, 144, 754, 776, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 815, 809, 'admin/content/node-type/blog/fields/field_slideshow', 'admin/content/node-type/blog/fields/field_slideshow', 'Slide Show', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 329, 809, 815, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 814, 809, 'admin/content/node-type/blog/fields/field_quarterthird', 'admin/content/node-type/blog/fields/field_quarterthird', 'Home quarter third', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 329, 809, 814, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 813, 809, 'admin/content/node-type/blog/fields/field_quartersecond', 'admin/content/node-type/blog/fields/field_quartersecond', 'Home quarter second', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 329, 809, 813, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 812, 809, 'admin/content/node-type/blog/fields/field_quarterfourth', 'admin/content/node-type/blog/fields/field_quarterfourth', 'Home quarter fourth', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 329, 809, 812, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 811, 809, 'admin/content/node-type/blog/fields/field_quarterfirst', 'admin/content/node-type/blog/fields/field_quarterfirst', 'Home quarter first', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 329, 809, 811, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 948, 138, 'update.php', '', 'Run updates', 'a:2:{s:8:"external";b:1;s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 50, 2, 0, 138, 948, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 843, 840, 'admin/content/node-type/story/display/search', 'admin/content/node-type/story/display/search', 'Search', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 141, 155, 247, 840, 843, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 842, 840, 'admin/content/node-type/story/display/rss', 'admin/content/node-type/story/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 141, 155, 247, 840, 842, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 841, 840, 'admin/content/node-type/story/display/basic', 'admin/content/node-type/story/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 247, 840, 841, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 740, 0, 'admin/content/node-type/portfolio/fields/field_quartersecond/remove', 'admin/content/node-type/portfolio/fields/field_quartersecond/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 740, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 741, 0, 'admin/content/node-type/portfolio/fields/field_quarterthird/remove', 'admin/content/node-type/portfolio/fields/field_quarterthird/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 741, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 742, 0, 'admin/content/node-type/portfolio/fields/field_slideshow/remove', 'admin/content/node-type/portfolio/fields/field_slideshow/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 742, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 743, 0, 'admin/content/node-type/story/fields/field_image/remove', 'admin/content/node-type/story/fields/field_image/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 743, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 744, 0, 'admin/content/node-type/story/fields/field_quarterfirst/remove', 'admin/content/node-type/story/fields/field_quarterfirst/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 744, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 745, 0, 'admin/content/node-type/story/fields/field_quarterfourth/remove', 'admin/content/node-type/story/fields/field_quarterfourth/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 745, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 746, 0, 'admin/content/node-type/story/fields/field_quartersecond/remove', 'admin/content/node-type/story/fields/field_quartersecond/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 746, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 747, 0, 'admin/content/node-type/story/fields/field_quarterthird/remove', 'admin/content/node-type/story/fields/field_quarterthird/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 747, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 748, 0, 'admin/content/node-type/story/fields/field_slideshow/remove', 'admin/content/node-type/story/fields/field_slideshow/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 748, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 749, 0, 'admin/help', 'admin/help', 'Help', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 9, 1, 0, 749, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 750, 145, 'admin/settings/admin_menu', 'admin/settings/admin_menu', 'Administration menu', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 2, 0, 145, 750, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 751, 141, 'admin/content/comment', 'admin/content/comment', 'Comments', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 141, 751, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 752, 144, 'admin/build/contact', 'admin/build/contact', 'Contact form', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 0, 2, 0, 144, 752, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 514, 231, 'http://drupal.org/project/issues/simplenews', '', 'Simplenews issue queue', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 1, 0, 0, 0, 3, 0, 138, 231, 514, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 946, 827, 'admin/content/node-type/portfolio/fields/field_style', 'admin/content/node-type/portfolio/fields/field_style', 'Syle', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 395, 827, 946, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 840, 247, 'admin/content/node-type/story/display', 'admin/content/node-type/story/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 141, 155, 247, 840, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 947, 0, 'admin/content/node-type/story/fields/field_style/remove', 'admin/content/node-type/story/fields/field_style/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 947, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 949, 845, 'admin/content/node-type/story/fields/field_style', 'admin/content/node-type/story/fields/field_style', 'Syle', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 247, 845, 949, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 944, 0, 'admin/content/node-type/portfolio/fields/field_style/remove', 'admin/content/node-type/portfolio/fields/field_style/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 944, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 806, 804, 'admin/content/node-type/blog/display/rss', 'admin/content/node-type/blog/display/rss', 'RSS', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 141, 155, 329, 804, 806, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 807, 804, 'admin/content/node-type/blog/display/search', 'admin/content/node-type/blog/display/search', 'Search', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 1, 5, 0, 141, 155, 329, 804, 807, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 809, 329, 'admin/content/node-type/blog/fields', 'admin/content/node-type/blog/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 4, 0, 141, 155, 329, 809, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 810, 809, 'admin/content/node-type/blog/fields/field_image', 'admin/content/node-type/blog/fields/field_image', 'Image', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 329, 809, 810, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 859, 193, 'admin/build/block/list/corporatevision', 'admin/build/block/list/corporatevision', 'Corporate Vision', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, -10, 4, 0, 144, 151, 193, 859, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 804, 329, 'admin/content/node-type/blog/display', 'admin/content/node-type/blog/display', 'Display fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 2, 4, 0, 141, 155, 329, 804, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 805, 804, 'admin/content/node-type/blog/display/basic', 'admin/content/node-type/blog/display/basic', 'Basic', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 329, 804, 805, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 666, 637, 'admin/help/help', 'admin/help/help', 'help', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 666, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 667, 637, 'admin/help/imagecache_ui', 'admin/help/imagecache_ui', 'imagecache_ui', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 667, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 668, 18, 'admin/settings/jquery_update', 'admin/settings/jquery_update', 'jQuery Update', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:44:"Configure settings for jQuery Update module.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 668, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 663, 637, 'admin/help/content', 'admin/help/content', 'content', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 663, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 664, 637, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 664, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 665, 637, 'admin/help/filter', 'admin/help/filter', 'filter', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 665, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 660, 637, 'admin/help/color', 'admin/help/color', 'color', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 660, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 661, 637, 'admin/help/comment', 'admin/help/comment', 'comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 661, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 662, 637, 'admin/help/contact', 'admin/help/contact', 'contact', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 662, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 657, 637, 'admin/help/admin_menu', 'admin/help/admin_menu', 'admin_menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 657, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 658, 637, 'admin/help/block', 'admin/help/block', 'block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 658, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 659, 637, 'admin/help/blog', 'admin/help/blog', 'blog', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 2, 637, 659, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 655, 16, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View ''page not found'' errors (404s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 655, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 656, 16, 'admin/reports/search', 'admin/reports/search', 'Top search phrases', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:33:"View most popular search phrases.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 656, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 653, 10, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Taxonomy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:67:"Manage tagging, categorization, and classification of your content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 653, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 654, 16, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:35:"View ''access denied'' errors (403s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 16, 654, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 621, 0, 'node/23', 'node/%', 'Text Styles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:11:"Text Styles";}}', 'menu', 0, 0, 0, 0, 0, 1, 0, 621, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 651, 18, 'admin/settings/search', 'admin/settings/search', 'Search settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:66:"Configure relevance settings for search and other indexing options";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 651, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 649, 16, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log entries', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View events that have recently been logged.";}}', 'system', 0, 0, 0, 0, -1, 3, 0, 2, 16, 649, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 650, 0, 'comment/reply/%', 'comment/reply/%', 'Reply to comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 650, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 647, 17, 'admin/build/menu', 'admin/build/menu', 'Menus', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:116:"Control your site''s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 2, 17, 647, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 646, 17, 'admin/build/imagecache', 'admin/build/imagecache', 'ImageCache', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:42:"Administer imagecache presets and actions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 646, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 644, 17, 'admin/build/contact', 'admin/build/contact', 'Contact form', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:71:"Create a system contact form and set up categories for the form to use.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 17, 644, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 645, 18, 'admin/settings/imageapi', 'admin/settings/imageapi', 'ImageAPI', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:19:"Configure ImageAPI.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 645, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 641, 0, 'system/files/imagecache', 'system/files/imagecache', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 641, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 642, 321, 'blog/%/feed', 'blog/%/feed', 'Blogs', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 319, 321, 642, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 643, 10, 'admin/content/comment', 'admin/content/comment', 'Comments', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"List and edit site comments and the comment moderation queue.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 10, 643, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 936, 0, 'admin/content/node-type/blog/fields/field_style/remove', 'admin/content/node-type/blog/fields/field_style/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 936, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 639, 0, 'views/ajax', 'views/ajax', 'Views', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:31:"Ajax callback for view loading.";}}', 'system', -1, 0, 0, 0, 0, 1, 0, 639, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 640, 18, 'admin/settings/admin_menu', 'admin/settings/admin_menu', 'Administration menu', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"Adjust administration menu settings.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 2, 18, 640, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 635, 0, 'comment/delete', 'comment/delete', 'Delete comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 635, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 636, 0, 'comment/edit', 'comment/edit', 'Edit comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 636, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 637, 2, 'admin/help', 'admin/help', 'Help', 'a:0:{}', 'system', 0, 0, 0, 0, 9, 2, 0, 2, 637, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 631, 0, 'filefield/progress', 'filefield/progress', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 631, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 632, 0, 'taxonomy/autocomplete', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 632, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('primary-links', 633, 319, 'blog/feed', 'blog/feed', 'Blogs', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 319, 633, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 941, 0, 'admin/content/node-type/page/fields/field_style/remove', 'admin/content/node-type/page/fields/field_style/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 941, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 626, 0, 'search', 'search', 'Search', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 626, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 627, 0, 'portfolio', 'portfolio', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 627, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 628, 0, 'admin_menu/toggle-modules', 'admin_menu/toggle-modules', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 628, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 629, 0, 'content/js_add_more', 'content/js_add_more', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 629, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 630, 0, 'admin_menu/flush-cache', 'admin_menu/flush-cache', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 630, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 845, 247, 'admin/content/node-type/story/fields', 'admin/content/node-type/story/fields', 'Manage fields', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 1, 0, 1, 4, 0, 141, 155, 247, 845, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 846, 845, 'admin/content/node-type/story/fields/field_image', 'admin/content/node-type/story/fields/field_image', 'Image', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 247, 845, 846, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 847, 845, 'admin/content/node-type/story/fields/field_quarterfirst', 'admin/content/node-type/story/fields/field_quarterfirst', 'Home quarter first', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 247, 845, 847, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 848, 845, 'admin/content/node-type/story/fields/field_quarterfourth', 'admin/content/node-type/story/fields/field_quarterfourth', 'Home quarter fourth', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 247, 845, 848, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 849, 845, 'admin/content/node-type/story/fields/field_quartersecond', 'admin/content/node-type/story/fields/field_quartersecond', 'Home quarter second', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 247, 845, 849, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 850, 845, 'admin/content/node-type/story/fields/field_quarterthird', 'admin/content/node-type/story/fields/field_quarterthird', 'Home quarter third', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 247, 845, 850, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 851, 845, 'admin/content/node-type/story/fields/field_slideshow', 'admin/content/node-type/story/fields/field_slideshow', 'Slide Show', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 247, 845, 851, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 852, 138, 'admin_menu/flush-cache', 'admin_menu/flush-cache', 'Flush all caches', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 1, 0, 20, 2, 0, 138, 852, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 853, 852, 'admin_menu/flush-cache/admin_menu', 'admin_menu/flush-cache', 'Administration menu', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 138, 852, 853, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 854, 852, 'admin_menu/flush-cache/cache', 'admin_menu/flush-cache', 'Cache tables', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 138, 852, 854, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 855, 852, 'admin_menu/flush-cache/menu', 'admin_menu/flush-cache', 'Menu', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 138, 852, 855, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 856, 852, 'admin_menu/flush-cache/requisites', 'admin_menu/flush-cache', 'Page requisites', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 138, 852, 856, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 857, 852, 'admin_menu/flush-cache/theme', 'admin_menu/flush-cache', 'Theme registry', 'a:2:{s:5:"alter";b:1;s:5:"query";s:11:"destination";}', 'admin_menu', 0, 0, 0, 0, 0, 3, 0, 138, 852, 857, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 858, 138, 'admin_menu/toggle-modules', 'admin_menu/toggle-modules', 'Disable developer modules', 'a:2:{s:5:"query";s:11:"destination";s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 88, 2, 0, 138, 858, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 860, 189, 'admin/build/themes/settings/corporatevision', 'admin/build/themes/settings/corporatevision', 'Corporate Vision', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 4, 0, 144, 174, 189, 860, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 938, 809, 'admin/content/node-type/blog/fields/field_style', 'admin/content/node-type/blog/fields/field_style', 'Syle', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 329, 809, 938, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 903, 0, 'admin/content/node-type/blog/fields/field_topfirst/remove', 'admin/content/node-type/blog/fields/field_topfirst/remove', 'Remove field', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 903, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('admin_menu', 905, 809, 'admin/content/node-type/blog/fields/field_topfirst', 'admin/content/node-type/blog/fields/field_topfirst', 'Home top first', 'a:1:{s:5:"alter";b:1;}', 'admin_menu', 0, 0, 0, 0, 0, 5, 0, 141, 155, 329, 809, 905, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('navigation', 916, 0, 'news', 'news', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 916, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-categories', 894, 0, 'taxonomy/term/2', 'taxonomy/term/%', 'Inspiration', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:11:"Inspiration";}}', 'taxonomy_menu', 0, 0, 0, 1, 0, 1, 0, 894, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-categories', 895, 0, 'taxonomy/term/1', 'taxonomy/term/%', 'Office Pranksters', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Office Pranksters";}}', 'taxonomy_menu', 0, 0, 0, 1, 0, 1, 0, 895, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES ('menu-categories', 896, 0, 'taxonomy/term/4', 'taxonomy/term/%', 'Photography', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:11:"Photography";}}', 'taxonomy_menu', 0, 0, 0, 1, 0, 1, 0, 896, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DROP TABLE IF EXISTS `menu_router`;
CREATE TABLE `menu_router` (
  `path` varchar(255) NOT NULL default '',
  `load_functions` text NOT NULL,
  `to_arg_functions` text NOT NULL,
  `access_callback` varchar(255) NOT NULL default '',
  `access_arguments` text,
  `page_callback` varchar(255) NOT NULL default '',
  `page_arguments` text,
  `fit` int(11) NOT NULL default '0',
  `number_parts` smallint(6) NOT NULL default '0',
  `tab_parent` varchar(255) NOT NULL default '',
  `tab_root` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `title_callback` varchar(255) NOT NULL default '',
  `title_arguments` varchar(255) NOT NULL default '',
  `type` int(11) NOT NULL default '0',
  `block_callback` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL default '',
  `weight` int(11) NOT NULL default '0',
  `file` mediumtext,
  PRIMARY KEY  (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `menu_router` VALUES ('node', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_page_default', 'a:0:{}', 1, 1, '', 'node', 'Content', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('rss.xml', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_feed', 'a:0:{}', 1, 1, '', 'rss.xml', 'RSS feed', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 1, 1, '', 'admin', 'Administer', 't', '', 6, '', '', '', 9, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('contact', '', '', 'user_access', 'a:1:{i:0;s:29:"access site-wide contact form";}', 'contact_site_page', 'a:0:{}', 1, 1, '', 'contact', 'Contact', 't', '', 20, '', '', '', 0, 'modules/contact/contact.pages.inc');
INSERT INTO `menu_router` VALUES ('logout', '', '', 'user_is_logged_in', 'a:0:{}', 'user_logout', 'a:0:{}', 1, 1, '', 'logout', 'Log out', 't', '', 6, '', '', '', 10, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('search', '', '', 'user_access', 'a:1:{i:0;s:14:"search content";}', 'search_view', 'a:0:{}', 1, 1, '', 'search', 'Search', 't', '', 20, '', '', '', 0, 'modules/search/search.pages.inc');
INSERT INTO `menu_router` VALUES ('batch', '', '', '1', 'a:0:{}', 'system_batch_page', 'a:0:{}', 1, 1, '', 'batch', '', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('user', '', '', '1', 'a:0:{}', 'user_page', 'a:0:{}', 1, 1, '', 'user', 'User account', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('blog', '', '', 'views_access', 'a:1:{i:0;b:1;}', 'views_page', 'a:2:{i:0;s:5:"blogs";i:1;s:6:"page_1";}', 1, 1, '', 'blog', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('news', '', '', 'views_access', 'a:1:{i:0;b:1;}', 'views_page', 'a:2:{i:0;s:11:"home_blocks";i:1;s:6:"page_1";}', 1, 1, '', 'news', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('portfolio', '', '', 'views_access', 'a:1:{i:0;b:1;}', 'views_page', 'a:2:{i:0;s:13:"taxonomy_term";i:1;s:6:"page_1";}', 1, 1, '', 'portfolio', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('user/login', '', '', 'user_is_anonymous', 'a:0:{}', 'user_page', 'a:0:{}', 3, 2, 'user', 'user', 'Log in', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('filefield/progress', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'filefield_progress', 'a:0:{}', 3, 2, '', 'filefield/progress', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('system/files', '', '', '1', 'a:0:{}', 'file_download', 'a:0:{}', 3, 2, '', 'system/files', 'File download', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin_menu/flush-cache', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'admin_menu_flush_cache', 'a:0:{}', 3, 2, '', 'admin_menu/flush-cache', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/admin_menu/admin_menu.inc');
INSERT INTO `menu_router` VALUES ('admin_menu/toggle-modules', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'admin_menu_toggle_modules', 'a:0:{}', 3, 2, '', 'admin_menu/toggle-modules', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/admin_menu/admin_menu.inc');
INSERT INTO `menu_router` VALUES ('content/js_add_more', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'content_add_more_js', 'a:0:{}', 3, 2, '', 'content/js_add_more', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.node_form.inc');
INSERT INTO `menu_router` VALUES ('taxonomy/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_autocomplete', 'a:0:{}', 3, 2, '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc');
INSERT INTO `menu_router` VALUES ('blog/feed', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'blog_feed_last', 'a:0:{}', 3, 2, '', 'blog/feed', 'Blogs', 't', '', 4, '', '', '', 0, 'modules/blog/blog.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/by-module', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_by_module', 'a:0:{}', 3, 2, 'admin', 'admin', 'By module', 't', '', 128, '', '', '', 2, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/by-task', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 3, 2, 'admin', 'admin', 'By task', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/compact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_compact_page', 'a:0:{}', 3, 2, '', 'admin/compact', 'Compact mode', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('filter/tips', '', '', '1', 'a:0:{}', 'filter_tips_long', 'a:0:{}', 3, 2, '', 'filter/tips', 'Compose tips', 't', '', 20, '', '', '', 0, 'modules/filter/filter.pages.inc');
INSERT INTO `menu_router` VALUES ('node/add', '', '', '_node_add_access', 'a:0:{}', 'node_add_page', 'a:0:{}', 3, 2, '', 'node/add', 'Create content', 't', '', 6, '', '', '', 1, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES ('comment/delete', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_delete', 'a:0:{}', 3, 2, '', 'comment/delete', 'Delete comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.admin.inc');
INSERT INTO `menu_router` VALUES ('comment/edit', '', '', 'user_access', 'a:1:{i:0;s:13:"post comments";}', 'comment_edit', 'a:0:{}', 3, 2, '', 'comment/edit', 'Edit comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_main', 'a:0:{}', 3, 2, '', 'admin/help', 'Help', 't', '', 6, '', '', '', 9, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('blog/%', 'a:1:{i:1;a:1:{s:14:"views_arg_load";a:3:{i:0;s:5:"blogs";i:1;s:4:"page";i:2;s:6:"%index";}}}', '', 'views_access', 'a:1:{i:0;b:1;}', 'views_page', 'a:3:{i:0;s:5:"blogs";i:1;s:4:"page";i:2;i:1;}', 2, 2, '', 'blog/%', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('user/register', '', '', 'user_register_access', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:13:"user_register";}', 3, 2, 'user', 'user', 'Create new account', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('user/password', '', '', 'user_is_anonymous', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:9:"user_pass";}', 3, 2, 'user', 'user', 'Request new password', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('user/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:20:"access user profiles";}', 'user_autocomplete', 'a:0:{}', 3, 2, '', 'user/autocomplete', 'User autocomplete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('views/ajax', '', '', '1', 'a:0:{}', 'views_ajax', 'a:0:{}', 3, 2, '', 'views/ajax', 'Views', 't', '', 4, '', 'Ajax callback for view loading.', '', 0, 'sites/all/modules/views/includes/ajax.inc');
INSERT INTO `menu_router` VALUES ('admin/content', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/content', 'Content management', 't', '', 6, '', 'Manage your site''s content.', 'left', -10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/reports', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/reports', 'Reports', 't', '', 6, '', 'View reports from system logs and other status information.', 'left', 5, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/build', 'Site building', 't', '', 6, '', 'Control how your site looks and feels.', 'right', -10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_settings_overview', 'a:0:{}', 3, 2, '', 'admin/settings', 'Site configuration', 't', '', 6, '', 'Adjust basic site configuration options.', 'right', -5, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('node/%', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/user', 'User management', 't', '', 6, '', 'Manage your site''s users, groups and access to site features.', 'left', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('user/%', 'a:1:{i:1;s:22:"user_uid_optional_load";}', 'a:1:{i:1;s:24:"user_uid_optional_to_arg";}', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', 6, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('node/%/view', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'View', 't', '', 136, '', '', '', -10, '');
INSERT INTO `menu_router` VALUES ('user/%/view', 'a:1:{i:1;s:9:"user_load";}', '', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'View', 't', '', 136, '', '', '', -10, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('system/files/imagecache', '', '', '1', 'a:0:{}', 'imagecache_cache_private', 'a:0:{}', 7, 3, '', 'system/files/imagecache', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/settings/actions', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 7, 3, '', 'admin/settings/actions', 'Actions', 't', '', 6, '', 'Manage the actions defined for your site.', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/user/rules', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 7, 3, '', 'admin/user/rules', 'Access rules', 't', '', 6, '', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 7, 3, '', 'admin/build/block', 'Blocks', 't', '', 6, '', 'Configure what block content appears in your site''s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/comment', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 7, 3, '', 'admin/content/comment', 'Comments', 't', '', 6, '', 'List and edit site comments and the comment moderation queue.', '', 0, 'modules/comment/comment.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/contact', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'contact_admin_categories', 'a:0:{}', 7, 3, '', 'admin/build/contact', 'Contact form', 't', '', 6, '', 'Create a system contact form and set up categories for the form to use.', '', 0, 'modules/contact/contact.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/imageapi', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:17:"imageapi_settings";}', 7, 3, '', 'admin/settings/imageapi', 'ImageAPI', 't', '', 6, '', 'Configure ImageAPI.', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_preset_overview', 'a:0:{}', 7, 3, '', 'admin/build/imagecache', 'ImageCache', 't', '', 6, '', 'Administer imagecache presets and actions.', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/logging', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_logging_overview', 'a:0:{}', 7, 3, '', 'admin/settings/logging', 'Logging and alerts', 't', '', 6, '', 'Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/reports/dblog', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_overview', 'a:0:{}', 7, 3, '', 'admin/reports/dblog', 'Recent log entries', 't', '', 6, '', 'View events that have recently been logged.', '', -1, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/reports/status', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_status', 'a:0:{}', 7, 3, '', 'admin/reports/status', 'Status report', 't', '', 6, '', 'Get a status report about your site''s operation and any detected problems.', '', 10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/admin_menu', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/admin_menu', 'admin_menu', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('taxonomy/term/%', 'a:1:{i:2;a:1:{s:14:"views_arg_load";a:3:{i:0;s:13:"taxonomy_term";i:1;s:4:"page";i:2;s:6:"%index";}}}', '', 'views_access', 'a:1:{i:0;b:1;}', 'views_page', 'a:3:{i:0;s:13:"taxonomy_term";i:1;s:4:"page";i:2;i:2;}', 6, 3, '', 'taxonomy/term/%', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/help/block', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/block', 'block', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/blog', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/blog', 'blog', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/color', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/color', 'color', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/comment', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/comment', 'comment', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/contact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/contact', 'contact', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/content', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/content', 'content', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/dblog', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/dblog', 'dblog', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/filter', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/filter', 'filter', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/help', 'help', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/imagecache_ui', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/imagecache_ui', 'imagecache_ui', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/jquery_update', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:22:"jquery_update_settings";}', 7, 3, '', 'admin/settings/jquery_update', 'jQuery Update', 't', '', 6, '', 'Configure settings for jQuery Update module.', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/help/menu', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/menu', 'menu', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/node', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/node', 'node', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/search', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/search', 'search', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/system', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/system', 'system', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/taxonomy', 'taxonomy', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/user', 'user', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/help/views_ui', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/views_ui', 'views_ui', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/admin_menu', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"admin_menu_theme_settings";}', 7, 3, '', 'admin/settings/admin_menu', 'Administration menu', 't', '', 6, '', 'Adjust administration menu settings.', '', 0, 'sites/all/modules/admin_menu/admin_menu.inc');
INSERT INTO `menu_router` VALUES ('blog/%/feed', 'a:1:{i:1;s:9:"user_load";}', '', 'blog_page_user_access', 'a:1:{i:0;i:1;}', 'blog_feed_user', 'a:1:{i:0;i:1;}', 5, 3, '', 'blog/%/feed', 'Blogs', 't', '', 4, '', '', '', 0, 'modules/blog/blog.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/clean-urls', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_clean_url_settings";}', 7, 3, '', 'admin/settings/clean-urls', 'Clean URLs', 't', '', 6, '', 'Enable or disable clean URLs for your site.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('user/%/contact', 'a:1:{i:1;s:9:"user_load";}', '', '_contact_user_tab_access', 'a:1:{i:0;i:1;}', 'contact_user_page', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'Contact', 't', '', 128, '', '', '', 2, 'modules/contact/contact.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 7, 3, '', 'admin/content/node', 'Content', 't', '', 6, '', 'View, edit, and delete your site''s content.', '', 0, 'modules/node/node.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/types', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_types_overview', 'a:0:{}', 7, 3, '', 'admin/content/types', 'Content types', 't', '', 6, '', 'Manage posts by content type, including default status, front page promotion, etc.', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/date-time', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', 7, 3, '', 'admin/settings/date-time', 'Date and time', 't', '', 6, '', 'Settings for how Drupal displays date and time, as well as the system''s default timezone.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('node/%/delete', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"delete";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"node_delete_confirm";i:1;i:1;}', 5, 3, '', 'node/%/delete', 'Delete', 't', '', 4, '', '', '', 1, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES ('user/%/delete', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:2:{i:0;s:19:"user_confirm_delete";i:1;i:1;}', 5, 3, '', 'user/%/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('node/%/edit', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'node_page_edit', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Edit', 't', '', 128, '', '', '', 1, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/error-reporting', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:31:"system_error_reporting_settings";}', 7, 3, '', 'admin/settings/error-reporting', 'Error reporting', 't', '', 6, '', 'Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/file-system', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_file_system_settings";}', 7, 3, '', 'admin/settings/file-system', 'File system', 't', '', 6, '', 'Tell Drupal where to store uploaded files and how they are accessed.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/image-toolkit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:29:"system_image_toolkit_settings";}', 7, 3, '', 'admin/settings/image-toolkit', 'Image toolkit', 't', '', 6, '', 'Choose which image toolkit to use if you have installed optional toolkits.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/filters', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 7, 3, '', 'admin/settings/filters', 'Input formats', 't', '', 6, '', 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 7, 3, '', 'admin/build/menu', 'Menus', 't', '', 6, '', 'Control your site''s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/modules', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 7, 3, '', 'admin/build/modules', 'Modules', 't', '', 6, '', 'Enable or disable add-on modules for your site.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/performance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_performance_settings";}', 7, 3, '', 'admin/settings/performance', 'Performance', 't', '', 6, '', 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/permissions', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_perm";}', 7, 3, '', 'admin/user/permissions', 'Permissions', 't', '', 6, '', 'Determine access to features by selecting permissions for roles.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_configure";}', 7, 3, '', 'admin/content/node-settings', 'Post settings', 't', '', 6, '', 'Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.', '', 0, 'modules/node/node.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/rss-publishing', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_rss_feeds_settings";}', 7, 3, '', 'admin/content/rss-publishing', 'RSS publishing', 't', '', 6, '', 'Configure the number of items per feed and whether feeds should be titles/teasers/full-text.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('comment/reply/%', 'a:1:{i:2;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:2;}', 'comment_reply', 'a:1:{i:0;i:2;}', 6, 3, '', 'comment/reply/%', 'Reply to comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc');
INSERT INTO `menu_router` VALUES ('node/%/revisions', 'a:1:{i:1;s:9:"node_load";}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_revision_overview', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Revisions', 't', '', 128, '', '', '', 2, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/user/roles', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_new_role";}', 7, 3, '', 'admin/user/roles', 'Roles', 't', '', 6, '', 'List, edit, or add user roles.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/search', '', '', 'user_access', 'a:1:{i:0;s:17:"administer search";}', 'drupal_get_form', 'a:1:{i:0;s:21:"search_admin_settings";}', 7, 3, '', 'admin/settings/search', 'Search settings', 't', '', 6, '', 'Configure relevance settings for search and other indexing options', '', 0, 'modules/search/search.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/site-information', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_information_settings";}', 7, 3, '', 'admin/settings/site-information', 'Site information', 't', '', 6, '', 'Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/site-maintenance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_maintenance_settings";}', 7, 3, '', 'admin/settings/site-maintenance', 'Site maintenance', 't', '', 6, '', 'Take the site off-line for maintenance or bring it back online.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 7, 3, '', 'admin/content/taxonomy', 'Taxonomy', 't', '', 6, '', 'Manage tagging, categorization, and classification of your content.', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/themes', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 7, 3, '', 'admin/build/themes', 'Themes', 't', '', 6, '', 'Change which theme your site uses or allows users to set.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/reports/access-denied', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:13:"access denied";}', 7, 3, '', 'admin/reports/access-denied', 'Top ''access denied'' errors', 't', '', 6, '', 'View ''access denied'' errors (403s).', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/reports/page-not-found', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:14:"page not found";}', 7, 3, '', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 't', '', 6, '', 'View ''page not found'' errors (404s).', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_settings";}', 7, 3, '', 'admin/user/settings', 'User settings', 't', '', 6, '', 'Configure default behavior of users, including registration requirements, e-mails, and user pictures.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/user', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 7, 3, '', 'admin/user/user', 'Users', 't', '', 6, '', 'List, add, and edit users.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_list_views', 'a:0:{}', 7, 3, '', 'admin/build/views', 'Views', 't', '', 6, '', 'Views are customized lists of content on your system; they are highly configurable and give you control over how lists of content are presented.', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('user/%/edit', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'Edit', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/reports/search', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:6:"search";}', 7, 3, '', 'admin/reports/search', 'Top search phrases', 't', '', 6, '', 'View most popular search phrases.', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/admin', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_admin_theme_settings";}', 7, 3, '', 'admin/settings/admin', 'Administration theme', 't', '', 6, 'system_admin_theme_settings', 'Settings for how your administrative pages should look.', 'left', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('node/add/blog', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:4:"blog";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/blog', 'Blog entry', 'check_plain', '', 6, '', 'A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES ('node/add/page', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:4:"page";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/page', 'Page', 'check_plain', '', 6, '', 'A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES ('node/add/portfolio', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:9:"portfolio";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/portfolio', 'Portfolio', 'check_plain', '', 6, '', '', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES ('node/add/story', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:5:"story";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/story', 'Story', 'check_plain', '', 6, '', 'A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES ('search/node/%', 'a:1:{i:2;N;}', 'a:1:{i:2;s:16:"menu_tail_to_arg";}', '_search_menu', 'a:1:{i:0;s:4:"node";}', 'search_view', 'a:1:{i:0;s:4:"node";}', 6, 3, 'search', 'search', '', 'module_invoke', 'a:4:{i:0;s:4:"node";i:1;s:6:"search";i:2;s:4:"name";i:3;b:1;}', 128, '', '', '', 0, 'modules/search/search.pages.inc');
INSERT INTO `menu_router` VALUES ('search/user/%', 'a:1:{i:2;N;}', 'a:1:{i:2;s:16:"menu_tail_to_arg";}', '_search_menu', 'a:1:{i:0;s:4:"user";}', 'search_view', 'a:1:{i:0;s:4:"user";}', 6, 3, 'search', 'search', '', 'module_invoke', 'a:4:{i:0;s:4:"user";i:1;s:6:"search";i:2;s:4:"name";i:3;b:1;}', 128, '', '', '', 0, 'modules/search/search.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/list', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 15, 4, 'admin/build/block', 'admin/build/block', 'List', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache/list', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_preset_overview', 'a:0:{}', 15, 4, 'admin/build/imagecache', 'admin/build/imagecache', 'List', 't', '', 136, '', '', '', -10, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node/overview', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 15, 4, 'admin/content/node', 'admin/content/node', 'List', 't', '', 136, '', '', '', -10, 'modules/node/node.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/types/list', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_types_overview', 'a:0:{}', 15, 4, 'admin/content/types', 'admin/content/types', 'List', 't', '', 136, '', '', '', -10, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/taxonomy/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 15, 4, 'admin/content/taxonomy', 'admin/content/taxonomy', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/rules/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/user/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 15, 4, 'admin/user/user', 'admin/user/user', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/imageapi/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:17:"imageapi_settings";}', 15, 4, 'admin/settings/imageapi', 'admin/settings/imageapi', 'List', 't', '', 136, '', '', '', -1, '');
INSERT INTO `menu_router` VALUES ('admin/settings/filters/list', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'List', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/modules/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'List', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/comment/new', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Published comments', 't', '', 136, '', '', '', -10, 'modules/comment/comment.admin.inc');
INSERT INTO `menu_router` VALUES ('user/%/edit/account', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 11, 4, 'user/%/edit', 'user/%', 'Account', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/build/themes/select', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'List', 't', '', 136, '', 'Select the default theme.', '', -1, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu/list', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'List menus', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('sites/default/files/imagecache', '', '', '1', 'a:0:{}', 'imagecache_cache', 'a:0:{}', 15, 4, '', 'sites/default/files/imagecache', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/build/themes/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'Configure', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/contact/list', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'contact_admin_categories', 'a:0:{}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'List', 't', '', 136, '', '', '', 0, 'modules/contact/contact.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/actions/manage', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 15, 4, 'admin/settings/actions', 'admin/settings/actions', 'Manage actions', 't', '', 136, '', 'Manage the actions defined for your site.', '', -2, '');
INSERT INTO `menu_router` VALUES ('admin/settings/actions/orphan', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_remove_orphans', 'a:0:{}', 15, 4, '', 'admin/settings/actions/orphan', 'Remove orphans', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/build/modules/uninstall', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'Uninstall', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/filters/add', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:0:{}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'Add input format', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/rules/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_add', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Add rule', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/user/create', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:6:"create";}', 15, 4, 'admin/user/user', 'admin/user/user', 'Add user', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/comment/approval', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:1:{i:0;s:8:"approval";}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Approval queue', 't', '', 128, '', '', '', 0, 'modules/comment/comment.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/rules/check', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_check', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Check rules', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/clean-urls/check', '', '', '1', 'a:0:{}', 'drupal_json', 'a:1:{i:0;a:1:{s:6:"status";b:1;}}', 15, 4, '', 'admin/settings/clean-urls/check', 'Clean URL check', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/settings/imageapi/config', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imageapi_gd_settings_form";}', 15, 4, 'admin/settings/imageapi', 'admin/settings/imageapi', 'Configure', 't', '', 128, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/settings/actions/configure', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_actions_configure";}', 15, 4, '', 'admin/settings/actions/configure', 'Configure an advanced action', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/settings/date-time/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_date_time_lookup', 'a:0:{}', 15, 4, '', 'admin/settings/date-time/lookup', 'Date and time lookup', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/roles/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_role";}', 15, 4, '', 'admin/user/roles/edit', 'Edit role', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/rules/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_edit', 'a:0:{}', 15, 4, '', 'admin/user/rules/edit', 'Edit rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/types/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'content_fields_list', 'a:0:{}', 15, 4, 'admin/content/types', 'admin/content/types', 'Fields', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/reports/status/php', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_php', 'a:0:{}', 15, 4, '', 'admin/reports/status/php', 'PHP', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-settings/rebuild', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:30:"node_configure_rebuild_confirm";}', 15, 4, '', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 't', '', 4, '', '', '', 0, 'modules/node/node.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/reports/status/run-cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_run_cron', 'a:0:{}', 15, 4, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/reports/status/sql', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_sql', 'a:0:{}', 15, 4, '', 'admin/reports/status/sql', 'SQL', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', 15, 4, 'admin/build/block', 'admin/build/block', 'Add block', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/contact/add', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:2:{i:0;s:18:"contact_admin_edit";i:1;i:3;}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'Add category', 't', '', 128, '', '', '', 1, 'modules/contact/contact.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/types/add', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_type_form";}', 15, 4, 'admin/content/types', 'admin/content/types', 'Add content type', 't', '', 128, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu/add', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:14:"menu_edit_menu";i:1;s:3:"add";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Add menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache/add', '', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imagecache_ui_preset_form";}', 15, 4, 'admin/build/imagecache', 'admin/build/imagecache', 'Add new preset', 't', '', 128, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"blog";s:4:"name";s:10:"Blog entry";s:6:"module";s:4:"blog";s:11:"description";s:78:"A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"0";s:8:"modified";s:1:"1";s:6:"locked";s:1:"1";s:9:"orig_type";s:4:"blog";}}', 15, 4, '', 'admin/content/node-type/blog', 'Blog entry', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/search/wipe', '', '', 'user_access', 'a:1:{i:0;s:17:"administer search";}', 'drupal_get_form', 'a:1:{i:0;s:19:"search_wipe_confirm";}', 15, 4, '', 'admin/settings/search/wipe', 'Clear index', 't', '', 4, '', '', '', 0, 'modules/search/search.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/configure', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:21:"block_admin_configure";}', 15, 4, '', 'admin/build/block/configure', 'Configure block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/delete', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:16:"block_box_delete";}', 15, 4, '', 'admin/build/block/delete', 'Delete block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/filters/delete', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:19:"filter_admin_delete";}', 15, 4, '', 'admin/settings/filters/delete', 'Delete input format', 't', '', 4, '', '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/user/rules/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:32:"user_admin_access_delete_confirm";}', 15, 4, '', 'admin/user/rules/delete', 'Delete rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/reports/event/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_event', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/reports/event/%', 'Details', 't', '', 4, '', '', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/taxonomy/%', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 14, 4, '', 'admin/content/taxonomy/%', 'List terms', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 15, 4, '', 'admin/content/node-type/page', 'Page', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:9:"portfolio";s:4:"name";s:9:"Portfolio";s:6:"module";s:4:"node";s:11:"description";s:0:"";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 15, 4, '', 'admin/content/node-type/portfolio', 'Portfolio', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/build/contact/settings', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:1:{i:0;s:22:"contact_admin_settings";}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'Settings', 't', '', 128, '', '', '', 2, 'modules/contact/contact.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu/settings', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:1:{i:0;s:14:"menu_configure";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Settings', 't', '', 128, '', '', '', 5, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('taxonomy/term/%/feed', 'a:1:{i:2;a:1:{s:14:"views_arg_load";a:3:{i:0;s:5:"blogs";i:1;a:2:{i:0;s:6:"feed_1";i:1;s:6:"feed_1";}i:2;s:6:"%index";}}}', '', 'views_access', 'a:2:{i:0;b:1;i:1;b:1;}', 'views_page', 'a:3:{i:0;s:5:"blogs";i:1;a:2:{i:0;s:6:"feed_1";i:1;s:6:"feed_1";}i:2;i:2;}', 13, 4, '', 'taxonomy/term/%/feed', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/build/views/add', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_add_page', 'a:0:{}', 15, 4, 'admin/build/views', 'admin/build/views', 'Add', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_list_views', 'a:0:{}', 15, 4, 'admin/build/views', 'admin/build/views', 'List', 't', '', 136, '', '', '', -1, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:5:"Story";s:6:"module";s:4:"node";s:11:"description";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}', 15, 4, '', 'admin/content/node-type/story', 'Story', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/logging/dblog', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"dblog_admin_settings";}', 15, 4, '', 'admin/settings/logging/dblog', 'Database logging', 't', '', 6, '', 'Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views1/delete', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:24:"views_ui_delete1_confirm";i:1;i:4;}', 15, 4, '', 'admin/build/views1/delete', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/convert.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/import', '', '', 'views_import_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_import_page";}', 15, 4, 'admin/build/views', 'admin/build/views', 'Import', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/tools', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_admin_tools";}', 15, 4, 'admin/build/views', 'admin/build/views', 'Tools', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views1/convert', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_convert1', 'a:1:{i:0;i:4;}', 15, 4, '', 'admin/build/views1/convert', 'Convert view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/convert.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/filters/%', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/settings/filters/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache/%', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:25:"imagecache_ui_preset_form";i:1;i:3;}', 14, 4, '', 'admin/build/imagecache/%', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:24:"Edit preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu-customize/%', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 14, 4, '', 'admin/build/menu-customize/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"blog";s:4:"name";s:10:"Blog entry";s:6:"module";s:4:"blog";s:11:"description";s:78:"A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"0";s:8:"modified";s:1:"1";s:6:"locked";s:1:"1";s:9:"orig_type";s:4:"blog";}}', 31, 5, 'admin/content/node-type/blog', 'admin/content/node-type/blog', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:9:"portfolio";s:4:"name";s:9:"Portfolio";s:6:"module";s:4:"node";s:11:"description";s:0:"";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, 'admin/content/node-type/portfolio', 'admin/content/node-type/portfolio', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:5:"Story";s:6:"module";s:4:"node";s:11:"description";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}', 31, 5, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/build/themes/settings/global', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Global settings', 't', '', 136, '', '', '', -1, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/taxonomy/%/list', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 29, 5, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/filters/%/edit', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Edit', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/modules/list/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 31, 5, '', 'admin/build/modules/list/confirm', 'List', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu-customize/%/list', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'List items', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/modules/uninstall/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 31, 5, '', 'admin/build/modules/uninstall/confirm', 'Uninstall', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/themes/settings/bluemarine', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"bluemarine";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/themes/settings/chameleon', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:9:"chameleon";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/themes/settings/corporatevision', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:53:"sites/all/themes/corporatevision/corporatevision.info";s:4:"name";s:15:"corporatevision";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:11:{s:4:"name";s:16:"Corporate Vision";s:11:"description";s:77:"Premium Drupal theme by <a href="http://www.themesnap.com">ThemeSnap.com</a>.";s:10:"screenshot";s:47:"sites/all/themes/corporatevision/screenshot.png";s:7:"version";s:7:"6.x-1.0";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:15:{s:19:"sidebar_right_first";s:13:"Sidebar Right";s:10:"slide_show";s:10:"Slide Show";s:14:"home_top_first";s:14:"Home top first";s:18:"home_quarter_first";s:18:"Home quarter first";s:19:"home_quarter_second";s:19:"Home quarter second";s:18:"home_quarter_third";s:18:"Home quarter third";s:19:"home_quarter_fourth";s:19:"Home quarter fourth";s:17:"home_bottom_first";s:17:"Home bottom first";s:18:"home_bottom_second";s:18:"Home bottom second";s:17:"home_bottom_third";s:17:"Home bottom third";s:6:"bottom";s:6:"Bottom";s:12:"footer_first";s:12:"Footer first";s:13:"footer_second";s:13:"Footer second";s:12:"footer_third";s:12:"Footer third";s:13:"footer_fourth";s:13:"Footer fourth";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:42:"sites/all/themes/corporatevision/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:42:"sites/all/themes/corporatevision/script.js";}s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:42:"sites/all/themes/corporatevision/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:15:"corporatevision";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Corporate Vision', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"blog";s:4:"name";s:10:"Blog entry";s:6:"module";s:4:"blog";s:11:"description";s:78:"A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"0";s:8:"modified";s:1:"1";s:6:"locked";s:1:"1";s:9:"orig_type";s:4:"blog";}}', 31, 5, '', 'admin/content/node-type/blog/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 31, 5, '', 'admin/content/node-type/page/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:9:"portfolio";s:4:"name";s:9:"Portfolio";s:6:"module";s:4:"node";s:11:"description";s:0:"";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:0:"";}}', 31, 5, '', 'admin/content/node-type/portfolio/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:5:"Story";s:6:"module";s:4:"node";s:11:"description";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}', 31, 5, '', 'admin/content/node-type/story/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES ('admin/content/taxonomy/edit/term', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_term_edit', 'a:0:{}', 31, 5, '', 'admin/content/taxonomy/edit/term', 'Edit term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/themes/settings/garland', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:7:"garland";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Garland', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/list/js', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display_js', 'a:0:{}', 31, 5, '', 'admin/build/block/list/js', 'JavaScript List Form', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/themes/settings/marvin', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:6:"marvin";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/themes/settings/minnelli', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:8:"minnelli";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/themes/settings/pushbutton', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"pushbutton";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/imageapi/config/imageapi_gd', '', '', 'user_access', 'a:1:{i:0;s:19:"administer imageapi";}', 'drupal_get_form', 'a:1:{i:0;s:25:"imageapi_gd_settings_form";}', 31, 5, 'admin/settings/imageapi/config', 'admin/settings/imageapi', '@name', 't', 'a:1:{s:5:"@name";s:12:"ImageAPI GD2";}', 136, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('filefield/ahah/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', 'filefield_edit_access', 'a:2:{i:0;i:2;i:1;i:3;}', 'filefield_js', 'a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}', 24, 5, '', 'filefield/ahah/%/%/%', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/build/menu-customize/%/add', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:3:"add";i:2;N;i:3;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Add item', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/list/bluemarine', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"bluemarine";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Bluemarine', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('taxonomy/term/%/%/feed', 'a:2:{i:2;a:1:{s:14:"views_arg_load";a:3:{i:0;s:5:"blogs";i:1;a:2:{i:0;s:4:"feed";i:1;s:4:"feed";}i:2;s:6:"%index";}}i:3;a:1:{s:14:"views_arg_load";a:3:{i:0;s:5:"blogs";i:1;a:2:{i:0;s:4:"feed";i:1;s:4:"feed";}i:2;s:6:"%index";}}}', '', 'views_access', 'a:2:{i:0;b:1;i:1;b:1;}', 'views_page', 'a:4:{i:0;s:5:"blogs";i:1;a:2:{i:0;s:4:"feed";i:1;s:4:"feed";}i:2;i:2;i:3;i:3;}', 25, 5, '', 'taxonomy/term/%/%/feed', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/build/block/list/chameleon', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:4:"name";s:9:"chameleon";s:4:"type";s:5:"theme";s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}}}', 'block_admin_display', 'a:1:{i:0;s:9:"chameleon";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Chameleon', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/filters/%/configure', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_configure_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Configure', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/list/corporatevision', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:53:"sites/all/themes/corporatevision/corporatevision.info";s:4:"name";s:15:"corporatevision";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:11:{s:4:"name";s:16:"Corporate Vision";s:11:"description";s:77:"Premium Drupal theme by <a href="http://www.themesnap.com">ThemeSnap.com</a>.";s:10:"screenshot";s:47:"sites/all/themes/corporatevision/screenshot.png";s:7:"version";s:7:"6.x-1.0";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:15:{s:19:"sidebar_right_first";s:13:"Sidebar Right";s:10:"slide_show";s:10:"Slide Show";s:14:"home_top_first";s:14:"Home top first";s:18:"home_quarter_first";s:18:"Home quarter first";s:19:"home_quarter_second";s:19:"Home quarter second";s:18:"home_quarter_third";s:18:"Home quarter third";s:19:"home_quarter_fourth";s:19:"Home quarter fourth";s:17:"home_bottom_first";s:17:"Home bottom first";s:18:"home_bottom_second";s:18:"Home bottom second";s:17:"home_bottom_third";s:17:"Home bottom third";s:6:"bottom";s:6:"Bottom";s:12:"footer_first";s:12:"Footer first";s:13:"footer_second";s:13:"Footer second";s:12:"footer_third";s:12:"Footer third";s:13:"footer_fourth";s:13:"Footer fourth";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:42:"sites/all/themes/corporatevision/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:42:"sites/all/themes/corporatevision/script.js";}s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:42:"sites/all/themes/corporatevision/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:15:"corporatevision";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Corporate Vision', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/views/ajax/autocomplete/user', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'views_ajax_autocomplete_user', 'a:0:{}', 31, 5, '', 'admin/views/ajax/autocomplete/user', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/ajax.inc');
INSERT INTO `menu_router` VALUES ('admin/views/ajax/autocomplete/tag', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_autocomplete_tag', 'a:0:{}', 31, 5, '', 'admin/views/ajax/autocomplete/tag', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/actions/delete/%', 'a:1:{i:4;s:12:"actions_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:2:{i:0;s:26:"system_actions_delete_form";i:1;i:4;}', 30, 5, '', 'admin/settings/actions/delete/%', 'Delete action', 't', '', 4, '', 'Delete an action.', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/build/contact/delete/%', 'a:1:{i:4;s:12:"contact_load";}', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:2:{i:0;s:20:"contact_admin_delete";i:1;i:4;}', 30, 5, '', 'admin/build/contact/delete/%', 'Delete contact', 't', '', 4, '', '', '', 0, 'modules/contact/contact.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu-customize/%/delete', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_delete_menu_page', 'a:1:{i:0;i:3;}', 29, 5, '', 'admin/build/menu-customize/%/delete', 'Delete menu', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:4:"blog";}', 31, 5, 'admin/content/node-type/blog', 'admin/content/node-type/blog', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:4:"page";}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:9:"portfolio";}', 31, 5, 'admin/content/node-type/portfolio', 'admin/content/node-type/portfolio', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/display', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:29:"content_display_overview_form";i:1;s:5:"story";}', 31, 5, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Display fields', 't', '', 128, '', '', '', 2, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/contact/edit/%', 'a:1:{i:4;s:12:"contact_load";}', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:3:{i:0;s:18:"contact_admin_edit";i:1;i:3;i:2;i:4;}', 30, 5, '', 'admin/build/contact/edit/%', 'Edit contact category', 't', '', 4, '', '', '', 0, 'modules/contact/contact.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu-customize/%/edit', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:3:{i:0;s:14:"menu_edit_menu";i:1;s:4:"edit";i:2;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Edit menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/list/garland', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:27:"themes/garland/garland.info";s:4:"name";s:7:"garland";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:7:"garland";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Garland', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:4:"blog";}', 31, 5, 'admin/content/node-type/blog', 'admin/content/node-type/blog', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:4:"page";}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:9:"portfolio";}', 31, 5, 'admin/content/node-type/portfolio', 'admin/content/node-type/portfolio', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:27:"content_field_overview_form";i:1;s:5:"story";}', 31, 5, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Manage fields', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/list/marvin', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:4:"name";s:6:"marvin";s:4:"type";s:5:"theme";s:5:"owner";s:0:"";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";}}', 'block_admin_display', 'a:1:{i:0;s:6:"marvin";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Marvin', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/list/minnelli', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:4:"name";s:8:"minnelli";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";}}', 'block_admin_display', 'a:1:{i:0;s:8:"minnelli";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Minnelli', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/block/list/pushbutton', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:10:"pushbutton";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Pushbutton', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/settings/filters/%/order', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_order_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Rearrange', 't', '', 128, '', '', '', 2, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES ('user/reset/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', '1', 'a:0:{}', 'drupal_get_form', 'a:4:{i:0;s:15:"user_pass_reset";i:1;i:2;i:2;i:3;i:3;i:4;}', 24, 5, '', 'user/reset/%/%/%', 'Reset password', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/content/taxonomy/add/vocabulary', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:24:"taxonomy_form_vocabulary";}', 31, 5, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Add vocabulary', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/break-lock/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:27:"views_ui_break_lock_confirm";i:1;i:4;}', 30, 5, '', 'admin/build/views/break-lock/%', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/delete/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:23:"views_ui_delete_confirm";i:1;i:4;}', 30, 5, '', 'admin/build/views/delete/%', 'Delete view', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('node/%/revisions/%/view', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_show', 'a:3:{i:0;i:1;i:1;N;i:2;b:1;}', 21, 5, '', 'node/%/revisions/%/view', 'Revisions', 't', '', 4, '', '', '', 0, '');
INSERT INTO `menu_router` VALUES ('admin/build/views/export/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:2:{i:0;s:20:"views_ui_export_page";i:1;i:4;}', 30, 5, '', 'admin/build/views/export/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/clone/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_clone_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/clone/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/disable/%', 'a:1:{i:4;s:21:"views_ui_default_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_disable_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/disable/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/enable/%', 'a:1:{i:4;s:21:"views_ui_default_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_enable_page', 'a:1:{i:0;i:4;}', 30, 5, '', 'admin/build/views/enable/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/tools/basic', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'drupal_get_form', 'a:1:{i:0;s:20:"views_ui_admin_tools";}', 31, 5, 'admin/build/views/tools', 'admin/build/views', 'Basic', 't', '', 136, '', '', '', -10, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/edit/%', 'a:1:{i:4;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_edit_page', 'a:1:{i:0;i:4;}', 30, 5, 'admin/build/views', 'admin/build/views', 'Edit', 't', '', 128, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/tools/convert', '', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_admin_convert', 'a:0:{}', 31, 5, 'admin/build/views/tools', 'admin/build/views', 'Convert', 't', '', 128, '', 'Convert stored Views 1 views.', '', 1, 'sites/all/modules/views/includes/convert.inc');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache/%/delete', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:32:"imagecache_ui_preset_delete_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/delete', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:26:"Delete preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache/%/export', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:32:"imagecache_ui_preset_export_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/export', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:26:"Export preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache/%/flush', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:16:"flush imagecache";}', 'drupal_get_form', 'a:2:{i:0;s:31:"imagecache_ui_preset_flush_form";i:1;i:3;}', 29, 5, '', 'admin/build/imagecache/%/flush', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:25:"Flush preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('node/%/revisions/%/delete', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"delete";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_delete_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache/%/override', 'a:1:{i:3;s:25:"imagecache_ui_preset_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:25:"imagecache_ui_preset_form";i:1;i:3;i:2;b:1;}', 29, 5, '', 'admin/build/imagecache/%/override', '', 'imagecache_preset_title_callback', 'a:2:{i:0;s:28:"Override preset: !presetname";i:1;i:3;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache/%/%', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:4;s:22:"imagecache_action_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:25:"imagecache_ui_action_form";i:1;i:3;i:2;i:4;}', 28, 5, '', 'admin/build/imagecache/%/%', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:30:"!action for preset !presetname";i:1;i:3;i:2;i:4;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('node/%/revisions/%/revert', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"update";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_revert_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"blog";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/blog/display', 'admin/content/node-type/blog', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"page";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/page/display', 'admin/content/node-type/page', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:9:"portfolio";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/portfolio/display', 'admin/content/node-type/portfolio', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/display/basic', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"story";i:2;s:5:"basic";}', 63, 6, 'admin/content/node-type/story/display', 'admin/content/node-type/story', 'Basic', 't', '', 136, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"blog";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/blog/display', 'admin/content/node-type/blog', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"page";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/page/display', 'admin/content/node-type/page', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:9:"portfolio";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/portfolio/display', 'admin/content/node-type/portfolio', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/display/rss', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"story";i:2;s:3:"rss";}', 63, 6, 'admin/content/node-type/story/display', 'admin/content/node-type/story', 'RSS', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/display/search', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"blog";i:2;s:6:"search";}', 63, 6, 'admin/content/node-type/blog/display', 'admin/content/node-type/blog', 'Search', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/display/search', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:4:"page";i:2;s:6:"search";}', 63, 6, 'admin/content/node-type/page/display', 'admin/content/node-type/page', 'Search', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/display/search', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:9:"portfolio";i:2;s:6:"search";}', 63, 6, 'admin/content/node-type/portfolio/display', 'admin/content/node-type/portfolio', 'Search', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/display/search', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:29:"content_display_overview_form";i:1;s:5:"story";i:2;s:6:"search";}', 63, 6, 'admin/content/node-type/story/display', 'admin/content/node-type/story', 'Search', 't', '', 128, '', '', '', 1, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu/item/%/delete', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_item_delete_page', 'a:1:{i:0;i:4;}', 61, 6, '', 'admin/build/menu/item/%/delete', 'Delete menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu/item/%/edit', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:4:"edit";i:2;i:4;i:3;N;}', 61, 6, '', 'admin/build/menu/item/%/edit', 'Edit menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/taxonomy/edit/vocabulary/%', 'a:1:{i:5;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_vocabulary_edit', 'a:1:{i:0;i:5;}', 62, 6, '', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_quarterfirst', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:4:"blog";i:2;s:18:"field_quarterfirst";}', 63, 6, 'admin/content/node-type/blog/fields', 'admin/content/node-type/blog', 'Home quarter first', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_quarterfirst', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:9:"portfolio";i:2;s:18:"field_quarterfirst";}', 63, 6, 'admin/content/node-type/portfolio/fields', 'admin/content/node-type/portfolio', 'Home quarter first', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_quarterfirst', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"story";i:2;s:18:"field_quarterfirst";}', 63, 6, 'admin/content/node-type/story/fields', 'admin/content/node-type/story', 'Home quarter first', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_quarterfourth', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:4:"blog";i:2;s:19:"field_quarterfourth";}', 63, 6, 'admin/content/node-type/blog/fields', 'admin/content/node-type/blog', 'Home quarter fourth', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_quarterfourth', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:9:"portfolio";i:2;s:19:"field_quarterfourth";}', 63, 6, 'admin/content/node-type/portfolio/fields', 'admin/content/node-type/portfolio', 'Home quarter fourth', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_quarterfourth', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"story";i:2;s:19:"field_quarterfourth";}', 63, 6, 'admin/content/node-type/story/fields', 'admin/content/node-type/story', 'Home quarter fourth', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_quartersecond', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:4:"blog";i:2;s:19:"field_quartersecond";}', 63, 6, 'admin/content/node-type/blog/fields', 'admin/content/node-type/blog', 'Home quarter second', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_quartersecond', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:9:"portfolio";i:2;s:19:"field_quartersecond";}', 63, 6, 'admin/content/node-type/portfolio/fields', 'admin/content/node-type/portfolio', 'Home quarter second', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_quartersecond', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"story";i:2;s:19:"field_quartersecond";}', 63, 6, 'admin/content/node-type/story/fields', 'admin/content/node-type/story', 'Home quarter second', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_quarterthird', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:4:"blog";i:2;s:18:"field_quarterthird";}', 63, 6, 'admin/content/node-type/blog/fields', 'admin/content/node-type/blog', 'Home quarter third', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_quarterthird', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:9:"portfolio";i:2;s:18:"field_quarterthird";}', 63, 6, 'admin/content/node-type/portfolio/fields', 'admin/content/node-type/portfolio', 'Home quarter third', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_quarterthird', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"story";i:2;s:18:"field_quarterthird";}', 63, 6, 'admin/content/node-type/story/fields', 'admin/content/node-type/story', 'Home quarter third', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_topfirst', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:4:"blog";i:2;s:14:"field_topfirst";}', 63, 6, 'admin/content/node-type/blog/fields', 'admin/content/node-type/blog', 'Home top first', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_image', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:4:"blog";i:2;s:11:"field_image";}', 63, 6, 'admin/content/node-type/blog/fields', 'admin/content/node-type/blog', 'Image', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/fields/field_image', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:4:"page";i:2;s:11:"field_image";}', 63, 6, 'admin/content/node-type/page/fields', 'admin/content/node-type/page', 'Image', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_image', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:9:"portfolio";i:2;s:11:"field_image";}', 63, 6, 'admin/content/node-type/portfolio/fields', 'admin/content/node-type/portfolio', 'Image', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_image', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"story";i:2;s:11:"field_image";}', 63, 6, 'admin/content/node-type/story/fields', 'admin/content/node-type/story', 'Image', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/menu/item/%/reset', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:23:"menu_reset_item_confirm";i:1;i:4;}', 61, 6, '', 'admin/build/menu/item/%/reset', 'Reset menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_slideshow', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:4:"blog";i:2;s:15:"field_slideshow";}', 63, 6, 'admin/content/node-type/blog/fields', 'admin/content/node-type/blog', 'Slide Show', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_slideshow', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:9:"portfolio";i:2;s:15:"field_slideshow";}', 63, 6, 'admin/content/node-type/portfolio/fields', 'admin/content/node-type/portfolio', 'Slide Show', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_slideshow', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"story";i:2;s:15:"field_slideshow";}', 63, 6, 'admin/content/node-type/story/fields', 'admin/content/node-type/story', 'Slide Show', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_style', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:4:"blog";i:2;s:11:"field_style";}', 63, 6, 'admin/content/node-type/blog/fields', 'admin/content/node-type/blog', 'Syle', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/fields/field_style', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:4:"page";i:2;s:11:"field_style";}', 63, 6, 'admin/content/node-type/page/fields', 'admin/content/node-type/page', 'Syle', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_style', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:9:"portfolio";i:2;s:11:"field_style";}', 63, 6, 'admin/content/node-type/portfolio/fields', 'admin/content/node-type/portfolio', 'Syle', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_style', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:23:"content_field_edit_form";i:1;s:5:"story";i:2;s:11:"field_style";}', 63, 6, 'admin/content/node-type/story/fields', 'admin/content/node-type/story', 'Syle', 't', '', 128, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/taxonomy/%/add/term', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_add_term_page', 'a:1:{i:0;i:3;}', 59, 6, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'Add term', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/%/add-display/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_add_display', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/add-display/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/%/%/%', 'a:3:{i:3;s:16:"views_ui_js_load";i:4;N;i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_ajax_form', 'a:3:{i:0;i:3;i:1;i:4;i:2;i:5;}', 56, 6, '', 'admin/build/views/%/%/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/%/analyze/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_analyze_view', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/analyze/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/%/details/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_edit_details', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/details/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/views/%/preview/%', 'a:2:{i:3;s:16:"views_ui_js_load";i:5;s:19:"views_ui_cache_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer views";}', 'views_ui_preview', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/views/%/preview/%', '', 't', '', 4, '', '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache/%/add/%', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:5;N;}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'imagecache_ui_action_add_page', 'a:2:{i:0;i:3;i:1;i:5;}', 58, 6, '', 'admin/build/imagecache/%/add/%', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:30:"Add !actionname to !presetname";i:1;i:3;i:2;i:5;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/build/imagecache/%/%/delete', 'a:2:{i:3;s:25:"imagecache_ui_preset_load";i:4;s:22:"imagecache_action_load";}', '', 'user_access', 'a:1:{i:0;s:21:"administer imagecache";}', 'drupal_get_form', 'a:3:{i:0;s:32:"imagecache_ui_action_delete_form";i:1;i:3;i:2;i:4;}', 57, 6, '', 'admin/build/imagecache/%/%/delete', '', 'imagecache_preset_title_callback', 'a:3:{i:0;s:37:"Delete !action for preset !presetname";i:1;i:3;i:2;i:4;}', 4, '', '', '', 0, 'sites/all/modules/imagecache/imagecache_ui.pages.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_image/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:4:"blog";i:2;s:11:"field_image";}', 127, 7, '', 'admin/content/node-type/blog/fields/field_image/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_quarterfirst/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:4:"blog";i:2;s:18:"field_quarterfirst";}', 127, 7, '', 'admin/content/node-type/blog/fields/field_quarterfirst/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_quarterfourth/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:4:"blog";i:2;s:19:"field_quarterfourth";}', 127, 7, '', 'admin/content/node-type/blog/fields/field_quarterfourth/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_quartersecond/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:4:"blog";i:2;s:19:"field_quartersecond";}', 127, 7, '', 'admin/content/node-type/blog/fields/field_quartersecond/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_quarterthird/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:4:"blog";i:2;s:18:"field_quarterthird";}', 127, 7, '', 'admin/content/node-type/blog/fields/field_quarterthird/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_slideshow/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:4:"blog";i:2;s:15:"field_slideshow";}', 127, 7, '', 'admin/content/node-type/blog/fields/field_slideshow/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_style/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:4:"blog";i:2;s:11:"field_style";}', 127, 7, '', 'admin/content/node-type/blog/fields/field_style/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/blog/fields/field_topfirst/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:4:"blog";i:2;s:14:"field_topfirst";}', 127, 7, '', 'admin/content/node-type/blog/fields/field_topfirst/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/fields/field_image/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:4:"page";i:2;s:11:"field_image";}', 127, 7, '', 'admin/content/node-type/page/fields/field_image/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/page/fields/field_style/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:4:"page";i:2;s:11:"field_style";}', 127, 7, '', 'admin/content/node-type/page/fields/field_style/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_image/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:9:"portfolio";i:2;s:11:"field_image";}', 127, 7, '', 'admin/content/node-type/portfolio/fields/field_image/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_quarterfirst/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:9:"portfolio";i:2;s:18:"field_quarterfirst";}', 127, 7, '', 'admin/content/node-type/portfolio/fields/field_quarterfirst/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_quarterfourth/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:9:"portfolio";i:2;s:19:"field_quarterfourth";}', 127, 7, '', 'admin/content/node-type/portfolio/fields/field_quarterfourth/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_quartersecond/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:9:"portfolio";i:2;s:19:"field_quartersecond";}', 127, 7, '', 'admin/content/node-type/portfolio/fields/field_quartersecond/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_quarterthird/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:9:"portfolio";i:2;s:18:"field_quarterthird";}', 127, 7, '', 'admin/content/node-type/portfolio/fields/field_quarterthird/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_slideshow/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:9:"portfolio";i:2;s:15:"field_slideshow";}', 127, 7, '', 'admin/content/node-type/portfolio/fields/field_slideshow/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/portfolio/fields/field_style/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:9:"portfolio";i:2;s:11:"field_style";}', 127, 7, '', 'admin/content/node-type/portfolio/fields/field_style/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_image/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"story";i:2;s:11:"field_image";}', 127, 7, '', 'admin/content/node-type/story/fields/field_image/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_quarterfirst/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"story";i:2;s:18:"field_quarterfirst";}', 127, 7, '', 'admin/content/node-type/story/fields/field_quarterfirst/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_quarterfourth/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"story";i:2;s:19:"field_quarterfourth";}', 127, 7, '', 'admin/content/node-type/story/fields/field_quarterfourth/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_quartersecond/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"story";i:2;s:19:"field_quartersecond";}', 127, 7, '', 'admin/content/node-type/story/fields/field_quartersecond/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_quarterthird/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"story";i:2;s:18:"field_quarterthird";}', 127, 7, '', 'admin/content/node-type/story/fields/field_quarterthird/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_slideshow/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"story";i:2;s:15:"field_slideshow";}', 127, 7, '', 'admin/content/node-type/story/fields/field_slideshow/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
INSERT INTO `menu_router` VALUES ('admin/content/node-type/story/fields/field_style/remove', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:3:{i:0;s:25:"content_field_remove_form";i:1;s:5:"story";i:2;s:11:"field_style";}', 127, 7, '', 'admin/content/node-type/story/fields/field_style/remove', 'Remove field', 't', '', 4, '', '', '', 0, 'sites/all/modules/cck/includes/content.admin.inc');
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `nid` int(10) unsigned NOT NULL auto_increment,
  `vid` int(10) unsigned NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  `language` varchar(12) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `uid` int(11) NOT NULL default '0',
  `status` int(11) NOT NULL default '1',
  `created` int(11) NOT NULL default '0',
  `changed` int(11) NOT NULL default '0',
  `comment` int(11) NOT NULL default '0',
  `promote` int(11) NOT NULL default '0',
  `moderate` int(11) NOT NULL default '0',
  `sticky` int(11) NOT NULL default '0',
  `tnid` int(10) unsigned NOT NULL default '0',
  `translate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_moderate` (`moderate`),
  KEY `node_promote_status` (`promote`,`status`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;
INSERT INTO `node` VALUES (1, 1, 'page', '', 'About Us', 1, 1, 1282308509, 1285619060, 0, 0, 0, 0, 0, 0);
INSERT INTO `node` VALUES (2, 2, 'page', '', 'Privacy Policy', 1, 1, 1282309794, 1282309794, 0, 0, 0, 0, 0, 0);
INSERT INTO `node` VALUES (3, 3, 'page', '', 'Terms and Conditions', 1, 1, 1282309842, 1282309842, 0, 0, 0, 0, 0, 0);
INSERT INTO `node` VALUES (4, 4, 'page', '', 'Environmental Policy', 1, 1, 1282309882, 1282309882, 0, 0, 0, 0, 0, 0);
INSERT INTO `node` VALUES (5, 5, 'page', '', 'Equal Opportunities Policy', 1, 1, 1282309912, 1282309912, 0, 0, 0, 0, 0, 0);
INSERT INTO `node` VALUES (6, 6, 'blog', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing', 1, 1, 1282315450, 1285589970, 2, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (7, 7, 'blog', '', 'Ut dolore magna aliqua', 1, 1, 1282315491, 1285590058, 2, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (8, 8, 'blog', '', 'Ut enim ad minim veniam', 1, 1, 1282315548, 1285590004, 2, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (9, 9, 'blog', '', 'Nisi ipsum dolor sit', 1, 1, 1282315627, 1285590030, 2, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (10, 10, 'blog', '', 'Nisi ut aliquip ex ea com', 1, 1, 1282333221, 1285576416, 2, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (11, 11, 'page', '', 'Customer Testimonials', 1, 1, 1282562505, 1282562505, 0, 0, 0, 0, 0, 0);
INSERT INTO `node` VALUES (12, 12, 'page', '', 'Our Workplace', 1, 1, 1282562549, 1282562549, 0, 0, 0, 0, 0, 0);
INSERT INTO `node` VALUES (13, 13, 'page', '', 'Network & Connectivity', 1, 1, 1282562693, 1282562693, 0, 0, 0, 0, 0, 0);
INSERT INTO `node` VALUES (14, 14, 'portfolio', '', 'Lorem ipsum dolor sit amet', 1, 1, 1282585636, 1285570162, 0, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (15, 15, 'portfolio', '', 'Nisi ut aliquip ex ea commodo', 1, 1, 1282585809, 1285590092, 0, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (16, 16, 'portfolio', '', 'Ut enim ad minim veniam', 1, 1, 1282585856, 1285590123, 0, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (17, 17, 'portfolio', '', 'Sed do eiusmod tempor incididunt', 1, 1, 1282585910, 1285590148, 0, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (18, 18, 'portfolio', '', 'Adipisicing elit 3dt labore', 1, 1, 1282585989, 1285590212, 0, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (19, 19, 'portfolio', '', 'Labore et dolore magna', 1, 1, 1282586060, 1285590232, 0, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (20, 20, 'portfolio', '', 'Tempor incididunt ut labore', 1, 1, 1282586168, 1285590254, 0, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (21, 21, 'portfolio', '', 'Ipsum dolor sit amet', 1, 1, 1282586286, 1285590293, 0, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (22, 22, 'page', '', 'Sprout brings new growth in ways you never thought possible', 1, 1, 1282667423, 1285571230, 0, 0, 0, 0, 0, 0);
INSERT INTO `node` VALUES (23, 23, 'page', '', 'Text Styles', 1, 1, 1282751175, 1285684968, 0, 0, 0, 0, 0, 0);
INSERT INTO `node` VALUES (24, 24, 'blog', '', 'Why people love Sprout', 1, 1, 1285576623, 1285579440, 2, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (25, 25, 'blog', '', 'Duis semper feugiat', 1, 1, 1285583773, 1285686524, 2, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (26, 26, 'story', '', 'Duis semper feugiat', 1, 1, 1285586786, 1285586786, 2, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (27, 27, 'story', '', 'Nunc cursus enim sit', 1, 1, 1285586863, 1285586863, 2, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES (28, 28, 'story', '', 'Cras commodo massa', 1, 1, 1285586941, 1285586941, 2, 1, 0, 0, 0, 0);
DROP TABLE IF EXISTS `node_access`;
CREATE TABLE `node_access` (
  `nid` int(10) unsigned NOT NULL default '0',
  `gid` int(10) unsigned NOT NULL default '0',
  `realm` varchar(255) NOT NULL default '',
  `grant_view` tinyint(3) unsigned NOT NULL default '0',
  `grant_update` tinyint(3) unsigned NOT NULL default '0',
  `grant_delete` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `node_access` VALUES (0, 0, 'all', 1, 0, 0);
DROP TABLE IF EXISTS `node_comment_statistics`;
CREATE TABLE `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL default '0',
  `last_comment_timestamp` int(11) NOT NULL default '0',
  `last_comment_name` varchar(60) default NULL,
  `last_comment_uid` int(11) NOT NULL default '0',
  `comment_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `node_comment_statistics` VALUES (1, 1282308509, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (2, 1282309794, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (3, 1282309842, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (4, 1282309882, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (5, 1282309912, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (6, 1282315450, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (7, 1282315491, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (8, 1282315548, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (9, 1282315627, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (10, 1282569938, '', 1, 5);
INSERT INTO `node_comment_statistics` VALUES (11, 1282562505, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (12, 1282562549, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (13, 1282562693, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (14, 1282585636, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (15, 1282585809, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (16, 1282585856, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (17, 1282585910, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (18, 1282585989, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (19, 1282586060, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (20, 1282586168, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (21, 1282586286, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (22, 1282667423, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (23, 1282751175, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (24, 1285576623, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (25, 1285583773, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (26, 1285586786, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (27, 1285586863, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES (28, 1285586941, NULL, 1, 0);
DROP TABLE IF EXISTS `node_counter`;
CREATE TABLE `node_counter` (
  `nid` int(11) NOT NULL default '0',
  `totalcount` bigint(20) unsigned NOT NULL default '0',
  `daycount` mediumint(8) unsigned NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `node_revisions`;
CREATE TABLE `node_revisions` (
  `nid` int(10) unsigned NOT NULL default '0',
  `vid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL default '0',
  `format` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;
INSERT INTO `node_revisions` VALUES (1, 1, 1, 'About Us', 'Sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet. Sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet. Sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet. Sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper. Sed congue blandit nisi eget ultrices. Cras commodo, massa nec dictum vehicula, velit tortor feugiat quam, et rutrum erat velit ut sapien. Mauris velit tortor, imperdiet et faucibus id, iaculis a quam. Ut leo sem, consectetur quis imperdiet vel, pretium sit amet mi. In quam orci, dignissim non elementum vel, commodo sed nunc. Pellentesque ante sapien, aliquam nec eleifend et, pellentesque at est. ', 'Sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet. Sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet consectetu adipisicing elit, sit amet.', '', 1285619060, 1);
INSERT INTO `node_revisions` VALUES (2, 2, 1, 'Privacy Policy', 'sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.', 'sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r', '', 1282309794, 1);
INSERT INTO `node_revisions` VALUES (3, 3, 1, 'Terms and Conditions', 'sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.', 'sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r', '', 1282309842, 1);
INSERT INTO `node_revisions` VALUES (4, 4, 1, 'Environmental Policy', 'sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.', 'sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r', '', 1282309882, 1);
INSERT INTO `node_revisions` VALUES (5, 5, 1, 'Equal Opportunities Policy', 'sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.', 'sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r\nsit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet, consectetur adipisicing consectetur adipisicing elit, sit amet, consectetu adipisicing elit, sit amet.\r', '', 1282309912, 1);
INSERT INTO `node_revisions` VALUES (6, 6, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r', '', 1285589970, 1);
INSERT INTO `node_revisions` VALUES (7, 7, 1, 'Ut dolore magna aliqua', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r', '', 1285590058, 1);
INSERT INTO `node_revisions` VALUES (8, 8, 1, 'Ut enim ad minim veniam', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r', '', 1285590004, 1);
INSERT INTO `node_revisions` VALUES (9, 9, 1, 'Nisi ipsum dolor sit', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r', '', 1285590030, 1);
INSERT INTO `node_revisions` VALUES (22, 22, 1, 'Sprout brings new growth in ways you never thought possible', '<p>When someone puts all their passion into a theme you can really tell the difference. Sprout has clean and valid code, is well commented, and easy to use. Sprout is the perfect solution for your website.</p>\r\n<div id="action">\r\n<a class="actionbutton" href="#"></a>\r\n<a class="infobutton" href="#"></a>\r\n</div>', '<p>When someone puts all their passion into a theme you can really tell the difference. Sprout has clean and valid code, is well commented, and easy to use. Sprout is the perfect solution for your website.</p>\r\n<div id="action">\r\n<a class="actionbutton" href="#"></a>\r\n<a class="infobutton" href="#"></a>\r\n</div>', '', 1285571230, 2);
INSERT INTO `node_revisions` VALUES (24, 24, 1, 'Why people love Sprout', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard. Dummy text ever since the 1500s, when an unknown. Printer took a galley of type and scrambled it to make.</p><p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages and stuff. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour.</p>', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard. Dummy text ever since the 1500s, when an unknown. Printer took a galley of type and scrambled it to make.</p><p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages and stuff. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour.</p>', '', 1285579440, 2);
INSERT INTO `node_revisions` VALUES (10, 10, 1, 'Nisi ut aliquip ex ea com', 'Nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, 3dt labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, 3dt labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, 3dt labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, 3dt labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, 3dt labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipisicing elit, 3dt labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r', '', 1285576416, 1);
INSERT INTO `node_revisions` VALUES (11, 11, 1, 'Customer Testimonials', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r', '', 1282562505, 1);
INSERT INTO `node_revisions` VALUES (12, 12, 1, 'Our Workplace', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r', '', 1282562549, 1);
INSERT INTO `node_revisions` VALUES (13, 13, 1, 'Network & Connectivity', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\r', '', 1282562693, 1);
INSERT INTO `node_revisions` VALUES (14, 14, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '', 1285570162, 1);
INSERT INTO `node_revisions` VALUES (15, 15, 1, 'Nisi ut aliquip ex ea commodo', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '', 1285590092, 1);
INSERT INTO `node_revisions` VALUES (16, 16, 1, 'Ut enim ad minim veniam', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '', 1285590123, 1);
INSERT INTO `node_revisions` VALUES (17, 17, 1, 'Sed do eiusmod tempor incididunt', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '', 1285590148, 1);
INSERT INTO `node_revisions` VALUES (18, 18, 1, 'Adipisicing elit 3dt labore', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '', 1285590212, 1);
INSERT INTO `node_revisions` VALUES (19, 19, 1, 'Labore et dolore magna', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '', 1285590232, 1);
INSERT INTO `node_revisions` VALUES (20, 20, 1, 'Tempor incididunt ut labore', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '', 1285590254, 1);
INSERT INTO `node_revisions` VALUES (21, 21, 1, 'Ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nNisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '', 1285590293, 1);
INSERT INTO `node_revisions` VALUES (23, 23, 1, 'Text Styles', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy.</p>\r\n            \r\n            <h1>h1 header title</h1>\r\n            <h2>h2 header title</h2>\r\n            <h3>h3 header title</h3>\r\n            <h4>h4 header title</h4>\r\n            <h5>h5 header title</h5>\r\n            <h6>h6 header title</h6>\r\n            <br />\r\n            \r\n            <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy.</p>\r\n            \r\n            <h4>Blockquote</h4>\r\n            <blockquote><p>A long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English.</p></blockquote>\r\n            \r\n            <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy.</p>\r\n            \r\n            <h4>List Styles</h4>\r\n            <ul>\r\n            	<li>Lorem ipsum dolor sit amet</li>\r\n                <li>Lorem ipsum dolor sit amet</li>\r\n                <li>Lorem ipsum dolor sit amet</li>\r\n                <li>Lorem ipsum dolor sit amet</li>\r\n                <li>Lorem ipsum dolor sit amet</li>\r\n            </ul> \r\n            \r\n            <ol>\r\n            	<li><p>Lorem ipsum dolor sit amet</p></li>\r\n                <li><p>Lorem ipsum dolor sit amet</p></li>\r\n                <li><p>Lorem ipsum dolor sit amet</p></li>\r\n                <li><p>Lorem ipsum dolor sit amet</p></li>\r\n                <li><p>Lorem ipsum dolor sit amet</p></li>\r\n            </ol>    \r\n            \r\n            <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy.</p>            \r\n            \r\n            <h4>Pre Formatted Text</h4>\r\n<pre>\r\n.features-1 {\r\n    width: 235px;\r\n    padding: 0 15px 15px 0;\r\n    float: left;\r\n    border-right: 1px solid #f6f6f6;\r\n    border-bottom: 1px solid #f6f6f6;\r\n    background: url(''../../style/images/monitor.png'') 0 0 no-repeat;\r\n}\r\n</pre>\r\n\r\n<h4>This is a table</h4>\r\n<p>I do not recommend eating food on this one.</p>\r\n<table border="0" cellpadding="0" cellspacing="0">\r\n    <thead>\r\n        <tr>\r\n            <th>Heading</th>\r\n            <th>Heading</th>\r\n            <th>Heading</th>\r\n            <th>Heading</th>\r\n            <th>Heading</th>\r\n            <th>Heading</th>\r\n            <th>Heading</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n        </tr>\r\n        <tr class="alt">\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n        </tr>\r\n        <tr>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n        </tr>\r\n            <tr class="alt">\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n            <td>table data</td>\r\n        </tr>\r\n    </tbody>\r\n</table>', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy.</p>', '', 1285684968, 2);
INSERT INTO `node_revisions` VALUES (25, 25, 1, 'Duis semper feugiat', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper. Sed congue blandit nisi eget ultrices. Cras commodo, massa nec dictum vehicula, velit tortor feugiat quam, et rutrum erat velit ut sapien. Mauris velit tortor, imperdiet et faucibus id, iaculis a quam. Ut leo sem, consectetur quis imperdiet vel, pretium sit amet mi. In quam orci, dignissim non elementum vel, commodo sed nunc. Pellentesque ante sapien, aliquam nec eleifend et, pellentesque at est.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper. Sed congue blandit nisi eget ultrices. Cras commodo, massa nec dictum vehicula, velit tortor feugiat quam, et rutrum erat velit ut sapien. Mauris velit tortor, imperdiet et faucibus id, iaculis a quam. Ut leo sem, consectetur quis imperdiet vel, pretium sit amet mi. In quam orci, dignissim non elementum vel, commodo sed nunc. Pellentesque ante sapien, aliquam nec eleifend et, pellentesque at est. ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper.', '', 1285686524, 1);
INSERT INTO `node_revisions` VALUES (26, 26, 1, 'Duis semper feugiat', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper. Sed congue blandit nisi eget ultrices. Cras commodo, massa nec dictum vehicula, velit tortor feugiat quam, et rutrum erat velit ut sapien. Mauris velit tortor, imperdiet et faucibus id, iaculis a quam. Ut leo sem, consectetur quis imperdiet vel, pretium sit amet mi. In quam orci, dignissim non elementum vel, commodo sed nunc. Pellentesque ante sapien, aliquam nec eleifend et, pellentesque at est.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper. Sed congue blandit nisi eget ultrices. Cras commodo, massa nec dictum vehicula, velit tortor feugiat quam, et rutrum erat velit ut sapien. Mauris velit tortor, imperdiet et faucibus id, iaculis a quam. Ut leo sem, consectetur quis imperdiet vel, pretium sit amet mi. In quam orci, dignissim non elementum vel, commodo sed nunc. Pellentesque ante sapien, aliquam nec eleifend et, pellentesque at est.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper.', '', 1285586786, 1);
INSERT INTO `node_revisions` VALUES (27, 27, 1, 'Nunc cursus enim sit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper. Sed congue blandit nisi eget ultrices. Cras commodo, massa nec dictum vehicula, velit tortor feugiat quam, et rutrum erat velit ut sapien. Mauris velit tortor, imperdiet et faucibus id, iaculis a quam. Ut leo sem, consectetur quis imperdiet vel, pretium sit amet mi. In quam orci, dignissim non elementum vel, commodo sed nunc. Pellentesque ante sapien, aliquam nec eleifend et, pellentesque at est.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper. Sed congue blandit nisi eget ultrices. Cras commodo, massa nec dictum vehicula, velit tortor feugiat quam, et rutrum erat velit ut sapien. Mauris velit tortor, imperdiet et faucibus id, iaculis a quam. Ut leo sem, consectetur quis imperdiet vel, pretium sit amet mi. In quam orci, dignissim non elementum vel, commodo sed nunc. Pellentesque ante sapien, aliquam nec eleifend et, pellentesque at est.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper.', '', 1285586863, 1);
INSERT INTO `node_revisions` VALUES (28, 28, 1, 'Cras commodo massa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper. Sed congue blandit nisi eget ultrices. Cras commodo, massa nec dictum vehicula, velit tortor feugiat quam, et rutrum erat velit ut sapien. Mauris velit tortor, imperdiet et faucibus id, iaculis a quam. Ut leo sem, consectetur quis imperdiet vel, pretium sit amet mi. In quam orci, dignissim non elementum vel, commodo sed nunc. Pellentesque ante sapien, aliquam nec eleifend et, pellentesque at est.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper. Sed congue blandit nisi eget ultrices. Cras commodo, massa nec dictum vehicula, velit tortor feugiat quam, et rutrum erat velit ut sapien. Mauris velit tortor, imperdiet et faucibus id, iaculis a quam. Ut leo sem, consectetur quis imperdiet vel, pretium sit amet mi. In quam orci, dignissim non elementum vel, commodo sed nunc. Pellentesque ante sapien, aliquam nec eleifend et, pellentesque at est.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies, mauris a sollicitudin ornare, risus dolor gravida dolor, nec semper odio odio in ligula. Duis semper feugiat nisl et eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer mauris sem, tempus ultrices pharetra eu, pellentesque nec purus. Curabitur mollis congue scelerisque. Nam tristique fermentum mi id pellentesque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis purus sed turpis mattis ullamcorper. Nunc cursus enim sit amet erat suscipit id ultrices velit ullamcorper.', '', 1285586941, 1);
DROP TABLE IF EXISTS `node_type`;
CREATE TABLE `node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL default '',
  `has_body` tinyint(3) unsigned NOT NULL,
  `body_label` varchar(255) NOT NULL default '',
  `min_word_count` smallint(5) unsigned NOT NULL,
  `custom` tinyint(4) NOT NULL default '0',
  `modified` tinyint(4) NOT NULL default '0',
  `locked` tinyint(4) NOT NULL default '0',
  `orig_type` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `node_type` VALUES ('page', 'Page', 'node', 'A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, 'page');
INSERT INTO `node_type` VALUES ('story', 'Story', 'node', 'A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, 'story');
INSERT INTO `node_type` VALUES ('blog', 'Blog entry', 'blog', 'A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.', '', 1, 'Title', 1, 'Body', 0, 0, 1, 1, 'blog');
INSERT INTO `node_type` VALUES ('portfolio', 'Portfolio', 'node', '', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, '');
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `pid` int(11) NOT NULL auto_increment,
  `rid` int(10) unsigned NOT NULL default '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;
INSERT INTO `permission` VALUES (7, 1, 'access comments, post comments, post comments without approval, access site-wide contact form, access content, search content, subscribe to newsletters', 0);
INSERT INTO `permission` VALUES (8, 2, 'access comments, post comments, post comments without approval, access site-wide contact form, access content, search content, subscribe to newsletters', 0);
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;
INSERT INTO `role` VALUES (1, 'anonymous user');
INSERT INTO `role` VALUES (2, 'authenticated user');
DROP TABLE IF EXISTS `search_dataset`;
CREATE TABLE `search_dataset` (
  `sid` int(10) unsigned NOT NULL default '0',
  `type` varchar(16) default NULL,
  `data` longtext NOT NULL,
  `reindex` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `sid_type` (`sid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `search_dataset` VALUES (1, 'node', ' about us sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetu adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetu adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetu adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetu adipisicing elit sit amet consectetu adipisicing elit sit amet  ', 1285619060);
INSERT INTO `search_dataset` VALUES (2, 'node', ' privacy policy sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet  ', 0);
INSERT INTO `search_dataset` VALUES (3, 'node', ' terms and conditions sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet  ', 0);
INSERT INTO `search_dataset` VALUES (4, 'node', ' environmental policy sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet  ', 0);
INSERT INTO `search_dataset` VALUES (5, 'node', ' equal opportunities policy sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet  ', 0);
INSERT INTO `search_dataset` VALUES (6, 'node', ' lorem ipsum dolor sit amet consectetur adipisicing lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam  ', 1285589970);
INSERT INTO `search_dataset` VALUES (7, 'node', ' ut dolore magna aliqua lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam n n n n home quarter fourth  ', 1285590058);
INSERT INTO `search_dataset` VALUES (8, 'node', ' ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam n home quarter first n n n  ', 1285590004);
INSERT INTO `search_dataset` VALUES (9, 'node', ' nisi ipsum dolor sit lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat n n n home quarter third n  ', 1285590030);
INSERT INTO `search_dataset` VALUES (10, 'node', ' nisi ut aliquip ex ea commodo nisi ut aliquip ex ea commodo consequat lorem ipsum dolor sit amet consectetur adipisicing elit 3dt labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequat lorem ipsum dolor sit amet consectetur adipisicing elit 3dt labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequat lorem ipsum dolor sit amet consectetur adipisicing elit 3dt labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequat lorem ipsum dolor sit amet consectetur adipisicing elit 3dt labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat n n home quarter second n n lorem ipsum dolor sit amet  lorem ipsum dolor sit amet consectetur adipisicing elit 3dt labore et dolore magna aliqua ut enim ad minim veniam quis ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit ut labore et dolore magna aliqua nisi ut aliquip ex ea commodo nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit ut labore et dolore magna aliqua nisi ut aliquip ex ea commodo nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit ut labore et dolore magna aliqua  ', 1285576416);
INSERT INTO `search_dataset` VALUES (11, 'node', ' customer testimonials lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam  ', 0);
INSERT INTO `search_dataset` VALUES (12, 'node', ' our workplace lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam  ', 0);
INSERT INTO `search_dataset` VALUES (13, 'node', ' network connectivity lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam  ', 0);
INSERT INTO `search_dataset` VALUES (14, 'node', ' lorem ipsum dolor sit amet lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat slide show n n n n  photography  ', 1285570162);
INSERT INTO `search_dataset` VALUES (15, 'node', ' nisi ut aliquip ex ea commodo lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat slide show n n n n  daily life  ', 1285590092);
INSERT INTO `search_dataset` VALUES (16, 'node', ' ut enim ad minim veniam lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat slide show n n n n  inspiration  ', 1285590123);
INSERT INTO `search_dataset` VALUES (17, 'node', ' sed do eiusmod tempor incididunt lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat slide show n n n n  office pranksters  ', 1285590148);
INSERT INTO `search_dataset` VALUES (18, 'node', ' adipisicing elit 3dt labore lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat slide show n n n n  photography  ', 1285590212);
INSERT INTO `search_dataset` VALUES (19, 'node', ' labore et dolore magna lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat slide show n n n n  daily life  ', 1285590232);
INSERT INTO `search_dataset` VALUES (20, 'node', ' tempor incididunt ut labore lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat slide show n n n n  inspiration  ', 1285590254);
INSERT INTO `search_dataset` VALUES (21, 'node', ' ipsum dolor sit amet lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat nisi ut aliquip ex ea commodo consequatlorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat slide show n n n n  office pranksters  ', 1285590293);
INSERT INTO `search_dataset` VALUES (22, 'node', ' welcome to doubtfire  website design   tutorials   business sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetur adipisicing consectetur adipisicing elit sit amet consectetu adipisicing elit sit amet consectetu adipisicing elit sit amet consectetu adipisicing elit sit amet get a quote get in contact ', 1285571230);
INSERT INTO `search_dataset` VALUES (23, 'node', ' text styles it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a moreorless normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy h1 header title h2 header title h3 header title h4 header title h5 header title h6 header title it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a moreorless normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy blockquote a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a moreorless normal distribution of letters as opposed to using content here content here making it look like readable english it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a moreorless normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy list styles lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout the point of using lorem ipsum is that it has a moreorless normal distribution of letters as opposed to using content here content here making it look like readable english many desktop publishing packages and web page editors now use lorem ipsum as their default model text and a search for lorem ipsum will uncover many web sites still in their infancy pre formatted text features1 width 235px padding 0 15px 15px 0 float left borderright 1px solid f6f6f6 borderbottom 1px solid f6f6f6 background url style images monitorpng 0 0 norepeat  this is a table i do not recommend eating food on this one heading heading heading heading heading heading heading table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data table data  ', 1285684968);
DROP TABLE IF EXISTS `search_index`;
CREATE TABLE `search_index` (
  `word` varchar(50) NOT NULL default '',
  `sid` int(10) unsigned NOT NULL default '0',
  `type` varchar(16) default NULL,
  `score` float default NULL,
  UNIQUE KEY `word_sid_type` (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `search_index` VALUES ('about', 1, 'node', 26);
INSERT INTO `search_index` VALUES ('sit', 1, 'node', 28);
INSERT INTO `search_index` VALUES ('amet', 1, 'node', 28);
INSERT INTO `search_index` VALUES ('consectetur', 1, 'node', 16);
INSERT INTO `search_index` VALUES ('adipisicing', 1, 'node', 32);
INSERT INTO `search_index` VALUES ('elit', 1, 'node', 24);
INSERT INTO `search_index` VALUES ('consectetu', 1, 'node', 16);
INSERT INTO `search_index` VALUES ('privacy', 2, 'node', 26);
INSERT INTO `search_index` VALUES ('policy', 2, 'node', 26);
INSERT INTO `search_index` VALUES ('sit', 2, 'node', 15);
INSERT INTO `search_index` VALUES ('amet', 2, 'node', 15);
INSERT INTO `search_index` VALUES ('consectetur', 2, 'node', 12);
INSERT INTO `search_index` VALUES ('adipisicing', 2, 'node', 18);
INSERT INTO `search_index` VALUES ('elit', 2, 'node', 12);
INSERT INTO `search_index` VALUES ('consectetu', 2, 'node', 6);
INSERT INTO `search_index` VALUES ('terms', 3, 'node', 26);
INSERT INTO `search_index` VALUES ('and', 3, 'node', 26);
INSERT INTO `search_index` VALUES ('conditions', 3, 'node', 26);
INSERT INTO `search_index` VALUES ('sit', 3, 'node', 15);
INSERT INTO `search_index` VALUES ('amet', 3, 'node', 15);
INSERT INTO `search_index` VALUES ('consectetur', 3, 'node', 12);
INSERT INTO `search_index` VALUES ('adipisicing', 3, 'node', 18);
INSERT INTO `search_index` VALUES ('elit', 3, 'node', 12);
INSERT INTO `search_index` VALUES ('consectetu', 3, 'node', 6);
INSERT INTO `search_index` VALUES ('environmental', 4, 'node', 26);
INSERT INTO `search_index` VALUES ('policy', 4, 'node', 26);
INSERT INTO `search_index` VALUES ('sit', 4, 'node', 15);
INSERT INTO `search_index` VALUES ('amet', 4, 'node', 15);
INSERT INTO `search_index` VALUES ('consectetur', 4, 'node', 12);
INSERT INTO `search_index` VALUES ('adipisicing', 4, 'node', 18);
INSERT INTO `search_index` VALUES ('elit', 4, 'node', 12);
INSERT INTO `search_index` VALUES ('consectetu', 4, 'node', 6);
INSERT INTO `search_index` VALUES ('equal', 5, 'node', 26);
INSERT INTO `search_index` VALUES ('opportunities', 5, 'node', 26);
INSERT INTO `search_index` VALUES ('policy', 5, 'node', 26);
INSERT INTO `search_index` VALUES ('sit', 5, 'node', 15);
INSERT INTO `search_index` VALUES ('amet', 5, 'node', 15);
INSERT INTO `search_index` VALUES ('consectetur', 5, 'node', 12);
INSERT INTO `search_index` VALUES ('adipisicing', 5, 'node', 18);
INSERT INTO `search_index` VALUES ('elit', 5, 'node', 12);
INSERT INTO `search_index` VALUES ('consectetu', 5, 'node', 6);
INSERT INTO `search_index` VALUES ('lorem', 6, 'node', 34);
INSERT INTO `search_index` VALUES ('ipsum', 6, 'node', 34);
INSERT INTO `search_index` VALUES ('dolor', 6, 'node', 34);
INSERT INTO `search_index` VALUES ('sit', 6, 'node', 34);
INSERT INTO `search_index` VALUES ('amet', 6, 'node', 34);
INSERT INTO `search_index` VALUES ('consectetur', 6, 'node', 34);
INSERT INTO `search_index` VALUES ('adipisicing', 6, 'node', 34);
INSERT INTO `search_index` VALUES ('elit', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('sed', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('eiusmod', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('tempor', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('incididunt', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('labore', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('dolore', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('magna', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('aliqua', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('enim', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('minim', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('veniam', 6, 'node', 8);
INSERT INTO `search_index` VALUES ('dolore', 7, 'node', 34);
INSERT INTO `search_index` VALUES ('magna', 7, 'node', 34);
INSERT INTO `search_index` VALUES ('aliqua', 7, 'node', 34);
INSERT INTO `search_index` VALUES ('lorem', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('ipsum', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('dolor', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('sit', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('amet', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('consectetur', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('adipisicing', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('elit', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('sed', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('eiusmod', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('tempor', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('incididunt', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('labore', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('enim', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('minim', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('veniam', 7, 'node', 8);
INSERT INTO `search_index` VALUES ('home', 7, 'node', 1);
INSERT INTO `search_index` VALUES ('quarter', 7, 'node', 1);
INSERT INTO `search_index` VALUES ('fourth', 7, 'node', 1);
INSERT INTO `search_index` VALUES ('enim', 8, 'node', 36);
INSERT INTO `search_index` VALUES ('minim', 8, 'node', 36);
INSERT INTO `search_index` VALUES ('veniam', 8, 'node', 36);
INSERT INTO `search_index` VALUES ('lorem', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('ipsum', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('dolor', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('sit', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('amet', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('consectetur', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('adipisicing', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('elit', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('sed', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('eiusmod', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('tempor', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('incididunt', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('labore', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('dolore', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('magna', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('aliqua', 8, 'node', 10);
INSERT INTO `search_index` VALUES ('home', 8, 'node', 1);
INSERT INTO `search_index` VALUES ('quarter', 8, 'node', 1);
INSERT INTO `search_index` VALUES ('first', 8, 'node', 1);
INSERT INTO `search_index` VALUES ('nisi', 9, 'node', 31);
INSERT INTO `search_index` VALUES ('ipsum', 9, 'node', 29);
INSERT INTO `search_index` VALUES ('dolor', 9, 'node', 29);
INSERT INTO `search_index` VALUES ('sit', 9, 'node', 29);
INSERT INTO `search_index` VALUES ('lorem', 9, 'node', 1);
INSERT INTO `search_index` VALUES ('amet', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('consectetur', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('adipisicing', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('elit', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('sed', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('eiusmod', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('tempor', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('incididunt', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('labore', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('dolore', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('magna', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('aliqua', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('enim', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('minim', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('veniam', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('quis', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('nostrud', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('exercitation', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('ullamco', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('laboris', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('aliquip', 9, 'node', 5);
INSERT INTO `search_index` VALUES ('commodo', 9, 'node', 5);
INSERT INTO `search_index` VALUES ('consequat', 9, 'node', 3);
INSERT INTO `search_index` VALUES ('consequatlorem', 9, 'node', 2);
INSERT INTO `search_index` VALUES ('home', 9, 'node', 1);
INSERT INTO `search_index` VALUES ('quarter', 9, 'node', 1);
INSERT INTO `search_index` VALUES ('third', 9, 'node', 1);
INSERT INTO `search_index` VALUES ('nisi', 10, 'node', 95);
INSERT INTO `search_index` VALUES ('aliquip', 10, 'node', 95);
INSERT INTO `search_index` VALUES ('commodo', 10, 'node', 95);
INSERT INTO `search_index` VALUES ('consequat', 10, 'node', 9);
INSERT INTO `search_index` VALUES ('lorem', 10, 'node', 24);
INSERT INTO `search_index` VALUES ('ipsum', 10, 'node', 27);
INSERT INTO `search_index` VALUES ('dolor', 10, 'node', 27);
INSERT INTO `search_index` VALUES ('sit', 10, 'node', 27);
INSERT INTO `search_index` VALUES ('amet', 10, 'node', 27);
INSERT INTO `search_index` VALUES ('consectetur', 10, 'node', 8);
INSERT INTO `search_index` VALUES ('adipisicing', 10, 'node', 8);
INSERT INTO `search_index` VALUES ('elit', 10, 'node', 8);
INSERT INTO `search_index` VALUES ('3dt', 10, 'node', 5);
INSERT INTO `search_index` VALUES ('labore', 10, 'node', 8);
INSERT INTO `search_index` VALUES ('dolore', 10, 'node', 8);
INSERT INTO `search_index` VALUES ('magna', 10, 'node', 8);
INSERT INTO `search_index` VALUES ('aliqua', 10, 'node', 8);
INSERT INTO `search_index` VALUES ('enim', 10, 'node', 24);
INSERT INTO `search_index` VALUES ('minim', 10, 'node', 24);
INSERT INTO `search_index` VALUES ('veniam', 10, 'node', 24);
INSERT INTO `search_index` VALUES ('quis', 10, 'node', 24);
INSERT INTO `search_index` VALUES ('nostrud', 10, 'node', 5);
INSERT INTO `search_index` VALUES ('exercitation', 10, 'node', 5);
INSERT INTO `search_index` VALUES ('ullamco', 10, 'node', 5);
INSERT INTO `search_index` VALUES ('laboris', 10, 'node', 5);
INSERT INTO `search_index` VALUES ('home', 10, 'node', 1);
INSERT INTO `search_index` VALUES ('quarter', 10, 'node', 1);
INSERT INTO `search_index` VALUES ('second', 10, 'node', 1);
INSERT INTO `search_index` VALUES ('consequatlorem', 10, 'node', 3);
INSERT INTO `search_index` VALUES ('customer', 11, 'node', 26);
INSERT INTO `search_index` VALUES ('testimonials', 11, 'node', 26);
INSERT INTO `search_index` VALUES ('lorem', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('ipsum', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('dolor', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('sit', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('amet', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('consectetur', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('adipisicing', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('elit', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('sed', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('eiusmod', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('tempor', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('incididunt', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('labore', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('dolore', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('magna', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('aliqua', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('enim', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('minim', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('veniam', 11, 'node', 6);
INSERT INTO `search_index` VALUES ('our', 12, 'node', 26);
INSERT INTO `search_index` VALUES ('workplace', 12, 'node', 26);
INSERT INTO `search_index` VALUES ('lorem', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('ipsum', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('dolor', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('sit', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('amet', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('consectetur', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('adipisicing', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('elit', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('sed', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('eiusmod', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('tempor', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('incididunt', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('labore', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('dolore', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('magna', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('aliqua', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('enim', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('minim', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('veniam', 12, 'node', 12);
INSERT INTO `search_index` VALUES ('network', 13, 'node', 26);
INSERT INTO `search_index` VALUES ('connectivity', 13, 'node', 26);
INSERT INTO `search_index` VALUES ('lorem', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('ipsum', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('dolor', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('sit', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('amet', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('consectetur', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('adipisicing', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('elit', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('sed', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('eiusmod', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('tempor', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('incididunt', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('labore', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('dolore', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('magna', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('aliqua', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('enim', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('minim', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('veniam', 13, 'node', 8);
INSERT INTO `search_index` VALUES ('lorem', 14, 'node', 27);
INSERT INTO `search_index` VALUES ('ipsum', 14, 'node', 28);
INSERT INTO `search_index` VALUES ('dolor', 14, 'node', 28);
INSERT INTO `search_index` VALUES ('sit', 14, 'node', 28);
INSERT INTO `search_index` VALUES ('amet', 14, 'node', 28);
INSERT INTO `search_index` VALUES ('consectetur', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('adipisicing', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('elit', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('sed', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('eiusmod', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('tempor', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('incididunt', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('labore', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('dolore', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('magna', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('aliqua', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('enim', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('minim', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('veniam', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('quis', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('nostrud', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('exercitation', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('ullamco', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('laboris', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('nisi', 14, 'node', 3);
INSERT INTO `search_index` VALUES ('aliquip', 14, 'node', 3);
INSERT INTO `search_index` VALUES ('commodo', 14, 'node', 3);
INSERT INTO `search_index` VALUES ('consequat', 14, 'node', 2);
INSERT INTO `search_index` VALUES ('consequatlorem', 14, 'node', 1);
INSERT INTO `search_index` VALUES ('slide', 14, 'node', 1);
INSERT INTO `search_index` VALUES ('show', 14, 'node', 1);
INSERT INTO `search_index` VALUES ('photography', 14, 'node', 4);
INSERT INTO `search_index` VALUES ('nisi', 15, 'node', 29);
INSERT INTO `search_index` VALUES ('aliquip', 15, 'node', 29);
INSERT INTO `search_index` VALUES ('commodo', 15, 'node', 29);
INSERT INTO `search_index` VALUES ('lorem', 15, 'node', 1);
INSERT INTO `search_index` VALUES ('ipsum', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('dolor', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('sit', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('amet', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('consectetur', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('adipisicing', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('elit', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('sed', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('eiusmod', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('tempor', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('incididunt', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('labore', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('dolore', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('magna', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('aliqua', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('enim', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('minim', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('veniam', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('quis', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('nostrud', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('exercitation', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('ullamco', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('laboris', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('consequat', 15, 'node', 2);
INSERT INTO `search_index` VALUES ('consequatlorem', 15, 'node', 1);
INSERT INTO `search_index` VALUES ('slide', 15, 'node', 1);
INSERT INTO `search_index` VALUES ('show', 15, 'node', 1);
INSERT INTO `search_index` VALUES ('daily', 15, 'node', 4);
INSERT INTO `search_index` VALUES ('life', 15, 'node', 4);
INSERT INTO `search_index` VALUES ('enim', 16, 'node', 28);
INSERT INTO `search_index` VALUES ('minim', 16, 'node', 28);
INSERT INTO `search_index` VALUES ('veniam', 16, 'node', 28);
INSERT INTO `search_index` VALUES ('lorem', 16, 'node', 1);
INSERT INTO `search_index` VALUES ('ipsum', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('dolor', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('sit', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('amet', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('consectetur', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('adipisicing', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('elit', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('sed', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('eiusmod', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('tempor', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('incididunt', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('labore', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('dolore', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('magna', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('aliqua', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('quis', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('nostrud', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('exercitation', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('ullamco', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('laboris', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('nisi', 16, 'node', 3);
INSERT INTO `search_index` VALUES ('aliquip', 16, 'node', 3);
INSERT INTO `search_index` VALUES ('commodo', 16, 'node', 3);
INSERT INTO `search_index` VALUES ('consequat', 16, 'node', 2);
INSERT INTO `search_index` VALUES ('consequatlorem', 16, 'node', 1);
INSERT INTO `search_index` VALUES ('slide', 16, 'node', 1);
INSERT INTO `search_index` VALUES ('show', 16, 'node', 1);
INSERT INTO `search_index` VALUES ('inspiration', 16, 'node', 4);
INSERT INTO `search_index` VALUES ('sed', 17, 'node', 28);
INSERT INTO `search_index` VALUES ('eiusmod', 17, 'node', 28);
INSERT INTO `search_index` VALUES ('tempor', 17, 'node', 28);
INSERT INTO `search_index` VALUES ('incididunt', 17, 'node', 28);
INSERT INTO `search_index` VALUES ('lorem', 17, 'node', 1);
INSERT INTO `search_index` VALUES ('ipsum', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('dolor', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('sit', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('amet', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('consectetur', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('adipisicing', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('elit', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('labore', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('dolore', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('magna', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('aliqua', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('enim', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('minim', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('veniam', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('quis', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('nostrud', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('exercitation', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('ullamco', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('laboris', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('nisi', 17, 'node', 3);
INSERT INTO `search_index` VALUES ('aliquip', 17, 'node', 3);
INSERT INTO `search_index` VALUES ('commodo', 17, 'node', 3);
INSERT INTO `search_index` VALUES ('consequat', 17, 'node', 2);
INSERT INTO `search_index` VALUES ('consequatlorem', 17, 'node', 1);
INSERT INTO `search_index` VALUES ('slide', 17, 'node', 1);
INSERT INTO `search_index` VALUES ('show', 17, 'node', 1);
INSERT INTO `search_index` VALUES ('office', 17, 'node', 4);
INSERT INTO `search_index` VALUES ('pranksters', 17, 'node', 4);
INSERT INTO `search_index` VALUES ('adipisicing', 18, 'node', 28);
INSERT INTO `search_index` VALUES ('elit', 18, 'node', 28);
INSERT INTO `search_index` VALUES ('3dt', 18, 'node', 26);
INSERT INTO `search_index` VALUES ('labore', 18, 'node', 28);
INSERT INTO `search_index` VALUES ('lorem', 18, 'node', 1);
INSERT INTO `search_index` VALUES ('ipsum', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('dolor', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('sit', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('amet', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('consectetur', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('sed', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('eiusmod', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('tempor', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('incididunt', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('dolore', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('magna', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('aliqua', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('enim', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('minim', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('veniam', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('quis', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('nostrud', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('exercitation', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('ullamco', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('laboris', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('nisi', 18, 'node', 3);
INSERT INTO `search_index` VALUES ('aliquip', 18, 'node', 3);
INSERT INTO `search_index` VALUES ('commodo', 18, 'node', 3);
INSERT INTO `search_index` VALUES ('consequat', 18, 'node', 2);
INSERT INTO `search_index` VALUES ('consequatlorem', 18, 'node', 1);
INSERT INTO `search_index` VALUES ('slide', 18, 'node', 1);
INSERT INTO `search_index` VALUES ('show', 18, 'node', 1);
INSERT INTO `search_index` VALUES ('photography', 18, 'node', 4);
INSERT INTO `search_index` VALUES ('labore', 19, 'node', 28);
INSERT INTO `search_index` VALUES ('dolore', 19, 'node', 28);
INSERT INTO `search_index` VALUES ('magna', 19, 'node', 28);
INSERT INTO `search_index` VALUES ('lorem', 19, 'node', 1);
INSERT INTO `search_index` VALUES ('ipsum', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('dolor', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('sit', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('amet', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('consectetur', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('adipisicing', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('elit', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('sed', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('eiusmod', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('tempor', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('incididunt', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('aliqua', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('enim', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('minim', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('veniam', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('quis', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('nostrud', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('exercitation', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('ullamco', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('laboris', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('nisi', 19, 'node', 3);
INSERT INTO `search_index` VALUES ('aliquip', 19, 'node', 3);
INSERT INTO `search_index` VALUES ('commodo', 19, 'node', 3);
INSERT INTO `search_index` VALUES ('consequat', 19, 'node', 2);
INSERT INTO `search_index` VALUES ('consequatlorem', 19, 'node', 1);
INSERT INTO `search_index` VALUES ('slide', 19, 'node', 1);
INSERT INTO `search_index` VALUES ('show', 19, 'node', 1);
INSERT INTO `search_index` VALUES ('daily', 19, 'node', 4);
INSERT INTO `search_index` VALUES ('life', 19, 'node', 4);
INSERT INTO `search_index` VALUES ('tempor', 20, 'node', 28);
INSERT INTO `search_index` VALUES ('incididunt', 20, 'node', 28);
INSERT INTO `search_index` VALUES ('labore', 20, 'node', 28);
INSERT INTO `search_index` VALUES ('lorem', 20, 'node', 1);
INSERT INTO `search_index` VALUES ('ipsum', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('dolor', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('sit', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('amet', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('consectetur', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('adipisicing', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('elit', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('sed', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('eiusmod', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('dolore', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('magna', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('aliqua', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('enim', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('minim', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('veniam', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('quis', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('nostrud', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('exercitation', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('ullamco', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('laboris', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('nisi', 20, 'node', 3);
INSERT INTO `search_index` VALUES ('aliquip', 20, 'node', 3);
INSERT INTO `search_index` VALUES ('commodo', 20, 'node', 3);
INSERT INTO `search_index` VALUES ('consequat', 20, 'node', 2);
INSERT INTO `search_index` VALUES ('consequatlorem', 20, 'node', 1);
INSERT INTO `search_index` VALUES ('slide', 20, 'node', 1);
INSERT INTO `search_index` VALUES ('show', 20, 'node', 1);
INSERT INTO `search_index` VALUES ('inspiration', 20, 'node', 4);
INSERT INTO `search_index` VALUES ('ipsum', 21, 'node', 28);
INSERT INTO `search_index` VALUES ('dolor', 21, 'node', 28);
INSERT INTO `search_index` VALUES ('sit', 21, 'node', 28);
INSERT INTO `search_index` VALUES ('amet', 21, 'node', 28);
INSERT INTO `search_index` VALUES ('lorem', 21, 'node', 1);
INSERT INTO `search_index` VALUES ('consectetur', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('adipisicing', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('elit', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('sed', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('eiusmod', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('tempor', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('incididunt', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('labore', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('dolore', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('magna', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('aliqua', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('enim', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('minim', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('veniam', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('quis', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('nostrud', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('exercitation', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('ullamco', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('laboris', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('nisi', 21, 'node', 3);
INSERT INTO `search_index` VALUES ('aliquip', 21, 'node', 3);
INSERT INTO `search_index` VALUES ('commodo', 21, 'node', 3);
INSERT INTO `search_index` VALUES ('consequat', 21, 'node', 2);
INSERT INTO `search_index` VALUES ('consequatlorem', 21, 'node', 1);
INSERT INTO `search_index` VALUES ('slide', 21, 'node', 1);
INSERT INTO `search_index` VALUES ('show', 21, 'node', 1);
INSERT INTO `search_index` VALUES ('office', 21, 'node', 4);
INSERT INTO `search_index` VALUES ('pranksters', 21, 'node', 4);
INSERT INTO `search_index` VALUES ('welcome', 22, 'node', 26);
INSERT INTO `search_index` VALUES ('doubtfire', 22, 'node', 26);
INSERT INTO `search_index` VALUES ('website', 22, 'node', 11);
INSERT INTO `search_index` VALUES ('design', 22, 'node', 11);
INSERT INTO `search_index` VALUES ('tutorials', 22, 'node', 11);
INSERT INTO `search_index` VALUES ('business', 22, 'node', 11);
INSERT INTO `search_index` VALUES ('sit', 22, 'node', 7);
INSERT INTO `search_index` VALUES ('amet', 22, 'node', 7);
INSERT INTO `search_index` VALUES ('consectetur', 22, 'node', 4);
INSERT INTO `search_index` VALUES ('adipisicing', 22, 'node', 8);
INSERT INTO `search_index` VALUES ('elit', 22, 'node', 6);
INSERT INTO `search_index` VALUES ('consectetu', 22, 'node', 4);
INSERT INTO `search_index` VALUES ('get', 22, 'node', 22);
INSERT INTO `search_index` VALUES ('quote', 22, 'node', 11);
INSERT INTO `search_index` VALUES ('contact', 22, 'node', 11);
INSERT INTO `search_index` VALUES ('text', 23, 'node', 43);
INSERT INTO `search_index` VALUES ('styles', 23, 'node', 39);
INSERT INTO `search_index` VALUES ('long', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('established', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('fact', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('that', 23, 'node', 10);
INSERT INTO `search_index` VALUES ('reader', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('will', 23, 'node', 9);
INSERT INTO `search_index` VALUES ('distracted', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('the', 23, 'node', 10);
INSERT INTO `search_index` VALUES ('readable', 23, 'node', 10);
INSERT INTO `search_index` VALUES ('content', 23, 'node', 15);
INSERT INTO `search_index` VALUES ('page', 23, 'node', 9);
INSERT INTO `search_index` VALUES ('when', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('looking', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('its', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('layout', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('point', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('using', 23, 'node', 10);
INSERT INTO `search_index` VALUES ('lorem', 23, 'node', 23);
INSERT INTO `search_index` VALUES ('ipsum', 23, 'node', 23);
INSERT INTO `search_index` VALUES ('has', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('moreorless', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('normal', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('distribution', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('letters', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('opposed', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('here', 23, 'node', 10);
INSERT INTO `search_index` VALUES ('making', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('look', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('like', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('english', 23, 'node', 5);
INSERT INTO `search_index` VALUES ('many', 23, 'node', 8);
INSERT INTO `search_index` VALUES ('desktop', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('publishing', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('packages', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('and', 23, 'node', 8);
INSERT INTO `search_index` VALUES ('web', 23, 'node', 8);
INSERT INTO `search_index` VALUES ('editors', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('now', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('use', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('their', 23, 'node', 8);
INSERT INTO `search_index` VALUES ('default', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('model', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('search', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('for', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('uncover', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('sites', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('still', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('infancy', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('header', 23, 'node', 91);
INSERT INTO `search_index` VALUES ('title', 23, 'node', 91);
INSERT INTO `search_index` VALUES ('blockquote', 23, 'node', 13);
INSERT INTO `search_index` VALUES ('list', 23, 'node', 13);
INSERT INTO `search_index` VALUES ('dolor', 23, 'node', 10);
INSERT INTO `search_index` VALUES ('sit', 23, 'node', 10);
INSERT INTO `search_index` VALUES ('amet', 23, 'node', 10);
INSERT INTO `search_index` VALUES ('pre', 23, 'node', 13);
INSERT INTO `search_index` VALUES ('formatted', 23, 'node', 13);
INSERT INTO `search_index` VALUES ('features1', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('width', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('235px', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('padding', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('0', 23, 'node', 4);
INSERT INTO `search_index` VALUES ('15px', 23, 'node', 2);
INSERT INTO `search_index` VALUES ('float', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('left', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('borderright', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('1px', 23, 'node', 2);
INSERT INTO `search_index` VALUES ('solid', 23, 'node', 2);
INSERT INTO `search_index` VALUES ('f6f6f6', 23, 'node', 2);
INSERT INTO `search_index` VALUES ('borderbottom', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('background', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('url', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('style', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('images', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('monitorpng', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('norepeat', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('this', 23, 'node', 14);
INSERT INTO `search_index` VALUES ('table', 23, 'node', 41);
INSERT INTO `search_index` VALUES ('not', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('recommend', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('eating', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('food', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('one', 23, 'node', 1);
INSERT INTO `search_index` VALUES ('heading', 23, 'node', 7);
INSERT INTO `search_index` VALUES ('data', 23, 'node', 28);
DROP TABLE IF EXISTS `search_node_links`;
CREATE TABLE `search_node_links` (
  `sid` int(10) unsigned NOT NULL default '0',
  `type` varchar(16) NOT NULL default '',
  `nid` int(10) unsigned NOT NULL default '0',
  `caption` longtext,
  PRIMARY KEY  (`sid`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `search_total`;
CREATE TABLE `search_total` (
  `word` varchar(50) NOT NULL default '',
  `count` float default NULL,
  PRIMARY KEY  (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `search_total` VALUES ('about', 0.0163904);
INSERT INTO `search_total` VALUES ('sit', 0.00141234);
INSERT INTO `search_total` VALUES ('amet', 0.00154279);
INSERT INTO `search_total` VALUES ('consectetur', 0.00250315);
INSERT INTO `search_total` VALUES ('adipisicing', 0.00178355);
INSERT INTO `search_total` VALUES ('elit', 0.00236673);
INSERT INTO `search_total` VALUES ('consectetu', 0.00975984);
INSERT INTO `search_total` VALUES ('privacy', 0.0163904);
INSERT INTO `search_total` VALUES ('policy', 0.00553249);
INSERT INTO `search_total` VALUES ('terms', 0.0163904);
INSERT INTO `search_total` VALUES ('and', 0.0125891);
INSERT INTO `search_total` VALUES ('conditions', 0.0163904);
INSERT INTO `search_total` VALUES ('environmental', 0.0163904);
INSERT INTO `search_total` VALUES ('equal', 0.0163904);
INSERT INTO `search_total` VALUES ('opportunities', 0.0163904);
INSERT INTO `search_total` VALUES ('lorem', 0.00270589);
INSERT INTO `search_total` VALUES ('ipsum', 0.00192592);
INSERT INTO `search_total` VALUES ('dolor', 0.00204374);
INSERT INTO `search_total` VALUES ('sed', 0.00445434);
INSERT INTO `search_total` VALUES ('eiusmod', 0.00445434);
INSERT INTO `search_total` VALUES ('tempor', 0.00351657);
INSERT INTO `search_total` VALUES ('incididunt', 0.00351657);
INSERT INTO `search_total` VALUES ('labore', 0.00275743);
INSERT INTO `search_total` VALUES ('dolore', 0.00330264);
INSERT INTO `search_total` VALUES ('magna', 0.00330264);
INSERT INTO `search_total` VALUES ('aliqua', 0.00411657);
INSERT INTO `search_total` VALUES ('enim', 0.00294438);
INSERT INTO `search_total` VALUES ('minim', 0.00294438);
INSERT INTO `search_total` VALUES ('veniam', 0.00294438);
INSERT INTO `search_total` VALUES ('home', 0.09691);
INSERT INTO `search_total` VALUES ('quarter', 0.09691);
INSERT INTO `search_total` VALUES ('fourth', 0.30103);
INSERT INTO `search_total` VALUES ('first', 0.30103);
INSERT INTO `search_total` VALUES ('nisi', 0.0024606);
INSERT INTO `search_total` VALUES ('quis', 0.00998422);
INSERT INTO `search_total` VALUES ('nostrud', 0.0177288);
INSERT INTO `search_total` VALUES ('exercitation', 0.0177288);
INSERT INTO `search_total` VALUES ('ullamco', 0.0177288);
INSERT INTO `search_total` VALUES ('laboris', 0.0177288);
INSERT INTO `search_total` VALUES ('aliquip', 0.00288569);
INSERT INTO `search_total` VALUES ('commodo', 0.00288569);
INSERT INTO `search_total` VALUES ('consequat', 0.01524);
INSERT INTO `search_total` VALUES ('consequatlorem', 0.0321847);
INSERT INTO `search_total` VALUES ('third', 0.30103);
INSERT INTO `search_total` VALUES ('3dt', 0.0137883);
INSERT INTO `search_total` VALUES ('second', 0.30103);
INSERT INTO `search_total` VALUES ('customer', 0.0163904);
INSERT INTO `search_total` VALUES ('testimonials', 0.0163904);
INSERT INTO `search_total` VALUES ('our', 0.0163904);
INSERT INTO `search_total` VALUES ('workplace', 0.0163904);
INSERT INTO `search_total` VALUES ('network', 0.0163904);
INSERT INTO `search_total` VALUES ('connectivity', 0.0163904);
INSERT INTO `search_total` VALUES ('slide', 0.0511525);
INSERT INTO `search_total` VALUES ('show', 0.0511525);
INSERT INTO `search_total` VALUES ('photography', 0.0511525);
INSERT INTO `search_total` VALUES ('daily', 0.0511525);
INSERT INTO `search_total` VALUES ('life', 0.0511525);
INSERT INTO `search_total` VALUES ('inspiration', 0.0511525);
INSERT INTO `search_total` VALUES ('office', 0.0511525);
INSERT INTO `search_total` VALUES ('pranksters', 0.0511525);
INSERT INTO `search_total` VALUES ('welcome', 0.0163904);
INSERT INTO `search_total` VALUES ('doubtfire', 0.0163904);
INSERT INTO `search_total` VALUES ('website', 0.0377886);
INSERT INTO `search_total` VALUES ('design', 0.0377886);
INSERT INTO `search_total` VALUES ('tutorials', 0.0377886);
INSERT INTO `search_total` VALUES ('business', 0.0377886);
INSERT INTO `search_total` VALUES ('get', 0.0193052);
INSERT INTO `search_total` VALUES ('quote', 0.0377886);
INSERT INTO `search_total` VALUES ('contact', 0.0377886);
INSERT INTO `search_total` VALUES ('text', 0.00998422);
INSERT INTO `search_total` VALUES ('styles', 0.0109954);
INSERT INTO `search_total` VALUES ('long', 0.0791812);
INSERT INTO `search_total` VALUES ('established', 0.0791812);
INSERT INTO `search_total` VALUES ('fact', 0.0791812);
INSERT INTO `search_total` VALUES ('that', 0.0413927);
INSERT INTO `search_total` VALUES ('reader', 0.0791812);
INSERT INTO `search_total` VALUES ('will', 0.0457575);
INSERT INTO `search_total` VALUES ('distracted', 0.0791812);
INSERT INTO `search_total` VALUES ('the', 0.0413927);
INSERT INTO `search_total` VALUES ('readable', 0.0413927);
INSERT INTO `search_total` VALUES ('content', 0.0280287);
INSERT INTO `search_total` VALUES ('page', 0.0457575);
INSERT INTO `search_total` VALUES ('when', 0.0791812);
INSERT INTO `search_total` VALUES ('looking', 0.0791812);
INSERT INTO `search_total` VALUES ('its', 0.0791812);
INSERT INTO `search_total` VALUES ('layout', 0.0791812);
INSERT INTO `search_total` VALUES ('point', 0.0791812);
INSERT INTO `search_total` VALUES ('using', 0.0413927);
INSERT INTO `search_total` VALUES ('has', 0.0791812);
INSERT INTO `search_total` VALUES ('moreorless', 0.0791812);
INSERT INTO `search_total` VALUES ('normal', 0.0791812);
INSERT INTO `search_total` VALUES ('distribution', 0.0791812);
INSERT INTO `search_total` VALUES ('letters', 0.0791812);
INSERT INTO `search_total` VALUES ('opposed', 0.0791812);
INSERT INTO `search_total` VALUES ('here', 0.0413927);
INSERT INTO `search_total` VALUES ('making', 0.0791812);
INSERT INTO `search_total` VALUES ('look', 0.0791812);
INSERT INTO `search_total` VALUES ('like', 0.0791812);
INSERT INTO `search_total` VALUES ('english', 0.0791812);
INSERT INTO `search_total` VALUES ('many', 0.0511525);
INSERT INTO `search_total` VALUES ('desktop', 0.09691);
INSERT INTO `search_total` VALUES ('publishing', 0.09691);
INSERT INTO `search_total` VALUES ('packages', 0.09691);
INSERT INTO `search_total` VALUES ('web', 0.0511525);
INSERT INTO `search_total` VALUES ('editors', 0.09691);
INSERT INTO `search_total` VALUES ('now', 0.09691);
INSERT INTO `search_total` VALUES ('use', 0.09691);
INSERT INTO `search_total` VALUES ('their', 0.0511525);
INSERT INTO `search_total` VALUES ('default', 0.09691);
INSERT INTO `search_total` VALUES ('model', 0.09691);
INSERT INTO `search_total` VALUES ('search', 0.09691);
INSERT INTO `search_total` VALUES ('for', 0.09691);
INSERT INTO `search_total` VALUES ('uncover', 0.09691);
INSERT INTO `search_total` VALUES ('sites', 0.09691);
INSERT INTO `search_total` VALUES ('still', 0.09691);
INSERT INTO `search_total` VALUES ('infancy', 0.09691);
INSERT INTO `search_total` VALUES ('header', 0.00474644);
INSERT INTO `search_total` VALUES ('title', 0.00474644);
INSERT INTO `search_total` VALUES ('blockquote', 0.0321847);
INSERT INTO `search_total` VALUES ('list', 0.0321847);
INSERT INTO `search_total` VALUES ('pre', 0.0321847);
INSERT INTO `search_total` VALUES ('formatted', 0.0321847);
INSERT INTO `search_total` VALUES ('features1', 0.30103);
INSERT INTO `search_total` VALUES ('width', 0.30103);
INSERT INTO `search_total` VALUES ('235px', 0.30103);
INSERT INTO `search_total` VALUES ('padding', 0.30103);
INSERT INTO `search_total` VALUES ('0', 0.09691);
INSERT INTO `search_total` VALUES ('15px', 0.176091);
INSERT INTO `search_total` VALUES ('float', 0.30103);
INSERT INTO `search_total` VALUES ('left', 0.30103);
INSERT INTO `search_total` VALUES ('borderright', 0.30103);
INSERT INTO `search_total` VALUES ('1px', 0.176091);
INSERT INTO `search_total` VALUES ('solid', 0.176091);
INSERT INTO `search_total` VALUES ('f6f6f6', 0.176091);
INSERT INTO `search_total` VALUES ('borderbottom', 0.30103);
INSERT INTO `search_total` VALUES ('background', 0.30103);
INSERT INTO `search_total` VALUES ('url', 0.30103);
INSERT INTO `search_total` VALUES ('style', 0.30103);
INSERT INTO `search_total` VALUES ('images', 0.30103);
INSERT INTO `search_total` VALUES ('monitorpng', 0.30103);
INSERT INTO `search_total` VALUES ('norepeat', 0.30103);
INSERT INTO `search_total` VALUES ('this', 0.0299632);
INSERT INTO `search_total` VALUES ('table', 0.0104654);
INSERT INTO `search_total` VALUES ('not', 0.30103);
INSERT INTO `search_total` VALUES ('recommend', 0.30103);
INSERT INTO `search_total` VALUES ('eating', 0.30103);
INSERT INTO `search_total` VALUES ('food', 0.30103);
INSERT INTO `search_total` VALUES ('one', 0.30103);
INSERT INTO `search_total` VALUES ('heading', 0.0579919);
INSERT INTO `search_total` VALUES ('data', 0.01524);
DROP TABLE IF EXISTS `semaphore`;
CREATE TABLE `semaphore` (
  `name` varchar(255) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  `expire` double NOT NULL,
  PRIMARY KEY  (`name`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(64) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  `cache` int(11) NOT NULL default '0',
  `session` longtext,
  PRIMARY KEY  (`sid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `filename` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `type` varchar(255) NOT NULL default '',
  `owner` varchar(255) NOT NULL default '',
  `status` int(11) NOT NULL default '0',
  `throttle` tinyint(4) NOT NULL default '0',
  `bootstrap` int(11) NOT NULL default '0',
  `schema_version` smallint(6) NOT NULL default '-1',
  `weight` int(11) NOT NULL default '0',
  `info` text,
  PRIMARY KEY  (`filename`),
  KEY `modules` (`type`(12),`status`,`weight`,`filename`),
  KEY `bootstrap` (`type`(12),`status`,`bootstrap`,`weight`,`filename`),
  KEY `type_name` (`type`(12),`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `system` VALUES ('sites/all/themes/corporatevision/corporatevision.info', 'corporatevision', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0, 'a:11:{s:4:"name";s:16:"Corporate Vision";s:11:"description";s:77:"Premium Drupal theme by <a href="http://www.themesnap.com">ThemeSnap.com</a>.";s:10:"screenshot";s:47:"sites/all/themes/corporatevision/screenshot.png";s:7:"version";s:7:"6.x-1.0";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:15:{s:19:"sidebar_right_first";s:13:"Sidebar Right";s:10:"slide_show";s:10:"Slide Show";s:14:"home_top_first";s:14:"Home top first";s:18:"home_quarter_first";s:18:"Home quarter first";s:19:"home_quarter_second";s:19:"Home quarter second";s:18:"home_quarter_third";s:18:"Home quarter third";s:19:"home_quarter_fourth";s:19:"Home quarter fourth";s:17:"home_bottom_first";s:17:"Home bottom first";s:18:"home_bottom_second";s:18:"Home bottom second";s:17:"home_bottom_third";s:17:"Home bottom third";s:6:"bottom";s:6:"Bottom";s:12:"footer_first";s:12:"Footer first";s:13:"footer_second";s:13:"Footer second";s:12:"footer_third";s:12:"Footer third";s:13:"footer_fourth";s:13:"Footer fourth";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:42:"sites/all/themes/corporatevision/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:42:"sites/all/themes/corporatevision/script.js";}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('themes/pushbutton/pushbutton.info', 'pushbutton', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('themes/garland/minnelli/minnelli.info', 'minnelli', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}');
INSERT INTO `system` VALUES ('themes/garland/garland.info', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('themes/chameleon/marvin/marvin.info', 'marvin', 'theme', '', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('themes/chameleon/chameleon.info', 'chameleon', 'theme', 'themes/chameleon/chameleon.theme', 0, 0, 0, -1, 0, 'a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('themes/bluemarine/bluemarine.info', 'bluemarine', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/system/system.module', 'system', 'module', '', 1, 0, 0, 6055, 0, 'a:10:{s:4:"name";s:6:"System";s:11:"description";s:54:"Handles general site configuration for administrators.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/admin_menu/admin_menu.module', 'admin_menu', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:19:"Administration menu";s:11:"description";s:123:"Provides a dropdown menu to most administrative tasks and other common destinations (to users with the proper permissions).";s:7:"package";s:14:"Administration";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.5";s:7:"project";s:10:"admin_menu";s:9:"datestamp";s:10:"1246537502";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/aggregator/aggregator.module', 'aggregator', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Aggregator";s:11:"description";s:57:"Aggregates syndicated content (RSS, RDF, and Atom feeds).";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/block/block.module', 'block', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:5:"Block";s:11:"description";s:62:"Controls the boxes that are displayed around the main content.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/blog/blog.module', 'blog', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Blog";s:11:"description";s:69:"Enables keeping easily and regularly updated user web pages or blogs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/blogapi/blogapi.module', 'blogapi', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Blog API";s:11:"description";s:79:"Allows users to post content using applications that support XML-RPC blog APIs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/book/book.module', 'book', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Book";s:11:"description";s:63:"Allows users to structure site pages in a hierarchy or outline.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/color/color.module', 'color', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:5:"Color";s:11:"description";s:61:"Allows the user to change the color scheme of certain themes.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/comment/comment.module', 'comment', 'module', '', 1, 0, 0, 6003, 0, 'a:10:{s:4:"name";s:7:"Comment";s:11:"description";s:57:"Allows users to comment on and discuss published content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/contact/contact.module', 'contact', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:7:"Contact";s:11:"description";s:61:"Enables the use of both personal and site-wide contact forms.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/contact_form_blocks/contact_form_blocks.module', 'contact_form_blocks', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:19:"Contact Form Blocks";s:11:"description";s:62:"Makes your site-wide contact forms available as Drupal Blocks.";s:12:"dependencies";a:1:{i:0;s:7:"contact";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.1";s:7:"project";s:19:"contact_form_blocks";s:9:"datestamp";s:10:"1250721312";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/cck/content.module', 'content', 'module', '', 1, 0, 0, 6010, 0, 'a:10:{s:4:"name";s:7:"Content";s:11:"description";s:50:"Allows administrators to define new content types.";s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.8";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1281570988";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/cck/modules/content_copy/content_copy.module', 'content_copy', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:12:"Content Copy";s:11:"description";s:51:"Enables ability to import/export field definitions.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.8";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1281570988";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/cck/modules/content_permissions/content_permissions.module', 'content_permissions', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Content Permissions";s:11:"description";s:43:"Set field-level permissions for CCK fields.";s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"version";s:7:"6.x-2.8";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1281570988";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/dblog/dblog.module', 'dblog', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:16:"Database logging";s:11:"description";s:47:"Logs and records system events to the database.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/ddblock/ddblock.module', 'ddblock', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:21:"Dynamic display block";s:11:"description";s:36:"Displays dynamic content in a block.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:13:"jquery_update";}s:7:"version";s:11:"6.x-1.0-rc6";s:7:"project";s:7:"ddblock";s:9:"datestamp";s:10:"1235658642";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/cck/modules/fieldgroup/fieldgroup.module', 'fieldgroup', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Fieldgroup";s:11:"description";s:37:"Create display groups for CCK fields.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.8";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1281570988";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/filefield/filefield.module', 'filefield', 'module', '', 1, 0, 0, 6104, 0, 'a:10:{s:4:"name";s:9:"FileField";s:11:"description";s:26:"Defines a file field type.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.0";s:7:"version";s:7:"6.x-3.7";s:7:"project";s:9:"filefield";s:9:"datestamp";s:10:"1277943012";s:10:"dependents";a:0:{}}');
INSERT INTO `system` VALUES ('sites/all/modules/filefield/filefield_meta/filefield_meta.module', 'filefield_meta', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"FileField Meta";s:11:"description";s:48:"Add metadata gathering and storage to FileField.";s:12:"dependencies";a:2:{i:0;s:9:"filefield";i:1;s:6:"getid3";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.0";s:7:"version";s:7:"6.x-3.7";s:7:"project";s:9:"filefield";s:9:"datestamp";s:10:"1277943012";s:10:"dependents";a:0:{}}');
INSERT INTO `system` VALUES ('modules/filter/filter.module', 'filter', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Filter";s:11:"description";s:60:"Handles the filtering of content in preparation for display.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/forum/forum.module', 'forum', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:5:"Forum";s:11:"description";s:50:"Enables threaded discussions about general topics.";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/help/help.module', 'help', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Help";s:11:"description";s:35:"Manages the display of online help.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/imageapi/imageapi.module', 'imageapi', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"ImageAPI";s:11:"description";s:38:"ImageAPI supporting multiple toolkits.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:3:"php";s:3:"5.1";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1272675611";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}');
INSERT INTO `system` VALUES ('sites/all/modules/imageapi/imageapi_gd.module', 'imageapi_gd', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:12:"ImageAPI GD2";s:11:"description";s:49:"Uses PHP''s built-in GD2 image processing support.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1272675611";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/imageapi/imageapi_imagemagick.module', 'imageapi_imagemagick', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:20:"ImageAPI ImageMagick";s:11:"description";s:33:"Command Line ImageMagick support.";s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.8";s:7:"project";s:8:"imageapi";s:9:"datestamp";s:10:"1272675611";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/imagecache/imagecache.module', 'imagecache', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:10:"ImageCache";s:11:"description";s:36:"Dynamic image manipulator and cache.";s:7:"package";s:10:"ImageCache";s:12:"dependencies";a:1:{i:0;s:8:"imageapi";}s:4:"core";s:3:"6.x";s:7:"version";s:14:"6.x-2.0-beta10";s:7:"project";s:10:"imagecache";s:9:"datestamp";s:10:"1250716281";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/imagecache/imagecache_ui.module', 'imagecache_ui', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:13:"ImageCache UI";s:11:"description";s:26:"ImageCache User Interface.";s:12:"dependencies";a:2:{i:0;s:10:"imagecache";i:1;s:8:"imageapi";}s:7:"package";s:10:"ImageCache";s:4:"core";s:3:"6.x";s:7:"version";s:14:"6.x-2.0-beta10";s:7:"project";s:10:"imagecache";s:9:"datestamp";s:10:"1250716281";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/imagefield/imagefield.module', 'imagefield', 'module', '', 1, 0, 0, 6006, 0, 'a:10:{s:4:"name";s:10:"ImageField";s:11:"description";s:28:"Defines an image field type.";s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:7:"content";i:1;s:9:"filefield";}s:7:"package";s:3:"CCK";s:7:"version";s:7:"6.x-3.7";s:7:"project";s:10:"imagefield";s:9:"datestamp";s:10:"1277942710";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/jquery_update/jquery_update.module', 'jquery_update', 'module', '', 1, 0, 0, 6200, 99, 'a:10:{s:4:"name";s:13:"jQuery Update";s:11:"description";s:51:"Updates Drupal to use the latest version of jQuery.";s:7:"package";s:14:"User interface";s:4:"core";s:3:"6.x";s:7:"version";s:14:"6.x-2.0-alpha1";s:7:"project";s:13:"jquery_update";s:9:"datestamp";s:10:"1272041110";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/locale/locale.module', 'locale', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Locale";s:11:"description";s:119:"Adds language handling functionality and enables the translation of the user interface to languages other than English.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/menu/menu.module', 'menu', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Menu";s:11:"description";s:60:"Allows administrators to customize the site navigation menu.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/node/node.module', 'node', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Node";s:11:"description";s:66:"Allows content to be submitted to the site and displayed on pages.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/cck/modules/nodereference/nodereference.module', 'nodereference', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"Node Reference";s:11:"description";s:59:"Defines a field type for referencing one node from another.";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:4:"text";i:2;s:13:"optionwidgets";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.8";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1281570988";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/cck/modules/number/number.module', 'number', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Number";s:11:"description";s:28:"Defines numeric field types.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.8";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1281570988";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/openid/openid.module', 'openid', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"OpenID";s:11:"description";s:48:"Allows users to log into your site using OpenID.";s:7:"version";s:4:"6.19";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/cck/modules/optionwidgets/optionwidgets.module', 'optionwidgets', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:14:"Option Widgets";s:11:"description";s:82:"Defines selection, check box and radio button widgets for text and numeric fields.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.8";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1281570988";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/path/path.module', 'path', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Path";s:11:"description";s:28:"Allows users to rename URLs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/php/php.module', 'php', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"PHP filter";s:11:"description";s:50:"Allows embedded PHP code/snippets to be evaluated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/ping/ping.module', 'ping', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Ping";s:11:"description";s:51:"Alerts other sites when your site has been updated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/poll/poll.module', 'poll', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Poll";s:11:"description";s:95:"Allows your site to capture votes on different topics in the form of multiple choice questions.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/profile/profile.module', 'profile', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Profile";s:11:"description";s:36:"Supports configurable user profiles.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/search/search.module', 'search', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Search";s:11:"description";s:36:"Enables site-wide keyword searching.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/statistics/statistics.module', 'statistics', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Statistics";s:11:"description";s:37:"Logs access statistics for your site.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/syslog/syslog.module', 'syslog', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Syslog";s:11:"description";s:41:"Logs and records system events to syslog.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Taxonomy";s:11:"description";s:38:"Enables the categorization of content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/taxonomy_menu/taxonomy_menu.module', 'taxonomy_menu', 'module', '', 1, 0, 0, 6200, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:8:"taxonomy";}s:11:"description";s:39:"Adds links to taxonomy terms to a menu.";s:4:"name";s:13:"Taxonomy Menu";s:7:"package";s:13:"Taxonomy Menu";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:13:"taxonomy_menu";s:9:"datestamp";s:10:"1280800574";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/taxonomy_menu/taxonomy_menu_hierarchy/taxonomy_menu_hierarchy.module', 'taxonomy_menu_hierarchy', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:13:"taxonomy_menu";}s:11:"description";s:40:"Enables Hierarchy path to Taxonomy Menu.";s:4:"name";s:23:"Taxonomy Menu Hierarchy";s:7:"package";s:13:"Taxonomy Menu";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:13:"taxonomy_menu";s:9:"datestamp";s:10:"1280800574";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/taxonomy_menu/taxonomy_menu_path_custom/taxonomy_menu_path_custom.module', 'taxonomy_menu_path_custom', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:13:"taxonomy_menu";}s:11:"description";s:42:"Enables Custom path base to Taxonomy Menu.";s:4:"name";s:25:"Taxonomy Menu Custom Path";s:7:"package";s:13:"Taxonomy Menu";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:13:"taxonomy_menu";s:9:"datestamp";s:10:"1280800574";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/taxonomy_menu/taxonomy_menu_vocabulary_path/taxonomy_menu_vocabulary_path.module', 'taxonomy_menu_vocabulary_path', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"core";s:3:"6.x";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:13:"taxonomy_menu";}s:11:"description";s:64:"Enables a custom path for each vocabulary through Taxonomy Menu.";s:4:"name";s:29:"Taxonomy Menu Vocabulary Path";s:7:"package";s:13:"Taxonomy Menu";s:7:"version";s:7:"6.x-2.9";s:7:"project";s:13:"taxonomy_menu";s:9:"datestamp";s:10:"1280800574";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/cck/modules/text/text.module', 'text', 'module', '', 1, 0, 0, 6003, 0, 'a:10:{s:4:"name";s:4:"Text";s:11:"description";s:32:"Defines simple text field types.";s:12:"dependencies";a:1:{i:0;s:7:"content";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.8";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1281570988";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/throttle/throttle.module', 'throttle', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Throttle";s:11:"description";s:66:"Handles the auto-throttling mechanism, to control site congestion.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/tracker/tracker.module', 'tracker', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Tracker";s:11:"description";s:43:"Enables tracking of recent posts for users.";s:12:"dependencies";a:1:{i:0;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/translation/translation.module', 'translation', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Content translation";s:11:"description";s:57:"Allows content to be translated into different languages.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/trigger/trigger.module', 'trigger', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Trigger";s:11:"description";s:90:"Enables actions to be fired on certain system events, such as when new content is created.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/twitter/twitter.module', 'twitter', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:7:"Twitter";s:11:"description";s:56:"Adds integration with the Twitter microblogging service.";s:3:"php";s:3:"5.1";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.6";s:7:"project";s:7:"twitter";s:9:"datestamp";s:10:"1246548743";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}}');
INSERT INTO `system` VALUES ('sites/all/modules/twitter/twitter_actions/twitter_actions.module', 'twitter_actions', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:15:"Twitter actions";s:11:"description";s:48:"Exposes Drupal actions to send Twitter messages.";s:12:"dependencies";a:1:{i:0;s:7:"twitter";}s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.6";s:7:"project";s:7:"twitter";s:9:"datestamp";s:10:"1246548743";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/update/update.module', 'update', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:13:"Update status";s:11:"description";s:88:"Checks the status of available updates for Drupal and your installed modules and themes.";s:7:"version";s:4:"6.19";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/upload/upload.module', 'upload', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Upload";s:11:"description";s:51:"Allows users to upload and attach files to content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('modules/user/user.module', 'user', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"User";s:11:"description";s:47:"Manages the user registration and login system.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/cck/modules/userreference/userreference.module', 'userreference', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"User Reference";s:11:"description";s:56:"Defines a field type for referencing a user from a node.";s:12:"dependencies";a:3:{i:0;s:7:"content";i:1;s:4:"text";i:2;s:13:"optionwidgets";}s:7:"package";s:3:"CCK";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.8";s:7:"project";s:3:"cck";s:9:"datestamp";s:10:"1281570988";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/views/views.module', 'views', 'module', '', 1, 0, 0, 6009, 10, 'a:10:{s:4:"name";s:5:"Views";s:11:"description";s:55:"Create customized lists and queries from your database.";s:7:"package";s:5:"Views";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.11";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1276743614";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/views/views_export/views_export.module', 'views_export', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:14:"Views exporter";s:11:"description";s:40:"Allows exporting multiple views at once.";s:7:"package";s:5:"Views";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-2.11";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1276743614";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/views/views_ui.module', 'views_ui', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Views UI";s:11:"description";s:93:"Administrative interface to views. Without this module, you cannot create or edit your views.";s:7:"package";s:5:"Views";s:4:"core";s:3:"6.x";s:12:"dependencies";a:1:{i:0;s:5:"views";}s:7:"version";s:8:"6.x-2.11";s:7:"project";s:5:"views";s:9:"datestamp";s:10:"1276743614";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/simplenews/simplenews.module', 'simplenews', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"Simplenews";s:11:"description";s:47:"Send newsletters to subscribed email addresses.";s:12:"dependencies";a:1:{i:0;s:8:"taxonomy";}s:7:"package";s:4:"Mail";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.3";s:7:"project";s:10:"simplenews";s:9:"datestamp";s:10:"1274456709";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `system` VALUES ('sites/all/modules/simplenews/simplenews_action/simplenews_action.module', 'simplenews_action', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:17:"Simplenews action";s:11:"description";s:31:"Provide actions for Simplenews.";s:12:"dependencies";a:2:{i:0;s:10:"simplenews";i:1;s:7:"trigger";}s:7:"package";s:4:"Mail";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.3";s:7:"project";s:10:"simplenews";s:9:"datestamp";s:10:"1274456709";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
DROP TABLE IF EXISTS `taxonomy_menu`;
CREATE TABLE `taxonomy_menu` (
  `mlid` int(10) unsigned NOT NULL default '0',
  `tid` int(10) unsigned NOT NULL default '0',
  `vid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mlid`,`tid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `taxonomy_menu` VALUES (896, 4, 1);
INSERT INTO `taxonomy_menu` VALUES (895, 1, 1);
INSERT INTO `taxonomy_menu` VALUES (894, 2, 1);
INSERT INTO `taxonomy_menu` VALUES (893, 6, 1);
INSERT INTO `taxonomy_menu` VALUES (892, 3, 1);
DROP TABLE IF EXISTS `term_data`;
CREATE TABLE `term_data` (
  `tid` int(10) unsigned NOT NULL auto_increment,
  `vid` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;
INSERT INTO `term_data` VALUES (1, 1, 'Office Pranksters', '', 0);
INSERT INTO `term_data` VALUES (2, 1, 'Inspiration', '', 0);
INSERT INTO `term_data` VALUES (3, 1, 'Daily Life', '', 0);
INSERT INTO `term_data` VALUES (4, 1, 'Photography', '', 0);
INSERT INTO `term_data` VALUES (5, 2, 'Modern Business newsletter', '', 0);
INSERT INTO `term_data` VALUES (6, 1, 'Fun Projects', '', 0);
DROP TABLE IF EXISTS `term_hierarchy`;
CREATE TABLE `term_hierarchy` (
  `tid` int(10) unsigned NOT NULL default '0',
  `parent` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `term_hierarchy` VALUES (1, 0);
INSERT INTO `term_hierarchy` VALUES (2, 0);
INSERT INTO `term_hierarchy` VALUES (3, 0);
INSERT INTO `term_hierarchy` VALUES (4, 0);
INSERT INTO `term_hierarchy` VALUES (5, 0);
INSERT INTO `term_hierarchy` VALUES (6, 0);
DROP TABLE IF EXISTS `term_node`;
CREATE TABLE `term_node` (
  `nid` int(10) unsigned NOT NULL default '0',
  `vid` int(10) unsigned NOT NULL default '0',
  `tid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tid`,`vid`),
  KEY `vid` (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `term_node` VALUES (10, 10, 3);
INSERT INTO `term_node` VALUES (25, 25, 6);
INSERT INTO `term_node` VALUES (6, 6, 2);
INSERT INTO `term_node` VALUES (8, 8, 1);
INSERT INTO `term_node` VALUES (9, 9, 4);
INSERT INTO `term_node` VALUES (7, 7, 3);
DROP TABLE IF EXISTS `term_relation`;
CREATE TABLE `term_relation` (
  `trid` int(11) NOT NULL auto_increment,
  `tid1` int(10) unsigned NOT NULL default '0',
  `tid2` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
DROP TABLE IF EXISTS `term_synonym`;
CREATE TABLE `term_synonym` (
  `tsid` int(11) NOT NULL auto_increment,
  `tid` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
DROP TABLE IF EXISTS `url_alias`;
CREATE TABLE `url_alias` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `src` varchar(128) NOT NULL default '',
  `dst` varchar(128) NOT NULL default '',
  `language` varchar(12) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  UNIQUE KEY `dst_language_pid` (`dst`,`language`,`pid`),
  KEY `src_language_pid` (`src`,`language`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `pass` varchar(32) NOT NULL default '',
  `mail` varchar(64) default '',
  `mode` tinyint(4) NOT NULL default '0',
  `sort` tinyint(4) default '0',
  `threshold` tinyint(4) default '0',
  `theme` varchar(255) NOT NULL default '',
  `signature` varchar(255) NOT NULL default '',
  `signature_format` smallint(6) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `login` int(11) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '0',
  `timezone` varchar(8) default NULL,
  `language` varchar(12) NOT NULL default '',
  `picture` varchar(255) NOT NULL default '',
  `init` varchar(64) default '',
  `data` longtext,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;
INSERT INTO `users` VALUES (0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, NULL, '', '', '', NULL);
INSERT INTO `users` VALUES (1, 'admin', 'c4ca4238a0b923820dcc509a6f75849b', 'me@localhost.com', 0, 0, 0, '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1, 1282302762, 1285778295, 1282302810, 1, '10800', '', '', 'me@localhost.com', 'a:4:{s:14:"picture_delete";s:0:"";s:14:"picture_upload";s:0:"";s:7:"contact";i:0;s:13:"form_build_id";s:37:"form-3db47255ecf942797ab8ca2d856e686c";}');
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `uid` int(10) unsigned NOT NULL default '0',
  `rid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `variable`;
CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL default '',
  `value` longtext NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `variable` VALUES ('theme_default', 's:15:"corporatevision";');
INSERT INTO `variable` VALUES ('filter_html_1', 'i:1;');
INSERT INTO `variable` VALUES ('node_options_forum', 'a:1:{i:0;s:6:"status";}');
INSERT INTO `variable` VALUES ('drupal_private_key', 's:64:"21866c10fdce8238e0c20eab8ff9ca0e340c7a66783118b6cd3cc2217de0672a";');
INSERT INTO `variable` VALUES ('menu_masks', 'a:25:{i:0;i:127;i:1;i:63;i:2;i:62;i:3;i:61;i:4;i:59;i:5;i:58;i:6;i:57;i:7;i:56;i:8;i:31;i:9;i:30;i:10;i:29;i:11;i:28;i:12;i:25;i:13;i:24;i:14;i:21;i:15;i:15;i:16;i:14;i:17;i:13;i:18;i:11;i:19;i:7;i:20;i:6;i:21;i:5;i:22;i:3;i:23;i:2;i:24;i:1;}');
INSERT INTO `variable` VALUES ('admin_menu_margin_top', 'i:0;');
INSERT INTO `variable` VALUES ('install_task', 's:4:"done";');
INSERT INTO `variable` VALUES ('menu_expanded', 'a:2:{i:0;s:15:"menu-categories";i:1;s:13:"primary-links";}');
INSERT INTO `variable` VALUES ('site_name', 's:15:"Modern Business";');
INSERT INTO `variable` VALUES ('site_mail', 's:16:"me@localhost.com";');
INSERT INTO `variable` VALUES ('date_default_timezone', 's:5:"10800";');
INSERT INTO `variable` VALUES ('user_email_verification', 'i:1;');
INSERT INTO `variable` VALUES ('clean_url', 's:1:"1";');
INSERT INTO `variable` VALUES ('install_time', 'i:1282302810;');
INSERT INTO `variable` VALUES ('node_options_page', 'a:1:{i:0;s:6:"status";}');
INSERT INTO `variable` VALUES ('comment_page', 'i:0;');
INSERT INTO `variable` VALUES ('theme_settings', 'a:19:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:1;s:13:"toggle_search";i:1;s:14:"toggle_favicon";i:1;s:20:"toggle_primary_links";i:1;s:22:"toggle_secondary_links";i:1;s:21:"toggle_node_info_blog";i:1;s:21:"toggle_node_info_page";i:0;s:22:"toggle_node_info_story";i:1;s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:1;s:12:"favicon_path";s:0:"";s:14:"favicon_upload";s:0:"";}');
INSERT INTO `variable` VALUES ('drupal_http_request_fails', 'b:0;');
INSERT INTO `variable` VALUES ('css_js_query_string', 's:20:"VKNEmH57bkoYafd00000";');
INSERT INTO `variable` VALUES ('install_profile', 's:14:"modernbusiness";');
INSERT INTO `variable` VALUES ('content_schema_version', 'i:6009;');
INSERT INTO `variable` VALUES ('site_slogan', 's:0:"";');
INSERT INTO `variable` VALUES ('file_directory_temp', 's:4:"/tmp";');
INSERT INTO `variable` VALUES ('javascript_parsed', 'a:0:{}');
INSERT INTO `variable` VALUES ('site_mission', 's:0:"";');
INSERT INTO `variable` VALUES ('site_footer', 's:60:"Copyright &copy; 2010 Corporate Vision. All rights reserved.";');
INSERT INTO `variable` VALUES ('anonymous', 's:9:"Anonymous";');
INSERT INTO `variable` VALUES ('site_frontpage', 's:4:"node";');
INSERT INTO `variable` VALUES ('admin_theme', 's:1:"0";');
INSERT INTO `variable` VALUES ('node_admin_theme', 'i:0;');
INSERT INTO `variable` VALUES ('content_extra_weights_blog', 'a:8:{s:5:"title";s:2:"-5";s:10:"body_field";s:2:"-1";s:20:"revision_information";s:1:"8";s:6:"author";s:1:"7";s:7:"options";s:1:"9";s:16:"comment_settings";s:2:"10";s:4:"menu";s:2:"-4";s:8:"taxonomy";s:2:"-3";}');
INSERT INTO `variable` VALUES ('jquery_update_replace', 'b:1;');
INSERT INTO `variable` VALUES ('views_defaults', 'a:1:{s:13:"taxonomy_term";b:0;}');
INSERT INTO `variable` VALUES ('theme_modernbusiness_settings', 'a:21:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:1;s:27:"toggle_comment_user_picture";i:1;s:13:"toggle_search";i:1;s:14:"toggle_favicon";i:1;s:20:"toggle_primary_links";i:1;s:22:"toggle_secondary_links";i:1;s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:1;s:12:"favicon_path";s:0:"";s:14:"favicon_upload";s:0:"";s:7:"tm_skin";s:1:"0";s:12:"tm_slideshow";s:1:"1";s:11:"tm_category";s:1:"1";s:12:"tm_portfolio";s:1:"0";s:7:"tm_page";s:1:"1";}');
INSERT INTO `variable` VALUES ('rebuild', 's:19:"Rebuild permissions";');
INSERT INTO `variable` VALUES ('default_nodes_main', 's:2:"10";');
INSERT INTO `variable` VALUES ('teaser_length', 's:3:"600";');
INSERT INTO `variable` VALUES ('node_preview', 's:1:"0";');
INSERT INTO `variable` VALUES ('node_options_blog', 'a:2:{i:0;s:6:"status";i:1;s:7:"promote";}');
INSERT INTO `variable` VALUES ('form_build_id_blog', 's:37:"form-e579e1151db353fc1c17594d675eae23";');
INSERT INTO `variable` VALUES ('comment_blog', 's:1:"2";');
INSERT INTO `variable` VALUES ('comment_default_mode_blog', 's:1:"4";');
INSERT INTO `variable` VALUES ('comment_default_order_blog', 's:1:"1";');
INSERT INTO `variable` VALUES ('comment_default_per_page_blog', 's:2:"50";');
INSERT INTO `variable` VALUES ('comment_controls_blog', 's:1:"3";');
INSERT INTO `variable` VALUES ('comment_anonymous_blog', 'i:0;');
INSERT INTO `variable` VALUES ('comment_subject_field_blog', 's:1:"0";');
INSERT INTO `variable` VALUES ('comment_preview_blog', 's:1:"0";');
INSERT INTO `variable` VALUES ('comment_form_location_blog', 's:1:"1";');
INSERT INTO `variable` VALUES ('node_options_story', 'a:2:{i:0;s:6:"status";i:1;s:7:"promote";}');
INSERT INTO `variable` VALUES ('form_build_id_story', 's:37:"form-01afd5a3960f65ffcc599ee001b26e35";');
INSERT INTO `variable` VALUES ('comment_story', 's:1:"2";');
INSERT INTO `variable` VALUES ('comment_default_mode_story', 's:1:"4";');
INSERT INTO `variable` VALUES ('comment_default_order_story', 's:1:"1";');
INSERT INTO `variable` VALUES ('comment_default_per_page_story', 's:2:"50";');
INSERT INTO `variable` VALUES ('comment_controls_story', 's:1:"3";');
INSERT INTO `variable` VALUES ('comment_anonymous_story', 'i:0;');
INSERT INTO `variable` VALUES ('comment_subject_field_story', 's:1:"0";');
INSERT INTO `variable` VALUES ('comment_preview_story', 's:1:"0";');
INSERT INTO `variable` VALUES ('comment_form_location_story', 's:1:"1";');
INSERT INTO `variable` VALUES ('user_register', 's:1:"1";');
INSERT INTO `variable` VALUES ('user_registration_help', 's:0:"";');
INSERT INTO `variable` VALUES ('user_mail_register_admin_created_subject', 's:52:"An administrator created an account for you at !site";');
INSERT INTO `variable` VALUES ('user_mail_register_admin_created_body', 's:468:"!username,\r\n\r\nA site administrator at !site has created an account for you. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team";');
INSERT INTO `variable` VALUES ('user_mail_register_no_approval_required_subject', 's:38:"Account details for !username at !site";');
INSERT INTO `variable` VALUES ('user_mail_register_no_approval_required_body', 's:442:"!username,\r\n\r\nThank you for registering at !site. You may now log in to !login_uri using the following username and password:\r\n\r\nusername: !username\r\npassword: !password\r\n\r\nYou may also log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\n\r\n--  !site team";');
INSERT INTO `variable` VALUES ('user_mail_register_pending_approval_subject', 's:63:"Account details for !username at !site (pending admin approval)";');
INSERT INTO `variable` VALUES ('user_mail_register_pending_approval_body', 's:273:"!username,\r\n\r\nThank you for registering at !site. Your application for an account is currently pending approval. Once it has been approved, you will receive another e-mail containing information about how to log in, set your password, and other details.\r\n\r\n\r\n--  !site team";');
INSERT INTO `variable` VALUES ('user_mail_password_reset_subject', 's:52:"Replacement login information for !username at !site";');
INSERT INTO `variable` VALUES ('user_mail_password_reset_body', 's:419:"!username,\r\n\r\nA request to reset the password for your account has been made at !site.\r\n\r\nYou may now log in to !uri_brief by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once. It expires after one day and nothing will happen if it''s not used.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.";');
INSERT INTO `variable` VALUES ('user_mail_status_activated_notify', 'i:1;');
INSERT INTO `variable` VALUES ('user_mail_status_activated_subject', 's:49:"Account details for !username at !site (approved)";');
INSERT INTO `variable` VALUES ('user_mail_status_activated_body', 's:434:"!username,\r\n\r\nYour account at !site has been activated.\r\n\r\nYou may now log in by clicking on this link or copying and pasting it in your browser:\r\n\r\n!login_url\r\n\r\nThis is a one-time login, so it can be used only once.\r\n\r\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\r\n\r\nOnce you have set your own password, you will be able to log in to !login_uri in the future using:\r\n\r\nusername: !username\r\n";');
INSERT INTO `variable` VALUES ('user_mail_status_blocked_notify', 'i:0;');
INSERT INTO `variable` VALUES ('user_mail_status_blocked_subject', 's:48:"Account details for !username at !site (blocked)";');
INSERT INTO `variable` VALUES ('user_mail_status_blocked_body', 's:53:"!username,\r\n\r\nYour account on !site has been blocked.";');
INSERT INTO `variable` VALUES ('user_mail_status_deleted_notify', 'i:0;');
INSERT INTO `variable` VALUES ('user_mail_status_deleted_subject', 's:48:"Account details for !username at !site (deleted)";');
INSERT INTO `variable` VALUES ('user_mail_status_deleted_body', 's:53:"!username,\r\n\r\nYour account on !site has been deleted.";');
INSERT INTO `variable` VALUES ('user_signatures', 's:1:"0";');
INSERT INTO `variable` VALUES ('user_pictures', 's:1:"1";');
INSERT INTO `variable` VALUES ('user_picture_path', 's:8:"pictures";');
INSERT INTO `variable` VALUES ('user_picture_default', 's:51:"sites/all/themes/corporatevision/author-picture.gif";');
INSERT INTO `variable` VALUES ('user_picture_dimensions', 's:5:"65x65";');
INSERT INTO `variable` VALUES ('user_picture_file_size', 's:2:"30";');
INSERT INTO `variable` VALUES ('user_picture_guidelines', 's:0:"";');
INSERT INTO `variable` VALUES ('node_options_portfolio', 'a:2:{i:0;s:6:"status";i:1;s:7:"promote";}');
INSERT INTO `variable` VALUES ('form_build_id_portfolio', 's:37:"form-010d5d7e1600112aba7f5f4ce2d8aa23";');
INSERT INTO `variable` VALUES ('comment_portfolio', 's:1:"0";');
INSERT INTO `variable` VALUES ('comment_default_mode_portfolio', 's:1:"4";');
INSERT INTO `variable` VALUES ('comment_default_order_portfolio', 's:1:"1";');
INSERT INTO `variable` VALUES ('comment_default_per_page_portfolio', 's:2:"50";');
INSERT INTO `variable` VALUES ('comment_controls_portfolio', 's:1:"3";');
INSERT INTO `variable` VALUES ('comment_anonymous_portfolio', 's:1:"0";');
INSERT INTO `variable` VALUES ('comment_subject_field_portfolio', 's:1:"0";');
INSERT INTO `variable` VALUES ('comment_preview_portfolio', 's:1:"0";');
INSERT INTO `variable` VALUES ('comment_form_location_portfolio', 's:1:"1";');
INSERT INTO `variable` VALUES ('content_extra_weights_portfolio', 'a:7:{s:5:"title";s:2:"-5";s:10:"body_field";s:2:"-2";s:20:"revision_information";s:1:"6";s:6:"author";s:1:"5";s:7:"options";s:1:"7";s:16:"comment_settings";s:1:"8";s:4:"menu";s:2:"-4";}');
INSERT INTO `variable` VALUES ('taxonomy_menu_vocab_menu_1', 's:15:"menu-categories";');
INSERT INTO `variable` VALUES ('taxonomy_menu_vocab_parent_1', 's:1:"0";');
INSERT INTO `variable` VALUES ('taxonomy_menu_path_1', 's:26:"taxonomy_menu_path_default";');
INSERT INTO `variable` VALUES ('taxonomy_menu_sync_1', 'i:1;');
INSERT INTO `variable` VALUES ('taxonomy_menu_display_num_1', 'i:0;');
INSERT INTO `variable` VALUES ('taxonomy_menu_hide_empty_terms_1', 'i:0;');
INSERT INTO `variable` VALUES ('taxonomy_menu_voc_item_1', 'i:0;');
INSERT INTO `variable` VALUES ('taxonomy_menu_expanded_1', 'i:1;');
INSERT INTO `variable` VALUES ('taxonomy_menu_voc_name_1', 's:0:"";');
INSERT INTO `variable` VALUES ('taxonomy_menu_display_descendants_1', 'i:0;');
INSERT INTO `variable` VALUES ('taxonomy_menu_end_all_1', 'i:0;');
INSERT INTO `variable` VALUES ('taxonomy_menu_rebuild_1', 'i:0;');
INSERT INTO `variable` VALUES ('content_extra_weights_story', 'a:7:{s:5:"title";s:2:"-5";s:10:"body_field";s:2:"-2";s:20:"revision_information";s:1:"6";s:6:"author";s:1:"5";s:7:"options";s:1:"7";s:16:"comment_settings";s:1:"8";s:4:"menu";s:2:"-4";}');
INSERT INTO `variable` VALUES ('admin_menu_position_fixed', 'i:0;');
INSERT INTO `variable` VALUES ('admin_menu_tweak_modules', 'i:0;');
INSERT INTO `variable` VALUES ('admin_menu_tweak_tabs', 'i:0;');
INSERT INTO `variable` VALUES ('wipe', 's:16:"Wipe and rebuild";');
INSERT INTO `variable` VALUES ('theme_corporatevision_settings', 'a:23:{s:11:"toggle_logo";i:1;s:11:"toggle_name";i:1;s:13:"toggle_slogan";i:0;s:14:"toggle_mission";i:1;s:24:"toggle_node_user_picture";i:0;s:27:"toggle_comment_user_picture";i:1;s:13:"toggle_search";i:1;s:14:"toggle_favicon";i:1;s:20:"toggle_primary_links";i:1;s:22:"toggle_secondary_links";i:1;s:12:"default_logo";i:1;s:9:"logo_path";s:0:"";s:11:"logo_upload";s:0:"";s:15:"default_favicon";i:1;s:12:"favicon_path";s:0:"";s:14:"favicon_upload";s:0:"";s:7:"tm_skin";s:1:"0";s:12:"tm_slideshow";s:1:"0";s:8:"tm_title";s:7:"Reviews";s:14:"tm_intro_title";s:18:"Welcome to Sprout ";s:8:"tm_intro";s:165:"We are a small digital agency with a big passion for design. Located in the heart of Plano Texas, we design and build beautiful websites using Drupal and mad skills.";s:12:"tm_portfolio";s:1:"1";s:7:"tm_page";s:1:"0";}');
INSERT INTO `variable` VALUES ('content_extra_weights_page', 'a:7:{s:5:"title";s:2:"-5";s:10:"body_field";s:2:"-2";s:20:"revision_information";s:1:"1";s:6:"author";s:1:"0";s:7:"options";s:1:"2";s:16:"comment_settings";s:1:"3";s:4:"menu";s:2:"-4";}');
INSERT INTO `variable` VALUES ('taxonomy_menu_blank_title_1', 'i:0;');
INSERT INTO `variable` VALUES ('menu_default_node_menu', 's:13:"primary-links";');
INSERT INTO `variable` VALUES ('menu_primary_links_source', 's:13:"primary-links";');
INSERT INTO `variable` VALUES ('menu_secondary_links_source', 's:15:"secondary-links";');
INSERT INTO `variable` VALUES ('node_cron_comments_scale', 'd:0.200000000000000011102230246251565404236316680908203125;');
INSERT INTO `variable` VALUES ('node_cron_views_scale', 'd:1;');
INSERT INTO `variable` VALUES ('node_cron_last', 's:10:"1285262998";');
INSERT INTO `variable` VALUES ('cron_last', 'i:1285569630;');
DROP TABLE IF EXISTS `views_display`;
CREATE TABLE `views_display` (
  `vid` int(10) unsigned NOT NULL default '0',
  `id` varchar(64) NOT NULL default '',
  `display_title` varchar(64) NOT NULL default '',
  `display_plugin` varchar(64) NOT NULL default '',
  `position` int(11) default '0',
  `display_options` longtext,
  PRIMARY KEY  (`vid`,`id`),
  KEY `vid` (`vid`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `views_display` VALUES (1, 'block_1', 'Block Latest Blog Posts', 'block', 6, 'a:12:{s:12:"style_plugin";s:7:"default";s:8:"defaults";a:11:{s:12:"style_plugin";b:0;s:13:"style_options";b:0;s:10:"row_plugin";b:0;s:11:"row_options";b:0;s:5:"title";b:0;s:6:"fields";b:0;s:5:"sorts";b:0;s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;}s:13:"style_options";a:0:{}s:10:"row_plugin";s:6:"fields";s:11:"row_options";a:3:{s:6:"inline";a:0:{}s:9:"separator";s:0:"";s:10:"hide_empty";i:0;}s:5:"title";s:17:"Latest Blog Posts";s:6:"fields";a:4:{s:4:"body";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:1;s:10:"max_length";s:3:"120";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:1;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"body";s:5:"table";s:14:"node_revisions";s:5:"field";s:4:"body";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:7:"created";a:13:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:11:"date_format";s:6:"custom";s:18:"custom_date_format";s:5:"M j Y";s:7:"exclude";i:0;s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:5:"title";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:1;s:7:"exclude";i:0;s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:4:"path";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:8:"absolute";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"path";s:5:"table";s:4:"node";s:5:"field";s:4:"path";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}}s:5:"sorts";a:1:{s:7:"created";a:6:{s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:5:"order";s:4:"DESC";s:11:"granularity";s:6:"second";s:12:"relationship";s:4:"none";}}s:14:"items_per_page";i:3;s:6:"offset";i:0;s:9:"use_pager";s:1:"0";s:13:"pager_element";i:0;}');
INSERT INTO `views_display` VALUES (1, 'feed', 'Core feed', 'feed', 3, 'a:14:{s:14:"items_per_page";i:15;s:8:"defaults";a:4:{s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;}s:6:"offset";i:0;s:9:"use_pager";s:1:"1";s:13:"pager_element";i:0;s:12:"style_plugin";s:3:"rss";s:13:"style_options";a:2:{s:19:"mission_description";b:0;s:11:"description";s:0:"";}s:10:"row_plugin";s:8:"node_rss";s:11:"row_options";a:1:{s:11:"item_length";s:7:"default";}s:4:"path";s:22:"taxonomy/term/%/%/feed";s:4:"menu";a:5:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:11:"description";s:0:"";s:6:"weight";i:0;s:4:"name";s:10:"navigation";}s:11:"tab_options";a:5:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:11:"description";s:0:"";s:6:"weight";i:0;s:4:"name";s:10:"navigation";}s:8:"displays";a:2:{s:4:"page";s:4:"page";s:7:"default";i:0;}s:14:"sitename_title";b:0;}');
INSERT INTO `views_display` VALUES (1, 'feed_1', 'Views 1 feed', 'feed', 4, 'a:14:{s:14:"items_per_page";i:15;s:8:"defaults";a:4:{s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;}s:6:"offset";i:0;s:9:"use_pager";s:1:"1";s:13:"pager_element";i:0;s:12:"style_plugin";s:3:"rss";s:13:"style_options";a:2:{s:19:"mission_description";b:0;s:11:"description";s:0:"";}s:10:"row_plugin";s:8:"node_rss";s:11:"row_options";a:1:{s:11:"item_length";s:7:"default";}s:4:"path";s:20:"taxonomy/term/%/feed";s:4:"menu";a:5:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:11:"description";s:0:"";s:6:"weight";i:0;s:4:"name";s:10:"navigation";}s:11:"tab_options";a:5:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:11:"description";s:0:"";s:6:"weight";i:0;s:4:"name";s:10:"navigation";}s:8:"displays";a:0:{}s:14:"sitename_title";b:0;}');
INSERT INTO `views_display` VALUES (1, 'page_1', 'Page', 'page', 5, 'a:7:{s:12:"style_plugin";s:7:"default";s:8:"defaults";a:5:{s:12:"style_plugin";b:0;s:13:"style_options";b:0;s:10:"row_plugin";b:0;s:11:"row_options";b:0;s:6:"fields";b:0;}s:13:"style_options";a:0:{}s:10:"row_plugin";s:6:"fields";s:11:"row_options";a:0:{}s:4:"path";s:4:"blog";s:6:"fields";a:7:{s:4:"body";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:1;s:10:"max_length";s:3:"200";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:1;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"body";s:5:"table";s:14:"node_revisions";s:5:"field";s:4:"body";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:13:"comment_count";a:17:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:13:"set_precision";b:0;s:9:"precision";i:0;s:7:"decimal";s:1:".";s:9:"separator";s:1:",";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:7:"exclude";i:0;s:2:"id";s:13:"comment_count";s:5:"table";s:23:"node_comment_statistics";s:5:"field";s:13:"comment_count";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:7:"created";a:13:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:11:"date_format";s:6:"custom";s:18:"custom_date_format";s:5:"M j Y";s:7:"exclude";i:0;s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:5:"title";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:1;s:7:"exclude";i:0;s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:15:"field_image_fid";a:15:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:0;s:10:"label_type";s:4:"none";s:6:"format";s:10:"path_plain";s:8:"multiple";a:4:{s:5:"group";b:1;s:15:"multiple_number";s:0:"";s:13:"multiple_from";s:0:"";s:17:"multiple_reversed";b:0;}s:7:"exclude";i:0;s:2:"id";s:15:"field_image_fid";s:5:"table";s:21:"node_data_field_image";s:5:"field";s:15:"field_image_fid";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:4:"path";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:8:"absolute";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"path";s:5:"table";s:4:"node";s:5:"field";s:4:"path";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:4:"name";a:14:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_user";i:1;s:19:"overwrite_anonymous";i:0;s:14:"anonymous_text";s:0:"";s:7:"exclude";i:0;s:2:"id";s:4:"name";s:5:"table";s:5:"users";s:5:"field";s:4:"name";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}}}');
INSERT INTO `views_display` VALUES (1, 'default', 'Defaults', 'default', 1, 'a:16:{s:5:"sorts";a:2:{s:6:"sticky";a:5:{s:2:"id";s:6:"sticky";s:5:"table";s:4:"node";s:5:"field";s:6:"sticky";s:5:"order";s:4:"DESC";s:12:"relationship";s:4:"none";}s:7:"created";a:6:{s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:5:"order";s:4:"DESC";s:11:"granularity";s:6:"second";s:12:"relationship";s:4:"none";}}s:8:"defaults";a:13:{s:5:"sorts";b:0;s:9:"arguments";b:0;s:7:"filters";b:0;s:6:"access";b:0;s:5:"cache";b:0;s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;s:12:"style_plugin";b:0;s:13:"style_options";b:0;s:10:"row_plugin";b:0;s:11:"row_options";b:0;}s:9:"arguments";a:0:{}s:7:"filters";a:2:{s:12:"status_extra";a:9:{s:2:"id";s:12:"status_extra";s:5:"table";s:4:"node";s:5:"field";s:12:"status_extra";s:8:"operator";s:1:"=";s:5:"value";s:0:"";s:5:"group";i:0;s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:12:"relationship";s:4:"none";}s:4:"type";a:9:{s:8:"operator";s:2:"in";s:5:"value";a:1:{s:4:"blog";s:4:"blog";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:4:"type";s:5:"table";s:4:"node";s:5:"field";s:4:"type";s:12:"relationship";s:4:"none";}}s:6:"access";a:3:{s:4:"type";s:4:"none";s:4:"role";a:0:{}s:4:"perm";s:0:"";}s:5:"cache";a:1:{s:4:"type";s:4:"none";}s:14:"items_per_page";i:12;s:6:"offset";i:0;s:9:"use_pager";s:1:"1";s:13:"pager_element";i:0;s:12:"style_plugin";s:7:"default";s:13:"style_options";a:0:{}s:10:"row_plugin";s:4:"node";s:11:"row_options";a:2:{s:6:"teaser";b:1;s:5:"links";b:1;}s:6:"fields";a:4:{s:4:"body";a:3:{s:2:"id";s:4:"body";s:5:"table";s:14:"node_revisions";s:5:"field";s:4:"body";}s:13:"comment_count";a:3:{s:2:"id";s:13:"comment_count";s:5:"table";s:23:"node_comment_statistics";s:5:"field";s:13:"comment_count";}s:7:"created";a:3:{s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";}s:5:"title";a:3:{s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";}}s:5:"title";s:5:"Blogs";}');
INSERT INTO `views_display` VALUES (1, 'page', 'Page', 'page', 2, 'a:9:{s:4:"path";s:6:"blog/%";s:4:"menu";a:5:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:11:"description";s:0:"";s:6:"weight";i:0;s:4:"name";s:10:"navigation";}s:11:"tab_options";a:5:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:11:"description";s:0:"";s:6:"weight";i:0;s:4:"name";s:10:"navigation";}s:12:"style_plugin";s:7:"default";s:8:"defaults";a:5:{s:12:"style_plugin";b:0;s:13:"style_options";b:0;s:10:"row_plugin";b:0;s:11:"row_options";b:0;s:6:"fields";b:0;}s:13:"style_options";a:0:{}s:10:"row_plugin";s:6:"fields";s:11:"row_options";a:0:{}s:6:"fields";a:7:{s:4:"body";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:1;s:10:"max_length";s:3:"200";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:1;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"body";s:5:"table";s:14:"node_revisions";s:5:"field";s:4:"body";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:13:"comment_count";a:17:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:13:"set_precision";b:0;s:9:"precision";i:0;s:7:"decimal";s:1:".";s:9:"separator";s:1:",";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:7:"exclude";i:0;s:2:"id";s:13:"comment_count";s:5:"table";s:23:"node_comment_statistics";s:5:"field";s:13:"comment_count";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:7:"created";a:13:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:11:"date_format";s:6:"medium";s:18:"custom_date_format";s:0:"";s:7:"exclude";i:0;s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:5:"title";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:1;s:7:"exclude";i:0;s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:15:"field_image_fid";a:15:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:0;s:10:"label_type";s:4:"none";s:6:"format";s:10:"path_plain";s:8:"multiple";a:4:{s:5:"group";b:1;s:15:"multiple_number";s:0:"";s:13:"multiple_from";s:0:"";s:17:"multiple_reversed";b:0;}s:7:"exclude";i:0;s:2:"id";s:15:"field_image_fid";s:5:"table";s:21:"node_data_field_image";s:5:"field";s:15:"field_image_fid";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:4:"path";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:8:"absolute";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"path";s:5:"table";s:4:"node";s:5:"field";s:4:"path";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:4:"name";a:14:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_user";i:1;s:19:"overwrite_anonymous";i:0;s:14:"anonymous_text";s:0:"";s:7:"exclude";i:0;s:2:"id";s:4:"name";s:5:"table";s:5:"users";s:5:"field";s:4:"name";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}}}');
INSERT INTO `views_display` VALUES (2, 'page', 'Page', 'page', 2, 'a:13:{s:4:"path";s:15:"taxonomy/term/%";s:4:"menu";a:3:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:6:"weight";i:0;}s:11:"tab_options";a:3:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:6:"weight";i:0;}s:12:"style_plugin";s:7:"default";s:8:"defaults";a:9:{s:12:"style_plugin";b:0;s:13:"style_options";b:0;s:10:"row_plugin";b:0;s:11:"row_options";b:0;s:7:"filters";b:0;s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;}s:13:"style_options";a:0:{}s:10:"row_plugin";s:4:"node";s:11:"row_options";a:4:{s:12:"relationship";s:4:"none";s:10:"build_mode";s:6:"teaser";s:5:"links";i:1;s:8:"comments";i:0;}s:7:"filters";a:1:{s:12:"status_extra";a:9:{s:2:"id";s:12:"status_extra";s:5:"table";s:4:"node";s:5:"field";s:12:"status_extra";s:8:"operator";s:1:"=";s:5:"value";s:0:"";s:5:"group";i:0;s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:12:"relationship";s:4:"none";}}s:14:"items_per_page";i:10;s:6:"offset";i:0;s:9:"use_pager";s:1:"1";s:13:"pager_element";i:0;}');
INSERT INTO `views_display` VALUES (2, 'feed', 'Core feed', 'feed', 3, 'a:11:{s:14:"items_per_page";i:15;s:8:"defaults";a:4:{s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;}s:6:"offset";i:0;s:9:"use_pager";s:1:"1";s:13:"pager_element";i:0;s:10:"row_plugin";s:8:"node_rss";s:11:"row_options";a:1:{s:11:"item_length";s:7:"default";}s:4:"path";s:22:"taxonomy/term/%/%/feed";s:4:"menu";a:3:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:6:"weight";i:0;}s:11:"tab_options";a:3:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:6:"weight";i:0;}s:8:"displays";a:2:{s:4:"page";s:4:"page";s:7:"default";i:0;}}');
INSERT INTO `views_display` VALUES (2, 'feed_1', 'Views 1 feed', 'feed', 4, 'a:10:{s:14:"items_per_page";i:15;s:8:"defaults";a:4:{s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;}s:6:"offset";i:0;s:9:"use_pager";s:1:"1";s:13:"pager_element";i:0;s:10:"row_plugin";s:8:"node_rss";s:11:"row_options";a:1:{s:11:"item_length";s:7:"default";}s:4:"path";s:20:"taxonomy/term/%/feed";s:4:"menu";a:3:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:6:"weight";i:0;}s:11:"tab_options";a:3:{s:4:"type";s:4:"none";s:5:"title";s:0:"";s:6:"weight";i:0;}}');
INSERT INTO `views_display` VALUES (2, 'page_1', 'Page', 'page', 5, 'a:9:{s:12:"style_plugin";s:7:"default";s:8:"defaults";a:7:{s:12:"style_plugin";b:0;s:13:"style_options";b:0;s:10:"row_plugin";b:0;s:11:"row_options";b:0;s:9:"arguments";b:0;s:5:"title";b:0;s:6:"fields";b:0;}s:13:"style_options";a:0:{}s:10:"row_plugin";s:6:"fields";s:11:"row_options";a:3:{s:6:"inline";a:0:{}s:9:"separator";s:0:"";s:10:"hide_empty";i:0;}s:9:"arguments";a:0:{}s:4:"path";s:9:"portfolio";s:5:"title";s:9:"Portfolio";s:6:"fields";a:6:{s:7:"created";a:13:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:11:"date_format";s:5:"large";s:18:"custom_date_format";s:0:"";s:7:"exclude";i:0;s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:5:"title";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:1;s:7:"exclude";i:0;s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:15:"field_image_fid";a:15:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:0;s:10:"label_type";s:4:"none";s:6:"format";s:10:"path_plain";s:8:"multiple";a:4:{s:5:"group";b:1;s:15:"multiple_number";s:0:"";s:13:"multiple_from";s:0:"";s:17:"multiple_reversed";b:0;}s:7:"exclude";i:0;s:2:"id";s:15:"field_image_fid";s:5:"table";s:21:"node_data_field_image";s:5:"field";s:15:"field_image_fid";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:4:"name";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"link_to_taxonomy";i:1;s:7:"exclude";i:0;s:2:"id";s:4:"name";s:5:"table";s:9:"term_data";s:5:"field";s:4:"name";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:4:"path";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:8:"absolute";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"path";s:5:"table";s:4:"node";s:5:"field";s:4:"path";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:4:"body";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:1;s:10:"max_length";s:3:"150";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"body";s:5:"table";s:14:"node_revisions";s:5:"field";s:4:"body";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}}}');
INSERT INTO `views_display` VALUES (3, 'block_1', 'Block Home quarter first', 'block', 2, 'a:2:{s:7:"filters";a:2:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"1";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:36:"field_quarterfirst_value_many_to_one";a:11:{s:8:"operator";s:2:"or";s:5:"value";a:1:{s:1:"y";s:1:"y";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:36:"field_quarterfirst_value_many_to_one";s:5:"table";s:28:"node_data_field_quarterfirst";s:5:"field";s:36:"field_quarterfirst_value_many_to_one";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";s:17:"reduce_duplicates";i:0;}}s:8:"defaults";a:1:{s:7:"filters";b:0;}}');
INSERT INTO `views_display` VALUES (3, 'block_2', 'Block Home quarter second', 'block', 3, 'a:2:{s:7:"filters";a:2:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"1";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:37:"field_quartersecond_value_many_to_one";a:11:{s:8:"operator";s:2:"or";s:5:"value";a:1:{s:1:"y";s:1:"y";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:37:"field_quartersecond_value_many_to_one";s:5:"table";s:29:"node_data_field_quartersecond";s:5:"field";s:37:"field_quartersecond_value_many_to_one";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";s:17:"reduce_duplicates";i:0;}}s:8:"defaults";a:1:{s:7:"filters";b:0;}}');
INSERT INTO `views_display` VALUES (3, 'block_3', 'Block Home quarter third', 'block', 4, 'a:2:{s:7:"filters";a:2:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"1";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:36:"field_quarterthird_value_many_to_one";a:11:{s:8:"operator";s:2:"or";s:5:"value";a:1:{s:1:"y";s:1:"y";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:36:"field_quarterthird_value_many_to_one";s:5:"table";s:28:"node_data_field_quarterthird";s:5:"field";s:36:"field_quarterthird_value_many_to_one";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";s:17:"reduce_duplicates";i:0;}}s:8:"defaults";a:1:{s:7:"filters";b:0;}}');
INSERT INTO `views_display` VALUES (3, 'block_4', 'Block Home quarter fourth', 'block', 5, 'a:2:{s:7:"filters";a:2:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"1";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:37:"field_quarterfourth_value_many_to_one";a:11:{s:8:"operator";s:2:"or";s:5:"value";a:1:{s:1:"y";s:1:"y";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:37:"field_quarterfourth_value_many_to_one";s:5:"table";s:29:"node_data_field_quarterfourth";s:5:"field";s:37:"field_quarterfourth_value_many_to_one";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";s:17:"reduce_duplicates";i:0;}}s:8:"defaults";a:1:{s:7:"filters";b:0;}}');
INSERT INTO `views_display` VALUES (3, 'block_5', 'Block Home bottom first', 'block', 6, 'a:7:{s:6:"fields";a:6:{s:4:"body";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:1;s:10:"max_length";s:3:"500";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"body";s:5:"table";s:14:"node_revisions";s:5:"field";s:4:"body";s:12:"relationship";s:4:"none";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}}s:5:"title";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:1;s:7:"exclude";i:0;s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:12:"relationship";s:4:"none";}s:4:"path";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:8:"absolute";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"path";s:5:"table";s:4:"node";s:5:"field";s:4:"path";s:12:"relationship";s:4:"none";}s:7:"created";a:13:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:11:"date_format";s:5:"large";s:18:"custom_date_format";s:0:"";s:7:"exclude";i:0;s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:3:"uid";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_user";i:0;s:7:"exclude";i:0;s:2:"id";s:3:"uid";s:5:"table";s:5:"users";s:5:"field";s:3:"uid";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}s:15:"field_image_fid";a:15:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:0;s:10:"label_type";s:4:"none";s:6:"format";s:10:"path_plain";s:8:"multiple";a:4:{s:5:"group";b:1;s:15:"multiple_number";s:0:"";s:13:"multiple_from";s:0:"";s:17:"multiple_reversed";b:0;}s:7:"exclude";i:0;s:2:"id";s:15:"field_image_fid";s:5:"table";s:21:"node_data_field_image";s:5:"field";s:15:"field_image_fid";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}}s:8:"defaults";a:6:{s:6:"fields";b:0;s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;s:7:"filters";b:0;}s:14:"items_per_page";i:1;s:6:"offset";i:0;s:9:"use_pager";b:0;s:13:"pager_element";i:0;s:7:"filters";a:2:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"1";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:4:"type";a:10:{s:8:"operator";s:2:"in";s:5:"value";a:1:{s:4:"blog";s:4:"blog";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:4:"type";s:5:"table";s:4:"node";s:5:"field";s:4:"type";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}}}');
INSERT INTO `views_display` VALUES (3, 'block_7', 'Block Slide Show', 'block', 7, 'a:7:{s:7:"filters";a:2:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"1";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:33:"field_slideshow_value_many_to_one";a:11:{s:8:"operator";s:2:"or";s:5:"value";a:1:{s:1:"y";s:1:"y";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:33:"field_slideshow_value_many_to_one";s:5:"table";s:25:"node_data_field_slideshow";s:5:"field";s:33:"field_slideshow_value_many_to_one";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";s:17:"reduce_duplicates";i:0;}}s:8:"defaults";a:6:{s:7:"filters";b:0;s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;s:5:"sorts";b:0;}s:14:"items_per_page";i:10;s:6:"offset";i:0;s:9:"use_pager";b:0;s:13:"pager_element";i:0;s:5:"sorts";a:1:{s:6:"random";a:3:{s:2:"id";s:6:"random";s:5:"table";s:5:"views";s:5:"field";s:6:"random";}}}');
INSERT INTO `views_display` VALUES (3, 'block_8', 'Block Home top first', 'block', 8, 'a:3:{s:6:"fields";a:5:{s:4:"body";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:3:"200";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"body";s:5:"table";s:14:"node_revisions";s:5:"field";s:4:"body";s:12:"relationship";s:4:"none";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}}s:5:"title";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:1;s:7:"exclude";i:0;s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:12:"relationship";s:4:"none";}s:15:"field_image_fid";a:14:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:0;s:10:"label_type";s:4:"none";s:6:"format";s:10:"path_plain";s:8:"multiple";a:4:{s:5:"group";b:1;s:15:"multiple_number";s:0:"";s:13:"multiple_from";s:0:"";s:17:"multiple_reversed";b:0;}s:7:"exclude";i:0;s:2:"id";s:15:"field_image_fid";s:5:"table";s:21:"node_data_field_image";s:5:"field";s:15:"field_image_fid";s:12:"relationship";s:4:"none";}s:4:"path";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:8:"absolute";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"path";s:5:"table";s:4:"node";s:5:"field";s:4:"path";s:12:"relationship";s:4:"none";}s:4:"name";a:14:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_user";i:1;s:19:"overwrite_anonymous";i:0;s:14:"anonymous_text";s:0:"";s:7:"exclude";i:0;s:2:"id";s:4:"name";s:5:"table";s:5:"users";s:5:"field";s:4:"name";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}}s:8:"defaults";a:2:{s:6:"fields";b:0;s:7:"filters";b:0;}s:7:"filters";a:2:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"1";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:32:"field_topfirst_value_many_to_one";a:11:{s:8:"operator";s:2:"or";s:5:"value";a:1:{s:2:"on";s:2:"on";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:32:"field_topfirst_value_many_to_one";s:5:"table";s:24:"node_data_field_topfirst";s:5:"field";s:32:"field_topfirst_value_many_to_one";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";s:17:"reduce_duplicates";i:0;}}}');
INSERT INTO `views_display` VALUES (4, 'default', 'Defaults', 'default', 1, 'a:5:{s:6:"fields";a:2:{s:9:"timestamp";a:13:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:11:"date_format";s:6:"custom";s:18:"custom_date_format";s:5:"M j Y";s:7:"exclude";i:0;s:2:"id";s:9:"timestamp";s:5:"table";s:8:"comments";s:5:"field";s:9:"timestamp";s:12:"relationship";s:4:"none";s:8:"override";a:1:{s:6:"button";s:8:"Override";}}s:7:"subject";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:15:"link_to_comment";i:1;s:7:"exclude";i:0;s:2:"id";s:7:"subject";s:5:"table";s:8:"comments";s:5:"field";s:7:"subject";s:12:"relationship";s:4:"none";}}s:7:"filters";a:1:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"0";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:8:"comments";s:5:"field";s:6:"status";s:12:"relationship";s:4:"none";s:8:"override";a:1:{s:6:"button";s:8:"Override";}}}s:5:"sorts";a:1:{s:9:"timestamp";a:6:{s:5:"order";s:4:"DESC";s:11:"granularity";s:6:"second";s:2:"id";s:9:"timestamp";s:5:"table";s:8:"comments";s:5:"field";s:9:"timestamp";s:12:"relationship";s:4:"none";}}s:14:"items_per_page";i:5;s:6:"offset";i:0;}');
INSERT INTO `views_display` VALUES (3, 'page_1', 'Page News', 'page', 10, 'a:12:{s:5:"title";s:4:"News";s:8:"defaults";a:10:{s:5:"title";b:0;s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;s:12:"style_plugin";b:0;s:13:"style_options";b:0;s:10:"row_plugin";b:0;s:11:"row_options";b:0;s:7:"filters";b:0;}s:14:"items_per_page";i:10;s:6:"offset";i:0;s:9:"use_pager";s:1:"1";s:13:"pager_element";i:0;s:4:"path";s:4:"news";s:12:"style_plugin";s:7:"default";s:13:"style_options";a:0:{}s:10:"row_plugin";s:4:"node";s:11:"row_options";a:4:{s:12:"relationship";s:4:"none";s:10:"build_mode";s:6:"teaser";s:5:"links";i:1;s:8:"comments";i:0;}s:7:"filters";a:2:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"1";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:4:"type";a:10:{s:8:"operator";s:2:"in";s:5:"value";a:1:{s:5:"story";s:5:"story";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:4:"type";s:5:"table";s:4:"node";s:5:"field";s:4:"type";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}}}');
INSERT INTO `views_display` VALUES (3, 'block_9', 'Block News', 'block', 9, 'a:7:{s:6:"fields";a:4:{s:4:"body";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:1;s:10:"max_length";s:3:"160";s:13:"word_boundary";i:1;s:8:"ellipsis";i:0;s:4:"html";i:0;s:10:"strip_tags";i:1;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"body";s:5:"table";s:14:"node_revisions";s:5:"field";s:4:"body";s:12:"relationship";s:4:"none";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}}s:5:"title";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:1;s:7:"exclude";i:0;s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:12:"relationship";s:4:"none";}s:4:"path";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:8:"absolute";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"path";s:5:"table";s:4:"node";s:5:"field";s:4:"path";s:12:"relationship";s:4:"none";}s:7:"created";a:13:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:11:"date_format";s:5:"small";s:18:"custom_date_format";s:0:"";s:7:"exclude";i:0;s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}}s:8:"defaults";a:6:{s:6:"fields";b:0;s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;s:7:"filters";b:0;}s:14:"items_per_page";i:3;s:6:"offset";i:0;s:9:"use_pager";b:0;s:13:"pager_element";i:0;s:7:"filters";a:2:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"1";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:4:"type";a:10:{s:8:"operator";s:2:"in";s:5:"value";a:1:{s:5:"story";s:5:"story";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:4:"type";s:5:"table";s:4:"node";s:5:"field";s:4:"type";s:8:"override";a:1:{s:6:"button";s:11:"Use default";}s:12:"relationship";s:4:"none";}}}');
INSERT INTO `views_display` VALUES (3, 'default', 'Defaults', 'default', 1, 'a:5:{s:6:"fields";a:4:{s:4:"body";a:10:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:1;s:10:"max_length";s:3:"120";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:1;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"body";s:5:"table";s:14:"node_revisions";s:5:"field";s:4:"body";s:12:"relationship";s:4:"none";}s:5:"title";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:1;s:7:"exclude";i:0;s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:12:"relationship";s:4:"none";}s:15:"field_image_fid";a:14:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:0;s:10:"label_type";s:4:"none";s:6:"format";s:10:"path_plain";s:8:"multiple";a:4:{s:5:"group";b:1;s:15:"multiple_number";s:0:"";s:13:"multiple_from";s:0:"";s:17:"multiple_reversed";b:0;}s:7:"exclude";i:0;s:2:"id";s:15:"field_image_fid";s:5:"table";s:21:"node_data_field_image";s:5:"field";s:15:"field_image_fid";s:12:"relationship";s:4:"none";}s:4:"path";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:8:"absolute";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"path";s:5:"table";s:4:"node";s:5:"field";s:4:"path";s:12:"relationship";s:4:"none";}}s:5:"sorts";a:1:{s:7:"created";a:6:{s:5:"order";s:4:"DESC";s:11:"granularity";s:6:"second";s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:12:"relationship";s:4:"none";}}s:7:"filters";a:1:{s:6:"status";a:10:{s:8:"operator";s:1:"=";s:5:"value";s:1:"1";s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:6:"status";s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}}s:14:"items_per_page";i:1;s:6:"offset";i:0;}');
INSERT INTO `views_display` VALUES (2, 'default', 'Defaults', 'default', 1, 'a:14:{s:5:"sorts";a:2:{s:6:"sticky";a:5:{s:2:"id";s:6:"sticky";s:5:"table";s:4:"node";s:5:"field";s:6:"sticky";s:5:"order";s:4:"DESC";s:12:"relationship";s:4:"none";}s:7:"created";a:6:{s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:5:"order";s:4:"DESC";s:11:"granularity";s:6:"second";s:12:"relationship";s:4:"none";}}s:8:"defaults";a:12:{s:5:"sorts";b:0;s:9:"arguments";b:0;s:7:"filters";b:0;s:6:"access";b:0;s:14:"items_per_page";b:0;s:6:"offset";b:0;s:9:"use_pager";b:0;s:13:"pager_element";b:0;s:12:"style_plugin";b:0;s:13:"style_options";b:0;s:10:"row_plugin";b:0;s:11:"row_options";b:0;}s:9:"arguments";a:2:{s:19:"term_node_tid_depth";a:34:{s:14:"default_action";s:9:"not found";s:12:"style_plugin";s:15:"default_summary";s:13:"style_options";a:3:{s:5:"count";b:1;s:8:"override";b:0;s:14:"items_per_page";i:25;}s:8:"wildcard";s:3:"all";s:21:"wildcard_substitution";s:3:"All";s:5:"title";s:14:"Portfolio - %1";s:10:"breadcrumb";s:0:"";s:21:"default_argument_type";s:5:"fixed";s:16:"default_argument";s:0:"";s:13:"validate_type";s:13:"taxonomy_term";s:13:"validate_fail";s:9:"not found";s:5:"depth";s:1:"0";s:12:"break_phrase";i:1;s:14:"set_breadcrumb";i:0;s:22:"use_taxonomy_term_path";i:0;s:2:"id";s:19:"term_node_tid_depth";s:5:"table";s:4:"node";s:5:"field";s:19:"term_node_tid_depth";s:12:"relationship";s:4:"none";s:22:"default_argument_fixed";s:0:"";s:20:"default_argument_php";s:0:"";s:27:"validate_argument_node_type";a:4:{s:4:"blog";i:0;s:4:"page";i:0;s:9:"portfolio";i:0;s:5:"story";i:0;}s:28:"validate_argument_vocabulary";a:1:{i:1;i:0;}s:22:"validate_argument_type";s:4:"tids";s:21:"validate_argument_php";s:0:"";s:27:"validate_user_argument_type";s:3:"uid";s:19:"validate_user_roles";a:1:{i:2;i:0;}s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:26:"default_options_div_prefix";s:0:"";s:21:"default_argument_user";i:0;s:29:"validate_argument_node_access";i:0;s:26:"validate_argument_nid_type";s:3:"nid";s:27:"validate_argument_transform";i:0;s:28:"validate_user_restrict_roles";i:0;}s:28:"term_node_tid_depth_modifier";a:13:{s:2:"id";s:28:"term_node_tid_depth_modifier";s:5:"table";s:4:"node";s:5:"field";s:28:"term_node_tid_depth_modifier";s:14:"default_action";s:6:"ignore";s:12:"style_plugin";s:15:"default_summary";s:13:"style_options";a:3:{s:5:"count";b:1;s:8:"override";b:0;s:14:"items_per_page";i:25;}s:8:"wildcard";s:3:"all";s:21:"wildcard_substitution";s:3:"All";s:5:"title";s:0:"";s:21:"default_argument_type";s:5:"fixed";s:16:"default_argument";s:0:"";s:13:"validate_type";s:4:"none";s:13:"validate_fail";s:9:"not found";}}s:7:"filters";a:2:{s:12:"status_extra";a:9:{s:2:"id";s:12:"status_extra";s:5:"table";s:4:"node";s:5:"field";s:12:"status_extra";s:8:"operator";s:1:"=";s:5:"value";s:0:"";s:5:"group";i:0;s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:12:"relationship";s:4:"none";}s:4:"type";a:10:{s:8:"operator";s:2:"in";s:5:"value";a:1:{s:9:"portfolio";s:9:"portfolio";}s:5:"group";s:1:"0";s:7:"exposed";b:0;s:6:"expose";a:2:{s:8:"operator";b:0;s:5:"label";s:0:"";}s:2:"id";s:4:"type";s:5:"table";s:4:"node";s:5:"field";s:4:"type";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}}s:6:"access";a:3:{s:4:"type";s:4:"none";s:4:"role";a:0:{}s:4:"perm";s:0:"";}s:14:"items_per_page";i:12;s:6:"offset";i:0;s:9:"use_pager";s:1:"1";s:13:"pager_element";i:0;s:12:"style_plugin";s:7:"default";s:13:"style_options";a:0:{}s:10:"row_plugin";s:4:"node";s:11:"row_options";a:2:{s:6:"teaser";b:1;s:5:"links";b:1;}s:6:"fields";a:6:{s:7:"created";a:13:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:11:"date_format";s:5:"large";s:18:"custom_date_format";s:0:"";s:7:"exclude";i:0;s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:5:"title";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:1;s:7:"exclude";i:0;s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:15:"field_image_fid";a:15:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:12:"link_to_node";i:0;s:10:"label_type";s:4:"none";s:6:"format";s:10:"path_plain";s:8:"multiple";a:4:{s:5:"group";b:1;s:15:"multiple_number";s:0:"";s:13:"multiple_from";s:0:"";s:17:"multiple_reversed";b:0;}s:7:"exclude";i:0;s:2:"id";s:15:"field_image_fid";s:5:"table";s:21:"node_data_field_image";s:5:"field";s:15:"field_image_fid";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:4:"name";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"link_to_taxonomy";i:1;s:7:"exclude";i:0;s:2:"id";s:4:"name";s:5:"table";s:9:"term_data";s:5:"field";s:4:"name";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:4:"path";a:12:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:8:"absolute";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"path";s:5:"table";s:4:"node";s:5:"field";s:4:"path";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}s:4:"body";a:11:{s:5:"label";s:0:"";s:5:"alter";a:16:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:10:"link_class";s:0:"";s:3:"alt";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:4:"help";s:0:"";s:4:"trim";i:1;s:10:"max_length";s:3:"150";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:4:"html";i:0;s:10:"strip_tags";i:0;}s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:7:"exclude";i:0;s:2:"id";s:4:"body";s:5:"table";s:14:"node_revisions";s:5:"field";s:4:"body";s:8:"override";a:1:{s:6:"button";s:8:"Override";}s:12:"relationship";s:4:"none";}}}');
INSERT INTO `views_display` VALUES (4, 'block_1', 'Block Recent comments', 'block', 2, 'a:0:{}');
DROP TABLE IF EXISTS `views_object_cache`;
CREATE TABLE `views_object_cache` (
  `sid` varchar(64) default NULL,
  `name` varchar(32) default NULL,
  `obj` varchar(32) default NULL,
  `updated` int(10) unsigned NOT NULL default '0',
  `data` longtext,
  KEY `sid_obj_name` (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `views_view`;
CREATE TABLE `views_view` (
  `vid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL default '',
  `description` varchar(255) default '',
  `tag` varchar(255) default '',
  `view_php` blob,
  `base_table` varchar(64) NOT NULL default '',
  `is_cacheable` tinyint(4) default '0',
  PRIMARY KEY  (`vid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;
INSERT INTO `views_view` VALUES (1, 'blogs', 'A view to emulate Drupal core''s handling of blog;', 'default', '', 'node', 0);
INSERT INTO `views_view` VALUES (2, 'taxonomy_term', 'A view to emulate Drupal core''s handling of taxonomy/term; it also emulates Views 1''s handling by having two possible feeds.', 'default', '', 'node', 0);
INSERT INTO `views_view` VALUES (3, 'home_blocks', '', '', '', 'node', 0);
INSERT INTO `views_view` VALUES (4, 'comments', '', '', '', 'comments', 0);
DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE `vocabulary` (
  `vid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` longtext,
  `help` varchar(255) NOT NULL default '',
  `relations` tinyint(3) unsigned NOT NULL default '0',
  `hierarchy` tinyint(3) unsigned NOT NULL default '0',
  `multiple` tinyint(3) unsigned NOT NULL default '0',
  `required` tinyint(3) unsigned NOT NULL default '0',
  `tags` tinyint(3) unsigned NOT NULL default '0',
  `module` varchar(255) NOT NULL default '',
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `list` (`weight`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;
INSERT INTO `vocabulary` VALUES (1, 'Categories', '', '', 1, 0, 0, 0, 1, 'taxonomy', 0);
INSERT INTO `vocabulary` VALUES (2, 'Newsletter', NULL, '', 0, 0, 0, 1, 0, 'simplenews', 0);
DROP TABLE IF EXISTS `vocabulary_node_types`;
CREATE TABLE `vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`type`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `vocabulary_node_types` VALUES (1, 'blog');
DROP TABLE IF EXISTS `watchdog`;
CREATE TABLE `watchdog` (
  `wid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `type` varchar(16) NOT NULL default '',
  `message` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL default '0',
  `link` varchar(255) NOT NULL default '',
  `location` text NOT NULL,
  `referer` text,
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wid`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
