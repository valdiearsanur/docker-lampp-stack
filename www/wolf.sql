-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2018 at 10:16 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wolf`
--

-- --------------------------------------------------------

--
-- Table structure for table `cron`
--

CREATE TABLE `cron` (
  `id` int(11) UNSIGNED NOT NULL,
  `lastrun` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cron`
--

INSERT INTO `cron` (`id`, `lastrun`) VALUES
(1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `layout`
--

CREATE TABLE `layout` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `content_type` varchar(80) DEFAULT NULL,
  `content` text,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `position` mediumint(6) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `layout`
--

INSERT INTO `layout` (`id`, `name`, `content_type`, `content`, `created_on`, `updated_on`, `created_by_id`, `updated_by_id`, `position`) VALUES
(2, 'Team Hore', 'text/html', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-GB">\r\n\r\n<head>\r\n	<title><?php echo $this->title(); ?></title>\r\n\r\n  <meta http-equiv="content-type" content="application/xhtml+xml; charset=utf-8" />\r\n  <meta name="robots" content="index, follow" />\r\n  <meta name="description" content="<?php echo ($this->description() != '''') ? $this->description() : ''Default description goes here''; ?>" />\r\n  <meta name="keywords" content="<?php echo ($this->keywords() != '''') ? $this->keywords() : ''default, keywords, here''; ?>" />\r\n  <meta name="author" content="Author Name" />\r\n\r\n  <link rel="favourites icon" href="<?php echo THEMES_PATH; ?>simple/images/favicon.ico" />\r\n\r\n  <!-- Adapted from Matthew James Taylor''s "Holy Grail 3 column liquid-layout" = http://bit.ly/ejfjq -->\r\n  <!-- No snippets used; but snippet blocks for header, secondary nav, and footer are indicated -->\r\n\r\n  <link rel="stylesheet" href="<?php echo THEMES_PATH; ?>wolf/screen.css" media="screen" type="text/css" />\r\n  <link rel="stylesheet" href="<?php echo THEMES_PATH; ?>wolf/print.css" media="print" type="text/css" />\r\n  <link rel="alternate" type="application/rss+xml" title="Wolf Default RSS Feed" href="<?php echo URL_PUBLIC.((USE_MOD_REWRITE)?'''':''/?''); ?>rss.xml" />\r\n\r\n</head>\r\n<body>\r\n\r\n<!-- HEADER - COULD BE SNIPPET / START -->\r\n<div id="header">\r\n	<h1><a href="<?php echo URL_PUBLIC; ?>">Team Hore</a><span class="tagline">Upload File Management System</span></h1>\r\n</div><!-- / #header -->\r\n<div id="nav">\r\n	<ul>\r\n      <li><a<?php echo url_match(''/'') ? '' class="current"'': ''''; ?> href="<?php echo URL_PUBLIC; ?>">Home</a></li>\r\n<?php foreach($this->find(''/'')->children() as $menu): ?>\r\n      <li><?php echo $menu->link($menu->title, (in_array($menu->slug, explode(''/'', $this->path())) ? '' class="current"'': null)); ?></li>\r\n<?php endforeach; ?> \r\n	</ul>\r\n</div><!-- / #nav -->\r\n<!-- HEADER / END -->\r\n\r\n<div id="colmask"><div id="colmid"><div id="colright"><!-- = outer nested divs -->\r\n\r\n	<div id="col1wrap"><div id="col1pad"><!-- = inner/col1 nested divs -->\r\n\r\n		<div id="col1">\r\n		<!-- Column 1 start = main content -->\r\n\r\n<h2><?php echo $this->title(); ?></h2>\r\n\r\n  <?php echo $this->content(); ?> \r\n  <?php if ($this->hasContent(''extended'')) echo $this->content(''extended''); ?> \r\n\r\n		<!-- Column 1 end -->\r\n		</div><!-- / #col1 -->\r\n	\r\n	<!-- end inner/col1 nested divs -->\r\n	</div><!-- / #col1pad --></div><!-- / #col1wrap -->\r\n\r\n		<div id="col2">\r\n		<!-- Column 2 start = left/running sidebar -->\r\n\r\n  <?php echo $this->content(''sidebar'', true); ?> \r\n\r\n		<!-- Column 2 end -->\r\n		</div><!-- / #col2 -->\r\n\r\n		<div id="col3">\r\n		<!-- Column 3 start = right/secondary nav sidebar -->\r\n\r\n<!-- THIS CONDITIONAL NAVIGATION COULD GO INTO A SNIPPET / START -->\r\n<?php if ($this->level() > 0) { $slugs = explode(''/'', CURRENT_PATH); $parent = reset($slugs); $topPage = $this->find($parent); } ?>\r\n<?php if(isset($topPage) && $topPage != '''' && $topPage != null) : ?>\r\n\r\n<?php if ($this->level() > 0) : ?>\r\n<?php if (count($topPage->children()) > 0 && $topPage->slug() != ''articles'') : ?>\r\n<h2><?php echo $topPage->title(); ?> Menu</h2>\r\n<ul>\r\n<?php foreach ($topPage->children() as $subPage): ?>\r\n    <li><?php echo $subPage->link($subPage->title, (url_start_with($subPage->path()) ? '' class="current"'': null)); ?></li>\r\n<?php endforeach; ?>\r\n</ul>\r\n<?php endif; ?>\r\n<?php endif; ?>\r\n<?php endif; ?>\r\n<!-- CONDITIONAL NAVIGATION / END -->\r\n\r\n		<!-- Column 3 end -->\r\n		</div><!-- / #col3 -->\r\n\r\n<!-- end outer nested divs -->\r\n</div><!-- / #colright --></div><!-- /colmid # --></div><!-- / #colmask -->\r\n\r\n<!-- FOOTER - COULD BE SNIPPET / START -->\r\n<div id="footer">\r\n\r\n  <p>&copy; Copyright <?php echo date(''Y''); ?> <a href="#" title="Wolf">Team Hore Group</a><br />\r\n  <a href="#" title="#">In Team Hore We Trust</a> Inside.\r\n  </p>\r\n  \r\n</div><!-- / #footer -->\r\n<!-- FOOTER / END -->\r\n\r\n</body>\r\n</html>', '2018-05-29 08:00:36', '2018-05-29 08:14:54', 1, 1, NULL),
(4, 'RSS XML', 'application/rss+xml', '<?php echo $this->content(); ?>', '2018-05-29 08:00:40', '2018-05-29 08:00:41', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(100) NOT NULL DEFAULT '',
  `breadcrumb` varchar(160) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  `parent_id` int(11) UNSIGNED DEFAULT NULL,
  `layout_id` int(11) UNSIGNED DEFAULT NULL,
  `behavior_id` varchar(25) NOT NULL DEFAULT '',
  `status_id` int(11) UNSIGNED NOT NULL DEFAULT '100',
  `created_on` datetime DEFAULT NULL,
  `published_on` datetime DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `position` mediumint(6) UNSIGNED DEFAULT '0',
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `needs_login` tinyint(1) NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `title`, `slug`, `breadcrumb`, `keywords`, `description`, `parent_id`, `layout_id`, `behavior_id`, `status_id`, `created_on`, `published_on`, `valid_until`, `updated_on`, `created_by_id`, `updated_by_id`, `position`, `is_protected`, `needs_login`) VALUES
(1, 'Team Hore Page', '', 'Home Page', NULL, NULL, 0, 2, '', 100, '2018-05-29 08:00:42', '2018-05-29 08:00:43', NULL, '2018-05-29 08:13:04', 1, 1, 0, 1, 0),
(2, 'RSS Feed', 'rss.xml', 'RSS Feed', NULL, NULL, 1, 4, '', 101, '2018-05-29 08:00:45', '2018-05-29 08:00:46', NULL, '2018-05-29 08:00:47', 1, 1, 2, 1, 0),
(3, 'About us', 'about-us', 'About us', NULL, NULL, 1, 0, '', 100, '2018-05-29 08:00:48', '2018-05-29 08:00:49', NULL, '2018-05-29 08:00:50', 1, 1, 0, 0, 2),
(4, 'Articles', 'articles', 'Articles', NULL, NULL, 1, 0, 'archive', 100, '2018-05-29 08:00:51', '2018-05-29 08:00:52', NULL, '2018-05-29 08:00:53', 1, 1, 1, 1, 2),
(6, 'Mata Pelajaran A', 'my-second-article', 'My second article', NULL, NULL, 4, 0, '', 100, '2018-05-29 08:00:57', '2018-05-29 08:00:58', NULL, '2018-05-29 08:11:19', 1, 2, 0, 0, 2),
(7, '%B %Y archive', 'monthly-archive', '%B %Y archive', NULL, NULL, 4, 0, 'archive_month_index', 101, '2018-05-29 08:01:00', '2018-05-29 08:01:01', NULL, '2018-05-29 08:01:02', 1, 1, 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `page_part`
--

CREATE TABLE `page_part` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `filter_id` varchar(25) DEFAULT NULL,
  `content` longtext,
  `content_html` longtext,
  `page_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page_part`
--

INSERT INTO `page_part` (`id`, `name`, `filter_id`, `content`, `content_html`, `page_id`) VALUES
(1, 'body', NULL, '<?php \r\n\r\n$page_article = $this->find(''/articles/'');\r\n\r\nif ($page_article->childrenCount() > 0) {\r\n    $last_article = $page_article->children(array(''limit''=>1, ''order''=>''page.created_on DESC''));\r\n    $last_articles = $page_article->children(array(''limit''=>4, ''offset'' => 1, ''order''=>''page.created_on DESC''));\r\n?>\r\n<div class="first entry">\r\n  <h3><?php echo $last_article->link(); ?></h3>\r\n  <?php echo $last_article->content(); ?>\r\n  <?php if ($last_article->hasContent(''extended'')) echo $last_article->link(''Continue Reading&#8230;''); ?>\r\n  <p class="info">Posted by <?php echo $last_article->author(); ?> on <?php echo $last_article->date(); ?></p>\r\n</div>\r\n\r\n<?php foreach ($last_articles as $article): ?>\r\n<div class="entry">\r\n  <h3><?php echo $article->link(); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <?php if ($article->hasContent(''extended'')) echo $article->link(''Continue Reading&#8230;''); ?>\r\n  <p class="info">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?></p>\r\n</div>\r\n\r\n<?php\r\n    endforeach; \r\n}\r\n?>', '<?php \r\n\r\n$page_article = $this->find(''/articles/'');\r\n\r\nif ($page_article->childrenCount() > 0) {\r\n    $last_article = $page_article->children(array(''limit''=>1, ''order''=>''page.created_on DESC''));\r\n    $last_articles = $page_article->children(array(''limit''=>4, ''offset'' => 1, ''order''=>''page.created_on DESC''));\r\n?>\r\n<div class="first entry">\r\n  <h3><?php echo $last_article->link(); ?></h3>\r\n  <?php echo $last_article->content(); ?>\r\n  <?php if ($last_article->hasContent(''extended'')) echo $last_article->link(''Continue Reading&#8230;''); ?>\r\n  <p class="info">Posted by <?php echo $last_article->author(); ?> on <?php echo $last_article->date(); ?></p>\r\n</div>\r\n\r\n<?php foreach ($last_articles as $article): ?>\r\n<div class="entry">\r\n  <h3><?php echo $article->link(); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <?php if ($article->hasContent(''extended'')) echo $article->link(''Continue Reading&#8230;''); ?>\r\n  <p class="info">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?></p>\r\n</div>\r\n\r\n<?php\r\n    endforeach; \r\n}\r\n?>', 1),
(2, 'body', '', '<?php echo ''<?''; ?>xml version="1.0" encoding="UTF-8"<?php echo ''?>''; ?> \r\n<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">\r\n<channel>\r\n	<title>Wolf CMS</title>\r\n	<link><?php echo BASE_URL ?></link>\r\n	<atom:link href="<?php echo BASE_URL ?>rss.xml" rel="self" type="application/rss+xml" />\r\n	<language>en-us</language>\r\n	<copyright>Copyright <?php echo date(''Y''); ?>, wolfcms.org</copyright>\r\n	<pubDate><?php echo strftime(''%a, %d %b %Y %H:%M:%S %z''); ?></pubDate>\r\n	<lastBuildDate><?php echo strftime(''%a, %d %b %Y %H:%M:%S %z''); ?></lastBuildDate>\r\n	<category>any</category>\r\n	<generator>Wolf CMS</generator>\r\n	<description>The main news feed from Wolf CMS.</description>\r\n	<docs>http://www.rssboard.org/rss-specification</docs>\r\n	<?php $articles = $this->find(''articles''); ?>\r\n	<?php foreach ($articles->children(array(''limit'' => 10, ''order'' => ''page.created_on DESC'')) as $article): ?>\r\n	<item>\r\n		<title><?php echo $article->title(); ?></title>\r\n		<description><?php if ($article->hasContent(''summary'')) { echo $article->content(''summary''); } else { echo strip_tags($article->content()); } ?></description>\r\n		<pubDate><?php echo $article->date(''%a, %d %b %Y %H:%M:%S %z''); ?></pubDate>\r\n		<link><?php echo $article->url(); ?></link>\r\n		<guid><?php echo $article->url(); ?></guid>\r\n	</item>\r\n	<?php endforeach; ?>\r\n</channel>\r\n</rss>', '<?php echo ''<?''; ?>xml version="1.0" encoding="UTF-8"<?php echo ''?>''; ?> \r\n<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">\r\n<channel>\r\n	<title>Wolf CMS</title>\r\n	<link><?php echo BASE_URL ?></link>\r\n	<atom:link href="<?php echo BASE_URL ?>rss.xml" rel="self" type="application/rss+xml" />\r\n	<language>en-us</language>\r\n	<copyright>Copyright <?php echo date(''Y''); ?>, wolfcms.org</copyright>\r\n	<pubDate><?php echo strftime(''%a, %d %b %Y %H:%M:%S %z''); ?></pubDate>\r\n	<lastBuildDate><?php echo strftime(''%a, %d %b %Y %H:%M:%S %z''); ?></lastBuildDate>\r\n	<category>any</category>\r\n	<generator>Wolf CMS</generator>\r\n	<description>The main news feed from Wolf CMS.</description>\r\n	<docs>http://www.rssboard.org/rss-specification</docs>\r\n	<?php $articles = $this->find(''articles''); ?>\r\n	<?php foreach ($articles->children(array(''limit'' => 10, ''order'' => ''page.created_on DESC'')) as $article): ?>\r\n	<item>\r\n		<title><?php echo $article->title(); ?></title>\r\n		<description><?php if ($article->hasContent(''summary'')) { echo $article->content(''summary''); } else { echo strip_tags($article->content()); } ?></description>\r\n		<pubDate><?php echo $article->date(''%a, %d %b %Y %H:%M:%S %z''); ?></pubDate>\r\n		<link><?php echo $article->url(); ?></link>\r\n		<guid><?php echo $article->url(); ?></guid>\r\n	</item>\r\n	<?php endforeach; ?>\r\n</channel>\r\n</rss>', 2),
(3, 'body', 'textile', 'This is my site. I live in this city ... I do some nice things, like this and that ...', '<p>This is my site. I live in this city &#8230; I do some nice things, like this and that &#8230;</p>', 3),
(4, 'body', '', '<?php $last_articles = $this->children(array(''limit''=>5, ''order''=>''page.created_on DESC'')); ?>\r\n<?php foreach ($last_articles as $article): ?>\r\n<div class="entry">\r\n  <h3><?php echo $article->link($article->title); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <p class="info">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?>  \r\n     <br />tags: <?php echo join('', '', $article->tags()); ?>\r\n  </p>\r\n</div>\r\n<?php endforeach; ?>\r\n\r\n', '<?php $last_articles = $this->children(array(''limit''=>5, ''order''=>''page.created_on DESC'')); ?>\r\n<?php foreach ($last_articles as $article): ?>\r\n<div class="entry">\r\n  <h3><?php echo $article->link($article->title); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <p class="info">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?>  \r\n     <br />tags: <?php echo join('', '', $article->tags()); ?>\r\n  </p>\r\n</div>\r\n<?php endforeach; ?>\r\n\r\n', 4),
(7, 'body', 'markdown', 'Kalian bisa download mata pelajaran disini \r\n\r\n[kambing](http://localhost/repoo/public/kambing/ "kambing")', '<p>Kalian bisa download mata pelajaran disini</p>\n\n<p><a href="http://localhost/repoo/public/kambing/" title="kambing">kambing</a></p>\n', 6),
(8, 'body', '', '<?php $archives = $this->archive->get(); ?>\r\n<?php foreach ($archives as $archive): ?>\r\n<div class="entry">\r\n  <h3><?php echo $archive->link(); ?></h3>\r\n  <p class="info">Posted by <?php echo $archive->author(); ?> on <?php echo $archive->date(); ?> \r\n  </p>\r\n</div>\r\n<?php endforeach; ?>', '<?php $archives = $this->archive->get(); ?>\r\n<?php foreach ($archives as $archive): ?>\r\n<div class="entry">\r\n  <h3><?php echo $archive->link(); ?></h3>\r\n  <p class="info">Posted by <?php echo $archive->author(); ?> on <?php echo $archive->date(); ?> \r\n  </p>\r\n</div>\r\n<?php endforeach; ?>', 7),
(9, 'sidebar', NULL, '<h3>About Me</h3>\r\n\r\n<p>I''m just a demonstration of how easy it is to use Wolf CMS to power a blog. <a href="<?php echo BASE_URL; ?>about-us/">more ...</a></p>\r\n\r\n<h3>Favorite Sites</h3>\r\n<ul>\r\n  <li><a href="http://www.wolfcms.org">Team Hore</a></li>\r\n</ul>\r\n\r\n<?php if(url_match(''/'')): ?>\r\n<h3>Recent Entries</h3>\r\n<?php $page_article = $this->find(''/articles/''); ?>\r\n<ul>\r\n<?php foreach ($page_article->children(array(''limit'' => 10, ''order'' => ''page.created_on DESC'')) as $article): ?>\r\n  <li><?php echo $article->link(); ?></li> \r\n<?php endforeach; ?>\r\n</ul>\r\n<?php endif; ?>\r\n\r\n<p><a href="<?php echo BASE_URL; ?>articles/">Archives</a></p>\r\n\r\n<h3>Syndicate</h3>\r\n\r\n<p><a href="<?php echo BASE_URL; ?>rss.xml">Articles RSS Feed</a></p>', '<h3>About Me</h3>\r\n\r\n<p>I''m just a demonstration of how easy it is to use Wolf CMS to power a blog. <a href="<?php echo BASE_URL; ?>about-us/">more ...</a></p>\r\n\r\n<h3>Favorite Sites</h3>\r\n<ul>\r\n  <li><a href="http://www.wolfcms.org">Team Hore</a></li>\r\n</ul>\r\n\r\n<?php if(url_match(''/'')): ?>\r\n<h3>Recent Entries</h3>\r\n<?php $page_article = $this->find(''/articles/''); ?>\r\n<ul>\r\n<?php foreach ($page_article->children(array(''limit'' => 10, ''order'' => ''page.created_on DESC'')) as $article): ?>\r\n  <li><?php echo $article->link(); ?></li> \r\n<?php endforeach; ?>\r\n</ul>\r\n<?php endif; ?>\r\n\r\n<p><a href="<?php echo BASE_URL; ?>articles/">Archives</a></p>\r\n\r\n<h3>Syndicate</h3>\r\n\r\n<p><a href="<?php echo BASE_URL; ?>rss.xml">Articles RSS Feed</a></p>', 1),
(10, 'sidebar', '', '<?php $article = $this->find(''articles''); ?>\r\n<?php $archives = $article->archive->archivesByMonth(); ?>\r\n\r\n<h3>Archives By Month</h3>\r\n<ul>\r\n<?php foreach ($archives as $date): ?>\r\n  <li><a href="<?php echo $this->url(false) .''/''. $date . URL_SUFFIX; ?>"><?php echo strftime(''%B %Y'', strtotime(strtr($date, ''/'', ''-''))); ?></a></li>\r\n<?php endforeach; ?>\r\n</ul>', '<?php $article = $this->find(''articles''); ?>\r\n<?php $archives = $article->archive->archivesByMonth(); ?>\r\n\r\n<h3>Archives By Month</h3>\r\n<ul>\r\n<?php foreach ($archives as $date): ?>\r\n  <li><a href="<?php echo $this->url(false) .''/''. $date . URL_SUFFIX; ?>"><?php echo strftime(''%B %Y'', strtotime(strtr($date, ''/'', ''-''))); ?></a></li>\r\n<?php endforeach; ?>\r\n</ul>', 4);

-- --------------------------------------------------------

--
-- Table structure for table `page_tag`
--

CREATE TABLE `page_tag` (
  `page_id` int(11) UNSIGNED NOT NULL,
  `tag_id` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`) VALUES
(1, 'admin_view'),
(2, 'admin_edit'),
(3, 'user_view'),
(4, 'user_add'),
(5, 'user_edit'),
(6, 'user_delete'),
(7, 'layout_view'),
(8, 'layout_add'),
(9, 'layout_edit'),
(10, 'layout_delete'),
(11, 'snippet_view'),
(12, 'snippet_add'),
(13, 'snippet_edit'),
(14, 'snippet_delete'),
(15, 'page_view'),
(16, 'page_add'),
(17, 'page_edit'),
(18, 'page_delete'),
(19, 'file_manager_view'),
(20, 'file_manager_upload'),
(21, 'file_manager_mkdir'),
(22, 'file_manager_mkfile'),
(23, 'file_manager_rename'),
(24, 'file_manager_chmod'),
(25, 'file_manager_delete'),
(26, 'backup_restore_view');

-- --------------------------------------------------------

--
-- Table structure for table `plugin_settings`
--

CREATE TABLE `plugin_settings` (
  `plugin_id` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugin_settings`
--

INSERT INTO `plugin_settings` (`plugin_id`, `name`, `value`) VALUES
('archive', 'use_dates', '1'),
('file_manager', 'umask', '0022'),
('file_manager', 'dirmode', '0755'),
('file_manager', 'filemode', '0644'),
('file_manager', 'show_hidden', '0'),
('file_manager', 'show_backups', '1');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'administrator'),
(2, 'developer'),
(3, 'editor');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(2, 1),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(3, 1),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25);

-- --------------------------------------------------------

--
-- Table structure for table `secure_token`
--

CREATE TABLE `secure_token` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(40) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `secure_token`
--

INSERT INTO `secure_token` (`id`, `username`, `url`, `time`) VALUES
(1, 'admin', 'ba91b5e9931f9f44cf706c14c7372c68775ba5e139dc79382f4584329871d377', '1527581584.3972'),
(2, 'admin', '9ec4f86a418a50bb097f5078c47bc2e2a02475331707a33ba5e4561e81d79a6e', '1527581584.3982'),
(3, 'admin', '61cd1a04a7e27c5412ab7979fe3f9fccbb2276bace090cbbc27be3966456c278', '1527581584.3992'),
(4, 'admin', '3a4bab11e7449d532e6dda3a9ca8056f8432b9adf6f2759be0ade38d04506356', '1527581694.5118'),
(5, 'admin', '4618d88a68586719bc26c0c921dd8d550c6a0323843e71f4029e18cb5c4ae9dc', '1527581563.6505'),
(6, 'admin', '1f253a1ac38259062259b5f7737ab72ec90866dde5c0d62a81552c65c4cde382', '1527581605.1729'),
(7, 'admin', 'd9126df6a5d376f97019ade36a1de0f0e65f86d40072262b724c5311674aec0e', '1527581600.85'),
(8, 'admin', '004ed73627b76f3f04f0b8c16b83dc1968bb9adab719c112c1c24a971b004313', '1527581600.8521'),
(9, 'admin', '2ba4dd74f89becacc3df2194dc357886505c2243140eb9ed5e29ef1923ed4ea4', '1527581600.8529'),
(10, 'admin', 'af7a408afd986093d55b303d5cf412c99b49bad0cf06c449f2cc43a512a6f684', '1527581600.8537'),
(11, 'admin', '5a795f1f34d2922dc75d4fe43a3c34741e409fc24f66dc78cad9bf9e4f911023', '1527581600.8544'),
(12, 'admin', '5a6a83c8a63bbdd02e0a0774fe1f2d13a55e280559da1cd914edbd1ba707ecca', '1527581600.8552'),
(13, 'admin', '1ee2949f67237f2a7fefe5318971fa5eec44098c6c9882727ed0af04174680d7', '1527581600.8559'),
(14, 'admin', '2b89c81b0a65e18fca5272c9ccc60fedcef458cce448eb726fa597d71946931f', '1527581600.851'),
(15, 'admin', '04fefc647716d5b0a897bf56c7e2e31daf885f637feced2a49d472f843dd477e', '1527581234.2137'),
(16, 'admin', 'd0447bf805d80df178e67265e163208e2582bebb940cb98c5db5254a25cd54c2', '1527581026.8384'),
(17, 'admin', '76a161132e85be5df9600211e59d1a06a34b8e76696393bff49b1e06904ff248', '1527581045.994'),
(18, 'admin', 'fbdaab065e7c08f836889998aca1aa34b44af3254dc3ab6118414732ec54d7ec', '1527581125.1801'),
(19, 'admin', '50f3334a27475720725b85b3b004c8a15d8ebbc3eecfdf3b1dc4a66c7e4ae6f5', '1527581235.5887'),
(20, 'admin', '750b9f44b6b34c915a3e6426a6da51967fd5c328d5eb6724459de73000c91516', '1527581263.9819'),
(21, 'safri', 'd9126df6a5d376f97019ade36a1de0f0e65f86d40072262b724c5311674aec0e', '1527581419.3687'),
(22, 'safri', '2b89c81b0a65e18fca5272c9ccc60fedcef458cce448eb726fa597d71946931f', '1527581419.3696'),
(23, 'safri', '004ed73627b76f3f04f0b8c16b83dc1968bb9adab719c112c1c24a971b004313', '1527581419.3707'),
(24, 'safri', '2ba4dd74f89becacc3df2194dc357886505c2243140eb9ed5e29ef1923ed4ea4', '1527581419.3716'),
(25, 'safri', 'af7a408afd986093d55b303d5cf412c99b49bad0cf06c449f2cc43a512a6f684', '1527581419.3725'),
(26, 'safri', '5a795f1f34d2922dc75d4fe43a3c34741e409fc24f66dc78cad9bf9e4f911023', '1527581419.3734'),
(27, 'safri', '5a6a83c8a63bbdd02e0a0774fe1f2d13a55e280559da1cd914edbd1ba707ecca', '1527581419.3743'),
(28, 'safri', '1ee2949f67237f2a7fefe5318971fa5eec44098c6c9882727ed0af04174680d7', '1527581419.3756'),
(29, 'safri', '3a4bab11e7449d532e6dda3a9ca8056f8432b9adf6f2759be0ade38d04506356', '1527581501.1757'),
(30, 'safri', 'ba91b5e9931f9f44cf706c14c7372c68775ba5e139dc79382f4584329871d377', '1527581501.1687'),
(31, 'safri', '9ec4f86a418a50bb097f5078c47bc2e2a02475331707a33ba5e4561e81d79a6e', '1527581501.1699'),
(32, 'safri', '61cd1a04a7e27c5412ab7979fe3f9fccbb2276bace090cbbc27be3966456c278', '1527581501.1747'),
(33, 'safri', 'aaf45332107efd7f8653822d5591bcbd820c76819d4b00d521f20a911e282256', '1527581501.172'),
(34, 'safri', '3273f889d84a6da28c2bff29f37fe006c1288e6b356223150be4284ce6d94f50', '1527581501.1734'),
(35, 'safri', 'f749d2abe4164bf41240db436f0f442fd4c753ffd23f85798c11c467cb6362ff', '1527581495.0342'),
(36, 'safri', '5dde607106354406bc2df798ef095ad06887c2f248753a5fca3615be57d05c98', '1527581430.3897'),
(37, 'safri', '1ade9d2eb50ae4524f9800a2cd8272204f451b35b4c052c4b57fe3ce31669d2e', '1527581493.0192'),
(38, 'admin', 'aaf45332107efd7f8653822d5591bcbd820c76819d4b00d521f20a911e282256', '1527581597.5624'),
(39, 'admin', '3273f889d84a6da28c2bff29f37fe006c1288e6b356223150be4284ce6d94f50', '1527581597.5636'),
(40, 'admin', 'e409e16c4305f702e7410a87ef72a404204cb9334c9ccb9ff2fcd0d7bfeac89c', '1527581611.9873');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `name` varchar(40) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`name`, `value`) VALUES
('admin_title', 'Team Hore'),
('admin_email', 'kocak@kocak.com'),
('language', 'en'),
('theme', 'brown_and_blue'),
('default_status_id', '1'),
('default_filter_id', ''),
('default_tab', 'plugin/file_manager'),
('allow_html_title', 'off'),
('plugins', 'a:5:{s:7:"textile";i:1;s:8:"markdown";i:1;s:7:"archive";i:1;s:14:"page_not_found";i:1;s:12:"file_manager";i:1;}');

-- --------------------------------------------------------

--
-- Table structure for table `snippet`
--

CREATE TABLE `snippet` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `filter_id` varchar(25) DEFAULT NULL,
  `content` text,
  `content_html` text,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `position` mediumint(6) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `snippet`
--

INSERT INTO `snippet` (`id`, `name`, `filter_id`, `content`, `content_html`, `created_on`, `updated_on`, `created_by_id`, `updated_by_id`, `position`) VALUES
(1, 'header', NULL, '<div id="header">\r\n  <h1><a href="<?php echo URL_PUBLIC; ?>">Team Hore</a> <span>Kumpulan orang kece</span></h1>\r\n  <div id="nav">\r\n    <ul>\r\n      <li><a<?php echo url_match(''/'') ? '' class="current"'': ''''; ?> href="<?php echo URL_PUBLIC; ?>">Home</a></li>\r\n<?php foreach($this->find(''/'')->children() as $menu): ?>\r\n      <li><?php echo $menu->link($menu->title, (in_array($menu->slug, explode(''/'', $this->path())) ? '' class="current"'': null)); ?></li>\r\n<?php endforeach; ?> \r\n    </ul>\r\n  </div> <!-- end #navigation -->\r\n</div> <!-- end #header -->', '<div id="header">\r\n  <h1><a href="<?php echo URL_PUBLIC; ?>">Team Hore</a> <span>Kumpulan orang kece</span></h1>\r\n  <div id="nav">\r\n    <ul>\r\n      <li><a<?php echo url_match(''/'') ? '' class="current"'': ''''; ?> href="<?php echo URL_PUBLIC; ?>">Home</a></li>\r\n<?php foreach($this->find(''/'')->children() as $menu): ?>\r\n      <li><?php echo $menu->link($menu->title, (in_array($menu->slug, explode(''/'', $this->path())) ? '' class="current"'': null)); ?></li>\r\n<?php endforeach; ?> \r\n    </ul>\r\n  </div> <!-- end #navigation -->\r\n</div> <!-- end #header -->', '2018-05-29 08:01:03', '2018-05-29 08:05:22', 1, 1, NULL),
(2, 'footer', NULL, '<div id="footer"><div id="footer-inner">\r\n  <p>&copy; Copyright <?php echo date(''Y''); ?> <a href="#" title="Wolf">Team Hore</a><br />\r\n  <a href="#" title="Team Hore">Kece Sekali</a> Inside.\r\n  </p>\r\n</div></div><!-- end #footer -->', '<div id="footer"><div id="footer-inner">\r\n  <p>&copy; Copyright <?php echo date(''Y''); ?> <a href="#" title="Wolf">Team Hore</a><br />\r\n  <a href="#" title="Team Hore">Kece Sekali</a> Inside.\r\n  </p>\r\n</div></div><!-- end #footer -->', '2018-05-29 08:01:05', '2018-05-29 08:06:09', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `count` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `salt` varchar(1024) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_failure` datetime DEFAULT NULL,
  `failure_count` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `username`, `password`, `salt`, `language`, `last_login`, `last_failure`, `failure_count`, `created_on`, `updated_on`, `created_by_id`, `updated_by_id`) VALUES
(1, 'Administrator', 'admin@yoursite.com', 'admin', 'a3d7a74f608306ebcf5304912d9fe82dd63d67b649569b57675b4934364e8e0aaaa1e885a9963e94efb58cd8f3d61d3aeed38789e3126ffffb20bfccf1e829bd', 'a30a39b077e964710a644659b622cc6bbf6af6034ca769058f056aea810e41a7', 'en', '2018-05-29 08:00:59', NULL, 0, '2018-05-29 08:01:07', '2018-05-29 08:00:59', 1, NULL),
(2, 'safri', 'safri@safri.com', 'safri', '1aed25ff992fc9ee244a76e5bc9630a66775ec6ff1889c8f46b62b564871825ff819a1e0178aa8768b84e56d50949d264dbcc173d9a60d7cbbc49e2c05368a2b', 'eed35113c1290cc1319089e79c6978b98d257329b55f46da27e89fe6d374b809', 'en', '2018-05-29 08:10:09', '1970-01-01 00:00:00', 0, '2018-05-29 08:04:05', '2018-05-29 08:10:09', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cron`
--
ALTER TABLE `cron`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layout`
--
ALTER TABLE `layout`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_part`
--
ALTER TABLE `page_part`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_tag`
--
ALTER TABLE `page_tag`
  ADD UNIQUE KEY `page_id` (`page_id`,`tag_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `plugin_settings`
--
ALTER TABLE `plugin_settings`
  ADD UNIQUE KEY `plugin_setting_id` (`plugin_id`,`name`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD UNIQUE KEY `user_id` (`role_id`,`permission_id`);

--
-- Indexes for table `secure_token`
--
ALTER TABLE `secure_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_url` (`username`,`url`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD UNIQUE KEY `id` (`name`);

--
-- Indexes for table `snippet`
--
ALTER TABLE `snippet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `uc_email` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD UNIQUE KEY `user_id` (`user_id`,`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cron`
--
ALTER TABLE `cron`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `layout`
--
ALTER TABLE `layout`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `page_part`
--
ALTER TABLE `page_part`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `secure_token`
--
ALTER TABLE `secure_token`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `snippet`
--
ALTER TABLE `snippet`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
