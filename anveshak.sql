-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 04, 2019 at 05:10 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anveshak`
--

-- --------------------------------------------------------

--
-- Table structure for table `community_blobs`
--

CREATE TABLE `community_blobs` (
  `blobid` bigint(20) UNSIGNED NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_cache`
--

CREATE TABLE `community_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_categories`
--

CREATE TABLE `community_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_categorymetas`
--

CREATE TABLE `community_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_contentwords`
--

CREATE TABLE `community_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_contentwords`
--

INSERT INTO `community_contentwords` (`postid`, `wordid`, `count`, `type`, `questionid`) VALUES
(1, 10, 2, 'Q', 1),
(1, 11, 1, 'Q', 1),
(1, 8, 2, 'Q', 1),
(1, 12, 2, 'Q', 1),
(1, 13, 1, 'Q', 1),
(1, 14, 1, 'Q', 1),
(1, 15, 1, 'Q', 1),
(1, 16, 1, 'Q', 1),
(1, 7, 1, 'Q', 1),
(1, 9, 1, 'Q', 1),
(1, 1, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 3, 2, 'Q', 1),
(1, 17, 1, 'Q', 1),
(1, 4, 1, 'Q', 1),
(1, 5, 1, 'Q', 1),
(1, 18, 1, 'Q', 1),
(2, 19, 1, 'A', 1),
(2, 20, 1, 'A', 1),
(2, 12, 1, 'A', 1),
(2, 3, 2, 'A', 1),
(2, 21, 1, 'A', 1),
(2, 22, 1, 'A', 1),
(2, 9, 1, 'A', 1),
(2, 23, 1, 'A', 1),
(2, 24, 1, 'A', 1),
(2, 25, 1, 'A', 1),
(2, 26, 1, 'A', 1),
(2, 27, 1, 'A', 1),
(2, 28, 1, 'A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `community_cookies`
--

CREATE TABLE `community_cookies` (
  `cookieid` bigint(20) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_iplimits`
--

CREATE TABLE `community_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_iplimits`
--

INSERT INTO `community_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(0xac18fed7, 'A', 431004, 1),
(0xac18fed7, 'Q', 431004, 1),
(0xac18fed7, 'V', 431004, 1);

-- --------------------------------------------------------

--
-- Table structure for table `community_options`
--

CREATE TABLE `community_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_options`
--

INSERT INTO `community_options` (`title`, `content`) VALUES
('allow_anonymous_naming', '1'),
('allow_close_own_questions', '1'),
('allow_close_questions', '1'),
('allow_multi_answers', '1'),
('allow_self_answer', '1'),
('avatar_message_list_size', '20'),
('avatar_q_list_size', '0'),
('avatar_q_page_a_size', '40'),
('avatar_q_page_c_size', '20'),
('avatar_q_page_q_size', '50'),
('avatar_users_size', '30'),
('block_bad_words', ''),
('block_ips_write', ''),
('cache_acount', '1'),
('cache_flaggedcount', ''),
('cache_qcount', '1'),
('cache_queuedcount', ''),
('cache_tagcount', '0'),
('cache_unaqcount', '0'),
('cache_unselqcount', '1'),
('cache_unupaqcount', '1'),
('cache_userpointscount', '2'),
('caching_driver', 'filesystem'),
('caching_enabled', '0'),
('captcha_on_anon_post', '1'),
('captcha_on_unconfirmed', '0'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('custom_footer', ''),
('custom_header', ''),
('custom_home_content', ''),
('custom_home_heading', ''),
('custom_in_head', ''),
('custom_sidepanel', ''),
('db_version', '67'),
('do_ask_check_qs', '0'),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', 'WYSIWYG Editor'),
('editor_for_cs', ''),
('editor_for_qs', 'WYSIWYG Editor'),
('email_privacy', 'Privacy: Your email address will not be shared or sold to third parties.'),
('enabled_plugins', ''),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('extra_field_active', ''),
('feedback_email', ''),
('feedback_enabled', '0'),
('feed_for_activity', '0'),
('feed_for_hot', '0'),
('feed_for_qa', '0'),
('feed_for_questions', '0'),
('feed_for_search', '0'),
('feed_for_tag_qs', '0'),
('feed_for_unanswered', '0'),
('feed_full_text', '0'),
('feed_number_items', '50'),
('feed_per_category', '1'),
('flagging_hide_after', '5'),
('flagging_of_posts', '1'),
('follow_on_as', '1'),
('form_security_salt', 'sp4twspc1u0rf3tsp4i6hn5tc74tcpw1'),
('from_email', 'no-reply@172.24.254.215'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('links_in_new_window', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('match_example_tags', '3'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_as', '50'),
('max_rate_ip_cs', '40'),
('max_rate_ip_qs', '20'),
('max_rate_ip_votes', '600'),
('max_rate_user_as', '25'),
('max_rate_user_cs', '20'),
('max_rate_user_qs', '10'),
('max_rate_user_votes', '300'),
('max_store_user_updates', '50'),
('minify_html', '1'),
('min_len_a_content', '12'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_by_points', ''),
('moderate_unconfirmed', ''),
('moderate_users', ''),
('nav_activity', '0'),
('nav_ask', '1'),
('nav_categories', '0'),
('nav_home', ''),
('nav_hot', '0'),
('nav_qa_is_home', '0'),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('neat_urls', '5'),
('notice_visitor', ''),
('notify_admin_q_post', '0'),
('notify_users_default', '1'),
('pages_prev_next', '3'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_qs', '20'),
('page_size_q_as', '10'),
('permit_anon_view_ips', '70'),
('permit_close_q', '70'),
('permit_delete_hidden', '40'),
('permit_edit_a', '100'),
('permit_edit_q', '70'),
('permit_flag', '110'),
('permit_hide_show', '70'),
('permit_moderate', '100'),
('permit_post_a', '150'),
('permit_post_c', '150'),
('permit_post_q', '150'),
('permit_retag_cat', '70'),
('permit_select_a', '100'),
('permit_view_q_page', '150'),
('permit_view_voters_flaggers', '20'),
('permit_vote_a', '120'),
('permit_vote_down', '120'),
('permit_vote_q', '120'),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_c_voted_max_gain', '10'),
('points_c_voted_max_loss', '3'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_c_voted_down', '0'),
('points_per_c_voted_up', '0'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('recalc_hotness_q_view', '1'),
('show_a_c_links', '1'),
('show_a_form_immediate', 'if_no_as'),
('show_compact_numbers', '1'),
('show_custom_answer', ''),
('show_custom_ask', ''),
('show_custom_comment', ''),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_home_description', ''),
('show_notice_visitor', ''),
('show_post_update_meta', '1'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_counts', '0'),
('show_view_count_q_page', '0'),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'community'),
('site_theme_mobile', 'community'),
('site_title', 'Community Support'),
('site_url', 'http://172.24.254.215/SIH/anveshak/community/'),
('smtp_active', '0'),
('smtp_address', ''),
('smtp_authenticate', '0'),
('smtp_password', 'p'),
('smtp_port', '25'),
('smtp_secure', ''),
('smtp_username', '1780331b7f238658fef0'),
('sort_answers_by', 'created'),
('tags_or_categories', 'tc'),
('tag_separator_comma', ''),
('use_microdata', '1'),
('votes_separated', ''),
('voting_on_as', '1'),
('voting_on_qs', '1'),
('voting_on_q_page_only', ''),
('wysiwyg_editor_upload_images', '');

-- --------------------------------------------------------

--
-- Table structure for table `community_pages`
--

CREATE TABLE `community_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_pages`
--

INSERT INTO `community_pages` (`pageid`, `title`, `nav`, `position`, `flags`, `permit`, `tags`, `heading`, `content`) VALUES
(1, 'Home', 'B', 1, 1, 150, 'http://172.24.254.215/SIH/anveshak', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `community_postmetas`
--

CREATE TABLE `community_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_posts`
--

CREATE TABLE `community_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` varchar(30) DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_posts`
--

INSERT INTO `community_posts` (`postid`, `type`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 'startup1234', NULL, 0xac18fed7, NULL, NULL, 1, 0, 1, 0xac18fed7, 1, 57898700000, 0, '', '2019-03-03 17:55:12', NULL, NULL, 'What are the procedures for registering a new startup?', 'I am new to this field. I want to start a new startup. What are the formal procedures for the same.', '', NULL, '@'),
(2, 'A', 1, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 'corp1234', NULL, 0xac18fed7, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2019-03-03 17:56:40', NULL, NULL, NULL, 'Just go to the site of startup India you will find all the information.', NULL, NULL, '@');

-- --------------------------------------------------------

--
-- Table structure for table `community_posttags`
--

CREATE TABLE `community_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_sharedevents`
--

CREATE TABLE `community_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` varchar(30) DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_sharedevents`
--

INSERT INTO `community_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('Q', 1, 1, 1, NULL, 'startup1234', '2019-03-03 17:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `community_tagmetas`
--

CREATE TABLE `community_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_tagwords`
--

CREATE TABLE `community_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_titlewords`
--

CREATE TABLE `community_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_titlewords`
--

INSERT INTO `community_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `community_userevents`
--

CREATE TABLE `community_userevents` (
  `userid` varchar(30) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` varchar(30) DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_userfavorites`
--

CREATE TABLE `community_userfavorites` (
  `userid` varchar(30) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_userlevels`
--

CREATE TABLE `community_userlevels` (
  `userid` varchar(30) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_userlimits`
--

CREATE TABLE `community_userlimits` (
  `userid` varchar(30) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_userlimits`
--

INSERT INTO `community_userlimits` (`userid`, `action`, `period`, `count`) VALUES
('corp1234', 'A', 431004, 1),
('corp1234', 'V', 431004, 1),
('startup1234', 'Q', 431004, 1);

-- --------------------------------------------------------

--
-- Table structure for table `community_usermetas`
--

CREATE TABLE `community_usermetas` (
  `userid` varchar(30) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_usernotices`
--

CREATE TABLE `community_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` varchar(30) NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_userpoints`
--

CREATE TABLE `community_userpoints` (
  `userid` varchar(30) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `cvoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_userpoints`
--

INSERT INTO `community_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `cupvotes`, `cdownvotes`, `qvoteds`, `avoteds`, `cvoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
('corp1234', 150, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('startup1234', 130, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `community_uservotes`
--

CREATE TABLE `community_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` varchar(30) NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `votecreated` datetime DEFAULT NULL,
  `voteupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_uservotes`
--

INSERT INTO `community_uservotes` (`postid`, `userid`, `vote`, `flag`, `votecreated`, `voteupdated`) VALUES
(1, 'corp1234', 1, 0, '2019-03-03 17:56:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `community_widgets`
--

CREATE TABLE `community_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `community_words`
--

CREATE TABLE `community_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `community_words`
--

INSERT INTO `community_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'what', 1, 1, 0, 0),
(2, 'are', 1, 1, 0, 0),
(3, 'the', 1, 2, 0, 0),
(4, 'procedures', 1, 1, 0, 0),
(5, 'for', 1, 1, 0, 0),
(6, 'registering', 1, 0, 0, 0),
(7, 'a', 1, 1, 0, 0),
(8, 'new', 1, 1, 0, 0),
(9, 'startup', 1, 2, 0, 0),
(10, 'i', 0, 1, 0, 0),
(11, 'am', 0, 1, 0, 0),
(12, 'to', 0, 2, 0, 0),
(13, 'this', 0, 1, 0, 0),
(14, 'field', 0, 1, 0, 0),
(15, 'want', 0, 1, 0, 0),
(16, 'start', 0, 1, 0, 0),
(17, 'formal', 0, 1, 0, 0),
(18, 'same', 0, 1, 0, 0),
(19, 'just', 0, 1, 0, 0),
(20, 'go', 0, 1, 0, 0),
(21, 'site', 0, 1, 0, 0),
(22, 'of', 0, 1, 0, 0),
(23, 'india', 0, 1, 0, 0),
(24, 'you', 0, 1, 0, 0),
(25, 'will', 0, 1, 0, 0),
(26, 'find', 0, 1, 0, 0),
(27, 'all', 0, 1, 0, 0),
(28, 'information', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `corp_auth`
--

CREATE TABLE `corp_auth` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification for corporates',
  `login_id` varchar(30) DEFAULT NULL COMMENT 'login id of corporates  ',
  `password` varchar(40) DEFAULT NULL COMMENT 'password for corporate login',
  `corp_name` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will be used for authorization at the time for corporate login and contains details for the same.';

--
-- Dumping data for table `corp_auth`
--

INSERT INTO `corp_auth` (`corp_id`, `login_id`, `password`, `corp_name`, `created_date`, `status`) VALUES
('corp1234', 'regexp', 'p', 'Flipkart', '2014-09-29 23:25:26', 0),
('corp_04595b18fd5', '1780331b7f238658fef0', 'p', 'tech mahindra', '2019-03-02 10:36:47', 1),
('corp_06c317f8a9e', '996dd17e130306dbde83', 'p', 'tata motors', '2019-03-02 10:36:31', 1),
('corp_0aa07a595c5', 'b447d6a5aa6a81438ecc', 'p', 'SBI', '2019-03-02 10:36:11', 1),
('corp_0be05092603', '7c6571708b904db63c78', 'p', 'ashok leyland', '2019-03-02 10:31:31', 1),
('corp_102802fcf12', 'fa1b1f64a1fcfd669c58', 'p', 'DLF', '2019-03-02 10:32:40', 1),
('corp_160b5fec7fa', 'f3b78609aaa157759d72', 'p', 'TCS', '2019-03-02 10:36:44', 1),
('corp_1ab8764a438', 'fa23e56530a9a01f0fa4', 'p', 'ultratech cement', '2019-03-02 10:36:59', 1),
('corp_200afaacadf', '65972888dc630e6c5ac0', 'p', 'lupin', '2019-03-02 10:34:06', 1),
('corp_2164c4bae0d', '93d1775baf46abb96fef', 'p', 'HDFC', '2019-03-02 10:33:34', 1),
('corp_2183562f430', '787381ae99ec6ab7d2ab', 'p', 'power grid', '2019-03-02 10:35:59', 1),
('corp_22a8aac56ca', '00f4f72e82a1939d5539', 'p', 'hindalco', '2019-03-02 10:33:39', 1),
('corp_22c8b36bc19', '4823165ff289a8391680', 'p', 'apple', '2019-03-02 10:31:17', 1),
('corp_258ef2f332d', '991506e0592d99a0da5a', 'p', 'zee', '2019-03-02 10:37:18', 1),
('corp_2f6b247dc97', '947d593dc7bc6c8fb827', 'p', 'havells', '2019-03-02 10:33:12', 1),
('corp_30d1a3ad977', '675ad679355dbce902b0', 'p', 'britannia', '2019-03-02 10:32:04', 1),
('corp_3867e372b16', '672a11044f7c1da9a3d5', 'p', 'wipro', '2019-03-02 10:37:06', 1),
('corp_3a2720c2256', '67313558015805ae9b4f', 'p', 'microsoft', '2019-03-02 10:34:20', 1),
('corp_3ae0a9feaad', '1c09d940e70cef9f8a21', 'p', 'HCL', '2019-03-02 10:33:30', 1),
('corp_3c0d80f8381', '920804401a6ff65caf40', 'p', 'exide', '2019-03-02 10:32:54', 1),
('corp_434c7437f10', 'cc2139b8a3e7fa322472', 'p', 'yes bank', '2019-03-02 10:37:14', 1),
('corp_44a3c841421', 'f419de483d7853733259', 'p', 'samsung', '2019-03-02 10:36:06', 1),
('corp_4620fee06ad', '2e73b4dd564d890dc106', 'p', 'JSW', '2019-03-02 10:33:53', 1),
('corp_4905fa7d8c3', 'fa4e59c24373c6fa20d6', 'p', 'hero motocorp', '2019-03-02 10:33:36', 1),
('corp_4a945c93dfb', '166777bd81d873524aa9', 'p', 'walmart', '2019-03-02 10:37:02', 1),
('corp_4acd1501d46', 'a692298ad4ca617a6353', 'p', 'cipla', '2019-03-02 10:32:10', 1),
('corp_518ce6dcf39', '8650356b8769e119ea3b', 'p', 'reliance', '2019-03-02 10:36:02', 1),
('corp_53e62e090bb', 'efa7ad8c852661157ebf', 'p', 'tata power', '2019-03-02 10:36:37', 1),
('corp_553ab27251e', 'd686b0d22c290a8cbdef', 'p', 'shree cement', '2019-03-02 10:36:14', 1),
('corp_5a1df3d8a0a', 'c15bc6017d0c8f2327f6', 'p', 'vedanta', '2019-03-02 10:37:12', 1),
('corp_5f6f6c7bd54', '8e80322dee50d6ac9f4f', 'p', 'ACC', '2019-03-02 10:05:57', 1),
('corp_5f8e89442d3', '94b0104258250d751b38', 'p', 'sahara', '2019-03-02 10:34:45', 1),
('corp_62f6c749fae', '76ba3763edbdcec4b8e7', 'p', 'google', '2019-03-02 10:33:04', 1),
('corp_6c9b04ad14e', 'ac6bf32fece81616ca73', 'p', 'bosch', '2019-03-02 10:31:58', 1),
('corp_6d3f02f6cb7', 'a7ec1757cb6751da87aa', 'p', 'arcesium', '2019-03-02 10:31:28', 1),
('corp_795979f57fe', '28d3746aa9583b9d37c0', 'p', 'grasim', '2019-03-02 10:33:08', 1),
('corp_7afc6620f76', 'a489b75a38633f1d4c15', 'p', 'ICICI', '2019-03-02 10:33:47', 1),
('corp_7d07f4ba33c', 'faa6bb6f66cdbc2619c1', 'p', 'hindustan unilever', '2019-03-02 10:33:44', 1),
('corp_7d29219a7d6', 'de567f89b50229f15a5b', 'p', 'the federal bank', '2019-03-02 10:36:51', 1),
('corp_7d7ce7132cd', 'c8c109a697c424b848f0', 'p', 'BPCL', '2019-03-02 10:32:01', 1),
('corp_8529689edd8', '12153ed19516b247402d', 'p', 'bharti airtel', '2019-03-02 10:31:55', 1),
('corp_942212e7154', '7254bd435e76b9d4b49e', 'p', 'axis bank', '2019-03-02 10:31:37', 1),
('corp_99e0531f0f0', 'c039aa60c7e3e82897fa', 'p', 'TVS motors', '2019-03-02 10:36:54', 1),
('corp_9c780d1c5b5', '8d4d2e047abdf1bd2554', 'p', 'glenmark', '2019-03-02 10:32:57', 1),
('corp_a0f9792bf4e', '37f2fd30288f146dfefd', 'p', 'tata global', '2019-03-02 10:36:28', 1),
('corp_a278dc0661c', 'f6559bfb5739fdc945ab', 'p', 'siemens', '2019-03-02 10:36:21', 1),
('corp_a3642c0423b', '3fdc6013d23c68e64ad6', 'p', 'godrej', '2019-03-02 10:33:00', 1),
('corp_a487c6188bd', '3ad783249489fb1a2d66', 'p', 'dabur', '2019-03-02 10:32:16', 1),
('corp_a6d7f2bf581', '75ec72106c294ee461a9', 'p', 'bajaj auto', '2019-03-02 10:31:41', 1),
('corp_ae951f6e2dc', '90c2021df5d0ff219580', 'p', 'tata steel', '2019-03-02 10:36:41', 1),
('corp_b18c82d7214', '58b97fddbb87d65b903d', 'p', 'adobe', '2019-03-02 10:31:11', 1),
('corp_babb7ee2b18', 'e96113dd3b7d41fb6cb6', 'p', 'coal india', '2019-03-02 10:32:13', 1),
('corp_bdf81de9b31', 'b8efc2b43b24ed1a927f', 'p', 'maruti suzuki', '2019-03-02 10:34:16', 1),
('corp_be1b5f48062', 'f2939e9565ed2422ef6a', 'p', 'ONGC', '2019-03-02 10:34:32', 1),
('corp_c38abfe7c95', '72acb7f05d7aa1af6206', 'p', 'larsen and turbo', '2019-03-02 10:33:59', 1),
('corp_c4f62bfcc85', 'c5787040d25f52d71cf2', 'p', 'cummins', '2019-03-02 10:32:19', 1),
('corp_c73a8ab9a83', '592f47a379f4f98e0bb7', 'p', 'mahindra and mahindra', '2019-03-02 10:34:10', 1),
('corp_ce89b4f0611', '11a383c49e0e9805b03d', 'p', 'asian paints', '2019-03-02 10:31:34', 1),
('corp_d3888de758d', 'cd2fa4d153ff9229a872', 'p', 'marico', '2019-03-02 10:34:13', 1),
('corp_d5009945e43', 'f4ec0349d4de2a020d6f', 'p', 'elf', '2019-03-02 10:32:50', 1),
('corp_da72f6243de', '8361cf5b467dfe28a755', 'p', 'bharat forge', '2019-03-02 10:31:52', 1),
('corp_dcd02cd99f1', '0f23346d3be60bc71212', 'p', 'eicher motors', '2019-03-02 10:32:47', 1),
('corp_dd8051d28cf', '58c2c81fb474fa136f55', 'p', 'infosys', '2019-03-02 10:33:50', 1),
('corp_dfa59ca7b29', 'bbad1323bf5aacb3bd0b', 'p', 'star plus', '2019-03-02 10:36:24', 1),
('corp_e15316068c2', '5b9d037783ac0d8301fc', 'p', 'cadila', '2019-03-02 10:32:07', 1),
('corp_e15d5078882', 'b2244596fa6aecd8a46e', 'p', 'nestle', '2019-03-02 10:34:29', 1),
('corp_ed35bce448b', '4643b52c17e99b2c1530', 'p', 'ambuja', '2019-03-02 10:31:14', 1),
('corp_f5861f6b118', '933d5e17750036af8f6c', 'p', 'shriram', '2019-03-02 10:36:17', 1),
('corp_fb08e6cf0e5', '8267a995ce3c86284444', 'p', 'bajaj finance', '2019-03-02 10:31:45', 1),
('corp_fcf22708118', '7bc2bf6cacc1a7b059e5', 'p', 'kotak mahindra', '2019-03-02 10:33:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `corp_contact`
--

CREATE TABLE `corp_contact` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporates',
  `website` varchar(100) DEFAULT NULL COMMENT 'website url',
  `email` varchar(100) DEFAULT NULL COMMENT 'email address',
  `mobile` varchar(20) DEFAULT NULL COMMENT 'mobile no',
  `phone` varchar(20) DEFAULT NULL COMMENT 'telephone no',
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last update.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This will contain all the contact informations of the corporates.';

--
-- Dumping data for table `corp_contact`
--

INSERT INTO `corp_contact` (`corp_id`, `website`, `email`, `mobile`, `phone`, `update_timestamp`) VALUES
('corp1234', 'www.flipcart.com', 'flipcart.gmail.com', '1234567890', '0987654321', '2019-03-03 02:25:25'),
('corp_04595b18fd5', 'www.tm.com', 'tm@g.com', '1234567891', '123', '2019-03-02 05:06:47'),
('corp_06c317f8a9e', 'www.tm.com', 'tm@g.com', '1234567891', '123', '2019-03-02 05:06:31'),
('corp_0aa07a595c5', 'www.sbi.com', 'sbi@g.com', '1234567891', '1234', '2019-03-02 05:06:11'),
('corp_0be05092603', 'www.al.com', 'al@g.com', '1234567891', '123', '2019-03-02 05:01:31'),
('corp_102802fcf12', 'www.dlf.com', 'dlf@g.com', '1234567891', '123', '2019-03-02 05:02:40'),
('corp_160b5fec7fa', 'www.tcs.com', 'a@g.com', '1234567891', '12345', '2019-03-02 05:06:44'),
('corp_1ab8764a438', 'www.uc.com', 'uc@g.com', '1234567891', '123', '2019-03-02 05:06:59'),
('corp_200afaacadf', 'www.lup.com', 'lup@g.com', '1234567891', '123', '2019-03-02 05:04:06'),
('corp_2164c4bae0d', 'www.hdfc.com', 'hdfc@g.com', '1234567891', '1234', '2019-03-02 05:03:34'),
('corp_2183562f430', 'www.pg.com', 'pg@g.com', '1234567891', '123', '2019-03-02 05:05:59'),
('corp_22a8aac56ca', 'www.hind.com', 'hind@g.com', '1234567891', '123', '2019-03-02 05:03:39'),
('corp_22c8b36bc19', 'www.app.com', 'app@g.com', '1234567891', '123', '2019-03-02 05:01:17'),
('corp_258ef2f332d', 'www.zee.com', 'zee@g.com', '1234567891', '123', '2019-03-02 05:07:18'),
('corp_2f6b247dc97', 'www.havells.com', 'hav@g.com', '1234567891', '123', '2019-03-02 05:03:12'),
('corp_30d1a3ad977', 'www.brit.com', 'brit@g.com', '1234567891', '123', '2019-03-02 05:02:04'),
('corp_3867e372b16', 'www.wipro.com', 'wipro@g.com', '1234567891', '123', '2019-03-02 05:07:06'),
('corp_3a2720c2256', 'www.micro.com', 'micro@g.com', '1234567891', '123', '2019-03-02 05:04:20'),
('corp_3ae0a9feaad', 'www.hcl.com', 'hcl@g.com', '1234567891', '123', '2019-03-02 05:03:30'),
('corp_3c0d80f8381', 'www.exide.com', 'ex@g.com', '1234567891', '123', '2019-03-02 05:02:54'),
('corp_434c7437f10', 'www.yb.com', 'yb@g.com', '1234567891', '123', '2019-03-02 05:07:14'),
('corp_44a3c841421', 'www.sam.com', 'sam@g.com', '1234567891', '123', '2019-03-02 05:06:06'),
('corp_4620fee06ad', 'www.jsw.com', 'jsw@g.com', '1234567891', '123', '2019-03-02 05:03:53'),
('corp_4905fa7d8c3', 'www.hm.com', 'hm@g.com', '1234567891', '123', '2019-03-02 05:03:36'),
('corp_4a945c93dfb', 'www.w.com', 'w@g.com', '1234567891', '123', '2019-03-02 05:07:03'),
('corp_4acd1501d46', 'www.c.com', 'c@g.com', '1234567891', '123', '2019-03-02 05:02:10'),
('corp_518ce6dcf39', 'www.reliance.com', 'reliance@g.com', '1234567891', '12345', '2019-03-02 05:06:02'),
('corp_53e62e090bb', 'www.tp.com', 'tp@g.com', '1234567891', '123', '2019-03-02 05:06:37'),
('corp_553ab27251e', 'www.sc.com', 'sc@g.com', '1234567891', '123', '2019-03-02 05:06:14'),
('corp_5a1df3d8a0a', 'www.vedanta.com', 'vedanta@g.com', '1234567891', '123', '2019-03-02 05:07:12'),
('corp_5f6f6c7bd54', 'www.acc.com', 'acc@g.com', '1234567891', '123', '2019-03-02 04:35:57'),
('corp_5f8e89442d3', 'www.s.com', 's@g.com', '1234567891', '123', '2019-03-02 05:04:45'),
('corp_62f6c749fae', 'www.google.com', 'goo@g.com', '1234567891', '123', '2019-03-02 05:03:04'),
('corp_6c9b04ad14e', 'www.bosch.com', 'bosch@g.com', '1234567891', '123', '2019-03-02 05:01:58'),
('corp_6d3f02f6cb7', 'www.arcesium.com', 'arcesium@gmail.com', '1234567891', '123', '2019-03-02 05:01:28'),
('corp_795979f57fe', 'www.g.com', 'g@g.com', '1234567891', '123', '2019-03-02 05:03:08'),
('corp_7afc6620f76', 'www.icici.com', 'a@g.com', '1234567891', '123', '2019-03-02 05:03:47'),
('corp_7d07f4ba33c', 'www.hul.com', 'hul@g.com', '1234567891', '1234', '2019-03-02 05:03:44'),
('corp_7d29219a7d6', 'www.fb.com', 'fb@g.com', '1234567891', '123', '2019-03-02 05:06:51'),
('corp_7d7ce7132cd', 'www.bpcl.com', 'bpcl@g.com', '1234567891', '123', '2019-03-02 05:02:01'),
('corp_8529689edd8', 'www.ba.com', 'ba@g.com', '1234567891', '123', '2019-03-02 05:01:55'),
('corp_942212e7154', 'www.axis.com', 'axis@g.com', '1234567891', '123', '2019-03-02 05:01:37'),
('corp_99e0531f0f0', 'www.tvs.com', 'tvs@g.com', '1234567891', '123', '2019-03-02 05:06:54'),
('corp_9c780d1c5b5', 'www.glem.com', 'glem@g.com', '1234567891', '123', '2019-03-02 05:02:57'),
('corp_a0f9792bf4e', 'www.tg.com', 'tg@g.com', '1234567891', '123', '2019-03-02 05:06:28'),
('corp_a278dc0661c', 'www.siemens.com', 'sei@g.com', '1234567891', '123', '2019-03-02 05:06:21'),
('corp_a3642c0423b', 'www.godrej.com', 'god@g.com', '1234567891', '123', '2019-03-02 05:03:00'),
('corp_a487c6188bd', 'www.dabur.com', 'dabur@g.com', '1234567891', '123', '2019-03-02 05:02:16'),
('corp_a6d7f2bf581', 'www.ba.com', 'ba@g.com', '1234567891', '123', '2019-03-02 05:01:41'),
('corp_ae951f6e2dc', 'www.ts.com', 'ts@g.com', '1234567891', '123', '2019-03-02 05:06:41'),
('corp_b18c82d7214', 'www.a.com', 'a@g.com', '1234567891', '123', '2019-03-02 05:01:11'),
('corp_babb7ee2b18', 'www.cil.com', 'cil@g.com', '1234567891', '123', '2019-03-02 05:02:13'),
('corp_bdf81de9b31', 'www.ms.com', 'a@a.com', '1234567891', '123', '2019-03-02 05:04:16'),
('corp_be1b5f48062', 'www.ongc.com', 'ongc@g.com', '1234567891', '123', '2019-03-02 05:04:32'),
('corp_c38abfe7c95', 'www.lnt.com', 'lnt@g.com', '1234567891', '123', '2019-03-02 05:03:59'),
('corp_c4f62bfcc85', 'www.cummins.com', 'cummins@g.com', '1234567891', '123', '2019-03-02 05:02:19'),
('corp_c73a8ab9a83', 'www.mm.com', 'mm@g.com', '1234567891', '123', '2019-03-02 05:04:10'),
('corp_ce89b4f0611', 'www.a.com', 'a@g.com', '1234567891', '123', '2019-03-02 05:01:34'),
('corp_d3888de758d', 'www.marico.com', 'mar@g.com', '1234567891', '123', '2019-03-02 05:04:13'),
('corp_d5009945e43', 'www.elf.com', 'elf@g.com', '1234567891', '123', '2019-03-02 05:02:50'),
('corp_da72f6243de', 'www.bharat.com', 'bha@g.com', '1234567891', '123', '2019-03-02 05:01:52'),
('corp_dcd02cd99f1', 'www.em.com', 'em@g.com', '1234567891', '123', '2019-03-02 05:02:47'),
('corp_dd8051d28cf', 'www.infosys.com', 'infosys@g.com', '1234567891', '1234', '2019-03-02 05:03:50'),
('corp_dfa59ca7b29', 'www.sp.com', 'sp@g.com', '1234567891', '123', '2019-03-02 05:06:24'),
('corp_e15316068c2', 'www.cadila.com', 'cad@g.com', '1234567891', '123', '2019-03-02 05:02:07'),
('corp_e15d5078882', 'www.nestle.com', 'nestle@g.com', '1234567891', '123', '2019-03-02 05:04:29'),
('corp_ed35bce448b', 'www.am.com', 'am@g.com', '1234567891', '123', '2019-03-02 05:01:14'),
('corp_f5861f6b118', 'www.shriram.com', 'shri@g.com', '1234567891', '123', '2019-03-02 05:06:17'),
('corp_fb08e6cf0e5', 'www.bf.com', 'baf@g.com', '1234567891', '1234', '2019-03-02 05:01:45'),
('corp_fcf22708118', 'www.km.com', 'km@km.com', '1234567891', '1234', '2019-03-02 05:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `corp_detail`
--

CREATE TABLE `corp_detail` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporate',
  `corp_name` varchar(200) DEFAULT NULL COMMENT 'corporate name',
  `cin_no` varchar(100) DEFAULT NULL COMMENT 'assigned by govt agency',
  `roc_reg_no` varchar(100) DEFAULT NULL COMMENT 'assigned by govt agency',
  `category` varchar(100) DEFAULT NULL COMMENT 'category of corporate(Holding, Subsidiary, Associate)',
  `incorporate_date` date DEFAULT NULL COMMENT 'date of incorporation',
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of updation',
  `region` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='The basic details of the corporates.';

--
-- Dumping data for table `corp_detail`
--

INSERT INTO `corp_detail` (`corp_id`, `corp_name`, `cin_no`, `roc_reg_no`, `category`, `incorporate_date`, `update_timestamp`, `region`) VALUES
('corp_04595b18fd5', 'tech mahindra', '1023ab', '1023', '0', '2019-03-01', '2019-03-02 05:06:47', 'West Bengal'),
('corp_06c317f8a9e', 'tata motors', '1042ab', '1042', 'Holding', '2019-03-01', '2019-03-02 05:06:31', 'Rajasthan'),
('corp_0aa07a595c5', 'SBI', '1005ab', '1005', 'Associate', '2019-03-01', '2019-03-02 05:06:11', 'Madhya Pradesh'),
('corp_0be05092603', 'ashok leyland', '1062ab', '1062', 'Subsidiary', '2019-03-01', '2019-03-02 05:01:31', 'Uttar Pradesh'),
('corp_102802fcf12', 'DLF', '1058ab', '1058', 'Subsidiary', '2019-03-01', '2019-03-02 05:02:40', 'Bihar'),
('corp_160b5fec7fa', 'TCS', '10001ab', '1001', 'Holding', '2019-03-01', '2019-03-02 05:06:44', 'Gujrat'),
('corp_1ab8764a438', 'ultratech cement', '1020ab', '1020', 'Holding', '2019-03-01', '2019-03-02 05:06:59', 'Kerala'),
('corp_200afaacadf', 'lupin', '1052ab', '1052', 'Subsidiary', '2019-03-01', '2019-03-02 05:04:06', 'Sikkim'),
('corp_2164c4bae0d', 'HDFC', '10002ab', '1002', 'Subsidiary', '2019-03-01', '2019-03-02 05:03:34', 'West Bengal'),
('corp_2183562f430', 'power grid', '1021ab', '1021', 'Holding', '2019-03-01', '2019-03-02 05:05:59', 'Rajasthan'),
('corp_22a8aac56ca', 'hindalco', '1056ab', '1056', 'Subsidiary', '2019-03-01', '2019-03-02 05:03:39', 'Madhya Pradesh'),
('corp_22c8b36bc19', 'apple', '1050ab', '1050', 'Subsidiary', '2019-03-01', '2019-03-02 05:01:17', 'Uttar Pradesh'),
('corp_258ef2f332d', 'zee', '1045ab', '1045', 'Subsidiary', '2019-03-01', '2019-03-02 05:07:18', 'Bihar'),
('corp_2f6b247dc97', 'havells', '1051ab', '1051', 'Subsidiary', '2019-03-01', '2019-03-02 05:03:12', 'Gujrat'),
('corp_30d1a3ad977', 'britannia', '1032ab', '1032', 'Subsidiary', '2019-03-01', '2019-03-02 05:02:04', 'Kerala'),
('corp_3867e372b16', 'wipro', '1013ab', '1013', 'Subsidiary', '2019-03-01', '2019-03-02 05:07:06', 'Sikkim'),
('corp_3a2720c2256', 'microsoft', '1025ab', '1025', 'Associate', '2019-03-01', '2019-03-02 05:04:20', 'West Bengal'),
('corp_3ae0a9feaad', 'HCL', '1015ab', '1015', 'Associate', '2019-03-01', '2019-03-02 05:03:30', 'Rajasthan'),
('corp_3c0d80f8381', 'exide', '1065ab', '1065', 'Holding', '2019-03-01', '2019-03-02 05:02:54', 'Madhya Pradesh'),
('corp_434c7437f10', 'yes bank', '1041ab', '1041', 'Associate', '2019-03-01', '2019-03-02 05:07:14', 'Uttar Pradesh'),
('corp_44a3c841421', 'samsung', '1029ab', '1029', 'Subsidiary', '2019-03-01', '2019-03-02 05:06:06', 'Bihar'),
('corp_4620fee06ad', 'JSW', '1035ab', '1035', 'Subsidiary', '2019-03-01', '2019-03-02 05:03:53', 'Gujrat'),
('corp_4905fa7d8c3', 'hero motocorp', '1040ab', '1040', 'Associate', '2019-03-01', '2019-03-02 05:03:36', 'Kerala'),
('corp_4a945c93dfb', 'walmart', '1026ab', '1026', 'Holding', '2019-03-01', '2019-03-02 05:07:03', 'Sikkim'),
('corp_4acd1501d46', 'cipla', '1048ab', '1048', 'Subsidiary', '2019-03-01', '2019-03-02 05:02:10', 'West Bengal'),
('corp_518ce6dcf39', 'reliance', '1090ab', '1090', 'Holding', '2019-03-01', '2019-03-02 05:06:02', 'Rajasthan'),
('corp_53e62e090bb', 'tata power', '1067ab', '1067', 'Subsidiary', '2019-03-01', '2019-03-02 05:06:37', 'Madhya Pradesh'),
('corp_553ab27251e', 'shree cement', '1039ab', '1039', 'Holding', '2019-03-01', '2019-03-02 05:06:14', 'Uttar Pradesh'),
('corp_5a1df3d8a0a', 'vedanta', '1036ab', '1036', 'Associate', '2019-03-01', '2019-03-02 05:07:12', 'Bihar'),
('corp_5f6f6c7bd54', 'ACC', '1061ab', '1000', 'Holding', '2019-03-01', '2019-03-02 04:35:57', 'Gujrat'),
('corp_5f8e89442d3', 'sahara', '1047ab', '1047', 'Holding', '2019-03-01', '2019-03-02 05:04:45', 'Kerala'),
('corp_62f6c749fae', 'google', '1049ab', '1049', 'Associate', '2019-03-01', '2019-03-02 05:03:04', 'Sikkim'),
('corp_6c9b04ad14e', 'bosch', '1038ab', '1038', 'Holding', '2019-03-01', '2019-03-02 05:01:58', 'West Bengal'),
('corp_6d3f02f6cb7', 'arcesium', '1030ab', '1030', 'Subsidiary', '2019-03-01', '2019-03-02 05:01:28', 'Rajasthan'),
('corp_795979f57fe', 'grasim', '1044ab', '1044', 'Associate', '2019-03-01', '2019-03-02 05:03:08', 'Madhya Pradesh'),
('corp_7afc6620f76', 'ICICI', '1007ab', '1007', 'Subsidiary', '2019-03-01', '2019-03-02 05:03:47', 'Uttar Pradesh'),
('corp_7d07f4ba33c', 'hindustan unilever', '1003ab', '1003', 'Associate', '2019-03-01', '2019-03-02 05:03:44', 'Bihar'),
('corp_7d29219a7d6', 'the federal bank', '1069ab', '1069', 'Subsidiary', '2019-03-01', '2019-03-02 05:06:51', 'Gujrat'),
('corp_7d7ce7132cd', 'BPCL', '1033ab', '1033', 'Subsidiary', '2019-03-01', '2019-03-02 05:02:01', 'Kerala'),
('corp_8529689edd8', 'bharti airtel', '1018ab', '1018', 'Subsidiary', '2019-03-01', '2019-03-02 05:01:55', 'Sikkim'),
('corp_942212e7154', 'axis bank', '1010ab', '1010', 'Associate', '2019-03-01', '2019-03-02 05:01:37', 'Haryana'),
('corp_99e0531f0f0', 'TVS motors', '1063ab', '1063', 'Holding', '2019-03-01', '2019-03-02 05:06:54', 'Karnataka'),
('corp_9c780d1c5b5', 'glenmark', '1068ab', '1068', 'Subsidiary', '2019-03-01', '2019-03-02 05:02:57', 'Delhi'),
('corp_a0f9792bf4e', 'tata global', '1070ab', '1070', 'Subsidiary', '2019-03-01', '2019-03-02 05:06:28', 'West Bengal'),
('corp_a278dc0661c', 'siemens', '1053ab', '1053', 'Associate', '2019-03-01', '2019-03-02 05:06:21', 'Rajasthan'),
('corp_a3642c0423b', 'godrej', '1034ab', '1034', 'Subsidiary', '2019-03-01', '2019-03-02 05:03:00', 'Madhya Pradesh'),
('corp_a487c6188bd', 'dabur', '1031ab', '1031', 'Subsidiary', '2019-03-01', '2019-03-02 05:02:16', 'Uttar Pradesh'),
('corp_a6d7f2bf581', 'bajaj auto', '1022ab', '1022', 'Holding', '2019-03-01', '2019-03-02 05:01:41', 'Bihar'),
('corp_ae951f6e2dc', 'tata steel', '1037ab', '1037', 'Associate', '2019-03-01', '2019-03-02 05:06:41', 'Gujrat'),
('corp_b18c82d7214', 'adobe', '1027ab', '1027', '0', '2019-03-01', '2019-03-02 05:01:11', 'Kerala'),
('corp_babb7ee2b18', 'coal india', '1016ab', '1016', 'Subsidiary', '2019-03-01', '2019-03-02 05:02:13', 'Sikkim'),
('corp_bdf81de9b31', 'maruti suzuki', '1008ab', '1008', 'Holding', '2019-03-01', '2019-03-02 05:04:16', 'Tamil Nadu'),
('corp_be1b5f48062', 'ONGC', '1009ab', '1009', 'Associate', '2019-03-01', '2019-03-02 05:04:32', 'Goa'),
('corp_c38abfe7c95', 'larsen and turbo', '1011ab', '1011', 'Subsidiary', '2019-03-01', '2019-03-02 05:03:59', 'West Bengal'),
('corp_c4f62bfcc85', 'cummins', '1066ab', '1066', 'Holding', '2019-03-01', '2019-03-02 05:02:19', 'Rajasthan'),
('corp_c73a8ab9a83', 'mahindra and mahindra', '1024ab', '1024', 'Subsidiary', '2019-03-01', '2019-03-02 05:04:10', 'Madhya Pradesh'),
('corp_ce89b4f0611', 'asian paints', '1017ab', '1017', 'Subsidiary', '2019-03-01', '2019-03-02 05:01:34', 'Uttar Pradesh'),
('corp_d3888de758d', 'marico', '1055ab', '1055', 'Holding', '2019-03-01', '2019-03-02 05:04:13', 'Bihar'),
('corp_d5009945e43', 'elf', '1059ab', '1059', 'Subsidiary', '2019-03-01', '2019-03-02 05:02:50', 'Gujrat'),
('corp_da72f6243de', 'bharat forge', '1064ab', '1064', 'Holding', '2019-03-02', '2019-03-02 05:01:52', 'Kerala'),
('corp_dcd02cd99f1', 'eicher motors', '1043ab', '1043', 'Holding', '2019-03-01', '2019-03-02 05:02:47', 'Sikkim'),
('corp_dd8051d28cf', 'infosys', '1004ab', '1004', 'Subsidiary', '2019-03-01', '2019-03-02 05:03:50', 'West Bengal'),
('corp_dfa59ca7b29', 'star plus', '1046ab', '1046', 'Associate', '2019-03-01', '2019-03-02 05:06:24', 'Rajasthan'),
('corp_e15316068c2', 'cadila', '1057ab', '1057', 'Subsidiary', '2019-03-01', '2019-03-02 05:02:07', 'Madhya Pradesh'),
('corp_e15d5078882', 'nestle', '1019ab', '1019', 'Associate', '2019-03-01', '2019-03-02 05:04:29', 'Uttar Pradesh'),
('corp_ed35bce448b', 'ambuja', '1054ab', '1054', 'Associate', '2019-03-01', '2019-03-02 05:01:14', 'Bihar'),
('corp_f5861f6b118', 'shriram', '1060ab', '1060', 'Associate', '2019-03-01', '2019-03-02 05:06:17', 'Gujrat'),
('corp_fb08e6cf0e5', 'bajaj finance', '1014ab', '1014', 'Holding', '2019-03-01', '2019-03-02 05:01:45', 'Kerala'),
('corp_fcf22708118', 'kotak mahindra', '1006ab', '1006', 'Subsidiary', '2019-03-01', '2019-03-02 05:03:56', 'Sikkim');

-- --------------------------------------------------------

--
-- Table structure for table `corp_rating`
--

CREATE TABLE `corp_rating` (
  `corp1234` text,
  `ReliabilityIndex` int(11) DEFAULT NULL,
  `PerformanceIndex` int(11) DEFAULT NULL,
  `MonetaryIndex` int(11) DEFAULT NULL,
  `ImpactFactor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `corp_rating`
--

INSERT INTO `corp_rating` (`corp1234`, `ReliabilityIndex`, `PerformanceIndex`, `MonetaryIndex`, `ImpactFactor`) VALUES
('corp_04595b18fd5', 6, 6, 7, 10),
('corp_06c317f8a9e', 7, 8, 6, 8),
('corp_0aa07a595c5', 8, 7, 8, 11),
('corp_0be05092603', 8, 6, 7, 12),
('corp_102802fcf12', 7, 6, 5, 14),
('corp_160b5fec7fa', 8, 7, 7, 10),
('corp_1ab8764a438', 8, 8, 8, 11),
('corp_200afaacadf', 6, 6, 5, 15),
('corp_2164c4bae0d', 6, 7, 6, 12),
('corp_2183562f430', 6, 6, 5, 12),
('corp_22a8aac56ca', 8, 7, 5, 13),
('corp_22c8b36bc19', 4, 4, 4, 14),
('corp_258ef2f332d', 7, 8, 5, 8),
('corp_2f6b247dc97', 6, 6, 7, 16),
('corp_30d1a3ad977', 7, 8, 6, 9),
('corp_3867e372b16', 6, 6, 6, 13),
('corp_3a2720c2256', 8, 7, 7, 13),
('corp_3ae0a9feaad', 5, 5, 4, 18),
('corp_3c0d80f8381', 9, 8, 8, 13),
('corp_434c7437f10', 8, 7, 7, 12),
('corp_44a3c841421', 8, 9, 8, 15),
('corp_4620fee06ad', 5, 5, 5, 17),
('corp_4905fa7d8c3', 7, 8, 8, 12),
('corp_4a945c93dfb', 8, 6, 7, 12),
('corp_4acd1501d46', 6, 7, 7, 15),
('corp_518ce6dcf39', 6, 6, 6, 11),
('corp_53e62e090bb', 8, 8, 7, 13),
('corp_553ab27251e', 7, 8, 7, 15),
('corp_5a1df3d8a0a', 7, 6, 8, 13),
('corp_5f6f6c7bd54', 4, 5, 4, 14),
('corp_5f8e89442d3', 7, 8, 7, 9),
('corp_62f6c749fae', 7, 7, 6, 14),
('corp_6c9b04ad14e', 5, 6, 5, 15),
('corp_6d3f02f6cb7', 4, 3, 6, 13),
('corp_795979f57fe', 7, 7, 7, 9),
('corp_7afc6620f76', 4, 7, 6, 13),
('corp_7d07f4ba33c', 3, 4, 3, 13),
('corp_7d29219a7d6', 9, 9, 9, 9),
('corp_7d7ce7132cd', 5, 8, 6, 14),
('corp_8529689edd8', 7, 7, 8, 12),
('corp_942212e7154', 8, 8, 8, 10),
('corp_99e0531f0f0', 6, 6, 7, 9),
('corp_9c780d1c5b5', 7, 7, 7, 14),
('corp_a0f9792bf4e', 6, 7, 6, 12),
('corp_a278dc0661c', 3, 4, 3, 15),
('corp_a3642c0423b', 6, 6, 7, 10),
('corp_a487c6188bd', 7, 8, 6, 8),
('corp_a6d7f2bf581', 8, 7, 8, 11),
('corp_ae951f6e2dc', 8, 6, 7, 12),
('corp_b18c82d7214', 7, 6, 5, 14),
('corp_babb7ee2b18', 8, 7, 7, 10),
('corp_bdf81de9b31', 8, 8, 8, 11),
('corp_be1b5f48062', 6, 6, 5, 15),
('corp_c38abfe7c95', 6, 7, 6, 12),
('corp_c4f62bfcc85', 6, 6, 5, 12),
('corp_c73a8ab9a83', 8, 7, 5, 13),
('corp_ce89b4f0611', 4, 4, 4, 14),
('corp_d3888de758d', 7, 8, 5, 8),
('corp_d5009945e43', 6, 6, 7, 16),
('corp_da72f6243de', 7, 8, 6, 9),
('corp_dcd02cd99f1', 6, 6, 6, 13),
('corp_dd8051d28cf', 8, 7, 7, 13),
('corp_dfa59ca7b29', 5, 5, 4, 18),
('corp_e15316068c2', 9, 8, 8, 13),
('corp_e15d5078882', 8, 7, 7, 12),
('corp_ed35bce448b', 8, 9, 8, 15),
('corp_f5861f6b118', 5, 5, 5, 17),
('corp_fb08e6cf0e5', 7, 8, 8, 12),
('corp_fcf22708118', 8, 6, 7, 12);

-- --------------------------------------------------------

--
-- Table structure for table `corp_reg`
--

CREATE TABLE `corp_reg` (
  `reg_id` int(11) NOT NULL COMMENT 'unique identifier of registration request',
  `corp_name` varchar(200) NOT NULL DEFAULT '0' COMMENT 'corporate name',
  `cin_no` varchar(100) NOT NULL DEFAULT '0' COMMENT 'assigned by govt agency',
  `roc_reg_no` varchar(100) NOT NULL DEFAULT '0' COMMENT 'assigned by govt agency',
  `category` varchar(100) NOT NULL DEFAULT '0' COMMENT 'category of corporate (Holding, Subsidiary, Associate)',
  `incorporate_date` date DEFAULT NULL COMMENT 'date of incorporation',
  `website` varchar(100) NOT NULL DEFAULT '0' COMMENT 'website url',
  `email` varchar(100) NOT NULL DEFAULT '0' COMMENT 'email address',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT 'phone no',
  `mobile` varchar(20) NOT NULL DEFAULT '0' COMMENT 'mobile no',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'status of registration request( 0 - pending, 1 - granted, 2 - rejected)',
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timstamp for last update'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will save the details provided at the corporate registration time. After authenication by admin side its details will be used to create further tables. ';

--
-- Dumping data for table `corp_reg`
--

INSERT INTO `corp_reg` (`reg_id`, `corp_name`, `cin_no`, `roc_reg_no`, `category`, `incorporate_date`, `website`, `email`, `phone`, `mobile`, `status`, `update_timestamp`) VALUES
(3, 'reliance', '1090ab', '1090', 'Holding', '2019-03-01', 'www.reliance.com', 'reliance@g.com', '12345', '1234567891', 1, '2019-03-02 05:06:02'),
(4, 'TCS', '10001ab', '1001', 'Holding', '2019-03-01', 'www.tcs.com', 'a@g.com', '12345', '1234567891', 1, '2019-03-02 05:06:44'),
(5, 'HDFC', '10002ab', '1002', 'Subsidiary', '2019-03-01', 'www.hdfc.com', 'hdfc@g.com', '1234', '1234567891', 1, '2019-03-02 05:03:34'),
(6, 'hindustan unilever', '1003ab', '1003', 'Associate', '2019-03-01', 'www.hul.com', 'hul@g.com', '1234', '1234567891', 1, '2019-03-02 05:03:44'),
(7, 'infosys', '1004ab', '1004', 'Subsidiary', '2019-03-01', 'www.infosys.com', 'infosys@g.com', '1234', '1234567891', 1, '2019-03-02 05:03:50'),
(8, 'SBI', '1005ab', '1005', 'Associate', '2019-03-01', 'www.sbi.com', 'sbi@g.com', '1234', '1234567891', 1, '2019-03-02 05:06:11'),
(9, 'kotak mahindra', '1006ab', '1006', 'Subsidiary', '2019-03-01', 'www.km.com', 'km@km.com', '1234', '1234567891', 1, '2019-03-02 05:03:56'),
(10, 'ICICI', '1007ab', '1007', 'Subsidiary', '2019-03-01', 'www.icici.com', 'a@g.com', '123', '1234567891', 1, '2019-03-02 05:03:47'),
(11, 'maruti suzuki', '1008ab', '1008', 'Holding', '2019-03-01', 'www.ms.com', 'a@a.com', '123', '1234567891', 1, '2019-03-02 05:04:16'),
(12, 'ONGC', '1009ab', '1009', 'Associate', '2019-03-01', 'www.ongc.com', 'ongc@g.com', '123', '1234567891', 1, '2019-03-02 05:04:32'),
(13, 'axis bank', '1010ab', '1010', 'Associate', '2019-03-01', 'www.axis.com', 'axis@g.com', '123', '1234567891', 1, '2019-03-02 05:01:37'),
(14, 'larsen and turbo', '1011ab', '1011', 'Subsidiary', '2019-03-01', 'www.lnt.com', 'lnt@g.com', '123', '1234567891', 1, '2019-03-02 05:03:59'),
(15, 'wipro', '1013ab', '1013', 'Subsidiary', '2019-03-01', 'www.wipro.com', 'wipro@g.com', '123', '1234567891', 1, '2019-03-02 05:07:06'),
(16, 'bajaj finance', '1014ab', '1014', 'Holding', '2019-03-01', 'www.bf.com', 'baf@g.com', '1234', '1234567891', 1, '2019-03-02 05:01:45'),
(17, 'HCL', '1015ab', '1015', 'Associate', '2019-03-01', 'www.hcl.com', 'hcl@g.com', '123', '1234567891', 1, '2019-03-02 05:03:30'),
(18, 'coal india', '1016ab', '1016', 'Subsidiary', '2019-03-01', 'www.cil.com', 'cil@g.com', '123', '1234567891', 1, '2019-03-02 05:02:13'),
(19, 'asian paints', '1017ab', '1017', 'Subsidiary', '2019-03-01', 'www.a.com', 'a@g.com', '123', '1234567891', 1, '2019-03-02 05:01:34'),
(20, 'bharti airtel', '1018ab', '1018', 'Subsidiary', '2019-03-01', 'www.ba.com', 'ba@g.com', '123', '1234567891', 1, '2019-03-02 05:01:55'),
(21, 'nestle', '1019ab', '1019', 'Associate', '2019-03-01', 'www.nestle.com', 'nestle@g.com', '123', '1234567891', 1, '2019-03-02 05:04:29'),
(22, 'ultratech cement', '1020ab', '1020', 'Holding', '2019-03-01', 'www.uc.com', 'uc@g.com', '123', '1234567891', 1, '2019-03-02 05:06:59'),
(23, 'power grid', '1021ab', '1021', 'Holding', '2019-03-01', 'www.pg.com', 'pg@g.com', '123', '1234567891', 1, '2019-03-02 05:05:59'),
(24, 'bajaj auto', '1022ab', '1022', 'Holding', '2019-03-01', 'www.ba.com', 'ba@g.com', '123', '1234567891', 1, '2019-03-02 05:01:41'),
(25, 'tech mahindra', '1023ab', '1023', '0', '2019-03-01', 'www.tm.com', 'tm@g.com', '123', '1234567891', 1, '2019-03-02 05:06:47'),
(26, 'mahindra and mahindra', '1024ab', '1024', 'Subsidiary', '2019-03-01', 'www.mm.com', 'mm@g.com', '123', '1234567891', 1, '2019-03-02 05:04:10'),
(27, 'microsoft', '1025ab', '1025', 'Associate', '2019-03-01', 'www.micro.com', 'micro@g.com', '123', '1234567891', 1, '2019-03-02 05:04:20'),
(28, 'walmart', '1026ab', '1026', 'Holding', '2019-03-01', 'www.w.com', 'w@g.com', '123', '1234567891', 1, '2019-03-02 05:07:03'),
(29, 'adobe', '1027ab', '1027', '0', '2019-03-01', 'www.a.com', 'a@g.com', '123', '1234567891', 1, '2019-03-02 05:01:11'),
(30, 'samsung', '1029ab', '1029', 'Subsidiary', '2019-03-01', 'www.sam.com', 'sam@g.com', '123', '1234567891', 1, '2019-03-02 05:06:06'),
(31, 'arcesium', '1030ab', '1030', 'Subsidiary', '2019-03-01', 'www.arcesium.com', 'arcesium@gmail.com', '123', '1234567891', 1, '2019-03-02 05:01:28'),
(32, 'dabur', '1031ab', '1031', 'Subsidiary', '2019-03-01', 'www.dabur.com', 'dabur@g.com', '123', '1234567891', 1, '2019-03-02 05:02:16'),
(33, 'britannia', '1032ab', '1032', 'Subsidiary', '2019-03-01', 'www.brit.com', 'brit@g.com', '123', '1234567891', 1, '2019-03-02 05:02:04'),
(34, 'BPCL', '1033ab', '1033', 'Subsidiary', '2019-03-01', 'www.bpcl.com', 'bpcl@g.com', '123', '1234567891', 1, '2019-03-02 05:02:01'),
(35, 'godrej', '1034ab', '1034', 'Subsidiary', '2019-03-01', 'www.godrej.com', 'god@g.com', '123', '1234567891', 1, '2019-03-02 05:03:00'),
(36, 'JSW', '1035ab', '1035', 'Subsidiary', '2019-03-01', 'www.jsw.com', 'jsw@g.com', '123', '1234567891', 1, '2019-03-02 05:03:53'),
(37, 'vedanta', '1036ab', '1036', 'Associate', '2019-03-01', 'www.vedanta.com', 'vedanta@g.com', '123', '1234567891', 1, '2019-03-02 05:07:12'),
(38, 'tata steel', '1037ab', '1037', 'Associate', '2019-03-01', 'www.ts.com', 'ts@g.com', '123', '1234567891', 1, '2019-03-02 05:06:41'),
(39, 'bosch', '1038ab', '1038', 'Holding', '2019-03-01', 'www.bosch.com', 'bosch@g.com', '123', '1234567891', 1, '2019-03-02 05:01:58'),
(40, 'shree cement', '1039ab', '1039', 'Holding', '2019-03-01', 'www.sc.com', 'sc@g.com', '123', '1234567891', 1, '2019-03-02 05:06:14'),
(41, 'hero motocorp', '1040ab', '1040', 'Associate', '2019-03-01', 'www.hm.com', 'hm@g.com', '123', '1234567891', 1, '2019-03-02 05:03:37'),
(42, 'yes bank', '1041ab', '1041', 'Associate', '2019-03-01', 'www.yb.com', 'yb@g.com', '123', '1234567891', 1, '2019-03-02 05:07:14'),
(43, 'tata motors', '1042ab', '1042', 'Holding', '2019-03-01', 'www.tm.com', 'tm@g.com', '123', '1234567891', 1, '2019-03-02 05:06:31'),
(44, 'eicher motors', '1043ab', '1043', 'Holding', '2019-03-01', 'www.em.com', 'em@g.com', '123', '1234567891', 1, '2019-03-02 05:02:47'),
(45, 'grasim', '1044ab', '1044', 'Associate', '2019-03-01', 'www.g.com', 'g@g.com', '123', '1234567891', 1, '2019-03-02 05:03:08'),
(46, 'zee', '1045ab', '1045', 'Subsidiary', '2019-03-01', 'www.zee.com', 'zee@g.com', '123', '1234567891', 1, '2019-03-02 05:07:18'),
(47, 'star plus', '1046ab', '1046', 'Associate', '2019-03-01', 'www.sp.com', 'sp@g.com', '123', '1234567891', 1, '2019-03-02 05:06:24'),
(48, 'sahara', '1047ab', '1047', 'Holding', '2019-03-01', 'www.s.com', 's@g.com', '123', '1234567891', 1, '2019-03-02 05:04:45'),
(49, 'cipla', '1048ab', '1048', 'Subsidiary', '2019-03-01', 'www.c.com', 'c@g.com', '123', '1234567891', 1, '2019-03-02 05:02:10'),
(50, 'google', '1049ab', '1049', 'Associate', '2019-03-01', 'www.google.com', 'goo@g.com', '123', '1234567891', 1, '2019-03-02 05:03:04'),
(51, 'apple', '1050ab', '1050', 'Subsidiary', '2019-03-01', 'www.app.com', 'app@g.com', '123', '1234567891', 1, '2019-03-02 05:01:17'),
(52, 'havells', '1051ab', '1051', 'Subsidiary', '2019-03-01', 'www.havells.com', 'hav@g.com', '123', '1234567891', 1, '2019-03-02 05:03:12'),
(53, 'lupin', '1052ab', '1052', 'Subsidiary', '2019-03-01', 'www.lup.com', 'lup@g.com', '123', '1234567891', 1, '2019-03-02 05:04:06'),
(54, 'siemens', '1053ab', '1053', 'Associate', '2019-03-01', 'www.siemens.com', 'sei@g.com', '123', '1234567891', 1, '2019-03-02 05:06:21'),
(55, 'ambuja', '1054ab', '1054', 'Associate', '2019-03-01', 'www.am.com', 'am@g.com', '123', '1234567891', 1, '2019-03-02 05:01:14'),
(56, 'marico', '1055ab', '1055', 'Holding', '2019-03-01', 'www.marico.com', 'mar@g.com', '123', '1234567891', 1, '2019-03-02 05:04:13'),
(57, 'hindalco', '1056ab', '1056', 'Subsidiary', '2019-03-01', 'www.hind.com', 'hind@g.com', '123', '1234567891', 1, '2019-03-02 05:03:39'),
(58, 'cadila', '1057ab', '1057', 'Subsidiary', '2019-03-01', 'www.cadila.com', 'cad@g.com', '123', '1234567891', 1, '2019-03-02 05:02:07'),
(59, 'DLF', '1058ab', '1058', 'Subsidiary', '2019-03-01', 'www.dlf.com', 'dlf@g.com', '123', '1234567891', 1, '2019-03-02 05:02:40'),
(60, 'elf', '1059ab', '1059', 'Subsidiary', '2019-03-01', 'www.elf.com', 'elf@g.com', '123', '1234567891', 1, '2019-03-02 05:02:50'),
(61, 'shriram', '1060ab', '1060', 'Associate', '2019-03-01', 'www.shriram.com', 'shri@g.com', '123', '1234567891', 1, '2019-03-02 05:06:17'),
(62, 'ACC', '1061ab', '1061', 'Holding', '2019-03-01', 'www.acc.com', 'acc@g.com', '123', '1234567891', 1, '2019-03-02 04:59:48'),
(63, 'ashok leyland', '1062ab', '1062', 'Subsidiary', '2019-03-01', 'www.al.com', 'al@g.com', '123', '1234567891', 1, '2019-03-02 05:01:31'),
(64, 'TVS motors', '1063ab', '1063', 'Holding', '2019-03-01', 'www.tvs.com', 'tvs@g.com', '123', '1234567891', 1, '2019-03-02 05:06:54'),
(65, 'bharat forge', '1064ab', '1064', 'Holding', '2019-03-02', 'www.bharat.com', 'bha@g.com', '123', '1234567891', 1, '2019-03-02 05:01:52'),
(66, 'exide', '1065ab', '1065', 'Holding', '2019-03-01', 'www.exide.com', 'ex@g.com', '123', '1234567891', 1, '2019-03-02 05:02:54'),
(67, 'cummins', '1066ab', '1066', 'Holding', '2019-03-01', 'www.cummins.com', 'cummins@g.com', '123', '1234567891', 1, '2019-03-02 05:02:19'),
(68, 'tata power', '1067ab', '1067', 'Subsidiary', '2019-03-01', 'www.tp.com', 'tp@g.com', '123', '1234567891', 1, '2019-03-02 05:06:37'),
(69, 'glenmark', '1068ab', '1068', 'Subsidiary', '2019-03-01', 'www.glem.com', 'glem@g.com', '123', '1234567891', 1, '2019-03-02 05:02:57'),
(70, 'the federal bank', '1069ab', '1069', 'Subsidiary', '2019-03-01', 'www.fb.com', 'fb@g.com', '123', '1234567891', 1, '2019-03-02 05:06:51'),
(71, 'tata global', '1070ab', '1070', 'Subsidiary', '2019-03-01', 'www.tg.com', 'tg@g.com', '123', '1234567891', 1, '2019-03-02 05:06:28');

-- --------------------------------------------------------

--
-- Table structure for table `corp_tech`
--

CREATE TABLE `corp_tech` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporate',
  `tech_id` int(11) NOT NULL COMMENT 'unique identification of particular technology'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table stores the technology details a particular corporate is interested in or is working on.';

-- --------------------------------------------------------

--
-- Table structure for table `corp_vertical`
--

CREATE TABLE `corp_vertical` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporates',
  `vertical_id` int(11) NOT NULL COMMENT 'unique identification of verticals'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table stores verticals a particular corporate is working on or is interested in.';

-- --------------------------------------------------------

--
-- Table structure for table `corp_vision`
--

CREATE TABLE `corp_vision` (
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporates',
  `vision` text COMMENT 'path of corporate vision file',
  `short_desc` text COMMENT 'short description about corporates'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table stores vision and short description of a particular corporate. Both are optional for corporates. Description will be text stored in the DB itself. And vision will be stored in a separate file whose path will be stored in the table.';

-- --------------------------------------------------------

--
-- Table structure for table `feed_corp_startup`
--

CREATE TABLE `feed_corp_startup` (
  `feed_id` int(11) NOT NULL,
  `corp_id` varchar(20) NOT NULL,
  `startup_id` varchar(20) NOT NULL,
  `project_id` int(11) NOT NULL,
  `reliability` int(11) NOT NULL,
  `performance` int(11) NOT NULL,
  `punctuality` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gov_auth`
--

CREATE TABLE `gov_auth` (
  `gov_id` varchar(20) NOT NULL,
  `login_id` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gov_auth`
--

INSERT INTO `gov_auth` (`gov_id`, `login_id`, `password`, `created_date`, `status`, `type`) VALUES
('gov1234', 'startupindia', 'p', '2014-09-29 23:25:26', 1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_blobs`
--

CREATE TABLE `ideapitch_blobs` (
  `blobid` bigint(20) UNSIGNED NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_cache`
--

CREATE TABLE `ideapitch_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_categories`
--

CREATE TABLE `ideapitch_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_categorymetas`
--

CREATE TABLE `ideapitch_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_contentwords`
--

CREATE TABLE `ideapitch_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_contentwords`
--

INSERT INTO `ideapitch_contentwords` (`postid`, `wordid`, `count`, `type`, `questionid`) VALUES
(1, 4, 2, 'Q', 1),
(1, 5, 1, 'Q', 1),
(1, 6, 1, 'Q', 1),
(1, 7, 1, 'Q', 1),
(1, 1, 2, 'Q', 1),
(1, 2, 2, 'Q', 1),
(1, 3, 2, 'Q', 1),
(1, 8, 1, 'Q', 1),
(1, 9, 1, 'Q', 1),
(1, 10, 1, 'Q', 1),
(1, 11, 1, 'Q', 1),
(1, 12, 1, 'Q', 1),
(1, 13, 1, 'Q', 1),
(1, 14, 1, 'Q', 1),
(1, 15, 1, 'Q', 1),
(1, 16, 1, 'Q', 1),
(1, 17, 1, 'Q', 1),
(1, 18, 1, 'Q', 1),
(1, 19, 1, 'Q', 1),
(1, 20, 1, 'Q', 1),
(1, 21, 1, 'Q', 1),
(1, 22, 2, 'Q', 1),
(1, 23, 1, 'Q', 1),
(1, 24, 1, 'Q', 1),
(1, 25, 1, 'Q', 1),
(1, 26, 1, 'Q', 1),
(1, 27, 1, 'Q', 1),
(1, 28, 1, 'Q', 1),
(1, 29, 1, 'Q', 1),
(2, 31, 3, 'A', 1),
(2, 32, 1, 'A', 1),
(2, 33, 2, 'A', 1),
(2, 34, 2, 'A', 1),
(2, 27, 2, 'A', 1),
(2, 35, 2, 'A', 1),
(2, 4, 2, 'A', 1),
(2, 36, 1, 'A', 1),
(2, 37, 1, 'A', 1),
(2, 9, 1, 'A', 1),
(2, 38, 1, 'A', 1),
(2, 39, 1, 'A', 1),
(2, 40, 1, 'A', 1),
(2, 41, 1, 'A', 1),
(2, 42, 1, 'A', 1),
(2, 43, 1, 'A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_cookies`
--

CREATE TABLE `ideapitch_cookies` (
  `cookieid` bigint(20) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_iplimits`
--

CREATE TABLE `ideapitch_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_iplimits`
--

INSERT INTO `ideapitch_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(0xac18fdb9, 'A', 430995, 1),
(0xac18fdb9, 'V', 430995, 1),
(0xac18fed7, 'Q', 430995, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_options`
--

CREATE TABLE `ideapitch_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_options`
--

INSERT INTO `ideapitch_options` (`title`, `content`) VALUES
('allow_anonymous_naming', '1'),
('allow_close_own_questions', '1'),
('allow_close_questions', '1'),
('allow_multi_answers', '1'),
('allow_private_messages', '1'),
('allow_self_answer', '1'),
('allow_user_walls', '1'),
('allow_view_q_bots', '1'),
('avatar_message_list_size', '20'),
('avatar_q_list_size', '0'),
('avatar_q_page_a_size', '40'),
('avatar_q_page_c_size', '20'),
('avatar_q_page_q_size', '50'),
('avatar_users_size', '30'),
('block_bad_words', ''),
('block_ips_write', ''),
('cache_acount', '1'),
('cache_ccount', ''),
('cache_flaggedcount', ''),
('cache_qcount', '1'),
('cache_queuedcount', ''),
('cache_tagcount', '2'),
('cache_unaqcount', '0'),
('cache_unselqcount', '1'),
('cache_unupaqcount', '1'),
('cache_userpointscount', '2'),
('caching_catwidget_time', '30'),
('caching_driver', 'filesystem'),
('caching_enabled', '0'),
('caching_q_start', '7'),
('caching_q_time', '30'),
('captcha_on_anon_post', '1'),
('captcha_on_unconfirmed', '0'),
('columns_tags', '3'),
('columns_users', '2'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('custom_answer', ''),
('custom_ask', ''),
('custom_comment', ''),
('custom_footer', ''),
('custom_header', ''),
('custom_home_content', ''),
('custom_home_heading', ''),
('custom_in_head', ''),
('custom_sidebar', 'Welcome to IdeaPitch, where you can disseminate your latest exciting ideas for the corporates to see and get them interested.'),
('custom_sidepanel', ''),
('db_version', '67'),
('do_ask_check_qs', '0'),
('do_close_on_select', '0'),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', 'WYSIWYG Editor'),
('editor_for_cs', ''),
('editor_for_qs', 'WYSIWYG Editor'),
('email_privacy', 'Privacy: Your email address will not be shared or sold to third parties.'),
('enabled_plugins', ''),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('extra_field_active', '0'),
('extra_field_display', '0'),
('extra_field_label', ''),
('extra_field_prompt', ''),
('feedback_email', ''),
('feedback_enabled', '0'),
('feed_for_activity', '0'),
('feed_for_hot', '0'),
('feed_for_qa', '0'),
('feed_for_questions', '0'),
('feed_for_search', '0'),
('feed_for_tag_qs', '0'),
('feed_for_unanswered', '0'),
('feed_full_text', '1'),
('feed_number_items', '50'),
('feed_per_category', '1'),
('flagging_hide_after', '5'),
('flagging_notify_every', '2'),
('flagging_notify_first', '1'),
('flagging_of_posts', '1'),
('follow_on_as', '1'),
('form_security_salt', 'jevvtn0qreu7mfkxo45usci8n08wbgcs'),
('from_email', 'no-reply@example.com'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('links_in_new_window', ''),
('logo_height', '200'),
('logo_show', '1'),
('logo_url', 'qa-theme/IdeaPitch/images/logo.png'),
('logo_width', '200'),
('match_ask_check_qs', '3'),
('match_example_tags', '3'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_as', '50'),
('max_rate_ip_cs', '40'),
('max_rate_ip_flags', '10'),
('max_rate_ip_messages', '10'),
('max_rate_ip_qs', '20'),
('max_rate_ip_uploads', '20'),
('max_rate_ip_votes', '600'),
('max_rate_user_as', '25'),
('max_rate_user_cs', '20'),
('max_rate_user_flags', '5'),
('max_rate_user_messages', '5'),
('max_rate_user_qs', '10'),
('max_rate_user_uploads', '10'),
('max_rate_user_votes', '300'),
('max_store_user_updates', '50'),
('minify_html', '1'),
('min_len_a_content', '12'),
('min_len_c_content', '5'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_anon_post', ''),
('moderate_by_points', ''),
('moderate_edited_again', ''),
('moderate_notify_admin', '1'),
('moderate_points_limit', '150'),
('moderate_unapproved', ''),
('moderate_unconfirmed', ''),
('moderate_update_time', '1'),
('moderate_users', ''),
('nav_activity', '0'),
('nav_ask', '1'),
('nav_categories', '0'),
('nav_home', ''),
('nav_hot', '0'),
('nav_qa_is_home', '0'),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('neat_urls', '0'),
('notice_visitor', ''),
('notify_admin_q_post', '0'),
('notify_users_default', '1'),
('pages_prev_next', '3'),
('page_size_activity', '20'),
('page_size_ask_check_qs', '5'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_hot_qs', '20'),
('page_size_qs', '20'),
('page_size_q_as', '10'),
('page_size_search', '10'),
('page_size_tags', '30'),
('page_size_tag_qs', '20'),
('page_size_una_qs', '20'),
('page_size_users', '30'),
('permit_anon_view_ips', '70'),
('permit_anon_view_ips_points', ''),
('permit_close_q', '70'),
('permit_close_q_points', ''),
('permit_delete_hidden', '40'),
('permit_delete_hidden_points', ''),
('permit_edit_a', '100'),
('permit_edit_a_points', ''),
('permit_edit_c', '70'),
('permit_edit_c_points', ''),
('permit_edit_q', '70'),
('permit_edit_q_points', ''),
('permit_edit_silent', '40'),
('permit_edit_silent_points', ''),
('permit_flag', '110'),
('permit_flag_points', ''),
('permit_hide_show', '70'),
('permit_hide_show_points', ''),
('permit_moderate', '100'),
('permit_moderate_points', ''),
('permit_post_a', '150'),
('permit_post_a_points', ''),
('permit_post_c', '150'),
('permit_post_c_points', ''),
('permit_post_q', '150'),
('permit_post_q_points', ''),
('permit_post_wall', '110'),
('permit_post_wall_points', ''),
('permit_retag_cat', '70'),
('permit_retag_cat_points', ''),
('permit_select_a', '100'),
('permit_select_a_points', ''),
('permit_view_new_users_page', '70'),
('permit_view_new_users_page_points', ''),
('permit_view_q_page', '150'),
('permit_view_special_users_page', '40'),
('permit_view_special_users_page_points', ''),
('permit_view_voters_flaggers', '20'),
('permit_view_voters_flaggers_points', ''),
('permit_vote_a', '120'),
('permit_vote_a_points', ''),
('permit_vote_down', '120'),
('permit_vote_down_points', ''),
('permit_vote_q', '120'),
('permit_vote_q_points', ''),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_c_voted_max_gain', '10'),
('points_c_voted_max_loss', '3'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_c_voted_down', '0'),
('points_per_c_voted_up', '0'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('recalc_hotness_q_view', '1'),
('search_module', ''),
('show_a_c_links', '1'),
('show_a_form_immediate', 'if_no_as'),
('show_compact_numbers', '1'),
('show_custom_answer', '0'),
('show_custom_ask', '0'),
('show_custom_comment', '0'),
('show_custom_footer', '0'),
('show_custom_header', '0'),
('show_custom_home', '0'),
('show_custom_in_head', '0'),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', '0'),
('show_c_reply_buttons', '1'),
('show_fewer_cs_count', '5'),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_home_description', '0'),
('show_notice_visitor', '0'),
('show_post_update_meta', '1'),
('show_selected_first', '1'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_counts', '0'),
('show_view_count_q_page', '0'),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'IdeaPitch'),
('site_theme_mobile', 'IdeaPitch'),
('site_title', 'IdeaPitch'),
('site_url', 'http://localhost/SIH/anveshak/IdeaPitch/'),
('smtp_active', '0'),
('smtp_address', ''),
('smtp_authenticate', '0'),
('smtp_password', ''),
('smtp_port', '25'),
('smtp_secure', ''),
('smtp_username', ''),
('sort_answers_by', 'created'),
('tags_or_categories', 'tc'),
('tag_separator_comma', '0'),
('use_microdata', '1'),
('votes_separated', ''),
('voting_on_as', '1'),
('voting_on_cs', '0'),
('voting_on_qs', '1'),
('voting_on_q_page_only', ''),
('wysiwyg_editor_upload_images', '');

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_pages`
--

CREATE TABLE `ideapitch_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_pages`
--

INSERT INTO `ideapitch_pages` (`pageid`, `title`, `nav`, `position`, `flags`, `permit`, `tags`, `heading`, `content`) VALUES
(1, 'Home', 'B', 1, 1, 120, 'http://172.24.254.215/SIH/anveshak', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_postmetas`
--

CREATE TABLE `ideapitch_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_posts`
--

CREATE TABLE `ideapitch_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` varchar(30) DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_posts`
--

INSERT INTO `ideapitch_posts` (`postid`, `type`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 'startup1234', NULL, 0xac18fed7, NULL, NULL, 1, 0, 1, 0xac18fdb9, 2, 57892500000, 0, '', '2019-03-03 08:30:03', NULL, NULL, 'Block Chain Network', 'We want to use block chain network technology for providing the service of e-medicare. Using Block chain network we will store daily life routines and health habbits and give them good medical suggestions.', 'medical,block-chain', NULL, '@'),
(2, 'A', 1, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 'corp1234', NULL, 0xac18fdb9, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2019-03-03 08:57:21', NULL, NULL, NULL, 'This is a very good idea. We see a very good future for this idea. Hopefully we can work together in this area.', NULL, NULL, '@');

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_posttags`
--

CREATE TABLE `ideapitch_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_posttags`
--

INSERT INTO `ideapitch_posttags` (`postid`, `wordid`, `postcreated`) VALUES
(1, 28, '2019-03-03 08:30:03'),
(1, 30, '2019-03-03 08:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_sharedevents`
--

CREATE TABLE `ideapitch_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` varchar(30) DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_sharedevents`
--

INSERT INTO `ideapitch_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('Q', 1, 1, 1, NULL, 'startup1234', '2019-03-03 08:30:03'),
('T', 30, 1, 1, NULL, 'startup1234', '2019-03-03 08:30:03'),
('T', 28, 1, 1, NULL, 'startup1234', '2019-03-03 08:30:03');

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_tagmetas`
--

CREATE TABLE `ideapitch_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_tagwords`
--

CREATE TABLE `ideapitch_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_tagwords`
--

INSERT INTO `ideapitch_tagwords` (`postid`, `wordid`) VALUES
(1, 28),
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_titlewords`
--

CREATE TABLE `ideapitch_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_titlewords`
--

INSERT INTO `ideapitch_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_userevents`
--

CREATE TABLE `ideapitch_userevents` (
  `userid` varchar(30) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` varchar(30) DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_userfavorites`
--

CREATE TABLE `ideapitch_userfavorites` (
  `userid` varchar(30) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_userlevels`
--

CREATE TABLE `ideapitch_userlevels` (
  `userid` varchar(30) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_userlimits`
--

CREATE TABLE `ideapitch_userlimits` (
  `userid` varchar(30) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_userlimits`
--

INSERT INTO `ideapitch_userlimits` (`userid`, `action`, `period`, `count`) VALUES
('corp1234', 'A', 430995, 1),
('corp1234', 'V', 430995, 1),
('startup1234', 'Q', 430995, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_usermetas`
--

CREATE TABLE `ideapitch_usermetas` (
  `userid` varchar(30) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_usernotices`
--

CREATE TABLE `ideapitch_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` varchar(30) NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_userpoints`
--

CREATE TABLE `ideapitch_userpoints` (
  `userid` varchar(30) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `cvoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_userpoints`
--

INSERT INTO `ideapitch_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `cupvotes`, `cdownvotes`, `qvoteds`, `avoteds`, `cvoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
('corp1234', 150, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('startup1234', 130, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_uservotes`
--

CREATE TABLE `ideapitch_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` varchar(30) NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `votecreated` datetime DEFAULT NULL,
  `voteupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_uservotes`
--

INSERT INTO `ideapitch_uservotes` (`postid`, `userid`, `vote`, `flag`, `votecreated`, `voteupdated`) VALUES
(1, 'corp1234', 1, 0, '2019-03-03 08:56:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_widgets`
--

CREATE TABLE `ideapitch_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ideapitch_words`
--

CREATE TABLE `ideapitch_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideapitch_words`
--

INSERT INTO `ideapitch_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'block', 1, 1, 1, 0),
(2, 'chain', 1, 1, 1, 0),
(3, 'network', 1, 1, 0, 0),
(4, 'we', 0, 2, 0, 0),
(5, 'want', 0, 1, 0, 0),
(6, 'to', 0, 1, 0, 0),
(7, 'use', 0, 1, 0, 0),
(8, 'technology', 0, 1, 0, 0),
(9, 'for', 0, 2, 0, 0),
(10, 'providing', 0, 1, 0, 0),
(11, 'the', 0, 1, 0, 0),
(12, 'service', 0, 1, 0, 0),
(13, 'of', 0, 1, 0, 0),
(14, 'e', 0, 1, 0, 0),
(15, 'medicare', 0, 1, 0, 0),
(16, 'using', 0, 1, 0, 0),
(17, 'will', 0, 1, 0, 0),
(18, 'store', 0, 1, 0, 0),
(19, 'daily', 0, 1, 0, 0),
(20, 'life', 0, 1, 0, 0),
(21, 'routines', 0, 1, 0, 0),
(22, 'and', 0, 1, 0, 0),
(23, 'health', 0, 1, 0, 0),
(24, 'habbits', 0, 1, 0, 0),
(25, 'give', 0, 1, 0, 0),
(26, 'them', 0, 1, 0, 0),
(27, 'good', 0, 2, 0, 0),
(28, 'medical', 0, 1, 1, 1),
(29, 'suggestions', 0, 1, 0, 0),
(30, 'block-chain', 0, 0, 0, 1),
(31, 'this', 0, 1, 0, 0),
(32, 'is', 0, 1, 0, 0),
(33, 'a', 0, 1, 0, 0),
(34, 'very', 0, 1, 0, 0),
(35, 'idea', 0, 1, 0, 0),
(36, 'see', 0, 1, 0, 0),
(37, 'future', 0, 1, 0, 0),
(38, 'hopefully', 0, 1, 0, 0),
(39, 'can', 0, 1, 0, 0),
(40, 'work', 0, 1, 0, 0),
(41, 'together', 0, 1, 0, 0),
(42, 'in', 0, 1, 0, 0),
(43, 'area', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `login_logout_log`
--

CREATE TABLE `login_logout_log` (
  `log_id` int(11) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `logged_in_time` datetime DEFAULT NULL,
  `logged_out_time` datetime DEFAULT NULL,
  `login_ip` varchar(20) NOT NULL,
  `logout_ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_logout_log`
--

INSERT INTO `login_logout_log` (`log_id`, `user_id`, `logged_in_time`, `logged_out_time`, `login_ip`, `logout_ip`) VALUES
(1, 'gov1234', '2019-03-01 18:43:39', '2019-03-01 20:53:40', '127.0.0.1', '127.0.0.1'),
(2, 'startup1234', '2019-03-01 18:47:59', '2019-03-01 18:48:27', '127.0.0.1', '127.0.0.1'),
(3, 'startup_6dcc97cbf7bf', '2019-03-01 18:51:05', '2019-03-01 18:55:27', '127.0.0.1', '127.0.0.1'),
(4, 'gov1234', '2019-03-01 20:53:40', '2019-03-02 09:51:47', '127.0.0.1', '::1'),
(5, 'gov1234', '2019-03-02 09:51:47', '2019-03-02 14:57:01', '::1', '172.24.254.25'),
(6, 'gov1234', '2019-03-02 14:57:01', '2019-03-02 14:28:16', '172.24.254.25', '::1'),
(7, 'startup1234', '2019-03-02 15:15:51', '2019-03-02 16:00:03', '172.24.254.25', '172.24.254.25'),
(8, 'startup1234', '2019-03-02 16:00:11', '2019-03-02 16:00:53', '172.24.254.25', '172.24.254.25'),
(9, 'corp1234', '2019-03-02 16:01:04', '2019-03-02 14:24:50', '172.24.254.25', '::1'),
(10, 'corp1234', '2019-03-02 14:24:50', '2019-03-02 14:25:25', '::1', '::1'),
(11, 'corp1234', '2019-03-02 14:25:55', '2019-03-02 14:27:22', '::1', '::1'),
(12, 'gov1234', '2019-03-02 14:28:16', '2019-03-02 18:48:07', '::1', '::1'),
(13, 'startup1234', '2019-03-02 18:48:48', '2019-03-02 18:50:59', '::1', '::1'),
(14, 'startup1234', '2019-03-02 18:51:16', '2019-03-02 21:06:43', '::1', '::1'),
(15, 'startup1234', '2019-03-02 21:06:43', '2019-03-02 21:12:21', '::1', '::1'),
(16, 'startup1234', '2019-03-02 21:12:32', '2019-03-02 21:12:46', '::1', '::1'),
(17, 'startup1234', '2019-03-02 21:16:54', '2019-03-02 21:16:57', '::1', '::1'),
(18, 'startup1234', '2019-03-02 22:17:16', '2019-03-02 23:54:40', '::1', '::1'),
(19, 'corp1234', '2019-03-02 23:54:48', '2019-03-03 01:27:57', '::1', '::1'),
(20, 'startup1234', '2019-03-03 01:47:00', '2019-03-03 01:56:48', '172.24.254.215', '172.24.254.215'),
(21, 'startup1234', '2019-03-03 02:18:23', '2019-03-03 02:23:31', '172.24.254.215', '172.24.254.215'),
(22, 'corp1234', '2019-03-03 02:23:40', '2019-03-03 02:30:30', '172.24.254.215', '172.24.254.215'),
(23, 'startup1234', '2019-03-03 02:30:37', '2019-03-03 02:52:51', '172.24.254.215', '172.24.254.25'),
(24, 'startup_5377381aa1e', '2019-03-03 02:49:25', NULL, '172.24.249.142', NULL),
(25, 'startup1234', '2019-03-03 02:52:51', '2019-03-03 02:56:11', '172.24.254.25', '172.24.254.25'),
(26, 'startup1234', '2019-03-03 02:57:26', '2019-03-03 03:07:57', '172.24.254.25', '172.24.254.215'),
(27, 'startup_0221e174296', '2019-03-03 02:57:56', '2019-03-03 02:59:28', '172.24.254.25', '172.24.254.25'),
(28, 'startup_049027ac21d', '2019-03-03 02:59:55', '2019-03-03 04:41:40', '172.24.254.25', '172.24.254.25'),
(29, 'corp1234', '2019-03-03 03:08:34', '2019-03-03 03:26:01', '172.24.254.215', '172.24.254.215'),
(30, 'startup1234', '2019-03-03 03:26:18', '2019-03-03 03:26:48', '172.24.254.215', '172.24.254.215'),
(31, 'startup1234', '2019-03-03 03:26:51', '2019-03-03 03:38:17', '172.24.254.215', '172.24.254.215'),
(32, 'startup1234', '2019-03-03 03:38:22', '2019-03-03 04:36:40', '172.24.254.215', '172.24.254.215'),
(33, 'corp1234', '2019-03-03 04:25:49', '2019-03-03 04:41:01', '172.24.253.185', '172.24.254.215'),
(34, 'startup_3d04d4656c3', '2019-03-03 04:35:06', '2019-03-03 13:41:18', '172.24.252.150', '172.24.254.215'),
(35, 'corp_04595b18fd5', '2019-03-03 04:37:14', '2019-03-03 04:38:22', '172.24.254.215', '172.24.254.215'),
(36, 'startup1234', '2019-03-03 04:38:40', '2019-03-03 04:40:40', '172.24.254.215', '172.24.254.215'),
(37, 'corp1234', '2019-03-03 04:41:01', '2019-03-03 04:41:38', '172.24.254.215', '172.24.254.215'),
(38, 'corp_04595b18fd5', '2019-03-03 04:41:42', '2019-03-03 07:55:22', '172.24.254.215', '172.24.249.142'),
(39, 'startup_0221e174296', '2019-03-03 07:55:40', '2019-03-03 07:56:56', '172.24.249.142', '172.24.249.142'),
(40, 'startup_0221e174296', '2019-03-03 07:57:52', NULL, '172.24.249.142', NULL),
(41, 'corp_04595b18fd5', '2019-03-03 12:46:13', '2019-03-03 12:47:12', '172.24.254.215', '172.24.254.215'),
(42, 'startup1234', '2019-03-03 12:47:25', '2019-03-03 13:02:04', '172.24.254.215', '172.24.254.215'),
(43, 'corp_04595b18fd5', '2019-03-03 13:02:11', '2019-03-03 13:42:23', '172.24.254.215', '172.24.254.215'),
(44, 'startup1234', '2019-03-03 13:18:15', '2019-03-03 13:25:20', '172.24.254.215', '172.24.254.215'),
(45, 'corp1234', '2019-03-03 13:25:16', '2019-03-03 13:25:32', '172.24.250.5', '172.24.254.215'),
(46, 'corp1234', '2019-03-03 13:25:32', '2019-03-03 13:29:23', '172.24.254.215', '172.24.254.215'),
(47, 'corp1234', '2019-03-03 13:37:23', '2019-03-03 13:39:31', '172.24.254.215', '172.24.254.215'),
(48, 'startup1234', '2019-03-03 13:39:43', '2019-03-03 13:40:56', '172.24.254.215', '172.24.254.215'),
(49, 'startup_3d04d4656c3', '2019-03-03 13:41:18', '2019-03-03 13:41:55', '172.24.254.215', '172.24.254.215'),
(50, 'corp_04595b18fd5', '2019-03-03 13:42:23', '2019-03-03 13:42:41', '172.24.254.215', '172.24.254.215'),
(51, 'startup_3d04d4656c3', '2019-03-03 13:42:48', '2019-03-03 13:43:24', '172.24.254.215', '172.24.254.215'),
(52, 'corp_06c317f8a9e', '2019-03-03 13:43:30', '2019-03-03 13:43:48', '172.24.254.215', '172.24.254.215'),
(53, 'startup_3d04d4656c3', '2019-03-03 13:43:52', '2019-03-03 13:44:59', '172.24.254.215', '172.24.254.215'),
(54, 'corp_04595b18fd5', '2019-03-03 13:45:07', '2019-03-03 13:45:59', '172.24.254.215', '172.24.254.215'),
(55, 'startup_3d04d4656c3', '2019-03-03 13:46:04', '2019-03-03 13:52:22', '172.24.254.215', '172.24.254.215'),
(56, 'corp_04595b18fd5', '2019-03-03 13:52:28', '2019-03-03 13:55:32', '172.24.254.215', '172.24.254.215'),
(57, 'corp_06c317f8a9e', '2019-03-03 13:56:06', '2019-03-03 14:02:04', '172.24.254.215', '172.24.254.215'),
(58, 'startup_3d04d4656c3', '2019-03-03 14:02:14', '2019-03-03 14:03:31', '172.24.254.215', '172.24.254.215'),
(59, 'corp_06c317f8a9e', '2019-03-03 14:21:33', NULL, '172.24.254.215', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `problem_list`
--

CREATE TABLE `problem_list` (
  `prob_id` int(11) NOT NULL,
  `corp_id` varchar(40) NOT NULL,
  `problem_statement` text NOT NULL,
  `post_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problem_list`
--

INSERT INTO `problem_list` (`prob_id`, `corp_id`, `problem_statement`, `post_date`) VALUES
(8, 'corp_04595b18fd5', 'hello', '2019-03-03 15:17:22'),
(9, 'corp_04595b18fd5', 'ldjkdjkdl', '2019-03-03 15:17:22'),
(10, 'corp_04595b18fd5', 'payment', '2019-03-03 17:17:03'),
(11, 'corp1234', 'need interior designers ', '2019-03-03 18:08:31'),
(12, 'corp_04595b18fd5', 'interiors', '2019-03-03 18:12:37'),
(13, 'corp_06c317f8a9e', 'wedding', '2019-03-03 18:13:45');

-- --------------------------------------------------------

--
-- Table structure for table `problem_tag`
--

CREATE TABLE `problem_tag` (
  `prob_id` int(11) NOT NULL,
  `vertical_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problem_tag`
--

INSERT INTO `problem_tag` (`prob_id`, `vertical_id`) VALUES
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(9, 3),
(10, 2),
(11, 19),
(12, 19),
(13, 7);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `corp_id` varchar(20) NOT NULL,
  `startup_id` varchar(20) NOT NULL,
  `project_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`corp_id`, `startup_id`, `project_id`, `status`) VALUES
('char1234', 'rubix123', 1, 0),
('corp1234', 'startup2', 2, 0),
('corp1234', 'startup3', 3, 1),
('corp123', 'startup4', 4, 1),
('corp1234', 'startup5', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ratingdescription_dataset`
--

CREATE TABLE `ratingdescription_dataset` (
  `startup_id` text,
  `description` text,
  `tags` text,
  `ReliabilityIndex` int(11) DEFAULT NULL,
  `PerformanceIndex` int(11) DEFAULT NULL,
  `MonetaryIndex` int(11) DEFAULT NULL,
  `ImpactFactor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratingdescription_dataset`
--

INSERT INTO `ratingdescription_dataset` (`startup_id`, `description`, `tags`, `ReliabilityIndex`, `PerformanceIndex`, `MonetaryIndex`, `ImpactFactor`) VALUES
('startup_0221e174296', 'You know when you forward a filmy meme most of the time Filmygyan is mostly behind them. They are one innovative set of people making our lives masaledaar!', 'You know when you forward a filmy meme most of the time Filmygyan is mostly behind them. They are one innovative set of people making our lives masaledaar! Bollywood Review, movie review, entertainment, meme.', 8, 7, 9, 12),
('startup_049027ac21d', 'Providing solutions in Banking, Software and many more. Sumeru is your go to organisation for IT solutions with a human touch.\n\n', 'Providing solutions in Banking, Software and many more. Sumeru is your go to organisation for IT solutions with a human touch. Banking, Software, IT.\n\n', 6, 6, 6, 11),
('startup_07b7f23419d', 'Mobiefit motivates you to get fitter, healthier and a happier person with workouts, running and walking training. It enables its users to access training videos and exercises for a \'fitter you\'!', 'Mobiefit motivates you to get fitter, healthier and a happier person with workouts, running and walking training. It enables its users to access training videos and exercises for a \'fitter you\'! Fit, Fitness, walking, running, workout, training, health.', 6, 5, 9, 13),
('startup_08971b04e3a', 'A fun-filled space with high - class technological games to entertain youngsters and adults equally!', 'A fun-filled space with high - class technological games to entertain youngsters and adults equally! Tehnology, youngsters, fun, Entertainment, games.', 9, 8, 7, 16),
('startup_128f4e34887', 'Hipcask is a smartphone application that enables users to discover wines, whiskies, and beers. The application enables users to measure a likability factor, pair wines with foods, get and add tasting notes, get notifications about new launches, and more.', 'Hipcask is a smartphone application that enables users to discover wines, whiskies, and beers. The application enables users to measure a likability factor, pair wines with foods, get and add tasting notes, get notifications about new launches, and more. Sommelier, Food critic', 9, 7, 8, 13),
('startup_129b01b099e', 'ftcash is one of IndiaÍs fast-growing financial technology venture, recognized by Forbes, which aims to empower micro-merchants and small businesses with the power of credit using digital payments, using only a bank account and a feature phone', 'ftcash is one of IndiaÍs fast-growing financial technology venture, recognized by Forbes, which aims to empower micro-merchants and small businesses with the power of credit using digital payments, using only a bank account and a feature phone. Payment, Transaction, small scale, cashless, digital.', 9, 9, 7, 10),
('startup_1c057cbeac3', 'Known as Indian\'s most trusted pharmacy Netmeds.com is a renowned name in the medical field. It enables the user to send or receive medicine from any part of India.', 'Known as Indian\'s most trusted pharmacy Netmeds.com is a renowned name in the medical field. It enables the user to send or receive medicine from any part of India. Medical', 6, 8, 5, 13),
('startup_1e2a7dc8110', 'OncoStem Diagnostics was founded in 2011 with the vision of developing innovative multimarker prognostic & predictive tests to enable personalized treatment planning for patients with Cancer.', 'OncoStem Diagnostics was founded in 2011 with the vision of developing innovative multimarker prognostic & predictive tests to enable personalized treatment planning for patients with Cancer. Health, Checkup, diagnostic test, Cancer treatment, treat.', 4, 4, 6, 15),
('startup_258b66dcf51', 'Seeing that Artificial Intelligence is the future, Boxx.ai uses the same technology to solve problems that enterprises face in a more affordable way, making it more accessible for all. With all this securing a place amongst the top startups in India', 'Seeing that Artificial Intelligence is the future, Boxx.ai uses the same technology to solve problems that enterprises face in a more affordable way, making it more accessible for all. With all this securing a place amongst the top startups in India. Top startups, AI, technology', 4, 8, 9, 13),
('startup_2f4aa8e859b', 'HexOctane is an Internet of Things company intending toæcreate an environment which fosters ease of access to relevant information just when you need it and thus bring to life an informed sixth sense that manifests itself through one\'s smartphone.', 'HexOctane is an Internet of Things company intending toæcreate an environment which fosters ease of access to relevant information just when you need it and thus bring to life an informed sixth sense that manifests itself through one\'s smartphone. access, relevant, data, message, IoT, environment.', 5, 5, 5, 12),
('startup_30cf33991de', 'Making finger - licking homely food, Fingerlix aims on being \'the food\' for travelling professionals and fill stomachs of people with tasty food.', 'Making finger - licking homely food, Fingerlix aims on being \'the food\' for travelling professionals and fill stomachs of people with tasty food. yummy, tasty, delicious, amazing food, fingerlix, travel, transport food.', 6, 2, 4, 11),
('startup_35e0b47ed5f', 'With a sole aim of connecting empty stomachs with empty tables by giving discounts on meals in the restaurants registered with them. Eatigo has successfully has partnered with more than a million diners. Way to go!', 'With a sole aim of connecting empty stomachs with empty tables by giving discounts on meals in the restaurants registered with them. Eatigo has successfully has partnered with more than a million diners. Way to go! Discount, dining, Million, serves large.', 7, 2, 6, 12),
('startup_3ae62eea4d3', 'Noticeboard is focused on leveraging the power of the mobile phone to make information more accessible, and will be looking for top talent that understands the nuances of the small screen deeply. It aims making organisational communication more inclusive.', 'Noticeboard is focused on leveraging the power of the mobile phone to make information more accessible, and will be looking for top talent that understands the nuances of the small screen deeply. It aims making organisational communication more inclusive. Mobile, cellphone, small screen, organisation.', 8, 4, 9, 14),
('startup_3b9515728be', 'Koinex is India\'s most advanced digital assets exchange. Buy, sell and trade in the world\'s fastest growing assets: cryprocurrencies and tokens.', 'Koinex is India\'s most advanced digital assets exchange. Buy, sell and trade in the world\'s fastest growing assets: cryprocurrencies and tokens. ', 5, 7, 4, 13),
('startup_3bcb7c56f87', 'Innov8 is an ambitious project to house 100 entrepreneurs & help them build their vision & create impactful startups from the National Soil\n\n', 'Innov8 is an ambitious project to house 100 entrepreneurs & help them build their vision & create impactful startups from the National Soil\n\n', 7, 5, 5, 13),
('startup_3d04d4656c3', 'Want to meet your doctor but are too sick to get out of bed? Doctor Insta is at your service. Video Call or chat with a doctor to get an advice on your health!', 'Want to meet your doctor but are too sick to get out of bed? Doctor Insta is at your service. Video Call or chat with a doctor to get an advice on your health!', 7, 7, 6, 15),
('startup_3eeca45bc90', 'Finding a right insurance is like finding a right partner for yourself. AskArvi has done a great job in automating this system letting people find a perfect plan from their phones itself! This idea definitely makes them one of the best startups in India', 'Finding a right insurance is like finding a right partner for yourself. AskArvi has done a great job in automating this system letting people find a perfect plan from their phones itself! This idea definitely makes them one of the best startups in India', 4, 4, 7, 11),
('startup_3fe1ea0b539', 'A startups biggest challenge is to train its employees. HandyTrain trains them for you from your employees phones! Simple and smart right?', 'A startups biggest challenge is to train its employees. HandyTrain trains them for you from your employees phones! Simple and smart right?', 4, 5, 4, 12),
('startup_437d869e0b3', 'GoCoop.com is a internet-based global platform which provides value-added business services for co-ops and self-help groups to enable communication and collaboration with their members, marketing their products and services and leverage information technology to improve their operations.', 'GoCoop.com is a internet-based global platform which provides value-added business services for co-ops and self-help groups to enable communication and collaboration with their members, marketing their products and services and leverage information technology to improve their operations.', 4, 4, 4, 14),
('startup_4b23e056fd9', 'iNurture Education Solutions Pvt. Ltd. delivers industry relevant courses at undergraduate and postgraduate levels in the fast growing sectors of the economy, in active association with well-reputed universities and autonomous institutions/ colleges.', 'iNurture Education Solutions Pvt. Ltd. delivers industry relevant courses at undergraduate and postgraduate levels in the fast growing sectors of the economy, in active association with well-reputed universities and autonomous institutions/ colleges.', 6, 7, 7, 14),
('startup_501347dae2a', 'OpenOut is a trusted community of people, hosts and guests, where you can create, explore or become a part of unique at-home social experiences.', 'OpenOut is a trusted community of people, hosts and guests, where you can create, explore or become a part of unique at-home social experiences.', 7, 7, 6, 10),
('startup_514b7e9f6e6', 'Gaming turning into money-making! Yes, you read it right.HalaPlay can let you live in the fantasy world and win cash prizes at the end of every game making it among the best startups in India.', 'Gaming turning into money-making! Yes, you read it right.HalaPlay can let you live in the fantasy world and win cash prizes at the end of every game making it among the best startups in India.', 7, 8, 8, 11),
('startup_5349d6c5e0c', 'Sequretek intends to secure and manage the customers information assets so that they are better equipped to handle the changing digital landscape and service needs that lead to their organizational growth. It aims on being its customers \'Trusted Advisor\' for their problems', 'Sequretek intends to secure and manage the customers information assets so that they are better equipped to handle the changing digital landscape and service needs that lead to their organizational growth. It aims on being its customers \'Trusted Advisor\' for their problems', 9, 8, 8, 9),
('startup_5377381aa1e', 'Imagine knowing your money status with the help of your SMS-es, Money View shows your account details by accessing your bank messages and showing your balance!\n\n', 'Imagine knowing your money status with the help of your SMS-es, Money View shows your account details by accessing your bank messages and showing your balance!\n\n', 5, 4, 5, 13),
('startup_54e691b2e0e', 'In the age of technology, Active.ai makes it possible giving a beautiful human touch to Conversational Banking Services. They have made it possible to make conversations less robotic and consumer oriented making the doubt solving process more simpler!', 'In the age of technology, Active.ai makes it possible giving a beautiful human touch to Conversational Banking Services. They have made it possible to make conversations less robotic and consumer oriented making the doubt solving process more simpler!', 3, 2, 6, 9),
('startup_565a20e6211', 'In the business city of Bangalore, CoWrks is a unique concept providing many working individuals to come and rent working spaces for themselves. Pssstt.. they have an amazing interior worth being listed as one of the top startups in India!', 'In the business city of Bangalore, CoWrks is a unique concept providing many working individuals to come and rent working spaces for themselves. Pssstt.. they have an amazing interior worth being listed as one of the top startups in India!', 7, 5, 5, 13),
('startup_58ea6d8b492', 'Want your employees salaries increased without any change in your share? NiYo can give you a solution! Redefine Payroll & benefits and give your employees upto 10% Pay raise.', 'Want your employees salaries increased without any change in your share? NiYo can give you a solution! Redefine Payroll & benefits and give your employees upto 10% Pay raise.', 7, 5, 7, 13),
('startup_626fc93dc6a', 'Imagine how fun it would be learning via games and stories? Chimple is doing the same! This Bangalore based organisation believes that education is for all is doing everything to achieve their goal.', 'Imagine how fun it would be learning via games and stories? Chimple is doing the same! This Bangalore based organisation believes that education is for all is doing everything to achieve their goal.', 7, 3, 5, 10),
('startup_6ac1261a446', 'How great would it be if you could increase your work out speed and also track your progress? Kishore duo has made it possible my merging fitness with technology to make lives healthier for all and successfully made into the list of one of the best startups in India!', 'How great would it be if you could increase your work out speed and also track your progress? Kishore duo has made it possible my merging fitness with technology to make lives healthier for all and successfully made into the list of one of the best startups in India!', 8, 5, 8, 11),
('startup_6dcc97cbf7bf', 'Bringing alive the classic poker on-screen, 9Stacks is a unique concept binding all the Poker lovers together under one roof to start the game with 9 stacks of poker chips!', 'Bringing alive the classic poker on-screen, 9Stacks is a unique concept binding all the Poker lovers together under one roof to start the game with 9 stacks of poker chips!', 4, 3, 4, 5),
('startup_6eb76f323c3', 'Weaving magic with words, Terribly Tiny Tales is a forum for story enthusiasts and making a community of word lovers!', 'Weaving magic with words, Terribly Tiny Tales is a forum for story enthusiasts and making a community of word lovers!', 4, 4, 4, 13),
('startup_7213abde43e', 'Being a God-sent application for Bangalore-ians and Pune-kars, Dunzo runs errands for its users. Be it repairing your sink or sending a parcel off, you can just Dunzo-it! Waiting for it for available nationwide! But whatever it is, they surely deserve to be one of the best startups in India\n\n', 'Being a God-sent application for Bangalore-ians and Pune-kars, Dunzo runs errands for its users. Be it repairing your sink or sending a parcel off, you can just Dunzo-it! Waiting for it for available nationwide! But whatever it is, they surely deserve to be one of the best startups in India\n\n', 8, 5, 6, 12),
('startup_75f2cebe20e', 'CallHealth is a technology-powered healthcare company that brings healthcare services to the doorstep of the customer. Definitely worth being as one of the best startups in India.', 'CallHealth is a technology-powered healthcare company that brings healthcare services to the doorstep of the customer. Definitely worth being as one of the best startups in India.', 4, 4, 6, 16),
('startup_795e8d2f1bd', 'Seeing Fashion online, Fynd is dedicated to make its users chic and sexy!', 'Seeing Fashion online, Fynd is dedicated to make its users chic and sexy!', 5, 4, 6, 12),
('startup_7d25b37d798', 'With clients like Ola, PayTM, MobiKwick, ClearTrip and many more, Hansel.io is a trusted name in deep-config APIs. Delivering what they promise, Hansel.io is an expert in providing personalized experience for all its client base!', 'With clients like Ola, PayTM, MobiKwick, ClearTrip and many more, Hansel.io is a trusted name in deep-config APIs. Delivering what they promise, Hansel.io is an expert in providing personalized experience for all its client base!', 9, 9, 7, 14),
('startup_7e7e947b210', 'Building a home has never been easier, thanks to Homergize! Homergize is a One-Stop Shop for purchasing Materials & Products ranging from Building Materials to Fittings to Furnishings.', 'Building a home has never been easier, thanks to Homergize! Homergize is a One-Stop Shop for purchasing Materials & Products ranging from Building Materials to Fittings to Furnishings.', 5, 3, 4, 15),
('startup_80e57982848', 'Targeting India\'s most favorite food Biryani, this company has reached in the veins of maximum people. Biryani by Kilo does what the name suggests, sends happiness parceled and is perfect for any occasion. Guess what? It a rating of 4.0 on Zomato. Yummy idea!', 'Targeting India\'s most favorite food Biryani, this company has reached in the veins of maximum people. Biryani by Kilo does what the name suggests, sends happiness parceled and is perfect for any occasion. Guess what? It a rating of 4.0 on Zomato. Yummy idea!', 6, 6, 5, 8),
('startup_84dee75e130', 'Made for Indian men, Mr Button was an idea to make Indian men fashionable and presentable!', 'Made for Indian men, Mr Button was an idea to make Indian men fashionable and presentable!', 7, 9, 8, 10),
('startup_8559eb7766c', 'Love travelling? GoFro should be your best friend! Started to empower the modern traveler with flexibility of choices and a fulfilling sense of independence, GoFro is doing a splendid job!', 'Love travelling? GoFro should be your best friend! Started to empower the modern traveler with flexibility of choices and a fulfilling sense of independence, GoFro is doing a splendid job!', 7, 5, 8, 11),
('startup_88d64d63101', 'Graphic India is nations very well known animation creator. Want to see their recent work? Watch ñBaahubali: The Lost Legendsî on Amazon Prime and get amazed and you\'ll know why they are among the best startups in India.', 'Graphic India is nations very well known animation creator. Want to see their recent work? Watch ñBaahubali: The Lost Legendsî on Amazon Prime and get amazed and you\'ll know why they are among the best startups in India.', 5, 5, 7, 10),
('startup_88e4ee56611', 'Manage your cash flows with this useful app, Numberz!, Wallet, Banking', 'Manage your cash flows with this useful app, Numberz!, Wallet, Banking', 5, 3, 8, 12),
('startup_8a7cc648a7f', 'What if we tell you that you can monitor your body\'s clinical vitals from a device? Startup ten3T made this possible. Their invention of a wearable monitoring device for your dear body which can help you make healthier decisions!', 'What if we tell you that you can monitor your body\'s clinical vitals from a device? Startup ten3T made this possible. Their invention of a wearable monitoring device for your dear body which can help you make healthier decisions!', 4, 8, 4, 13),
('startup_8e5018e725e', 'Providing end - to - end logistics in an \'express\' way Ecom Express has established itself as one of the trusted and reliable names in delivery services to e-commerce industry and also one of the best startups in India', 'Providing end - to - end logistics in an \'express\' way Ecom Express has established itself as one of the trusted and reliable names in delivery services to e-commerce industry and also one of the best startups in India', 9, 9, 6, 6),
('startup_8e6bb85c120', 'Future Educators like AEON Learning are blessing for working professionals. With the help of technology, they provide degrees in various management courses from prestigious universities. Giving e-learning a new look!', 'Future Educators like AEON Learning are blessing for working professionals. With the help of technology, they provide degrees in various management courses from prestigious universities. Giving e-learning a new look!', 5, 5, 6, 9),
('startup_8e99c7d48a7', 'Have a luxury travel with icanstay and enjoy traveling first - class! Providing first class travel making them reach the destination of one of the best startup in India', 'Have a luxury travel with icanstay and enjoy traveling first - class! Providing first class travel making them reach the destination of one of the best startup in India', 7, 6, 5, 10),
('startup_8ed3e2b3e68', 'Clip - an Android application makes it a breeze to create, watch and download funny Indian videos. With 1,000,000+ users it is one app you should have!', 'Clip - an Android application makes it a breeze to create, watch and download funny Indian videos. With 1,000,000+ users it is one app you should have!', 4, 4, 4, 13),
('startup_905ba8f9dfb', 'Aiding global e-commerce and retail services for their monetary transactions, airpay aims in simplifying the process of transaction much more smoother and flexible.', 'Aiding global e-commerce and retail services for their monetary transactions, airpay aims in simplifying the process of transaction much more smoother and flexible.', 8, 7, 9, 12),
('startup_9099f229c0a', 'SigTuple aim to create a data driven, machine learned, cloud based solution for detection of anomalies and trends in medical data, which improves the accuracy and efficiency of disease diagnosis.', 'SigTuple aim to create a data driven, machine learned, cloud based solution for detection of anomalies and trends in medical data, which improves the accuracy and efficiency of disease diagnosis.', 6, 6, 6, 11),
('startup_93b9136fc9d', 'Shifu creates an innovative and immersive learning experience during play time by bringing board games and mobile devices together through Augmented Reality. Because they believe, children deserve good screen time.', 'Shifu creates an innovative and immersive learning experience during play time by bringing board games and mobile devices together through Augmented Reality. Because they believe, children deserve good screen time.', 6, 5, 9, 13),
('startup_9857eb86264', 'Little Black Book complies the best spots/eateries of your cities which you might never have discovered! Started with Delhi, this Little Black Book is worth the read!', 'Little Black Book complies the best spots/eateries of your cities which you might never have discovered! Started with Delhi, this Little Black Book is worth the read!', 9, 8, 7, 16),
('startup_98b25c82dfc', 'One of the pioneers of comedy in India, EIC has surely left a mark on people\'s minds and makes everyone laugh very hard with their sarcastic takes on real-time situations. Very \'SAARAAS\' job guys! Haaste haasate you finally got on the list of Top Startups in India', 'One of the pioneers of comedy in India, EIC has surely left a mark on people\'s minds and makes everyone laugh very hard with their sarcastic takes on real-time situations. Very \'SAARAAS\' job guys! Haaste haasate you finally got on the list of Top Startups in India', 9, 7, 8, 13),
('startup_9a4c9975a12', 'Do you have a vehicle lying just at a disposal? Turn it into an earning member with Drivezy and thank me later for including them among the top startups in India!', 'Do you have a vehicle lying just at a disposal? Turn it into an earning member with Drivezy and thank me later for including them among the top startups in India!', 9, 9, 7, 10),
('startup_9d66062929b', 'With 1,20,000+ subscribers, Flintobox has aims on holistic education of children. Delivering happiness in a box, Flintobox curates a new theme every month and helps in the growth of the child. If you are a parent, this is worth a try!', 'With 1,20,000+ subscribers, Flintobox has aims on holistic education of children. Delivering happiness in a box, Flintobox curates a new theme every month and helps in the growth of the child. If you are a parent, this is worth a try!', 6, 8, 5, 13),
('startup_a5b7068f910', 'Giving Best Price commitment, Sendd will give you complete shipping solution\nfor your Business from pick to drop at any pincode in India.', 'Giving Best Price commitment, Sendd will give you complete shipping solution\nfor your Business from pick to drop at any pincode in India.', 4, 4, 6, 15),
('startup_aab4679508c', 'SlicePay is a digital payment platform which was founded with a mission to simplify payments for the young. With changing times, they strive to make payments smarter and simpler.', 'SlicePay is a digital payment platform which was founded with a mission to simplify payments for the young. With changing times, they strive to make payments smarter and simpler.', 4, 8, 9, 13),
('startup_ae6a02c524d', 'We know how much of a limited pocket money does a student get and KrazyBee is a wonderful option for students to buy electronics on EMI', 'We know how much of a limited pocket money does a student get and KrazyBee is a wonderful option for students to buy electronics on EMI', 5, 5, 5, 12),
('startup_af2263cee85', 'Being the bridge between investors and borrowers Credy is one of its kind and totally one of the best startups in India!', 'Being the bridge between investors and borrowers Credy is one of its kind and totally one of the best startups in India!', 6, 2, 4, 11),
('startup_b081e59cc05', 'Have a car to be insured or want to insure the health of yourself or your family? Visit RenewBuy and do the needful in few minutes without any middleman in between!', 'Have a car to be insured or want to insure the health of yourself or your family? Visit RenewBuy and do the needful in few minutes without any middleman in between!', 7, 2, 6, 12),
('startup_b2a9b391d75', 'Often companies do not have enough data to train a machine learning model on their own using state of the art algorithms as well as don\'t have enough data scientists to work on those problems. NanoNets solves both these problems for companies. NanoNets is machine learning API for developers which requires 1/10th of data and no machine learning expertise to train a model.', 'Often companies do not have enough data to train a machine learning model on their own using state of the art algorithms as well as don\'t have enough data scientists to work on those problems. NanoNets solves both these problems for companies. NanoNets is machine learning API for developers which requires 1/10th of data and no machine learning expertise to train a model.', 8, 4, 9, 14),
('startup_b2c19bea700', 'It is home furniture, appliances and a lot of love that make a home - a house. Rentickle helps to rent furniture and home essentials with options of various brands to choose from.', 'It is home furniture, appliances and a lot of love that make a home - a house. Rentickle helps to rent furniture and home essentials with options of various brands to choose from.', 5, 7, 4, 13),
('startup_b59a5b8ce10', 'Stories always hold a special place in one hearts. Using this concept, Josh Talks uses words to inspire everyone wanting to be motivated!', 'Stories always hold a special place in one hearts. Using this concept, Josh Talks uses words to inspire everyone wanting to be motivated!', 7, 5, 5, 13),
('startup_b9590350041', 'Live in Delhi and own a car? Who would know better than you how difficult it is to find a parking spot! Get My Parking comes to your rescue. Use this app to find an available a spot in Delhi. Rest of the nation has to wait while Delhi-ites have all the perks of this app! If Delhi loves it, how can\'t this company be one of best startups in India.', 'Live in Delhi and own a car? Who would know better than you how difficult it is to find a parking spot! Get My Parking comes to your rescue. Use this app to find an available a spot in Delhi. Rest of the nation has to wait while Delhi-ites have all the perks of this app! If Delhi loves it, how can\'t this company be one of best startups in India.', 7, 7, 6, 15),
('startup_ba43cb76899', 'ERA is India\'s first integrated identity platform which provides it\'s users a safe and secure way to share their Identities with the world.', 'ERA is India\'s first integrated identity platform which provides it\'s users a safe and secure way to share their Identities with the world.', 4, 4, 7, 11),
('startup_ba8323c622b', 'Flochat is one of it\'s kind combining apps like Ola, Zomato and many more under one platform. Download this and enjoy the joy of surfing so many apps from one!', 'Flochat is one of it\'s kind combining apps like Ola, Zomato and many more under one platform. Download this and enjoy the joy of surfing so many apps from one!', 4, 5, 4, 12),
('startup_cc81205365c', 'Funded by one of the Nation\'s stylist diva - Alia Bhatt, StyleCracker - IndiaÍs first online personal styling portal understands the importance of great style in day-to-day life.', 'Funded by one of the Nation\'s stylist diva - Alia Bhatt, StyleCracker - IndiaÍs first online personal styling portal understands the importance of great style in day-to-day life.', 4, 4, 4, 14),
('startup_ccdee3e72f2', 'As the name suggests, this website wants to provide end - to - end health management to their consumers', 'As the name suggests, this website wants to provide end - to - end health management to their consumers', 6, 7, 7, 14),
('startup_cd15bb7049b', 'This Delhi based startup is giving wings to upcoming startups in form of monetary help. The best part? They just give funding just in 3 days! Delhi-ites with an idea, are you listening?', 'This Delhi based startup is giving wings to upcoming startups in form of monetary help. The best part? They just give funding just in 3 days! Delhi-ites with an idea, are you listening?', 7, 7, 6, 10),
('startup_cd96a563a60', 'Flock is a faster, more organized way for teams to communicate. Flock powers over 25,000 companies and its users around the world have reported increased productivity by 30%, 50% fewer emails, and a 50% reduction in in-person meetings.Their clients include Accenture, Tim Hortons, Whirlpool, VMware and Victorinox.', 'Flock is a faster, more organized way for teams to communicate. Flock powers over 25,000 companies and its users around the world have reported increased productivity by 30%, 50% fewer emails, and a 50% reduction in in-person meetings.Their clients include Accenture, Tim Hortons, Whirlpool, VMware and Victorinox.', 7, 8, 8, 11),
('startup_cf892e16246', 'Fella Homes is a branded chain of rental homes. Being synonymous with hassle-free and quality living, they aim to standardize the entire experience of finding and living in a rented home with the use of technology enabled product and services.', 'Fella Homes is a branded chain of rental homes. Being synonymous with hassle-free and quality living, they aim to standardize the entire experience of finding and living in a rented home with the use of technology enabled product and services.', 9, 8, 8, 9),
('startup_d138e6a27ec', 'Standing by its name, LetsTransport provides end-to-end logistic support with advantage of GPS tracking and advance booking only for you!', 'Standing by its name, LetsTransport provides end-to-end logistic support with advantage of GPS tracking and advance booking only for you!', 5, 4, 5, 13),
('startup_d230c1ec050', 'An EdTech start up, Avishkaar Box stands by its name. They create mind stimulating products enabling young students to spark up their minds and double their imagination. Their invention Robby and Robby 2 are mind boggling!', 'An EdTech start up, Avishkaar Box stands by its name. They create mind stimulating products enabling young students to spark up their minds and double their imagination. Their invention Robby and Robby 2 are mind boggling!', 3, 2, 6, 9),
('startup_d449f779505', 'Stanza is a unique housing concept created for students moving to a new place and wanting to create a space for themselves.', 'Stanza is a unique housing concept created for students moving to a new place and wanting to create a space for themselves.', 7, 5, 5, 13),
('startup_d775ae66135', 'As your end-to-end automation solutions partner, TAOautomation will work with you to develop your automation strategy, be it basic RPA or more advanced cognitive and machine learning solutions, to implement it swiftly and closely manage the entire change programme.', 'As your end-to-end automation solutions partner, TAOautomation will work with you to develop your automation strategy, be it basic RPA or more advanced cognitive and machine learning solutions, to implement it swiftly and closely manage the entire change programme.', 7, 5, 7, 13),
('startup_db108287d8c', 'Catering to on-demand entertainment, ALTBalaji is doing a splendid job! From its gripping original series to the wide range of shows and movies, ALTBalaji is really worth of your attention and a tough competition for many and deserves a place as one of the Top Startups in India.', 'Catering to on-demand entertainment, ALTBalaji is doing a splendid job! From its gripping original series to the wide range of shows and movies, ALTBalaji is really worth of your attention and a tough competition for many and deserves a place as one of the Top Startups in India.', 7, 3, 5, 10),
('startup_e21987a5713', 'Storeking is a revolutionary platform enabling small town Retailers to sell over 50,000 products to walk-in customers without having to invest in working capital stock.', 'Storeking is a revolutionary platform enabling small town Retailers to sell over 50,000 products to walk-in customers without having to invest in working capital stock.', 8, 5, 8, 11),
('startup_ec4d8c5e4dc', 'Empowering kirana-wala\'s to multi-nationals m.Paani helps in Sales Conversion to Brand Loyalty Services for its consumers right from their mobiles!', 'Empowering kirana-wala\'s to multi-nationals m.Paani helps in Sales Conversion to Brand Loyalty Services for its consumers right from their mobiles!', 4, 3, 4, 5),
('startup_ed65481df1f', 'Meesho is India\'s Largest Online Reseller Network of Housewives & SMBs, who sell products within their network on social channels.', 'Meesho is India\'s Largest Online Reseller Network of Housewives & SMBs, who sell products within their network on social channels.', 4, 4, 4, 13),
('startup_eeac0eb99d6', 'GamingMonk is a heaven for gamers, from organizes offline gaming tournaments for sports, strategy, and action e-games to be played on Xbox, personal computer, mobile, and PlayStation 4. It also retails gaming accessories, consoles, and software. Users can form their own communities and get lost in the fantasy world of their own.', 'GamingMonk is a heaven for gamers, from organizes offline gaming tournaments for sports, strategy, and action e-games to be played on Xbox, personal computer, mobile, and PlayStation 4. It also retails gaming accessories, consoles, and software. Users can form their own communities and get lost in the fantasy world of their own.', 8, 5, 6, 12),
('startup_efb616698b9', 'SensiBol was founded by like-minded audio-technology researchers and computer-scientists with a mission to deliver cutting-edge audio-processing solutions to the world.', 'SensiBol was founded by like-minded audio-technology researchers and computer-scientists with a mission to deliver cutting-edge audio-processing solutions to the world.', 4, 4, 6, 16),
('startup_f2e9ae74054', 'People dread shifting due to the hassle of taking the belongings from one place to another. That is when Blowhorn thought to help them and made their place in one of the Top Startups in India. Blowhorn offers a better and a safe option for people looking to move their belongings from one place to another!', 'People dread shifting due to the hassle of taking the belongings from one place to another. That is when Blowhorn thought to help them and made their place in one of the Top Startups in India. Blowhorn offers a better and a safe option for people looking to move their belongings from one place to another!', 5, 4, 6, 12),
('startup_f82fa6e6ecb', 'An amazing startup portal giving users loans in easy ways!', 'An amazing startup portal giving users loans in easy ways!', 9, 9, 7, 14),
('startup_faf60db1c6f', 'Gone are the days when owning a farm was a huge investment! Gold Farm lets you rent farming equipment and make lives simpler for all! What makes life good surely is among the best startups in India.', 'Gone are the days when owning a farm was a huge investment! Gold Farm lets you rent farming equipment and make lives simpler for all! What makes life good surely is among the best startups in India.', 5, 3, 4, 15),
('startup_fb1bebdd5d6', 'PropStory is a content platform for the real estate industry. The organization has been floated by professionals with several years of experience in Real Estate investing, private banking, and internet technology.', 'PropStory is a content platform for the real estate industry. The organization has been floated by professionals with several years of experience in Real Estate investing, private banking, and internet technology.', 6, 6, 5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `request_outsourcing`
--

CREATE TABLE `request_outsourcing` (
  `outsource_id` int(11) NOT NULL,
  `startup_id` varchar(50) NOT NULL,
  `corp_id` varchar(50) DEFAULT NULL,
  `outsource_desc` varchar(100) DEFAULT NULL,
  `outsource_duration` varchar(20) DEFAULT NULL,
  `status` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_outsourcing`
--

INSERT INTO `request_outsourcing` (`outsource_id`, `startup_id`, `corp_id`, `outsource_desc`, `outsource_duration`, `status`) VALUES
(10, 'startup1234', 'corp1234', 'payment', 'portal', 1),
(11, 'startup1234', 'corp1234', 'moonlight', '12 months', 2),
(12, 'startup_3d04d4656c3', 'startup1234', 'abcd', '6 months', 0),
(13, 'startup_3d04d4656c3', 'startup1234', 'doctor search', '6 month', 0),
(14, 'startup_3d04d4656c3', 'corp_04595b18fd5', 'health ', '6 month', 0),
(15, 'startup_3d04d4656c3', 'corp_04595b18fd5', 'doc', '6 month', 1),
(16, 'startup_3d04d4656c3', 'corp_04595b18fd5', 'medical pres', '4 months', 1),
(17, 'startup1234', 'corp_06c317f8a9e', 'sun', '11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_blobs`
--

CREATE TABLE `shoutout_blobs` (
  `blobid` bigint(20) UNSIGNED NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_cache`
--

CREATE TABLE `shoutout_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_categories`
--

CREATE TABLE `shoutout_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_categorymetas`
--

CREATE TABLE `shoutout_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_contentwords`
--

CREATE TABLE `shoutout_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_contentwords`
--

INSERT INTO `shoutout_contentwords` (`postid`, `wordid`, `count`, `type`, `questionid`) VALUES
(1, 4, 1, 'Q', 1),
(1, 5, 1, 'Q', 1),
(1, 6, 1, 'Q', 1),
(1, 7, 2, 'Q', 1),
(1, 8, 1, 'Q', 1),
(1, 1, 2, 'Q', 1),
(1, 9, 1, 'Q', 1),
(1, 10, 2, 'Q', 1),
(1, 11, 1, 'Q', 1),
(1, 12, 1, 'Q', 1),
(1, 13, 1, 'Q', 1),
(1, 14, 1, 'Q', 1),
(1, 15, 1, 'Q', 1),
(1, 16, 1, 'Q', 1),
(1, 17, 1, 'Q', 1),
(1, 18, 1, 'Q', 1),
(1, 19, 1, 'Q', 1),
(1, 20, 1, 'Q', 1),
(1, 21, 1, 'Q', 1),
(1, 22, 1, 'Q', 1),
(1, 23, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 24, 1, 'Q', 1),
(1, 25, 1, 'Q', 1),
(1, 26, 1, 'Q', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_cookies`
--

CREATE TABLE `shoutout_cookies` (
  `cookieid` bigint(20) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` varbinary(16) NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` varbinary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_iplimits`
--

CREATE TABLE `shoutout_iplimits` (
  `ip` varbinary(16) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_iplimits`
--

INSERT INTO `shoutout_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(0xac18fed7, 'Q', 430994, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_options`
--

CREATE TABLE `shoutout_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(12000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_options`
--

INSERT INTO `shoutout_options` (`title`, `content`) VALUES
('allow_anonymous_naming', '0'),
('allow_close_own_questions', '1'),
('allow_close_questions', '1'),
('allow_multi_answers', '0'),
('allow_self_answer', '0'),
('allow_user_walls', '1'),
('allow_view_q_bots', '1'),
('avatar_message_list_size', '20'),
('avatar_q_list_size', '0'),
('avatar_q_page_a_size', '40'),
('avatar_q_page_c_size', '20'),
('avatar_q_page_q_size', '50'),
('avatar_users_size', '30'),
('block_bad_words', ''),
('block_ips_write', ''),
('cache_flaggedcount', ''),
('cache_qcount', '1'),
('cache_queuedcount', ''),
('cache_tagcount', '2'),
('cache_unaqcount', '1'),
('cache_unselqcount', '1'),
('cache_unupaqcount', '1'),
('cache_userpointscount', '1'),
('caching_driver', 'filesystem'),
('caching_enabled', '0'),
('captcha_on_anon_post', '1'),
('captcha_on_unconfirmed', '0'),
('columns_tags', '3'),
('columns_users', '2'),
('comment_on_as', '1'),
('comment_on_qs', '1'),
('confirm_user_emails', '1'),
('custom_answer', ''),
('custom_ask', ''),
('custom_comment', ''),
('custom_footer', ''),
('custom_header', ''),
('custom_home_content', ''),
('custom_home_heading', ''),
('custom_in_head', ''),
('custom_sidepanel', ''),
('db_version', '67'),
('do_ask_check_qs', '0'),
('do_close_on_select', '0'),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', 'WYSIWYG Editor'),
('editor_for_cs', ''),
('editor_for_qs', 'WYSIWYG Editor'),
('email_privacy', 'Privacy: Your email address will not be shared or sold to third parties.'),
('enabled_plugins', ''),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('extra_field_active', '0'),
('extra_field_display', '0'),
('extra_field_label', ''),
('extra_field_prompt', ''),
('feedback_email', ''),
('feedback_enabled', '0'),
('feed_for_activity', '0'),
('feed_for_hot', '0'),
('feed_for_qa', '0'),
('feed_for_questions', '0'),
('feed_for_search', '0'),
('feed_for_tag_qs', '0'),
('feed_for_unanswered', '0'),
('feed_full_text', '0'),
('feed_number_items', '50'),
('feed_per_category', '1'),
('flagging_hide_after', '5'),
('flagging_of_posts', '1'),
('follow_on_as', '1'),
('form_security_salt', 't5kqhgqe1z5f62ho4n973qyhx3hfojox'),
('from_email', 'no-reply@172.24.254.215'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('links_in_new_window', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('match_ask_check_qs', '3'),
('match_example_tags', '3'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_cs', '40'),
('max_rate_ip_qs', '20'),
('max_rate_user_cs', '20'),
('max_rate_user_qs', '10'),
('max_store_user_updates', '50'),
('minify_html', '1'),
('min_len_a_content', '12'),
('min_len_c_content', '5'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_users', ''),
('nav_activity', '0'),
('nav_ask', '1'),
('nav_categories', '0'),
('nav_home', ''),
('nav_hot', '0'),
('nav_qa_is_home', '0'),
('nav_questions', '1'),
('nav_tags', '0'),
('nav_unanswered', '1'),
('nav_users', '0'),
('neat_urls', '5'),
('notice_visitor', ''),
('notify_admin_q_post', '0'),
('notify_users_default', '1'),
('pages_prev_next', '3'),
('page_size_activity', '20'),
('page_size_ask_check_qs', '5'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_hot_qs', '20'),
('page_size_qs', '20'),
('page_size_q_as', '10'),
('page_size_search', '10'),
('page_size_tags', '30'),
('page_size_tag_qs', '20'),
('page_size_una_qs', '20'),
('page_size_users', '30'),
('permit_anon_view_ips', '70'),
('permit_anon_view_ips_points', ''),
('permit_close_q', '70'),
('permit_close_q_points', ''),
('permit_delete_hidden', '40'),
('permit_delete_hidden_points', ''),
('permit_edit_a', '100'),
('permit_edit_a_points', ''),
('permit_edit_c', '70'),
('permit_edit_c_points', ''),
('permit_edit_q', '70'),
('permit_edit_q_points', ''),
('permit_edit_silent', '40'),
('permit_edit_silent_points', ''),
('permit_flag', '120'),
('permit_flag_points', ''),
('permit_hide_show', '70'),
('permit_hide_show_points', ''),
('permit_moderate', '100'),
('permit_moderate_points', ''),
('permit_post_a', '100'),
('permit_post_a_points', ''),
('permit_post_c', '120'),
('permit_post_c_points', ''),
('permit_post_q', '120'),
('permit_post_q_points', ''),
('permit_post_wall', '120'),
('permit_post_wall_points', ''),
('permit_retag_cat', '70'),
('permit_retag_cat_points', ''),
('permit_select_a', '100'),
('permit_select_a_points', ''),
('permit_view_new_users_page', '70'),
('permit_view_new_users_page_points', ''),
('permit_view_q_page', '150'),
('permit_view_special_users_page', '40'),
('permit_view_special_users_page_points', ''),
('permit_view_voters_flaggers', '20'),
('permit_view_voters_flaggers_points', ''),
('permit_vote_a', '120'),
('permit_vote_a_points', ''),
('permit_vote_down', '120'),
('permit_vote_down_points', ''),
('permit_vote_q', '120'),
('permit_vote_q_points', ''),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_c_voted_max_gain', '10'),
('points_c_voted_max_loss', '3'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_c_voted_down', '0'),
('points_per_c_voted_up', '0'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('recalc_hotness_q_view', '1'),
('search_module', ''),
('show_a_c_links', '1'),
('show_a_form_immediate', 'if_no_as'),
('show_compact_numbers', '1'),
('show_custom_answer', '0'),
('show_custom_ask', '0'),
('show_custom_comment', '0'),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_c_reply_buttons', '1'),
('show_fewer_cs_count', '5'),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_home_description', ''),
('show_notice_visitor', ''),
('show_post_update_meta', '1'),
('show_selected_first', '1'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_counts', '0'),
('show_view_count_q_page', '0'),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'ShoutOut'),
('site_theme_mobile', 'ShoutOut'),
('site_title', 'ShoutOut'),
('site_url', 'http://localhost/SIH/anveshak/ShoutOut/'),
('smtp_active', '0'),
('smtp_address', ''),
('smtp_authenticate', '0'),
('smtp_password', 'p'),
('smtp_port', '25'),
('smtp_secure', ''),
('smtp_username', 'rubix'),
('sort_answers_by', 'created'),
('tags_or_categories', 'tc'),
('tag_separator_comma', '0'),
('use_microdata', '1'),
('votes_separated', ''),
('voting_on_as', '1'),
('voting_on_cs', '0'),
('voting_on_qs', '1'),
('voting_on_q_page_only', ''),
('wysiwyg_editor_upload_images', '');

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_pages`
--

CREATE TABLE `shoutout_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_pages`
--

INSERT INTO `shoutout_pages` (`pageid`, `title`, `nav`, `position`, `flags`, `permit`, `tags`, `heading`, `content`) VALUES
(1, 'Home', 'B', 1, 1, 120, 'http://172.24.254.215/SIH/anveshak', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_postmetas`
--

CREATE TABLE `shoutout_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_posts`
--

CREATE TABLE `shoutout_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` varbinary(16) DEFAULT NULL,
  `lastuserid` varchar(30) DEFAULT NULL,
  `lastip` varbinary(16) DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` varbinary(16) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(12000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_posts`
--

INSERT INTO `shoutout_posts` (`postid`, `type`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 'startup1234', NULL, 0xac18fed7, NULL, NULL, 0, 0, 0, 0xac18fdb9, 2, 57860300000, 0, '', '2019-03-03 08:26:38', NULL, NULL, 'Taxes from startups', 'Currently, startup have to pay taxes even during incubation days which is a big burden to their finances. we want complete exemption from paying taxes during initial years', 'tax,finance', NULL, '@');

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_posttags`
--

CREATE TABLE `shoutout_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_posttags`
--

INSERT INTO `shoutout_posttags` (`postid`, `wordid`, `postcreated`) VALUES
(1, 27, '2019-03-03 08:26:38'),
(1, 28, '2019-03-03 08:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_sharedevents`
--

CREATE TABLE `shoutout_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` varchar(30) DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_sharedevents`
--

INSERT INTO `shoutout_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('Q', 1, 1, 1, NULL, 'startup1234', '2019-03-03 08:26:38'),
('T', 28, 1, 1, NULL, 'startup1234', '2019-03-03 08:26:38'),
('T', 27, 1, 1, NULL, 'startup1234', '2019-03-03 08:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_tagmetas`
--

CREATE TABLE `shoutout_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_tagwords`
--

CREATE TABLE `shoutout_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_tagwords`
--

INSERT INTO `shoutout_tagwords` (`postid`, `wordid`) VALUES
(1, 27),
(1, 28);

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_titlewords`
--

CREATE TABLE `shoutout_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_titlewords`
--

INSERT INTO `shoutout_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_userevents`
--

CREATE TABLE `shoutout_userevents` (
  `userid` varchar(30) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` varchar(30) DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_userfavorites`
--

CREATE TABLE `shoutout_userfavorites` (
  `userid` varchar(30) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_userlevels`
--

CREATE TABLE `shoutout_userlevels` (
  `userid` varchar(30) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_userlimits`
--

CREATE TABLE `shoutout_userlimits` (
  `userid` varchar(30) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_userlimits`
--

INSERT INTO `shoutout_userlimits` (`userid`, `action`, `period`, `count`) VALUES
('startup1234', 'Q', 430994, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_usermetas`
--

CREATE TABLE `shoutout_usermetas` (
  `userid` varchar(30) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_usernotices`
--

CREATE TABLE `shoutout_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` varchar(30) NOT NULL,
  `content` varchar(12000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_userpoints`
--

CREATE TABLE `shoutout_userpoints` (
  `userid` varchar(30) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `cdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `cvoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_userpoints`
--

INSERT INTO `shoutout_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `cupvotes`, `cdownvotes`, `qvoteds`, `avoteds`, `cvoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
('startup1234', 120, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_uservotes`
--

CREATE TABLE `shoutout_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` varchar(30) NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  `votecreated` datetime DEFAULT NULL,
  `voteupdated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_widgets`
--

CREATE TABLE `shoutout_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoutout_words`
--

CREATE TABLE `shoutout_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoutout_words`
--

INSERT INTO `shoutout_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'taxes', 1, 1, 0, 0),
(2, 'from', 1, 1, 0, 0),
(3, 'startups', 1, 0, 0, 0),
(4, 'currently', 0, 1, 0, 0),
(5, 'startup', 0, 1, 0, 0),
(6, 'have', 0, 1, 0, 0),
(7, 'to', 0, 1, 0, 0),
(8, 'pay', 0, 1, 0, 0),
(9, 'even', 0, 1, 0, 0),
(10, 'during', 0, 1, 0, 0),
(11, 'incubation', 0, 1, 0, 0),
(12, 'days', 0, 1, 0, 0),
(13, 'which', 0, 1, 0, 0),
(14, 'is', 0, 1, 0, 0),
(15, 'a', 0, 1, 0, 0),
(16, 'big', 0, 1, 0, 0),
(17, 'burden', 0, 1, 0, 0),
(18, 'their', 0, 1, 0, 0),
(19, 'finances', 0, 1, 0, 0),
(20, 'we', 0, 1, 0, 0),
(21, 'want', 0, 1, 0, 0),
(22, 'complete', 0, 1, 0, 0),
(23, 'exemption', 0, 1, 0, 0),
(24, 'paying', 0, 1, 0, 0),
(25, 'initial', 0, 1, 0, 0),
(26, 'years', 0, 1, 0, 0),
(27, 'tax', 0, 0, 1, 1),
(28, 'finance', 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `startup_auth`
--

CREATE TABLE `startup_auth` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `login_id` varchar(30) NOT NULL COMMENT 'login id of startup',
  `password` varchar(40) NOT NULL,
  `startup_name` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will be used for authorization at the time of startup login and contains the details for the same.';

--
-- Dumping data for table `startup_auth`
--

INSERT INTO `startup_auth` (`startup_id`, `login_id`, `password`, `startup_name`, `created_date`, `status`) VALUES
('startup1234', 'rubix', 'p', 'swiggy', '2014-09-29 23:25:26', 0),
('startup_0221e174296', '41dbf08b28d5106403a1', 'p', 'Filmygyan', '2019-03-02 10:00:49', 1),
('startup_049027ac21d', '27e7bff19c0d85df556c', 'p', 'Sumeru', '2019-03-02 10:05:34', 1),
('startup_07b7f23419d', '599cd49a5ad795b67188', 'p', 'Mobiefit', '2019-03-02 10:03:43', 1),
('startup_08971b04e3a', 'd811ede3ce45aafc2ffd', 'p', 'Smaaash Entertainment Pvt. Ltd.', '2019-03-02 10:05:18', 1),
('startup_128f4e34887', '5e7226b31cca2a237de0', 'p', 'HipCask', '2019-03-02 10:02:17', 1),
('startup_129b01b099e', '444ac1054d63b8a8901a', 'p', 'ftcash', '2019-03-02 10:01:21', 1),
('startup_1c057cbeac3', '2bf8bcc4c85252614ce7', 'p', 'Netmeds.com', '2019-03-02 10:04:04', 1),
('startup_1e2a7dc8110', '794cc76a6aa3da44aac5', 'p', ' OncoStem Diagnostics', '2019-03-02 10:04:22', 1),
('startup_258b66dcf51', 'f8f6fcc779ed62f70f06', 'p', 'Boxx.Ai', '2019-03-02 09:53:26', 1),
('startup_2895e36fda5', '7a28b329bf3cf2d286eb', 'p', 'InnerChef', '2019-03-02 10:02:42', 1),
('startup_2f4aa8e859b', '16f564af1fffc7f23633', 'p', ' HexOctane', '2019-03-02 10:02:14', 1),
('startup_30cf33991de', '4a648df10a85960929d8', 'p', 'Fingerlix', '2019-03-02 10:00:53', 1),
('startup_35e0b47ed5f', '3dbe7fd130ac000980f5', 'p', 'Eatigo', '2019-03-02 09:58:14', 1),
('startup_3ae62eea4d3', '65a95dea0f14a06ea445', 'p', ' Noticeboard', '2019-03-02 10:04:13', 1),
('startup_3b9515728be', 'c61026d5a10ee48cd5f3', 'p', ' Koinex', '2019-03-02 10:02:46', 1),
('startup_3bcb7c56f87', '4e8ac4fab07cd6a92454', 'p', ' Innov8 Coworking', '2019-03-02 10:02:29', 1),
('startup_3d04d4656c3', 'doctor', 'p', 'Doctor Insta', '2019-03-02 09:57:19', 1),
('startup_3eeca45bc90', '45ca4995dbce88e78b77', 'p', 'Ask Arvi', '2019-03-02 09:53:01', 1),
('startup_3fe1ea0b539', 'b0980e3638db570db58f', 'p', 'HandyTrain', '2019-03-02 10:02:02', 1),
('startup_437d869e0b3', 'dd351d4d232542459c48', 'p', 'GoCoop', '2019-03-02 10:01:35', 1),
('startup_4b23e056fd9', 'b8ca9590c29613b5dfab', 'p', 'iNurture', '2019-03-02 10:02:33', 1),
('startup_501347dae2a', 'cffc5a5db673181dd8ab', 'p', ' OpenOut', '2019-03-02 10:04:25', 1),
('startup_514b7e9f6e6', '49d03da0920fd6aa3833', 'p', ' HalaPlay', '2019-03-02 10:01:58', 1),
('startup_5349d6c5e0c', '7f0a04528dbd4acf4ea2', 'p', 'Sequretek', '2019-03-02 10:04:59', 1),
('startup_5377381aa1e', '3ec4654cc7d3beda9e65', 'p', ' Money View', '2019-03-02 10:03:46', 1),
('startup_54e691b2e0e', '4eb80394170af720c87c', 'p', 'Active.ai', '2019-03-01 20:54:35', 1),
('startup_565a20e6211', '39959bb46a33d3451bf9', 'p', 'coworks', '2019-03-02 09:54:28', 1),
('startup_58ea6d8b492', '22938fbe93b7d1a53c7d', 'p', ' NiYo Solutions', '2019-03-02 10:04:09', 1),
('startup_626fc93dc6a', '114da3cb651d13a05ca0', 'p', 'Chimple Learning', '2019-03-02 09:54:21', 1),
('startup_6ac1261a446', '537679f4e18805d9b80d', 'p', 'Boltt Sports', '2019-03-02 09:53:22', 1),
('startup_6dcc97cbf7bf', 'rub', 'p', '9Stacks', '2019-03-01 18:43:54', 1),
('startup_6eb76f323c3', '9335cdc15fbe1fc72e54', 'p', 'Terribly Tiny Tales', '2019-03-02 10:05:44', 1),
('startup_7213abde43e', '2d3496cce48c79eb4ff5', 'p', 'Dunzo', '2019-03-02 09:57:27', 1),
('startup_75f2cebe20e', 'f5d486145ace1ef1f11d', 'p', 'CashHealth', '2019-03-02 09:53:35', 1),
('startup_795e8d2f1bd', '3d3364d352fc9d960839', 'p', 'Fynd', '2019-03-02 10:01:25', 1),
('startup_7d25b37d798', 'b14582fdf544b858b5bd', 'p', 'Hansel.io', '2019-03-02 10:02:11', 1),
('startup_7e7e947b210', 'c13b28f7404d4bc3128a', 'p', 'Homergize', '2019-03-02 10:02:21', 1),
('startup_80e57982848', '31b5dd15a26f59b6fe09', 'p', 'Biryani By kilo', '2019-03-02 09:53:11', 1),
('startup_84dee75e130', '9209a93f04450886640b', 'p', 'Mr Button', '2019-03-02 10:03:50', 1),
('startup_8559eb7766c', '1612d61c46ee43280fcd', 'p', 'GoFro', '2019-03-02 10:01:39', 1),
('startup_88d64d63101', '2cd61ebcb53f71723d95', 'p', 'Graphic India', '2019-03-02 10:01:52', 1),
('startup_88e4ee56611', '8d4709d74fd8c0867509', 'p', 'Numberz', '2019-03-02 10:04:18', 1),
('startup_8a7cc648a7f', '00dd8000f3f48fa16c94', 'p', 'ten3T', '2019-03-02 10:05:41', 1),
('startup_8e5018e725e', 'd35565f69f84e30d01fc', 'p', ' Ecom Express', '2019-03-02 09:58:18', 1),
('startup_8e6bb85c120', 'bdf3f82eb3fa4dbbb09b', 'p', 'AEON learning', '2019-03-01 20:55:17', 1),
('startup_8e99c7d48a7', '013a3d5ca614423378c7', 'p', 'icanstay', '2019-03-02 10:02:26', 1),
('startup_8ed3e2b3e68', '040e1e0d33910a9726ba', 'p', 'Clip', '2019-03-02 09:54:24', 1),
('startup_905ba8f9dfb', '4f0f82c27938ec87315a', 'p', 'airpay', '2019-03-02 09:51:55', 1),
('startup_9099f229c0a', '89b3d8a0e8f56228bbc9', 'p', ' SigTuple', '2019-03-02 10:05:15', 1),
('startup_93b9136fc9d', 'c6d08f74150aebee8216', 'p', 'Play Shifu', '2019-03-02 10:04:37', 1),
('startup_9857eb86264', '5930adc2d7605a971eac', 'p', ' Little Black Book', '2019-03-02 10:03:32', 1),
('startup_98b25c82dfc', 'f9246c4168883342f373', 'p', 'East India Comedy', '2019-03-02 09:58:05', 1),
('startup_9a4c9975a12', 'e1f929cd7462bf6d4e49', 'p', 'drivezy', '2019-03-02 09:57:23', 1),
('startup_9d66062929b', '27a0e1637bf5e862def0', 'p', 'Flintobox', '2019-03-02 10:00:57', 1),
('startup_a5b7068f910', 'e4d7bf219ee6262d76db', 'p', 'Sendd', '2019-03-02 10:04:51', 1),
('startup_aab4679508c', '75090c1cd930e2956b38', 'p', ' SlicePay', '2019-03-02 10:05:07', 1),
('startup_ae6a02c524d', 'd8e0fe3f22e1134944c8', 'p', 'KrazyBee', '2019-03-02 10:02:52', 1),
('startup_af2263cee85', 'eb1dfb108778002bf261', 'p', 'credy', '2019-03-02 09:54:32', 1),
('startup_b081e59cc05', '1b03a7939333ad74e496', 'p', 'RenewBuy', '2019-03-02 10:04:41', 1),
('startup_b2a9b391d75', '71feff4cb084ae41ac75', 'p', ' NanoNets', '2019-03-02 10:03:59', 1),
('startup_b2c19bea700', 'a0309e826125d6b82bbd', 'p', 'Rentickle', '2019-03-02 10:04:48', 1),
('startup_b59a5b8ce10', '3a2e856a3d17a3be3975', 'p', ' Josh Talks', '2019-03-02 10:02:36', 1),
('startup_b9590350041', '194355021111f3d98535', 'p', 'Get My Parking', '2019-03-02 10:01:32', 1),
('startup_ba43cb76899', '6ca7991f176bd71fb8a4', 'p', 'ERA', '2019-03-02 10:00:41', 1),
('startup_ba8323c622b', 'aeceaf8ab2d0ad3f76d1', 'p', 'Flochat', '2019-03-02 10:01:02', 1),
('startup_cc81205365c', 'a2cd811f718ddb05ffb6', 'p', 'StyleCracker', '2019-03-02 10:05:29', 1),
('startup_ccdee3e72f2', '7db6a8e905575b79ede7', 'p', 'CureFit', '2019-03-02 09:57:15', 1),
('startup_cd15bb7049b', 'b21c761bdc965a51b465', 'p', 'Cash Suvidha', '2019-03-02 09:53:30', 1),
('startup_cd96a563a60', 'ec829de41b57a6bd2e70', 'p', 'Flock', '2019-03-02 10:01:06', 1),
('startup_cf892e16246', '50be706401e060fb43be', 'p', 'Fella Homes', '2019-03-02 10:00:45', 1),
('startup_d138e6a27ec', '257e853159b4cad40816', 'p', 'LetsTransport', '2019-03-02 10:02:49', 1),
('startup_d230c1ec050', '22a1a88f980d260dae66', 'p', 'Avishkaar Box', '2019-03-02 09:53:06', 1),
('startup_d449f779505', '19d27de24c7eca4d9290', 'p', 'Stanza Living', '2019-03-02 10:05:21', 1),
('startup_d775ae66135', 'eb5cea9ba2813dda709e', 'p', 'TAOautomation', '2019-03-02 10:05:37', 1),
('startup_db108287d8c', 'e941942c1e18037204f1', 'p', 'ALTBalaji', '2019-03-02 09:52:24', 1),
('startup_e21987a5713', '8fb691ca6a3d5c98d264', 'p', 'StoreKing', '2019-03-02 10:05:25', 1),
('startup_ec4d8c5e4dc', '24fef3ae27e02be8eca9', 'p', 'm.Paani', '2019-03-02 10:03:35', 1),
('startup_ed65481df1f', 'bafa61a2b4fe9a34ac98', 'p', 'Meesho', '2019-03-02 10:03:39', 1),
('startup_eeac0eb99d6', '46c3fe25a914f6d25bdd', 'p', ' GamingMonk', '2019-03-02 10:01:28', 1),
('startup_efb616698b9', '4e602544c2eea2ebcc3a', 'p', ' Sensibol Audio Technologies Pvt. Ltd.', '2019-03-02 10:04:56', 1),
('startup_f2e9ae74054', '2e63388e5382bbe72f76', 'p', 'BlowHorn', '2019-03-02 09:53:15', 1),
('startup_f82fa6e6ecb', 'ea31220a309a602ea697', 'p', 'Qbera', '2019-03-02 10:04:32', 1),
('startup_faf60db1c6f', 'dbf14a65cc4bc6111463', 'p', ' Gold Farm', '2019-03-02 10:01:42', 1),
('startup_fb1bebdd5d6', '85ef3cee57374a73c834', 'p', ' Propstory', '2019-03-02 10:04:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `startup_contact`
--

CREATE TABLE `startup_contact` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `website` varchar(100) DEFAULT NULL COMMENT 'website url',
  `email` varchar(100) DEFAULT NULL COMMENT 'email address',
  `phone` varchar(30) DEFAULT NULL COMMENT 'phone no',
  `mobile` varchar(30) DEFAULT NULL COMMENT 'mobile no',
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last update'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the contact informations of the startups.';

--
-- Dumping data for table `startup_contact`
--

INSERT INTO `startup_contact` (`startup_id`, `website`, `email`, `phone`, `mobile`, `update_timestamp`) VALUES
('startup1234', 'www.admin.com', 'admin@gmail.com', '1234567890', '0987654321', '2019-03-02 17:30:31'),
('startup_0221e174296', 'www.filmygyan.com', 'filmygyan@g.com', '787651', '7485961230', '2019-03-02 04:30:49'),
('startup_049027ac21d', 'www.sumeru.com', 'sumeru@g.com', '458712', '7845962103', '2019-03-02 04:35:34'),
('startup_07b7f23419d', 'www.mobiefit.com', 'mobie@g.com', '458712', '7845962103', '2019-03-02 04:33:43'),
('startup_08971b04e3a', 'www.smaash.com', 'smaash@g.com', '458712', '7845962103', '2019-03-02 04:35:18'),
('startup_128f4e34887', 'www.hipcask.com', 'hip@t.com', '458712', '7845962103', '2019-03-02 04:32:17'),
('startup_129b01b099e', 'www.ftcash.com', 'ftcash@gmail.com', '748596', '1020354478', '2019-03-02 04:31:21'),
('startup_1c057cbeac3', 'www.netmeds.com', 'netmeds@g.com', '458712', '7845962103', '2019-03-02 04:34:04'),
('startup_1e2a7dc8110', 'www.onco.com', 'onco@g.com', '458712', '7845962103', '2019-03-02 04:34:22'),
('startup_258b66dcf51', 'www.boxxai.com', 'boxxai@g.com', '789654', '7485961523', '2019-03-02 04:23:26'),
('startup_2895e36fda5', 'www.inner.com', 'inner@g.com', '458712', '7845962103', '2019-03-02 04:32:42'),
('startup_2f4aa8e859b', 'www.hexoctane.com', 'hexoctane@f.com', '458712', '7845962103', '2019-03-02 04:32:14'),
('startup_30cf33991de', 'www.finger.com', 'finger@g.com', '74859612', '4447778856', '2019-03-02 04:30:53'),
('startup_35e0b47ed5f', 'www.eatigo.com', 'eatigo@g.com', '74859632', '1144778855', '2019-03-02 04:28:14'),
('startup_3ae62eea4d3', 'www.notice.com', 'notice@g.com', '458712', '7845962103', '2019-03-02 04:34:13'),
('startup_3b9515728be', 'www.koinex.com', 'koinex@g.com', '458712', '7845962103', '2019-03-02 04:32:46'),
('startup_3bcb7c56f87', 'www.coworking.com', 'coworking@g.com', '458712', '7845962103', '2019-03-02 04:32:29'),
('startup_3d04d4656c3', 'www.doctor.com', 'doctor@g.com', '789654', '7485961523', '2019-03-02 04:27:19'),
('startup_3eeca45bc90', 'www.askarvi.com', 'askarvi@g.com', '789654', '7485961523', '2019-03-02 04:23:01'),
('startup_3fe1ea0b539', 'www.handy.com', 'handy@f.com', '987646', '7845963210', '2019-03-02 04:32:02'),
('startup_437d869e0b3', 'www.gocoop.com', 'gocoop@r.com', '798765', '4785691315', '2019-03-02 04:31:35'),
('startup_4b23e056fd9', 'www.inurture.com', 'inurture@g.com', '458712', '7845962103', '2019-03-02 04:32:33'),
('startup_501347dae2a', 'www.openout.com', 'openout@gmail.com', '458712', '7845962103', '2019-03-02 04:34:25'),
('startup_514b7e9f6e6', 'www.halaplay.com', 'hala@g.com', '441258', '7485963214', '2019-03-02 04:31:58'),
('startup_5349d6c5e0c', 'www.sequetek.com', 'seque@g.com', '458712', '7845962103', '2019-03-02 04:34:59'),
('startup_5377381aa1e', 'www.moneyview.com', 'moneyview@k.com', '458712', '7845962103', '2019-03-02 04:33:46'),
('startup_54e691b2e0e', 'www.active.com', 'active@g.com', '789654', '7485961523', '2019-03-01 15:24:35'),
('startup_565a20e6211', 'www.coworks.com', 'coworks@g.com', '789654', '7485961523', '2019-03-02 04:24:28'),
('startup_58ea6d8b492', 'www.niyo.com', 'niyp@g.com', '458712', '7845962103', '2019-03-02 04:34:09'),
('startup_626fc93dc6a', 'www.chimplelearning.com', 'chimplelearning@g.com', '789654', '7485961523', '2019-03-02 04:24:21'),
('startup_6ac1261a446', 'www.bolttsports.com', 'bolttsports@g.com', '789654', '7485961523', '2019-03-02 04:23:22'),
('startup_6dcc97cbf7bf', 'www.9stacks.com', 'a@gmail.com', '12365544', '7894561230', '2019-03-01 13:13:54'),
('startup_6eb76f323c3', 'www.tinytales.com', 'tinytales@g.com', '458712', '7845962103', '2019-03-02 04:35:44'),
('startup_7213abde43e', 'www.dunzo.com', 'dunzo@g.com', '74859612', '1475829630', '2019-03-02 04:27:27'),
('startup_75f2cebe20e', 'www.cashhealth.com', 'cashhealth@g.com', '789654', '7485961523', '2019-03-02 04:23:35'),
('startup_795e8d2f1bd', 'www.fynd.com', 'fynd@g.com', '748512', '4152879633', '2019-03-02 04:31:25'),
('startup_7d25b37d798', 'www.hansei.com', 'hansei@h.com', '45862137', '7485961230', '2019-03-02 04:32:11'),
('startup_7e7e947b210', 'www.homerize.com', 'home@f.com', '458712', '7845962103', '2019-03-02 04:32:21'),
('startup_80e57982848', 'www.biryani.com', 'biryani@g.com', '789654', '7485961523', '2019-03-02 04:23:11'),
('startup_84dee75e130', 'www.button.com', 'button@g.com', '458712', '7845962103', '2019-03-02 04:33:50'),
('startup_8559eb7766c', 'www.gofro.com', 'gofro@g.com', '13135498', '1212141517', '2019-03-02 04:31:39'),
('startup_88d64d63101', 'www.graphic.com', 'graphic@u.com', '7897651', '7412589630', '2019-03-02 04:31:52'),
('startup_88e4ee56611', 'www.numberz.com', 'numberz@g.com', '458712', '7845962103', '2019-03-02 04:34:18'),
('startup_8a7cc648a7f', 'www.ten.com', 'ten@g.com', '458712', '7845962103', '2019-03-02 04:35:41'),
('startup_8e5018e725e', 'www.express.com', 'express@g.com', '74125896', '1254789630', '2019-03-02 04:28:18'),
('startup_8e6bb85c120', 'www.aeon.com', 'aeon@g.com', '789654', '7485961523', '2019-03-01 15:25:17'),
('startup_8e99c7d48a7', 'www.icanstay.com', 'ican@h.com', '458712', '7845962103', '2019-03-02 04:32:26'),
('startup_8ed3e2b3e68', 'www.clip.com', 'clipg@g.com', '789654', '7485961523', '2019-03-02 04:24:24'),
('startup_905ba8f9dfb', 'www.airpay.com', 'airpay@g.com', '789654', '7485961523', '2019-03-02 04:21:55'),
('startup_9099f229c0a', 'www.sig.com', 'sig@g.com', '458712', '7845962103', '2019-03-02 04:35:15'),
('startup_93b9136fc9d', 'www.play.com', 'play@k.com', '458712', '7845962103', '2019-03-02 04:34:37'),
('startup_9857eb86264', 'www.blackbook.com', 'blackbook@g.com', '458712', '7845962103', '2019-03-02 04:33:32'),
('startup_98b25c82dfc', 'www.east.com', 'east@g.com', '74125896', '7485961523', '2019-03-02 04:28:05'),
('startup_9a4c9975a12', 'www.dri.com', 'dri@g.com', '78945', '1234567895', '2019-03-02 04:27:23'),
('startup_9d66062929b', 'www.flintbox.com', 'flintbox@g.com', '485664', '7845129630', '2019-03-02 04:30:57'),
('startup_a5b7068f910', 'www.sendd.com', 'sendd@g.com', '458712', '7845962103', '2019-03-02 04:34:51'),
('startup_aab4679508c', 'www.slicepay.com', 'slice@g.com', '458712', '7845962103', '2019-03-02 04:35:07'),
('startup_ae6a02c524d', 'www.krazybee.com', 'krazybee@g.com', '458712', '7845962103', '2019-03-02 04:32:52'),
('startup_af2263cee85', 'www.credy.com', 'credy@g.com', '788945961', '7412589630', '2019-03-02 04:24:32'),
('startup_b081e59cc05', 'www.renew.com', 'renew@g.com', '458712', '7845962103', '2019-03-02 04:34:41'),
('startup_b2a9b391d75', 'www.nanonets.com', 'nanonets@g.com', '458712', '7845962103', '2019-03-02 04:33:59'),
('startup_b2c19bea700', 'www.rentickle.com', 'renticle@g.com', '458712', '7845962103', '2019-03-02 04:34:48'),
('startup_b59a5b8ce10', 'www.josh.com', 'josh@g.com', '458712', '7845962103', '2019-03-02 04:32:36'),
('startup_b9590350041', 'www.getparking.com', 'getparking@gmail.com', '741288', '4458569612', '2019-03-02 04:31:32'),
('startup_ba43cb76899', 'www.era.com', 'era@g.com', '74125896', '1144778855', '2019-03-02 04:30:41'),
('startup_ba8323c622b', 'www.flochat.com', 'flochat@g.com', '123456', '1234567890', '2019-03-02 04:31:02'),
('startup_cc81205365c', 'www.style.com', 'style@g.com', '458712', '7845962103', '2019-03-02 04:35:29'),
('startup_ccdee3e72f2', 'www.curefit.com', 'curefit@g.com', '789654', '7485961523', '2019-03-02 04:27:15'),
('startup_cd15bb7049b', 'www.cashsuvidha.com', 'cashsuvidha@g.com', '789654', '7485961523', '2019-03-02 04:23:30'),
('startup_cd96a563a60', 'www.flock.com', 'flock@gmail.com', '787656', '4458569612', '2019-03-02 04:31:06'),
('startup_cf892e16246', 'www.fella.com', 'fella@g.com', '879564', '4567891135', '2019-03-02 04:30:45'),
('startup_d138e6a27ec', 'www.trans.com', 'trans@h.com', '458712', '7845962103', '2019-03-02 04:32:49'),
('startup_d230c1ec050', 'www.avishkar.com', 'avishkar@g.com', '789654', '7485961523', '2019-03-02 04:23:06'),
('startup_d449f779505', 'www.stanza.com', 'stanza@g.com', '458712', '7845962103', '2019-03-02 04:35:21'),
('startup_d775ae66135', 'www.taot.com', 'taot@g.com', '458712', '7845962103', '2019-03-02 04:35:37'),
('startup_db108287d8c', 'www.altbalaji.com', 'altbalaji@g.com', '789654', '7485961523', '2019-03-02 04:22:24'),
('startup_e21987a5713', 'www.store.com', 'store@g.com', '458712', '7845962103', '2019-03-02 04:35:25'),
('startup_ec4d8c5e4dc', 'www.mpaani.com', 'mpaani@k.com', '458712', '7845962103', '2019-03-02 04:33:35'),
('startup_ed65481df1f', 'www.meesho.com', 'meesho@h.com', '458712', '7845962103', '2019-03-02 04:33:39'),
('startup_eeac0eb99d6', 'www.gaming.com', 'gaming@t.com', '44158960', '1478502369', '2019-03-02 04:31:28'),
('startup_efb616698b9', 'www.audio.com', 'audio@g.com', '458712', '7845962103', '2019-03-02 04:34:56'),
('startup_f2e9ae74054', 'www.blowhorn.com', 'blowhorn@g.com', '789654', '7485961523', '2019-03-02 04:23:15'),
('startup_f82fa6e6ecb', 'www.qbera.com', 'qbera@g.com', '458712', '7845962103', '2019-03-02 04:34:32'),
('startup_faf60db1c6f', 'www.gold.com', 'gold@j.com', '78459612', '7485123690', '2019-03-02 04:31:42'),
('startup_fb1bebdd5d6', 'www.prop.com', 'prop@g.com', '458712', '7845962103', '2019-03-02 04:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `startup_corp_partner`
--

CREATE TABLE `startup_corp_partner` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `corp_id` varchar(20) NOT NULL COMMENT 'unique identification of corporate'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table provide details of the corporates with which a startup has worked or is presently working on.';

-- --------------------------------------------------------

--
-- Table structure for table `startup_detail`
--

CREATE TABLE `startup_detail` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `startup_name` varchar(200) DEFAULT NULL COMMENT 'name of startup',
  `cin_no` varchar(100) DEFAULT NULL COMMENT 'assigned by govt',
  `roc_reg_no` varchar(100) DEFAULT NULL COMMENT 'assigned by govt',
  `recog_no` varchar(100) DEFAULT NULL COMMENT 'recognition number of the startup',
  `incorporate_date` date DEFAULT NULL COMMENT 'date of incorporation'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the basic details of the startup.';

--
-- Dumping data for table `startup_detail`
--

INSERT INTO `startup_detail` (`startup_id`, `startup_name`, `cin_no`, `roc_reg_no`, `recog_no`, `incorporate_date`) VALUES
('startup_0221e174296', 'Filmygyan', '1028ab', '1028', '1000', '2019-02-28'),
('startup_049027ac21d', 'Sumeru', '1082ab', '1082', '1000', '2018-12-18'),
('startup_07b7f23419d', 'Mobiefit', '1058ab', '1058', '1000', '2018-12-11'),
('startup_08971b04e3a', 'Smaaash Entertainment Pvt. Ltd.', '1078ab', '1078', '1000', '2019-02-24'),
('startup_128f4e34887', 'HipCask', '1046ab', '1046', '1000', '2019-03-01'),
('startup_129b01b099e', 'ftcash', '1033ab', '1033', '1000', '2019-02-12'),
('startup_1c057cbeac3', 'Netmeds.com', '1062ab', '1062', '1000', '2019-02-24'),
('startup_1e2a7dc8110', ' OncoStem Diagnostics', '1066ab', '1066', '1000', '2018-06-04'),
('startup_258b66dcf51', 'Boxx.Ai', '1011ab', '1011', '1000', '2019-02-14'),
('startup_2895e36fda5', 'InnerChef', '1049ab', '1049', '1000', '2019-01-27'),
('startup_2f4aa8e859b', ' HexOctane', '1044ab', '1044', '1000', '2019-01-27'),
('startup_30cf33991de', 'Fingerlix', '1029ab', '1029', '1000', '2019-02-27'),
('startup_35e0b47ed5f', 'Eatigo', '1023ab', '1023', '1000', '2019-02-06'),
('startup_3ae62eea4d3', ' Noticeboard', '1064ab', '1064', '1000', '2018-11-20'),
('startup_3b9515728be', ' Koinex', '1053ab', '1053', '1000', '2019-01-08'),
('startup_3bcb7c56f87', ' Innov8 Coworking', '1050ab', '1050', '1000', '2019-02-24'),
('startup_3d04d4656c3', 'Doctor Insta', '1020ab', '1020', '1000', '2019-02-14'),
('startup_3eeca45bc90', 'Ask Arvi', '1006ab', '1006', '1000', '2019-02-14'),
('startup_3fe1ea0b539', 'HandyTrain', '1042ab', '1042', '1000', '2019-02-18'),
('startup_437d869e0b3', 'GoCoop', '1037ab', '1037', '1000', '2019-02-24'),
('startup_4b23e056fd9', 'iNurture', '1051ab', '1051', '1000', '2019-01-28'),
('startup_501347dae2a', ' OpenOut', '1067ab', '1067', '1000', '2018-11-14'),
('startup_514b7e9f6e6', ' HalaPlay', '1041ab', '1041', '1000', '2019-02-26'),
('startup_5349d6c5e0c', 'Sequretek', '1075ab', '1075', '1000', '2018-12-04'),
('startup_5377381aa1e', ' Money View', '1059ab', '1059', '1000', '2018-11-27'),
('startup_54e691b2e0e', 'Active.ai', '1002ab', '1002', '1000', '2019-02-14'),
('startup_565a20e6211', 'coworks', '1016ab', '1016', '1000', '2019-02-14'),
('startup_58ea6d8b492', ' NiYo Solutions', '1063ab', '1063', '1000', '2019-01-01'),
('startup_626fc93dc6a', 'Chimple Learning', '1014ab', '1014', '1000', '2019-02-14'),
('startup_6ac1261a446', 'Boltt Sports', '1010ab', '1010', '1000', '2019-02-14'),
('startup_6dcc97cbf7bf', '9Stacks', '1001ab', '0', '1478', '2019-02-01'),
('startup_6eb76f323c3', 'Terribly Tiny Tales', '1084ab', '1084', '1000', '2018-12-11'),
('startup_7213abde43e', 'Dunzo', '1022ab', '1022', '1000', '2019-02-28'),
('startup_75f2cebe20e', 'CashHealth', '1013ab', '1013', '1000', '2019-02-14'),
('startup_795e8d2f1bd', 'Fynd', '1034ab', '1034', '1000', '2019-02-04'),
('startup_7d25b37d798', 'Hansel.io', '1043ab', '1043', '1000', '2019-02-25'),
('startup_7e7e947b210', 'Homergize', '1047ab', '1047', '1000', '2019-02-24'),
('startup_80e57982848', 'Biryani By kilo', '1008ab', '1008', '1000', '2019-02-14'),
('startup_84dee75e130', 'Mr Button', '1060ab', '1060', '1000', '2018-11-13'),
('startup_8559eb7766c', 'GoFro', '1038ab', '1038', '1000', '2019-03-01'),
('startup_88d64d63101', 'Graphic India', '1040ab', '1040', '1000', '2019-02-25'),
('startup_88e4ee56611', 'Numberz', '1065ab', '1065', '1000', '2018-12-20'),
('startup_8a7cc648a7f', 'ten3T', '1083ab', '1083', '1000', '2018-12-11'),
('startup_8e5018e725e', ' Ecom Express', '1024ab', '1024', '1000', '2019-02-19'),
('startup_8e6bb85c120', 'AEON learning', '1003ab', '1003', '1000', '2019-02-14'),
('startup_8e99c7d48a7', 'icanstay', '1048ab', '1048', '1000', '2019-02-27'),
('startup_8ed3e2b3e68', 'Clip', '1015ab', '1015', '1000', '2019-02-14'),
('startup_905ba8f9dfb', 'airpay', '1004ab', '1004', '1000', '2019-02-14'),
('startup_9099f229c0a', ' SigTuple', '1076ab', '1076', '1000', '2018-12-04'),
('startup_93b9136fc9d', 'Play Shifu', '1068ab', '1068', '1000', '2018-12-11'),
('startup_9857eb86264', ' Little Black Book', '1056ab', '1056', '1000', '2019-01-01'),
('startup_98b25c82dfc', 'East India Comedy', '1025ab', '1025', '1000', '2019-03-01'),
('startup_9a4c9975a12', 'drivezy', '1021ab', '1021', '1021', '2019-02-01'),
('startup_9d66062929b', 'Flintobox', '1030ab', '1030', '1000', '2019-02-26'),
('startup_a5b7068f910', 'Sendd', '1073ab', '1073', '1000', '2019-02-24'),
('startup_aab4679508c', ' SlicePay', '1077ab', '1077', '1000', '2019-02-25'),
('startup_ae6a02c524d', 'KrazyBee', '1054ab', '1054', '1000', '2018-12-30'),
('startup_af2263cee85', 'credy', '1018ab', '1018', '1000', '2019-03-20'),
('startup_b081e59cc05', 'RenewBuy', '1071ab', '1071', '1000', '2019-02-25'),
('startup_b2a9b391d75', ' NanoNets', '1061ab', '1061', '1000', '2018-12-02'),
('startup_b2c19bea700', 'Rentickle', '1072ab', '1072', '1000', '2018-11-14'),
('startup_b59a5b8ce10', ' Josh Talks', '1052ab', '1052', '1000', '2019-02-01'),
('startup_b9590350041', 'Get My Parking', '1036ab', '1036', '1000', '2019-02-24'),
('startup_ba43cb76899', 'ERA', '1026ab', '1026', '1000', '2019-03-01'),
('startup_ba8323c622b', 'Flochat', '1031ab', '1031', '1000', '2019-02-25'),
('startup_cc81205365c', 'StyleCracker', '1081ab', '1081', '1000', '2018-12-11'),
('startup_ccdee3e72f2', 'CureFit', '1019ab', '1019', '1000', '2019-02-14'),
('startup_cd15bb7049b', 'Cash Suvidha', '1012ab', '1012', '1000', '2019-02-14'),
('startup_cd96a563a60', 'Flock', '1032ab', '1032', '1000', '2019-01-29'),
('startup_cf892e16246', 'Fella Homes', '1027ab', '1027', '1000', '2019-03-01'),
('startup_d138e6a27ec', 'LetsTransport', '1055ab', '1055', '1000', '2019-01-01'),
('startup_d230c1ec050', 'Avishkaar Box', '1007ab', '1007', '1000', '2019-02-14'),
('startup_d449f779505', 'Stanza Living', '1079ab', '1079', '1000', '2019-01-15'),
('startup_d775ae66135', 'TAOautomation', '1085ab', '1085', '1000', '2018-11-07'),
('startup_db108287d8c', 'ALTBalaji', '1005ab', '1005', '1000', '2019-02-14'),
('startup_e21987a5713', 'StoreKing', '1080ab', '1080', '1000', '2019-01-16'),
('startup_ec4d8c5e4dc', 'm.Paani', '1045ab', '1045', '1000', '2018-12-10'),
('startup_ed65481df1f', 'Meesho', '1057ab', '1057', '1000', '2019-03-01'),
('startup_eeac0eb99d6', ' GamingMonk', '1035ab', '1035', '1000', '2019-02-25'),
('startup_efb616698b9', ' Sensibol Audio Technologies Pvt. Ltd.', '1074ab', '1074', '1000', '2018-11-14'),
('startup_f2e9ae74054', 'BlowHorn', '1009ab', '1009', '1000', '2019-02-14'),
('startup_f82fa6e6ecb', 'Qbera', '1070ab', '1070', '1000', '2019-02-24'),
('startup_faf60db1c6f', ' Gold Farm', '1039ab', '1039', '1000', '2019-02-25'),
('startup_fb1bebdd5d6', ' Propstory', '1069ab', '1069', '1000', '2018-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `startup_reg`
--

CREATE TABLE `startup_reg` (
  `reg_id` int(11) UNSIGNED NOT NULL COMMENT 'unique identifier of the registration request',
  `startup_name` varchar(200) NOT NULL DEFAULT '0' COMMENT 'name of startup',
  `cin_no` varchar(100) NOT NULL DEFAULT '0' COMMENT 'assigned by govt agency',
  `roc_reg_no` varchar(100) NOT NULL DEFAULT '0' COMMENT 'assigned by govt agency',
  `incorporate_date` date DEFAULT NULL COMMENT 'date of incorporation',
  `worth` varchar(100) NOT NULL DEFAULT '0' COMMENT 'in million rupees',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-pending,1-approved,2-rejected',
  `recog_no` varchar(100) NOT NULL DEFAULT '0' COMMENT 'startup recognition number',
  `website` varchar(100) NOT NULL DEFAULT '0' COMMENT 'wesite url',
  `email` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Mandatory',
  `mobile` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Mandatory',
  `phone` varchar(100) NOT NULL DEFAULT '0' COMMENT 'telephone no',
  `insert_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp of last update'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the details provided at the time of startup registration. These details will be used for creating further tables.';

--
-- Dumping data for table `startup_reg`
--

INSERT INTO `startup_reg` (`reg_id`, `startup_name`, `cin_no`, `roc_reg_no`, `incorporate_date`, `worth`, `status`, `recog_no`, `website`, `email`, `mobile`, `phone`, `insert_timestamp`) VALUES
(1, '9Stacks', '1001ab', '1001', '2019-02-01', '1000000', 1, '1478', 'www.9stacks.com', 'a@gmail.com', '7894561230', '12365544', '2019-03-01 13:10:55'),
(2, 'Active.ai', '1002ab', '1002', '2019-02-14', '154267', 1, '1000', 'www.active.com', 'active@g.com', '7485961523', '789654', '2019-03-01 13:31:25'),
(3, 'AEON learning', '1003ab', '1003', '2019-02-14', '154267', 1, '1000', 'www.aeon.com', 'aeon@g.com', '7485961523', '789654', '2019-03-01 13:32:22'),
(4, 'airpay', '1004ab', '1004', '2019-02-14', '154267', 1, '1000', 'www.airpay.com', 'airpay@g.com', '7485961523', '789654', '2019-03-01 13:32:46'),
(5, 'ALTBalaji', '1005ab', '1005', '2019-02-14', '154267', 1, '1000', 'www.altbalaji.com', 'altbalaji@g.com', '7485961523', '789654', '2019-03-01 13:33:18'),
(6, 'Ask Arvi', '1006ab', '1006', '2019-02-14', '154267', 1, '1000', 'www.askarvi.com', 'askarvi@g.com', '7485961523', '789654', '2019-03-01 13:33:59'),
(7, 'Avishkaar Box', '1007ab', '1007', '2019-02-14', '154267', 1, '1000', 'www.avishkar.com', 'avishkar@g.com', '7485961523', '789654', '2019-03-01 13:34:36'),
(8, 'Biryani By kilo', '1008ab', '1008', '2019-02-14', '154267', 1, '1000', 'www.biryani.com', 'biryani@g.com', '7485961523', '789654', '2019-03-01 13:35:14'),
(9, 'BlowHorn', '1009ab', '1009', '2019-02-14', '154267', 1, '1000', 'www.blowhorn.com', 'blowhorn@g.com', '7485961523', '789654', '2019-03-01 13:35:39'),
(10, 'Boltt Sports', '1010ab', '1010', '2019-02-14', '154267', 1, '1000', 'www.bolttsports.com', 'bolttsports@g.com', '7485961523', '789654', '2019-03-01 13:36:14'),
(11, 'Boxx.Ai', '1011ab', '1011', '2019-02-14', '154267', 1, '1000', 'www.boxxai.com', 'boxxai@g.com', '7485961523', '789654', '2019-03-01 13:36:44'),
(14, 'Cash Suvidha', '1012ab', '1012', '2019-02-14', '154267', 1, '1000', 'www.cashsuvidha.com', 'cashsuvidha@g.com', '7485961523', '789654', '2019-03-01 13:51:03'),
(15, 'CashHealth', '1013ab', '1013', '2019-02-14', '154267', 1, '1000', 'www.cashhealth.com', 'cashhealth@g.com', '7485961523', '789654', '2019-03-01 13:51:50'),
(16, 'Chimple Learning', '1014ab', '1014', '2019-02-14', '154267', 1, '1000', 'www.chimplelearning.com', 'chimplelearning@g.com', '7485961523', '789654', '2019-03-01 13:52:32'),
(17, 'Clip', '1015ab', '1015', '2019-02-14', '154267', 1, '1000', 'www.clip.com', 'clipg@g.com', '7485961523', '789654', '2019-03-01 13:53:08'),
(18, 'coworks', '1016ab', '1016', '2019-02-14', '154267', 1, '1000', 'www.coworks.com', 'coworks@g.com', '7485961523', '789654', '2019-03-01 13:53:34'),
(20, 'credy', '1018ab', '1018', '2019-03-20', '145855', 1, '1000', 'www.credy.com', 'credy@g.com', '7412589630', '788945961', '2019-03-01 13:58:14'),
(21, 'CureFit', '1019ab', '1019', '2019-02-14', '154267', 1, '1000', 'www.curefit.com', 'curefit@g.com', '7485961523', '789654', '2019-03-01 14:00:25'),
(22, 'Doctor Insta', '1020ab', '1020', '2019-02-14', '154267', 1, '1000', 'www.doctor.com', 'doctor@g.com', '7485961523', '789654', '2019-03-01 14:02:57'),
(23, 'drivezy', '1021ab', '1021', '2019-02-01', '100000', 1, '1021', 'www.dri.com', 'dri@g.com', '1234567895', '78945', '2019-03-01 14:04:19'),
(24, 'Dunzo', '1022ab', '1022', '2019-02-28', '145236', 1, '1000', 'www.dunzo.com', 'dunzo@g.com', '1475829630', '74859612', '2019-03-01 14:09:52'),
(25, 'Eatigo', '1023ab', '1023', '2019-02-06', '789654', 1, '1000', 'www.eatigo.com', 'eatigo@g.com', '1144778855', '74859632', '2019-03-01 14:12:16'),
(26, ' Ecom Express', '1024ab', '1024', '2019-02-19', '748596', 1, '1000', 'www.express.com', 'express@g.com', '1254789630', '74125896', '2019-03-01 14:13:58'),
(27, 'East India Comedy', '1025ab', '1025', '2019-03-01', '745896', 1, '1000', 'www.east.com', 'east@g.com', '7485961523', '74125896', '2019-03-01 14:16:11'),
(28, 'ERA', '1026ab', '1026', '2019-03-01', '445448', 1, '1000', 'www.era.com', 'era@g.com', '1144778855', '74125896', '2019-03-01 14:19:26'),
(29, 'Fella Homes', '1027ab', '1027', '2019-03-01', '745896', 1, '1000', 'www.fella.com', 'fella@g.com', '4567891135', '879564', '2019-03-01 14:20:55'),
(30, 'Filmygyan', '1028ab', '1028', '2019-02-28', '152478', 1, '1000', 'www.filmygyan.com', 'filmygyan@g.com', '7485961230', '787651', '2019-03-01 14:21:52'),
(31, 'Fingerlix', '1029ab', '1029', '2019-02-27', '156897', 1, '1000', 'www.finger.com', 'finger@g.com', '4447778856', '74859612', '2019-03-01 14:23:30'),
(32, 'Flintobox', '1030ab', '1030', '2019-02-26', '4415523', 1, '1000', 'www.flintbox.com', 'flintbox@g.com', '7845129630', '485664', '2019-03-01 14:24:27'),
(33, 'Flochat', '1031ab', '1031', '2019-02-25', '142537', 1, '1000', 'www.flochat.com', 'flochat@g.com', '1234567890', '123456', '2019-03-01 14:30:26'),
(34, 'Flock', '1032ab', '1032', '2019-01-29', '787845', 1, '1000', 'www.flock.com', 'flock@gmail.com', '4458569612', '787656', '2019-03-01 14:32:35'),
(35, 'ftcash', '1033ab', '1033', '2019-02-12', '784532', 1, '1000', 'www.ftcash.com', 'ftcash@gmail.com', '1020354478', '748596', '2019-03-01 14:33:58'),
(36, 'Fynd', '1034ab', '1034', '2019-02-04', '122585', 1, '1000', 'www.fynd.com', 'fynd@g.com', '4152879633', '748512', '2019-03-01 14:34:55'),
(37, ' GamingMonk', '1035ab', '1035', '2019-02-25', '114785', 1, '1000', 'www.gaming.com', 'gaming@t.com', '1478502369', '44158960', '2019-03-01 14:35:40'),
(38, 'Get My Parking', '1036ab', '1036', '2019-02-24', '147852', 1, '1000', 'www.getparking.com', 'getparking@gmail.com', '4458569612', '741288', '2019-03-01 14:36:24'),
(39, 'GoCoop', '1037ab', '1037', '2019-02-24', '785462', 1, '1000', 'www.gocoop.com', 'gocoop@r.com', '4785691315', '798765', '2019-03-01 14:37:07'),
(40, 'GoFro', '1038ab', '1038', '2019-03-01', '49546', 1, '1000', 'www.gofro.com', 'gofro@g.com', '1212141517', '13135498', '2019-03-01 14:38:04'),
(41, ' Gold Farm', '1039ab', '1039', '2019-02-25', '100000', 1, '1000', 'www.gold.com', 'gold@j.com', '7485123690', '78459612', '2019-03-01 14:38:45'),
(42, 'Graphic India', '1040ab', '1040', '2019-02-25', '146547', 1, '1000', 'www.graphic.com', 'graphic@u.com', '7412589630', '7897651', '2019-03-01 14:39:32'),
(43, ' HalaPlay', '1041ab', '1041', '2019-02-26', '65465', 1, '1000', 'www.halaplay.com', 'hala@g.com', '7485963214', '441258', '2019-03-01 14:40:21'),
(44, 'HandyTrain', '1042ab', '1042', '2019-02-18', '785412', 1, '1000', 'www.handy.com', 'handy@f.com', '7845963210', '987646', '2019-03-01 14:42:47'),
(45, 'Hansel.io', '1043ab', '1043', '2019-02-25', '9846231', 1, '1000', 'www.hansei.com', 'hansei@h.com', '7485961230', '45862137', '2019-03-01 14:43:52'),
(46, ' HexOctane', '1044ab', '1044', '2019-01-27', '584796', 1, '1000', 'www.hexoctane.com', 'hexoctane@f.com', '7845962103', '458712', '2019-03-01 14:50:14'),
(47, 'HipCask', '1046ab', '1046', '2019-03-01', '584796', 1, '1000', 'www.hipcask.com', 'hip@t.com', '7845962103', '458712', '2019-03-01 14:50:47'),
(48, 'Homergize', '1047ab', '1047', '2019-02-24', '584796', 1, '1000', 'www.homerize.com', 'home@f.com', '7845962103', '458712', '2019-03-01 14:51:26'),
(49, 'icanstay', '1048ab', '1048', '2019-02-27', '584796', 1, '1000', 'www.icanstay.com', 'ican@h.com', '7845962103', '458712', '2019-03-01 14:51:54'),
(50, 'InnerChef', '1049ab', '1049', '2019-01-27', '584796', 1, '1000', 'www.inner.com', 'inner@g.com', '7845962103', '458712', '2019-03-01 14:52:36'),
(51, ' Innov8 Coworking', '1050ab', '1050', '2019-02-24', '584796', 1, '1000', 'www.coworking.com', 'coworking@g.com', '7845962103', '458712', '2019-03-01 14:53:13'),
(52, 'iNurture', '1051ab', '1051', '2019-01-28', '584796', 1, '1000', 'www.inurture.com', 'inurture@g.com', '7845962103', '458712', '2019-03-01 14:53:48'),
(53, ' Josh Talks', '1052ab', '1052', '2019-02-01', '584796', 1, '1000', 'www.josh.com', 'josh@g.com', '7845962103', '458712', '2019-03-01 14:54:19'),
(54, ' Koinex', '1053ab', '1053', '2019-01-08', '584796', 1, '1000', 'www.koinex.com', 'koinex@g.com', '7845962103', '458712', '2019-03-01 14:54:53'),
(55, 'KrazyBee', '1054ab', '1054', '2018-12-30', '584796', 1, '1000', 'www.krazybee.com', 'krazybee@g.com', '7845962103', '458712', '2019-03-01 14:55:28'),
(56, 'LetsTransport', '1055ab', '1055', '2019-01-01', '584796', 1, '1000', 'www.trans.com', 'trans@h.com', '7845962103', '458712', '2019-03-01 14:57:10'),
(57, ' Little Black Book', '1056ab', '1056', '2019-01-01', '584796', 1, '1000', 'www.blackbook.com', 'blackbook@g.com', '7845962103', '458712', '2019-03-01 14:57:47'),
(58, 'Meesho', '1057ab', '1057', '2019-03-01', '584796', 1, '1000', 'www.meesho.com', 'meesho@h.com', '7845962103', '458712', '2019-03-01 14:58:29'),
(59, 'm.Paani', '1045ab', '1045', '2018-12-10', '584796', 1, '1000', 'www.mpaani.com', 'mpaani@k.com', '7845962103', '458712', '2019-03-01 15:00:20'),
(60, 'Mobiefit', '1058ab', '1058', '2018-12-11', '584796', 1, '1000', 'www.mobiefit.com', 'mobie@g.com', '7845962103', '458712', '2019-03-01 15:00:59'),
(61, ' Money View', '1059ab', '1059', '2018-11-27', '584796', 1, '1000', 'www.moneyview.com', 'moneyview@k.com', '7845962103', '458712', '2019-03-01 15:01:33'),
(62, 'Mr Button', '1060ab', '1060', '2018-11-13', '584796', 1, '1000', 'www.button.com', 'button@g.com', '7845962103', '458712', '2019-03-01 15:02:04'),
(63, ' NanoNets', '1061ab', '1061', '2018-12-02', '584796', 1, '1000', 'www.nanonets.com', 'nanonets@g.com', '7845962103', '458712', '2019-03-01 15:02:47'),
(64, 'Netmeds.com', '1062ab', '1062', '2019-02-24', '584796', 1, '1000', 'www.netmeds.com', 'netmeds@g.com', '7845962103', '458712', '2019-03-01 15:03:21'),
(65, ' NiYo Solutions', '1063ab', '1063', '2019-01-01', '584796', 1, '1000', 'www.niyo.com', 'niyp@g.com', '7845962103', '458712', '2019-03-01 15:03:53'),
(66, ' Noticeboard', '1064ab', '1064', '2018-11-20', '584796', 1, '1000', 'www.notice.com', 'notice@g.com', '7845962103', '458712', '2019-03-01 15:04:24'),
(67, 'Numberz', '1065ab', '1065', '2018-12-20', '584796', 1, '1000', 'www.numberz.com', 'numberz@g.com', '7845962103', '458712', '2019-03-01 15:04:58'),
(68, ' OncoStem Diagnostics', '1066ab', '1066', '2018-06-04', '584796', 1, '1000', 'www.onco.com', 'onco@g.com', '7845962103', '458712', '2019-03-01 15:06:10'),
(69, ' OpenOut', '1067ab', '1067', '2018-11-14', '584796', 1, '1000', 'www.openout.com', 'openout@gmail.com', '7845962103', '458712', '2019-03-01 15:06:43'),
(70, 'Play Shifu', '1068ab', '1068', '2018-12-11', '584796', 1, '1000', 'www.play.com', 'play@k.com', '7845962103', '458712', '2019-03-01 15:07:16'),
(71, ' Propstory', '1069ab', '1069', '2018-10-31', '584796', 1, '1000', 'www.prop.com', 'prop@g.com', '7845962103', '458712', '2019-03-01 15:07:46'),
(72, 'Qbera', '1070ab', '1070', '2019-02-24', '584796', 1, '1000', 'www.qbera.com', 'qbera@g.com', '7845962103', '458712', '2019-03-01 15:08:17'),
(73, 'RenewBuy', '1071ab', '1071', '2019-02-25', '584796', 1, '1000', 'www.renew.com', 'renew@g.com', '7845962103', '458712', '2019-03-01 15:08:50'),
(74, 'Rentickle', '1072ab', '1072', '2018-11-14', '584796', 1, '1000', 'www.rentickle.com', 'renticle@g.com', '7845962103', '458712', '2019-03-01 15:09:22'),
(75, 'Sendd', '1073ab', '1073', '2019-02-24', '584796', 1, '1000', 'www.sendd.com', 'sendd@g.com', '7845962103', '458712', '2019-03-01 15:09:50'),
(76, ' Sensibol Audio Technologies Pvt. Ltd.', '1074ab', '1074', '2018-11-14', '584796', 1, '1000', 'www.audio.com', 'audio@g.com', '7845962103', '458712', '2019-03-01 15:10:19'),
(77, 'Sequretek', '1075ab', '1075', '2018-12-04', '584796', 1, '1000', 'www.sequetek.com', 'seque@g.com', '7845962103', '458712', '2019-03-01 15:11:01'),
(78, ' SigTuple', '1076ab', '1076', '2018-12-04', '584796', 1, '1000', 'www.sig.com', 'sig@g.com', '7845962103', '458712', '2019-03-01 15:11:39'),
(79, ' SlicePay', '1077ab', '1077', '2019-02-25', '584796', 1, '1000', 'www.slicepay.com', 'slice@g.com', '7845962103', '458712', '2019-03-01 15:12:10'),
(80, 'Smaaash Entertainment Pvt. Ltd.', '1078ab', '1078', '2019-02-24', '584796', 1, '1000', 'www.smaash.com', 'smaash@g.com', '7845962103', '458712', '2019-03-01 15:12:38'),
(81, 'Stanza Living', '1079ab', '1079', '2019-01-15', '584796', 1, '1000', 'www.stanza.com', 'stanza@g.com', '7845962103', '458712', '2019-03-01 15:13:10'),
(82, 'StoreKing', '1080ab', '1080', '2019-01-16', '584796', 1, '1000', 'www.store.com', 'store@g.com', '7845962103', '458712', '2019-03-01 15:13:43'),
(83, 'StyleCracker', '1081ab', '1081', '2018-12-11', '584796', 1, '1000', 'www.style.com', 'style@g.com', '7845962103', '458712', '2019-03-01 15:14:12'),
(84, 'Sumeru', '1082ab', '1082', '2018-12-18', '584796', 1, '1000', 'www.sumeru.com', 'sumeru@g.com', '7845962103', '458712', '2019-03-01 15:14:44'),
(85, 'ten3T', '1083ab', '1083', '2018-12-11', '584796', 1, '1000', 'www.ten.com', 'ten@g.com', '7845962103', '458712', '2019-03-01 15:15:29'),
(86, 'Terribly Tiny Tales', '1084ab', '1084', '2018-12-11', '584796', 1, '1000', 'www.tinytales.com', 'tinytales@g.com', '7845962103', '458712', '2019-03-01 15:16:06'),
(87, 'TAOautomation', '1085ab', '1085', '2018-11-07', '584796', 1, '1000', 'www.taot.com', 'taot@g.com', '7845962103', '458712', '2019-03-01 15:18:11'),
(88, 'practo', '1090ab', '1090', '2019-02-24', '584796', 0, '1000', 'www.practo.com', 'practo@g.com', '7845962103', '458712', '2019-03-02 09:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `startup_tech`
--

CREATE TABLE `startup_tech` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique indentification of startup',
  `tech_id` int(11) NOT NULL COMMENT 'unique identification of technology'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table list the technologies a particular startup is working on.';

-- --------------------------------------------------------

--
-- Table structure for table `startup_verticals`
--

CREATE TABLE `startup_verticals` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `vertical_id` int(11) NOT NULL COMMENT 'unique identification of verticals'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table list the verticals a particular startup is working on.';

--
-- Dumping data for table `startup_verticals`
--

INSERT INTO `startup_verticals` (`startup_id`, `vertical_id`) VALUES
('startup1234', 1),
('startup_0221e174296', 2),
('startup_0221e174296', 3),
('startup_0221e174296', 4),
('startup_0221e174296', 5),
('startup_0221e174296', 7),
('startup_0221e174296', 8),
('startup_5377381aa1e', 6);

-- --------------------------------------------------------

--
-- Table structure for table `startup_vision`
--

CREATE TABLE `startup_vision` (
  `startup_id` varchar(20) NOT NULL COMMENT 'unique identification of startup',
  `vision` text COMMENT 'path of vision file',
  `short_desc` text COMMENT 'short description text',
  `no_of_emp` int(11) DEFAULT NULL COMMENT 'number of employes '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the details of vision and short description about the startup.  Short description will be text and vision will be stored in a file whose path will be stored in the database.';

--
-- Dumping data for table `startup_vision`
--

INSERT INTO `startup_vision` (`startup_id`, `vision`, `short_desc`, `no_of_emp`) VALUES
('startup1234', 'You know when you forward a filmy meme most of the time Filmygyan is mostly behind them. They are one innovative set of people making our lives masaledaar!', 'You know when you forward a filmy meme most of the time Filmygyan is mostly behind them. They are one innovative set of people making our lives masaledaar!', 10),
('startup_0221e174296', 'You know when you forward a filmy meme most of the time Filmygyan is mostly behind them. They are one innovative set of people making our lives masaledaar!', 'You know when you forward a filmy meme most of the time Filmygyan is mostly behind them. They are one innovative set of people making our lives masaledaar! Bollywood Review, movie review, entertainment.', 100),
('startup_049027ac21d', 'Providing solutions in Banking, Software and many more. Sumeru is your go to organisation for IT solutions with a human touch.\n\n', 'Providing solutions in Banking, Software and many more. Sumeru is your go to organisation for IT solutions with a human touch.\n\n', 100),
('startup_07b7f23419d', 'Mobiefit motivates you to get fitter, healthier and a happier person with workouts, running and walking training. It enables its users to access training videos and exercises for a \'fitter you\'!', 'Mobiefit motivates you to get fitter, healthier and a happier person with workouts, running and walking training. It enables its users to access training videos and exercises for a \'fitter you\'!', 100),
('startup_08971b04e3a', 'A fun-filled space with high - class technological games to entertain youngsters and adults equally!', 'A fun-filled space with high - class technological games to entertain youngsters and adults equally!', 100),
('startup_128f4e34887', 'Hipcask is a smartphone application that enables users to discover wines, whiskies, and beers. The application enables users to measure a likability factor, pair wines with foods, get and add tasting notes, get notifications about new launches, and more.', 'Hipcask is a smartphone application that enables users to discover wines, whiskies, and beers. The application enables users to measure a likability factor, pair wines with foods, get and add tasting notes, get notifications about new launches, and more. Sommelier, Food critic', 100),
('startup_129b01b099e', 'ftcash is one of IndiaÍs fast-growing financial technology venture, recognized by Forbes, which aims to empower micro-merchants and small businesses with the power of credit using digital payments, using only a bank account and a feature phone', 'ftcash is one of IndiaÍs fast-growing financial technology venture, recognized by Forbes, which aims to empower micro-merchants and small businesses with the power of credit using digital payments, using only a bank account and a feature phone', 100),
('startup_1c057cbeac3', 'Known as Indian\'s most trusted pharmacy Netmeds.com is a renowned name in the medical field. It enables the user to send or receive medicine from any part of India.', 'Known as Indian\'s most trusted pharmacy Netmeds.com is a renowned name in the medical field. It enables the user to send or receive medicine from any part of India. Medical', 201),
('startup_1e2a7dc8110', 'OncoStem Diagnostics was founded in 2011 with the vision of developing innovative multimarker prognostic & predictive tests to enable personalized treatment planning for patients with Cancer.', 'OncoStem Diagnostics was founded in 2011 with the vision of developing innovative multimarker prognostic & predictive tests to enable personalized treatment planning for patients with Cancer.', 100),
('startup_258b66dcf51', 'Seeing that Artificial Intelligence is the future, Boxx.ai uses the same technology to solve problems that enterprises face in a more affordable way, making it more accessible for all. With all this securing a place amongst the top startups in India', 'Seeing that Artificial Intelligence is the future, Boxx.ai uses the same technology to solve problems that enterprises face in a more affordable way, making it more accessible for all. With all this securing a place amongst the top startups in India', 100),
('startup_2f4aa8e859b', 'HexOctane is an Internet of Things company intending toæcreate an environment which fosters ease of access to relevant information just when you need it and thus bring to life an informed sixth sense that manifests itself through one\'s smartphone.', 'HexOctane is an Internet of Things company intending toæcreate an environment which fosters ease of access to relevant information just when you need it and thus bring to life an informed sixth sense that manifests itself through one\'s smartphone.', 100),
('startup_30cf33991de', 'Making finger - licking homely food, Fingerlix aims on being \'the food\' for travelling professionals and fill stomachs of people with tasty food.', 'Making finger - licking homely food, Fingerlix aims on being \'the food\' for travelling professionals and fill stomachs of people with tasty food.', 100),
('startup_35e0b47ed5f', 'With a sole aim of connecting empty stomachs with empty tables by giving discounts on meals in the restaurants registered with them. Eatigo has successfully has partnered with more than a million diners. Way to go!', 'With a sole aim of connecting empty stomachs with empty tables by giving discounts on meals in the restaurants registered with them. Eatigo has successfully has partnered with more than a million diners. Way to go!', 100),
('startup_3ae62eea4d3', 'Noticeboard is focused on leveraging the power of the mobile phone to make information more accessible, and will be looking for top talent that understands the nuances of the small screen deeply. It aims making organisational communication more inclusive.', 'Noticeboard is focused on leveraging the power of the mobile phone to make information more accessible, and will be looking for top talent that understands the nuances of the small screen deeply. It aims making organisational communication more inclusive.', 100),
('startup_3b9515728be', 'Koinex is India\'s most advanced digital assets exchange. Buy, sell and trade in the world\'s fastest growing assets: cryprocurrencies and tokens.', 'Koinex is India\'s most advanced digital assets exchange. Buy, sell and trade in the world\'s fastest growing assets: cryprocurrencies and tokens.', 100),
('startup_3bcb7c56f87', 'Innov8 is an ambitious project to house 100 entrepreneurs & help them build their vision & create impactful startups from the National Soil\n\n', 'Innov8 is an ambitious project to house 100 entrepreneurs & help them build their vision & create impactful startups from the National Soil\n\n', 100),
('startup_3d04d4656c3', 'Want to meet your doctor but are too sick to get out of bed? Doctor Insta is at your service. Video Call or chat with a doctor to get an advice on your health!', 'Want to meet your doctor but are too sick to get out of bed? Doctor Insta is at your service. Video Call or chat with a doctor to get an advice on your health!', 100),
('startup_3eeca45bc90', 'Finding a right insurance is like finding a right partner for yourself. AskArvi has done a great job in automating this system letting people find a perfect plan from their phones itself! This idea definitely makes them one of the best startups in India', 'Finding a right insurance is like finding a right partner for yourself. AskArvi has done a great job in automating this system letting people find a perfect plan from their phones itself! This idea definitely makes them one of the best startups in India', 100),
('startup_3fe1ea0b539', 'A startups biggest challenge is to train its employees. HandyTrain trains them for you from your employees phones! Simple and smart right?', 'A startups biggest challenge is to train its employees. HandyTrain trains them for you from your employees phones! Simple and smart right?', 100),
('startup_437d869e0b3', 'GoCoop.com is a internet-based global platform which provides value-added business services for co-ops and self-help groups to enable communication and collaboration with their members, marketing their products and services and leverage information technology to improve their operations.', 'GoCoop.com is a internet-based global platform which provides value-added business services for co-ops and self-help groups to enable communication and collaboration with their members, marketing their products and services and leverage information technology to improve their operations.', 100),
('startup_4b23e056fd9', 'iNurture Education Solutions Pvt. Ltd. delivers industry relevant courses at undergraduate and postgraduate levels in the fast growing sectors of the economy, in active association with well-reputed universities and autonomous institutions/ colleges.', 'iNurture Education Solutions Pvt. Ltd. delivers industry relevant courses at undergraduate and postgraduate levels in the fast growing sectors of the economy, in active association with well-reputed universities and autonomous institutions/ colleges.', 100),
('startup_501347dae2a', 'OpenOut is a trusted community of people, hosts and guests, where you can create, explore or become a part of unique at-home social experiences.', 'OpenOut is a trusted community of people, hosts and guests, where you can create, explore or become a part of unique at-home social experiences.', 100),
('startup_514b7e9f6e6', 'Gaming turning into money-making! Yes, you read it right.HalaPlay can let you live in the fantasy world and win cash prizes at the end of every game making it among the best startups in India.', 'Gaming turning into money-making! Yes, you read it right.HalaPlay can let you live in the fantasy world and win cash prizes at the end of every game making it among the best startups in India.', 100),
('startup_5349d6c5e0c', 'Sequretek intends to secure and manage the customers information assets so that they are better equipped to handle the changing digital landscape and service needs that lead to their organizational growth. It aims on being its customers \'Trusted Advisor\' for their problems', 'Sequretek intends to secure and manage the customers information assets so that they are better equipped to handle the changing digital landscape and service needs that lead to their organizational growth. It aims on being its customers \'Trusted Advisor\' for their problems', 100),
('startup_5377381aa1e', 'Imagine knowing your money status with the help of your SMS-es, Money View shows your account details by accessing your bank messages and showing your balance!\n\n', 'Imagine knowing your money status with the help of your SMS-es, Money View shows your account details by accessing your bank messages and showing your balance!\n\n', 100),
('startup_54e691b2e0e', 'In the age of technology, Active.ai makes it possible giving a beautiful human touch to Conversational Banking Services. They have made it possible to make conversations less robotic and consumer oriented making the doubt solving process more simpler!', 'In the age of technology, Active.ai makes it possible giving a beautiful human touch to Conversational Banking Services. They have made it possible to make conversations less robotic and consumer oriented making the doubt solving process more simpler!', 100),
('startup_565a20e6211', 'In the business city of Bangalore, CoWrks is a unique concept providing many working individuals to come and rent working spaces for themselves. Pssstt.. they have an amazing interior worth being listed as one of the top startups in India!', 'In the business city of Bangalore, CoWrks is a unique concept providing many working individuals to come and rent working spaces for themselves. Pssstt.. they have an amazing interior worth being listed as one of the top startups in India!', 100),
('startup_58ea6d8b492', 'Want your employees salaries increased without any change in your share? NiYo can give you a solution! Redefine Payroll & benefits and give your employees upto 10% Pay raise.', 'Want your employees salaries increased without any change in your share? NiYo can give you a solution! Redefine Payroll & benefits and give your employees upto 10% Pay raise.', 100),
('startup_626fc93dc6a', 'Imagine how fun it would be learning via games and stories? Chimple is doing the same! This Bangalore based organisation believes that education is for all is doing everything to achieve their goal.', 'Imagine how fun it would be learning via games and stories? Chimple is doing the same! This Bangalore based organisation believes that education is for all is doing everything to achieve their goal.', 100),
('startup_6ac1261a446', 'How great would it be if you could increase your work out speed and also track your progress? Kishore duo has made it possible my merging fitness with technology to make lives healthier for all and successfully made into the list of one of the best startups in India!', 'How great would it be if you could increase your work out speed and also track your progress? Kishore duo has made it possible my merging fitness with technology to make lives healthier for all and successfully made into the list of one of the best startups in India!', 100),
('startup_6dcc97cbf7bf', 'Bringing alive the classic poker on-screen, 9Stacks is a unique concept binding all the Poker lovers together under one roof to start the game with 9 stacks of poker chips!', 'Bringing alive the classic poker on-screen, 9Stacks is a unique concept binding all the Poker lovers together under one roof to start the game with 9 stacks of poker chips!', 100),
('startup_6eb76f323c3', 'Weaving magic with words, Terribly Tiny Tales is a forum for story enthusiasts and making a community of word lovers!', 'Weaving magic with words, Terribly Tiny Tales is a forum for story enthusiasts and making a community of word lovers!', 100),
('startup_7213abde43e', 'Being a God-sent application for Bangalore-ians and Pune-kars, Dunzo runs errands for its users. Be it repairing your sink or sending a parcel off, you can just Dunzo-it! Waiting for it for available nationwide! But whatever it is, they surely deserve to be one of the best startups in India\n\n', 'Being a God-sent application for Bangalore-ians and Pune-kars, Dunzo runs errands for its users. Be it repairing your sink or sending a parcel off, you can just Dunzo-it! Waiting for it for available nationwide! But whatever it is, they surely deserve to be one of the best startups in India\n\n', 100),
('startup_75f2cebe20e', 'CallHealth is a technology-powered healthcare company that brings healthcare services to the doorstep of the customer. Definitely worth being as one of the best startups in India.', 'CallHealth is a technology-powered healthcare company that brings healthcare services to the doorstep of the customer. Definitely worth being as one of the best startups in India.', 100),
('startup_795e8d2f1bd', 'Seeing Fashion online, Fynd is dedicated to make its users chic and sexy!', 'Seeing Fashion online, Fynd is dedicated to make its users chic and sexy!', 100),
('startup_7d25b37d798', 'With clients like Ola, PayTM, MobiKwick, ClearTrip and many more, Hansel.io is a trusted name in deep-config APIs. Delivering what they promise, Hansel.io is an expert in providing personalized experience for all its client base!', 'With clients like Ola, PayTM, MobiKwick, ClearTrip and many more, Hansel.io is a trusted name in deep-config APIs. Delivering what they promise, Hansel.io is an expert in providing personalized experience for all its client base!', 100),
('startup_7e7e947b210', 'Building a home has never been easier, thanks to Homergize! Homergize is a One-Stop Shop for purchasing Materials & Products ranging from Building Materials to Fittings to Furnishings.', 'Building a home has never been easier, thanks to Homergize! Homergize is a One-Stop Shop for purchasing Materials & Products ranging from Building Materials to Fittings to Furnishings.', 100),
('startup_80e57982848', 'Targeting India\'s most favorite food Biryani, this company has reached in the veins of maximum people. Biryani by Kilo does what the name suggests, sends happiness parceled and is perfect for any occasion. Guess what? It a rating of 4.0 on Zomato. Yummy idea!', 'Targeting India\'s most favorite food Biryani, this company has reached in the veins of maximum people. Biryani by Kilo does what the name suggests, sends happiness parceled and is perfect for any occasion. Guess what? It a rating of 4.0 on Zomato. Yummy idea!', 100),
('startup_84dee75e130', 'Made for Indian men, Mr Button was an idea to make Indian men fashionable and presentable!', 'Made for Indian men, Mr Button was an idea to make Indian men fashionable and presentable!', 100),
('startup_8559eb7766c', 'Love travelling? GoFro should be your best friend! Started to empower the modern traveler with flexibility of choices and a fulfilling sense of independence, GoFro is doing a splendid job!', 'Love travelling? GoFro should be your best friend! Started to empower the modern traveler with flexibility of choices and a fulfilling sense of independence, GoFro is doing a splendid job!', 100),
('startup_88d64d63101', 'Graphic India is nations very well known animation creator. Want to see their recent work? Watch ñBaahubali: The Lost Legendsî on Amazon Prime and get amazed and you\'ll know why they are among the best startups in India.', 'Graphic India is nations very well known animation creator. Want to see their recent work? Watch ñBaahubali: The Lost Legendsî on Amazon Prime and get amazed and you\'ll know why they are among the best startups in India.', 100),
('startup_88e4ee56611', 'Manage your cash flows with this useful app, Numberz!, Wallet, Banking', 'Manage your cash flows with this useful app, Numberz!, Wallet, Banking', 100),
('startup_8a7cc648a7f', 'What if we tell you that you can monitor your body\'s clinical vitals from a device? Startup ten3T made this possible. Their invention of a wearable monitoring device for your dear body which can help you make healthier decisions!', 'What if we tell you that you can monitor your body\'s clinical vitals from a device? Startup ten3T made this possible. Their invention of a wearable monitoring device for your dear body which can help you make healthier decisions!', 100),
('startup_8e5018e725e', 'Providing end - to - end logistics in an \'express\' way Ecom Express has established itself as one of the trusted and reliable names in delivery services to e-commerce industry and also one of the best startups in India', 'Providing end - to - end logistics in an \'express\' way Ecom Express has established itself as one of the trusted and reliable names in delivery services to e-commerce industry and also one of the best startups in India', 100),
('startup_8e6bb85c120', 'Future Educators like AEON Learning are blessing for working professionals. With the help of technology, they provide degrees in various management courses from prestigious universities. Giving e-learning a new look!', 'Future Educators like AEON Learning are blessing for working professionals. With the help of technology, they provide degrees in various management courses from prestigious universities. Giving e-learning a new look!', 100),
('startup_8e99c7d48a7', 'Have a luxury travel with icanstay and enjoy traveling first - class! Providing first class travel making them reach the destination of one of the best startup in India', 'Have a luxury travel with icanstay and enjoy traveling first - class! Providing first class travel making them reach the destination of one of the best startup in India', 100),
('startup_8ed3e2b3e68', 'Clip - an Android application makes it a breeze to create, watch and download funny Indian videos. With 1,000,000+ users it is one app you should have!', 'Clip - an Android application makes it a breeze to create, watch and download funny Indian videos. With 1,000,000+ users it is one app you should have!', 100),
('startup_905ba8f9dfb', 'Aiding global e-commerce and retail services for their monetary transactions, airpay aims in simplifying the process of transaction much more smoother and flexible.', 'Aiding global e-commerce and retail services for their monetary transactions, airpay aims in simplifying the process of transaction much more smoother and flexible.', 100),
('startup_9099f229c0a', 'SigTuple aim to create a data driven, machine learned, cloud based solution for detection of anomalies and trends in medical data, which improves the accuracy and efficiency of disease diagnosis.', 'SigTuple aim to create a data driven, machine learned, cloud based solution for detection of anomalies and trends in medical data, which improves the accuracy and efficiency of disease diagnosis.', 100),
('startup_93b9136fc9d', 'Shifu creates an innovative and immersive learning experience during play time by bringing board games and mobile devices together through Augmented Reality. Because they believe, children deserve good screen time.', 'Shifu creates an innovative and immersive learning experience during play time by bringing board games and mobile devices together through Augmented Reality. Because they believe, children deserve good screen time.', 100),
('startup_9857eb86264', 'Little Black Book complies the best spots/eateries of your cities which you might never have discovered! Started with Delhi, this Little Black Book is worth the read!', 'Little Black Book complies the best spots/eateries of your cities which you might never have discovered! Started with Delhi, this Little Black Book is worth the read!', 100),
('startup_98b25c82dfc', 'One of the pioneers of comedy in India, EIC has surely left a mark on people\'s minds and makes everyone laugh very hard with their sarcastic takes on real-time situations. Very \'SAARAAS\' job guys! Haaste haasate you finally got on the list of Top Startups in India', 'One of the pioneers of comedy in India, EIC has surely left a mark on people\'s minds and makes everyone laugh very hard with their sarcastic takes on real-time situations. Very \'SAARAAS\' job guys! Haaste haasate you finally got on the list of Top Startups in India', 100),
('startup_9a4c9975a12', 'Do you have a vehicle lying just at a disposal? Turn it into an earning member with Drivezy and thank me later for including them among the top startups in India!', 'Do you have a vehicle lying just at a disposal? Turn it into an earning member with Drivezy and thank me later for including them among the top startups in India!', 100),
('startup_9d66062929b', 'With 1,20,000+ subscribers, Flintobox has aims on holistic education of children. Delivering happiness in a box, Flintobox curates a new theme every month and helps in the growth of the child. If you are a parent, this is worth a try!', 'With 1,20,000+ subscribers, Flintobox has aims on holistic education of children. Delivering happiness in a box, Flintobox curates a new theme every month and helps in the growth of the child. If you are a parent, this is worth a try!', 100),
('startup_a5b7068f910', 'Giving Best Price commitment, Sendd will give you complete shipping solution\nfor your Business from pick to drop at any pincode in India.', 'Giving Best Price commitment, Sendd will give you complete shipping solution\nfor your Business from pick to drop at any pincode in India.', 100),
('startup_aab4679508c', 'SlicePay is a digital payment platform which was founded with a mission to simplify payments for the young. With changing times, they strive to make payments smarter and simpler.', 'SlicePay is a digital payment platform which was founded with a mission to simplify payments for the young. With changing times, they strive to make payments smarter and simpler.', 100),
('startup_ae6a02c524d', 'We know how much of a limited pocket money does a student get and KrazyBee is a wonderful option for students to buy electronics on EMI', 'We know how much of a limited pocket money does a student get and KrazyBee is a wonderful option for students to buy electronics on EMI', 100),
('startup_af2263cee85', 'Being the bridge between investors and borrowers Credy is one of its kind and totally one of the best startups in India!', 'Being the bridge between investors and borrowers Credy is one of its kind and totally one of the best startups in India!', 100),
('startup_b081e59cc05', 'Have a car to be insured or want to insure the health of yourself or your family? Visit RenewBuy and do the needful in few minutes without any middleman in between!', 'Have a car to be insured or want to insure the health of yourself or your family? Visit RenewBuy and do the needful in few minutes without any middleman in between!', 100),
('startup_b2a9b391d75', 'Often companies do not have enough data to train a machine learning model on their own using state of the art algorithms as well as don\'t have enough data scientists to work on those problems. NanoNets solves both these problems for companies. NanoNets is machine learning API for developers which requires 1/10th of data and no machine learning expertise to train a model.', 'Often companies do not have enough data to train a machine learning model on their own using state of the art algorithms as well as don\'t have enough data scientists to work on those problems. NanoNets solves both these problems for companies. NanoNets is machine learning API for developers which requires 1/10th of data and no machine learning expertise to train a model.', 100),
('startup_b2c19bea700', 'It is home furniture, appliances and a lot of love that make a home - a house. Rentickle helps to rent furniture and home essentials with options of various brands to choose from.', 'It is home furniture, appliances and a lot of love that make a home - a house. Rentickle helps to rent furniture and home essentials with options of various brands to choose from.', 100),
('startup_b59a5b8ce10', 'Stories always hold a special place in one hearts. Using this concept, Josh Talks uses words to inspire everyone wanting to be motivated!', 'Stories always hold a special place in one hearts. Using this concept, Josh Talks uses words to inspire everyone wanting to be motivated!', 100),
('startup_b9590350041', 'Live in Delhi and own a car? Who would know better than you how difficult it is to find a parking spot! Get My Parking comes to your rescue. Use this app to find an available a spot in Delhi. Rest of the nation has to wait while Delhi-ites have all the perks of this app! If Delhi loves it, how can\'t this company be one of best startups in India.', 'Live in Delhi and own a car? Who would know better than you how difficult it is to find a parking spot! Get My Parking comes to your rescue. Use this app to find an available a spot in Delhi. Rest of the nation has to wait while Delhi-ites have all the perks of this app! If Delhi loves it, how can\'t this company be one of best startups in India.', 100),
('startup_ba43cb76899', 'ERA is India\'s first integrated identity platform which provides it\'s users a safe and secure way to share their Identities with the world.', 'ERA is India\'s first integrated identity platform which provides it\'s users a safe and secure way to share their Identities with the world.', 100),
('startup_ba8323c622b', 'Flochat is one of it\'s kind combining apps like Ola, Zomato and many more under one platform. Download this and enjoy the joy of surfing so many apps from one!', 'Flochat is one of it\'s kind combining apps like Ola, Zomato and many more under one platform. Download this and enjoy the joy of surfing so many apps from one!', 100),
('startup_cc81205365c', 'Funded by one of the Nation\'s stylist diva - Alia Bhatt, StyleCracker - IndiaÍs first online personal styling portal understands the importance of great style in day-to-day life.', 'Funded by one of the Nation\'s stylist diva - Alia Bhatt, StyleCracker - IndiaÍs first online personal styling portal understands the importance of great style in day-to-day life.', 100),
('startup_ccdee3e72f2', 'As the name suggests, this website wants to provide end - to - end health management to their consumers', 'As the name suggests, this website wants to provide end - to - end health management to their consumers', 100),
('startup_cd15bb7049b', 'This Delhi based startup is giving wings to upcoming startups in form of monetary help. The best part? They just give funding just in 3 days! Delhi-ites with an idea, are you listening?', 'This Delhi based startup is giving wings to upcoming startups in form of monetary help. The best part? They just give funding just in 3 days! Delhi-ites with an idea, are you listening?', 100),
('startup_cd96a563a60', 'Flock is a faster, more organized way for teams to communicate. Flock powers over 25,000 companies and its users around the world have reported increased productivity by 30%, 50% fewer emails, and a 50% reduction in in-person meetings.Their clients include Accenture, Tim Hortons, Whirlpool, VMware and Victorinox.', 'Flock is a faster, more organized way for teams to communicate. Flock powers over 25,000 companies and its users around the world have reported increased productivity by 30%, 50% fewer emails, and a 50% reduction in in-person meetings.Their clients include Accenture, Tim Hortons, Whirlpool, VMware and Victorinox.', 100),
('startup_cf892e16246', 'Fella Homes is a branded chain of rental homes. Being synonymous with hassle-free and quality living, they aim to standardize the entire experience of finding and living in a rented home with the use of technology enabled product and services.', 'Fella Homes is a branded chain of rental homes. Being synonymous with hassle-free and quality living, they aim to standardize the entire experience of finding and living in a rented home with the use of technology enabled product and services.', 100),
('startup_d138e6a27ec', 'Standing by its name, LetsTransport provides end-to-end logistic support with advantage of GPS tracking and advance booking only for you!', 'Standing by its name, LetsTransport provides end-to-end logistic support with advantage of GPS tracking and advance booking only for you!', 100),
('startup_d230c1ec050', 'An EdTech start up, Avishkaar Box stands by its name. They create mind stimulating products enabling young students to spark up their minds and double their imagination. Their invention Robby and Robby 2 are mind boggling!', 'An EdTech start up, Avishkaar Box stands by its name. They create mind stimulating products enabling young students to spark up their minds and double their imagination. Their invention Robby and Robby 2 are mind boggling!', 100),
('startup_d449f779505', 'Stanza is a unique housing concept created for students moving to a new place and wanting to create a space for themselves.', 'Stanza is a unique housing concept created for students moving to a new place and wanting to create a space for themselves.', 100),
('startup_d775ae66135', 'As your end-to-end automation solutions partner, TAOautomation will work with you to develop your automation strategy, be it basic RPA or more advanced cognitive and machine learning solutions, to implement it swiftly and closely manage the entire change programme.', 'As your end-to-end automation solutions partner, TAOautomation will work with you to develop your automation strategy, be it basic RPA or more advanced cognitive and machine learning solutions, to implement it swiftly and closely manage the entire change programme.', 100),
('startup_db108287d8c', 'Catering to on-demand entertainment, ALTBalaji is doing a splendid job! From its gripping original series to the wide range of shows and movies, ALTBalaji is really worth of your attention and a tough competition for many and deserves a place as one of the Top Startups in India.', 'Catering to on-demand entertainment, ALTBalaji is doing a splendid job! From its gripping original series to the wide range of shows and movies, ALTBalaji is really worth of your attention and a tough competition for many and deserves a place as one of the Top Startups in India.', 100),
('startup_e21987a5713', 'Storeking is a revolutionary platform enabling small town Retailers to sell over 50,000 products to walk-in customers without having to invest in working capital stock.', 'Storeking is a revolutionary platform enabling small town Retailers to sell over 50,000 products to walk-in customers without having to invest in working capital stock.', 100),
('startup_ec4d8c5e4dc', 'Empowering kirana-wala\'s to multi-nationals m.Paani helps in Sales Conversion to Brand Loyalty Services for its consumers right from their mobiles!', 'Empowering kirana-wala\'s to multi-nationals m.Paani helps in Sales Conversion to Brand Loyalty Services for its consumers right from their mobiles!', 100),
('startup_ed65481df1f', 'Meesho is India\'s Largest Online Reseller Network of Housewives & SMBs, who sell products within their network on social channels.', 'Meesho is India\'s Largest Online Reseller Network of Housewives & SMBs, who sell products within their network on social channels.', 100),
('startup_eeac0eb99d6', 'GamingMonk is a heaven for gamers, from organizes offline gaming tournaments for sports, strategy, and action e-games to be played on Xbox, personal computer, mobile, and PlayStation 4. It also retails gaming accessories, consoles, and software. Users can form their own communities and get lost in the fantasy world of their own.', 'GamingMonk is a heaven for gamers, from organizes offline gaming tournaments for sports, strategy, and action e-games to be played on Xbox, personal computer, mobile, and PlayStation 4. It also retails gaming accessories, consoles, and software. Users can form their own communities and get lost in the fantasy world of their own.', 100),
('startup_efb616698b9', 'SensiBol was founded by like-minded audio-technology researchers and computer-scientists with a mission to deliver cutting-edge audio-processing solutions to the world.', 'SensiBol was founded by like-minded audio-technology researchers and computer-scientists with a mission to deliver cutting-edge audio-processing solutions to the world.', 100),
('startup_f2e9ae74054', 'People dread shifting due to the hassle of taking the belongings from one place to another. That is when Blowhorn thought to help them and made their place in one of the Top Startups in India. Blowhorn offers a better and a safe option for people looking to move their belongings from one place to another!', 'People dread shifting due to the hassle of taking the belongings from one place to another. That is when Blowhorn thought to help them and made their place in one of the Top Startups in India. Blowhorn offers a better and a safe option for people looking to move their belongings from one place to another!', 100),
('startup_f82fa6e6ecb', 'An amazing startup portal giving users loans in easy ways!', 'An amazing startup portal giving users loans in easy ways!', 100),
('startup_faf60db1c6f', 'Gone are the days when owning a farm was a huge investment! Gold Farm lets you rent farming equipment and make lives simpler for all! What makes life good surely is among the best startups in India.', 'Gone are the days when owning a farm was a huge investment! Gold Farm lets you rent farming equipment and make lives simpler for all! What makes life good surely is among the best startups in India.', 100),
('startup_fb1bebdd5d6', 'PropStory is a content platform for the real estate industry. The organization has been floated by professionals with several years of experience in Real Estate investing, private banking, and internet technology.', 'PropStory is a content platform for the real estate industry. The organization has been floated by professionals with several years of experience in Real Estate investing, private banking, and internet technology.', 100);

-- --------------------------------------------------------

--
-- Table structure for table `status_outsource`
--

CREATE TABLE `status_outsource` (
  `outsource_id` int(11) NOT NULL,
  `startup_id` varchar(50) NOT NULL,
  `status_desc` varchar(50) DEFAULT NULL,
  `outsource_duration` varchar(50) DEFAULT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_outsource`
--

INSERT INTO `status_outsource` (`outsource_id`, `startup_id`, `status_desc`, `outsource_duration`, `count`) VALUES
(10, 'startup1234', 'started', '6 months', 2);

-- --------------------------------------------------------

--
-- Table structure for table `technology`
--

CREATE TABLE `technology` (
  `tech_id` int(11) NOT NULL COMMENT 'unique identification of technology',
  `tech_name` varchar(100) DEFAULT NULL COMMENT 'technology name',
  `tech_logo` text COMMENT 'path of the logo representiong technology'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains the list of various technologies. These technologies will be like big data, cloud computiong, AI etc.';

-- --------------------------------------------------------

--
-- Table structure for table `track_outsourcing`
--

CREATE TABLE `track_outsourcing` (
  `outsource_id` int(11) NOT NULL,
  `startup_id` varchar(50) NOT NULL,
  `corp_id` varchar(50) DEFAULT NULL,
  `outsource_desc` varchar(50) NOT NULL,
  `outsource_duration` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_outsourcing`
--

INSERT INTO `track_outsourcing` (`outsource_id`, `startup_id`, `corp_id`, `outsource_desc`, `outsource_duration`) VALUES
(10, 'startup1234', 'corp1234', 'payment', 'portal'),
(15, 'startup_3d04d4656c3', 'corp_04595b18fd5', 'doc', '6 month'),
(16, 'startup_3d04d4656c3', 'corp_04595b18fd5', 'medical pres', '4 months'),
(17, 'startup1234', 'corp_06c317f8a9e', 'sun', '11');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_attempts`
--

CREATE TABLE `user_login_attempts` (
  `id` varchar(40) NOT NULL,
  `time` datetime NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login_attempts`
--

INSERT INTO `user_login_attempts` (`id`, `time`, `password`, `status`, `ip`) VALUES
('corp1234', '2019-02-26 01:46:51', NULL, 'success', '::1'),
('corp1234', '2019-02-26 01:49:38', NULL, 'success', '::1'),
('corp1234', '2019-02-26 01:49:55', NULL, 'success', '::1'),
('corp1234', '2019-02-26 01:50:14', NULL, 'success', '::1'),
('corp1234', '2019-02-26 01:54:50', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:00:36', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:01:35', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:01:51', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:02:12', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:02:47', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:03:06', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:05:43', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:06:04', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:06:54', NULL, 'success', '::1'),
('startup1234', '2019-02-26 02:18:25', NULL, 'success', '::1'),
('startup1234', '2019-02-26 02:18:42', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:18:51', NULL, 'success', '::1'),
('startup1234', '2019-02-26 02:18:59', NULL, 'success', '::1'),
('startup1234', '2019-02-26 02:31:20', NULL, 'success', '::1'),
('startup1234', '2019-02-26 02:35:53', NULL, 'success', '::1'),
('startup1234', '2019-02-26 02:36:03', NULL, 'success', '::1'),
('startup1234', '2019-02-26 02:50:33', NULL, 'success', '::1'),
('startup1234', '2019-02-26 02:51:26', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:53:56', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:54:36', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:57:11', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:57:23', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:58:52', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:59:04', NULL, 'success', '::1'),
('corp1234', '2019-02-26 02:59:12', NULL, 'success', '::1'),
('startup1234', '2019-02-26 03:03:31', NULL, 'success', '::1'),
('startup1234', '2019-02-26 03:18:08', NULL, 'success', '::1'),
('corp1234', '2019-02-26 03:29:09', NULL, 'success', '::1'),
('startup1234', '2019-02-26 03:32:43', NULL, 'success', '::1'),
('corp1234', '2019-02-26 03:38:56', NULL, 'success', '::1'),
('startup1234', '2019-02-26 05:12:32', NULL, 'success', '::1'),
('startup1234', '2019-02-26 11:14:30', NULL, 'success', '::1'),
('startup1234', '2019-02-26 11:48:17', NULL, 'success', '::1'),
('gov1234', '2019-02-26 14:21:19', NULL, 'success', '::1'),
('gov1234', '2019-02-26 14:22:53', NULL, 'success', '::1'),
('gov1234', '2019-02-26 14:29:10', NULL, 'success', '::1'),
('startup1234', '2019-02-26 16:40:10', NULL, 'success', '::1'),
('gov1234', '2019-02-26 16:42:06', NULL, 'success', '::1'),
('gov1234', '2019-02-26 16:43:23', NULL, 'success', '::1'),
('gov1234', '2019-02-26 19:43:44', NULL, 'success', '::1'),
('gov1234', '2019-02-26 19:59:56', NULL, 'success', '::1'),
('startup1234', '2019-02-26 23:23:49', NULL, 'success', '::1'),
('gov1234', '2019-02-27 00:17:22', NULL, 'success', '::1'),
('gov1234', '2019-02-27 11:27:38', NULL, 'success', '::1'),
('gov1234', '2019-02-27 20:23:43', NULL, 'success', '::1'),
('startup1234', '2019-02-27 20:53:54', NULL, 'success', '::1'),
('gov1234', '2019-03-01 18:43:39', NULL, 'success', '127.0.0.1'),
('startup1234', '2019-03-01 18:47:59', NULL, 'success', '127.0.0.1'),
('startup_6dcc97cbf7bf', '2019-03-01 18:51:05', NULL, 'success', '127.0.0.1'),
('gov1234', '2019-03-01 20:53:40', NULL, 'success', '127.0.0.1'),
('gov1234', '2019-03-02 09:51:46', NULL, 'success', '::1'),
('gov1234', '2019-03-02 14:57:01', NULL, 'success', '172.24.254.25'),
('startup1234', '2019-03-02 15:15:51', NULL, 'success', '172.24.254.25'),
('startup1234', '2019-03-02 16:00:11', NULL, 'success', '172.24.254.25'),
('corp1234', '2019-03-02 16:01:04', NULL, 'success', '172.24.254.25'),
('corp1234', '2019-03-02 14:24:50', NULL, 'success', '::1'),
('corp1234', '2019-03-02 14:25:55', NULL, 'success', '::1'),
('gov1234', '2019-03-02 14:28:16', NULL, 'success', '::1'),
('startup1234', '2019-03-02 18:48:48', NULL, 'success', '::1'),
('startup1234', '2019-03-02 18:51:16', NULL, 'success', '::1'),
('startup1234', '2019-03-02 21:06:43', NULL, 'success', '::1'),
('startup1234', '2019-03-02 21:12:32', NULL, 'success', '::1'),
('startup1234', '2019-03-02 21:16:54', NULL, 'success', '::1'),
('startup1234', '2019-03-02 22:17:16', NULL, 'success', '::1'),
('corp1234', '2019-03-02 23:54:48', NULL, 'success', '::1'),
('startup1234', '2019-03-03 01:47:00', NULL, 'success', '172.24.254.215'),
('startup1234', '2019-03-03 02:18:23', NULL, 'success', '172.24.254.215'),
('corp1234', '2019-03-03 02:23:40', NULL, 'success', '172.24.254.215'),
('startup1234', '2019-03-03 02:30:37', NULL, 'success', '172.24.254.215'),
('startup_5377381aa1e', '2019-03-03 02:49:25', NULL, 'success', '172.24.249.142'),
('startup1234', '2019-03-03 02:52:51', NULL, 'success', '172.24.254.25'),
('startup1234', '2019-03-03 02:57:26', NULL, 'success', '172.24.254.25'),
('startup_0221e174296', '2019-03-03 02:57:56', NULL, 'success', '172.24.254.25'),
('startup_049027ac21d', '2019-03-03 02:59:55', NULL, 'success', '172.24.254.25'),
('corp1234', '2019-03-03 03:08:34', NULL, 'success', '172.24.254.215'),
('startup1234', '2019-03-03 03:26:18', NULL, 'success', '172.24.254.215'),
('startup1234', '2019-03-03 03:26:51', NULL, 'success', '172.24.254.215'),
('startup1234', '2019-03-03 03:38:22', NULL, 'success', '172.24.254.215'),
('corp1234', '2019-03-03 04:25:49', NULL, 'success', '172.24.253.185'),
('startup_3d04d4656c3', '2019-03-03 04:35:06', NULL, 'success', '172.24.252.150'),
('corp_04595b18fd5', '2019-03-03 04:37:14', NULL, 'success', '172.24.254.215'),
('startup1234', '2019-03-03 04:38:40', NULL, 'success', '172.24.254.215'),
('corp1234', '2019-03-03 04:41:01', NULL, 'success', '172.24.254.215'),
('corp_04595b18fd5', '2019-03-03 04:41:42', NULL, 'success', '172.24.254.215'),
('startup_0221e174296', '2019-03-03 07:55:40', NULL, 'success', '172.24.249.142'),
('startup_0221e174296', '2019-03-03 07:57:52', NULL, 'success', '172.24.249.142'),
('corp_04595b18fd5', '2019-03-03 12:46:13', NULL, 'success', '172.24.254.215'),
('startup1234', '2019-03-03 12:47:25', NULL, 'success', '172.24.254.215'),
('corp_04595b18fd5', '2019-03-03 13:02:11', NULL, 'success', '172.24.254.215'),
('startup1234', '2019-03-03 13:18:15', NULL, 'success', '172.24.254.215'),
('corp1234', '2019-03-03 13:25:16', NULL, 'success', '172.24.250.5'),
('corp1234', '2019-03-03 13:25:32', NULL, 'success', '172.24.254.215'),
('corp1234', '2019-03-03 13:37:23', NULL, 'success', '172.24.254.215'),
('startup1234', '2019-03-03 13:39:43', NULL, 'success', '172.24.254.215'),
('startup_3d04d4656c3', '2019-03-03 13:41:18', NULL, 'success', '172.24.254.215'),
('corp_04595b18fd5', '2019-03-03 13:42:23', NULL, 'success', '172.24.254.215'),
('startup_3d04d4656c3', '2019-03-03 13:42:48', NULL, 'success', '172.24.254.215'),
('corp_06c317f8a9e', '2019-03-03 13:43:30', NULL, 'success', '172.24.254.215'),
('startup_3d04d4656c3', '2019-03-03 13:43:52', NULL, 'success', '172.24.254.215'),
('corp_04595b18fd5', '2019-03-03 13:45:07', NULL, 'success', '172.24.254.215'),
('startup_3d04d4656c3', '2019-03-03 13:46:04', NULL, 'success', '172.24.254.215'),
('corp_04595b18fd5', '2019-03-03 13:52:28', NULL, 'success', '172.24.254.215'),
('corp_06c317f8a9e', '2019-03-03 13:56:06', NULL, 'success', '172.24.254.215'),
('startup_3d04d4656c3', '2019-03-03 14:02:14', NULL, 'success', '172.24.254.215'),
('corp_06c317f8a9e', '2019-03-03 14:21:33', NULL, 'success', '172.24.254.215');

-- --------------------------------------------------------

--
-- Table structure for table `vertical`
--

CREATE TABLE `vertical` (
  `vertical_id` int(11) NOT NULL COMMENT 'unique identification of vertical',
  `vertical_name` varchar(200) DEFAULT NULL COMMENT 'name of vertical',
  `vertical_logo` text COMMENT 'path of the logo of vertical',
  `vertical_desc` text COMMENT 'short description of the vertical'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table lists all the verticles. Here verticals means domains like biotechnology, e-commerce, food delivery etc.';

--
-- Dumping data for table `vertical`
--

INSERT INTO `vertical` (`vertical_id`, `vertical_name`, `vertical_logo`, `vertical_desc`) VALUES
(1, 'FOOD', NULL, NULL),
(2, 'E-COMMERECE', NULL, NULL),
(3, 'BLOCK CHAIN', NULL, NULL),
(4, 'CATERING', NULL, NULL),
(5, 'ENTERTAINMENT', NULL, NULL),
(6, 'BANKING', NULL, NULL),
(7, 'WEDDIND PLANNERS', NULL, NULL),
(8, 'HEALTH', NULL, NULL),
(9, 'EDUCATION', NULL, NULL),
(10, 'NEWS', NULL, NULL),
(11, 'BEAUTY', NULL, NULL),
(12, 'FINESS', NULL, NULL),
(13, 'DIGITAL PAYMENT', NULL, NULL),
(14, 'TRANSPORTATION', NULL, NULL),
(15, 'HOUSING', NULL, NULL),
(16, 'GAMING', NULL, NULL),
(17, 'SOFTWARE DESIGNERS', NULL, NULL),
(18, 'MOVERS AND PACKERS', NULL, NULL),
(19, 'INTERIOR DECORATORS', NULL, NULL),
(20, 'TRIP PLANNERS', NULL, NULL),
(21, 'BUDGET PLANNERS', NULL, NULL),
(22, ' WASHING', NULL, NULL),
(23, 'MESSAGING', NULL, NULL),
(24, 'LEASING', NULL, NULL),
(25, 'NBFC', NULL, NULL),
(26, 'FACTORING', NULL, NULL),
(27, 'INVESTMENT', NULL, NULL),
(28, 'FURNITURES', NULL, NULL),
(29, 'CONSULTANCY', NULL, NULL),
(30, 'AUGMENTED REALITY', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `community_blobs`
--
ALTER TABLE `community_blobs`
  ADD PRIMARY KEY (`blobid`);

--
-- Indexes for table `community_cache`
--
ALTER TABLE `community_cache`
  ADD PRIMARY KEY (`type`,`cacheid`),
  ADD KEY `lastread` (`lastread`);

--
-- Indexes for table `community_categories`
--
ALTER TABLE `community_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Indexes for table `community_categorymetas`
--
ALTER TABLE `community_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Indexes for table `community_contentwords`
--
ALTER TABLE `community_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `community_cookies`
--
ALTER TABLE `community_cookies`
  ADD PRIMARY KEY (`cookieid`);

--
-- Indexes for table `community_iplimits`
--
ALTER TABLE `community_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Indexes for table `community_options`
--
ALTER TABLE `community_options`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `community_pages`
--
ALTER TABLE `community_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `community_postmetas`
--
ALTER TABLE `community_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Indexes for table `community_posts`
--
ALTER TABLE `community_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Indexes for table `community_posttags`
--
ALTER TABLE `community_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Indexes for table `community_sharedevents`
--
ALTER TABLE `community_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Indexes for table `community_tagmetas`
--
ALTER TABLE `community_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Indexes for table `community_tagwords`
--
ALTER TABLE `community_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `community_titlewords`
--
ALTER TABLE `community_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `community_userevents`
--
ALTER TABLE `community_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Indexes for table `community_userfavorites`
--
ALTER TABLE `community_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Indexes for table `community_userlevels`
--
ALTER TABLE `community_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Indexes for table `community_userlimits`
--
ALTER TABLE `community_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Indexes for table `community_usermetas`
--
ALTER TABLE `community_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Indexes for table `community_usernotices`
--
ALTER TABLE `community_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Indexes for table `community_userpoints`
--
ALTER TABLE `community_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `community_uservotes`
--
ALTER TABLE `community_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`),
  ADD KEY `voted` (`votecreated`,`voteupdated`);

--
-- Indexes for table `community_widgets`
--
ALTER TABLE `community_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Indexes for table `community_words`
--
ALTER TABLE `community_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- Indexes for table `corp_auth`
--
ALTER TABLE `corp_auth`
  ADD PRIMARY KEY (`corp_id`),
  ADD UNIQUE KEY `corp_id` (`corp_id`),
  ADD UNIQUE KEY `login_id` (`login_id`);

--
-- Indexes for table `corp_contact`
--
ALTER TABLE `corp_contact`
  ADD PRIMARY KEY (`corp_id`),
  ADD UNIQUE KEY `corp_id` (`corp_id`);

--
-- Indexes for table `corp_detail`
--
ALTER TABLE `corp_detail`
  ADD PRIMARY KEY (`corp_id`);

--
-- Indexes for table `corp_reg`
--
ALTER TABLE `corp_reg`
  ADD PRIMARY KEY (`reg_id`),
  ADD UNIQUE KEY `reg_id` (`reg_id`);

--
-- Indexes for table `corp_tech`
--
ALTER TABLE `corp_tech`
  ADD PRIMARY KEY (`corp_id`,`tech_id`),
  ADD KEY `FK_corp_tech_technology` (`tech_id`);

--
-- Indexes for table `corp_vertical`
--
ALTER TABLE `corp_vertical`
  ADD PRIMARY KEY (`corp_id`,`vertical_id`),
  ADD KEY `FK_corp_vertical_vertical` (`vertical_id`);

--
-- Indexes for table `corp_vision`
--
ALTER TABLE `corp_vision`
  ADD PRIMARY KEY (`corp_id`),
  ADD UNIQUE KEY `corp_id` (`corp_id`);

--
-- Indexes for table `feed_corp_startup`
--
ALTER TABLE `feed_corp_startup`
  ADD UNIQUE KEY `feed_id` (`feed_id`);

--
-- Indexes for table `gov_auth`
--
ALTER TABLE `gov_auth`
  ADD PRIMARY KEY (`gov_id`),
  ADD UNIQUE KEY `login_id` (`login_id`);

--
-- Indexes for table `ideapitch_blobs`
--
ALTER TABLE `ideapitch_blobs`
  ADD PRIMARY KEY (`blobid`);

--
-- Indexes for table `ideapitch_cache`
--
ALTER TABLE `ideapitch_cache`
  ADD PRIMARY KEY (`type`,`cacheid`),
  ADD KEY `lastread` (`lastread`);

--
-- Indexes for table `ideapitch_categories`
--
ALTER TABLE `ideapitch_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Indexes for table `ideapitch_categorymetas`
--
ALTER TABLE `ideapitch_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Indexes for table `ideapitch_contentwords`
--
ALTER TABLE `ideapitch_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `ideapitch_cookies`
--
ALTER TABLE `ideapitch_cookies`
  ADD PRIMARY KEY (`cookieid`);

--
-- Indexes for table `ideapitch_iplimits`
--
ALTER TABLE `ideapitch_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Indexes for table `ideapitch_options`
--
ALTER TABLE `ideapitch_options`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `ideapitch_pages`
--
ALTER TABLE `ideapitch_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `ideapitch_postmetas`
--
ALTER TABLE `ideapitch_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Indexes for table `ideapitch_posts`
--
ALTER TABLE `ideapitch_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Indexes for table `ideapitch_posttags`
--
ALTER TABLE `ideapitch_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Indexes for table `ideapitch_sharedevents`
--
ALTER TABLE `ideapitch_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Indexes for table `ideapitch_tagmetas`
--
ALTER TABLE `ideapitch_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Indexes for table `ideapitch_tagwords`
--
ALTER TABLE `ideapitch_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `ideapitch_titlewords`
--
ALTER TABLE `ideapitch_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `ideapitch_userevents`
--
ALTER TABLE `ideapitch_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Indexes for table `ideapitch_userfavorites`
--
ALTER TABLE `ideapitch_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Indexes for table `ideapitch_userlevels`
--
ALTER TABLE `ideapitch_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Indexes for table `ideapitch_userlimits`
--
ALTER TABLE `ideapitch_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Indexes for table `ideapitch_usermetas`
--
ALTER TABLE `ideapitch_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Indexes for table `ideapitch_usernotices`
--
ALTER TABLE `ideapitch_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Indexes for table `ideapitch_userpoints`
--
ALTER TABLE `ideapitch_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `ideapitch_uservotes`
--
ALTER TABLE `ideapitch_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`),
  ADD KEY `voted` (`votecreated`,`voteupdated`);

--
-- Indexes for table `ideapitch_widgets`
--
ALTER TABLE `ideapitch_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Indexes for table `ideapitch_words`
--
ALTER TABLE `ideapitch_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- Indexes for table `login_logout_log`
--
ALTER TABLE `login_logout_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `problem_list`
--
ALTER TABLE `problem_list`
  ADD PRIMARY KEY (`prob_id`);

--
-- Indexes for table `problem_tag`
--
ALTER TABLE `problem_tag`
  ADD PRIMARY KEY (`prob_id`,`vertical_id`);

--
-- Indexes for table `request_outsourcing`
--
ALTER TABLE `request_outsourcing`
  ADD PRIMARY KEY (`outsource_id`,`startup_id`);

--
-- Indexes for table `shoutout_blobs`
--
ALTER TABLE `shoutout_blobs`
  ADD PRIMARY KEY (`blobid`);

--
-- Indexes for table `shoutout_cache`
--
ALTER TABLE `shoutout_cache`
  ADD PRIMARY KEY (`type`,`cacheid`),
  ADD KEY `lastread` (`lastread`);

--
-- Indexes for table `shoutout_categories`
--
ALTER TABLE `shoutout_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Indexes for table `shoutout_categorymetas`
--
ALTER TABLE `shoutout_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Indexes for table `shoutout_contentwords`
--
ALTER TABLE `shoutout_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `shoutout_cookies`
--
ALTER TABLE `shoutout_cookies`
  ADD PRIMARY KEY (`cookieid`);

--
-- Indexes for table `shoutout_iplimits`
--
ALTER TABLE `shoutout_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Indexes for table `shoutout_options`
--
ALTER TABLE `shoutout_options`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `shoutout_pages`
--
ALTER TABLE `shoutout_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Indexes for table `shoutout_postmetas`
--
ALTER TABLE `shoutout_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Indexes for table `shoutout_posts`
--
ALTER TABLE `shoutout_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Indexes for table `shoutout_posttags`
--
ALTER TABLE `shoutout_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Indexes for table `shoutout_sharedevents`
--
ALTER TABLE `shoutout_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Indexes for table `shoutout_tagmetas`
--
ALTER TABLE `shoutout_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Indexes for table `shoutout_tagwords`
--
ALTER TABLE `shoutout_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `shoutout_titlewords`
--
ALTER TABLE `shoutout_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Indexes for table `shoutout_userevents`
--
ALTER TABLE `shoutout_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Indexes for table `shoutout_userfavorites`
--
ALTER TABLE `shoutout_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Indexes for table `shoutout_userlevels`
--
ALTER TABLE `shoutout_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Indexes for table `shoutout_userlimits`
--
ALTER TABLE `shoutout_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Indexes for table `shoutout_usermetas`
--
ALTER TABLE `shoutout_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Indexes for table `shoutout_usernotices`
--
ALTER TABLE `shoutout_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Indexes for table `shoutout_userpoints`
--
ALTER TABLE `shoutout_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Indexes for table `shoutout_uservotes`
--
ALTER TABLE `shoutout_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`),
  ADD KEY `voted` (`votecreated`,`voteupdated`);

--
-- Indexes for table `shoutout_widgets`
--
ALTER TABLE `shoutout_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Indexes for table `shoutout_words`
--
ALTER TABLE `shoutout_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- Indexes for table `startup_auth`
--
ALTER TABLE `startup_auth`
  ADD PRIMARY KEY (`startup_id`),
  ADD UNIQUE KEY `startup_id` (`startup_id`),
  ADD UNIQUE KEY `login_id` (`login_id`);

--
-- Indexes for table `startup_contact`
--
ALTER TABLE `startup_contact`
  ADD PRIMARY KEY (`startup_id`),
  ADD UNIQUE KEY `startup_id` (`startup_id`);

--
-- Indexes for table `startup_corp_partner`
--
ALTER TABLE `startup_corp_partner`
  ADD PRIMARY KEY (`startup_id`),
  ADD UNIQUE KEY `startup_id` (`startup_id`),
  ADD KEY `FK_startup_corp_partner_corp_auth` (`corp_id`);

--
-- Indexes for table `startup_reg`
--
ALTER TABLE `startup_reg`
  ADD PRIMARY KEY (`reg_id`),
  ADD UNIQUE KEY `reg_id` (`reg_id`);

--
-- Indexes for table `startup_tech`
--
ALTER TABLE `startup_tech`
  ADD PRIMARY KEY (`startup_id`,`tech_id`),
  ADD KEY `FK_startup_tech_technology` (`tech_id`);

--
-- Indexes for table `startup_verticals`
--
ALTER TABLE `startup_verticals`
  ADD PRIMARY KEY (`startup_id`,`vertical_id`),
  ADD KEY `FK_startup_verticals_vertical` (`vertical_id`);

--
-- Indexes for table `startup_vision`
--
ALTER TABLE `startup_vision`
  ADD PRIMARY KEY (`startup_id`),
  ADD UNIQUE KEY `startup_id` (`startup_id`);

--
-- Indexes for table `status_outsource`
--
ALTER TABLE `status_outsource`
  ADD PRIMARY KEY (`outsource_id`,`startup_id`);

--
-- Indexes for table `technology`
--
ALTER TABLE `technology`
  ADD PRIMARY KEY (`tech_id`),
  ADD UNIQUE KEY `tech_id` (`tech_id`);

--
-- Indexes for table `track_outsourcing`
--
ALTER TABLE `track_outsourcing`
  ADD PRIMARY KEY (`outsource_id`,`startup_id`);

--
-- Indexes for table `vertical`
--
ALTER TABLE `vertical`
  ADD PRIMARY KEY (`vertical_id`),
  ADD UNIQUE KEY `vertical_id` (`vertical_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `community_categories`
--
ALTER TABLE `community_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `community_pages`
--
ALTER TABLE `community_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `community_posts`
--
ALTER TABLE `community_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `community_usernotices`
--
ALTER TABLE `community_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `community_widgets`
--
ALTER TABLE `community_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `community_words`
--
ALTER TABLE `community_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `corp_reg`
--
ALTER TABLE `corp_reg`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identifier of registration request', AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `feed_corp_startup`
--
ALTER TABLE `feed_corp_startup`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ideapitch_categories`
--
ALTER TABLE `ideapitch_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ideapitch_pages`
--
ALTER TABLE `ideapitch_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ideapitch_posts`
--
ALTER TABLE `ideapitch_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ideapitch_usernotices`
--
ALTER TABLE `ideapitch_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ideapitch_widgets`
--
ALTER TABLE `ideapitch_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ideapitch_words`
--
ALTER TABLE `ideapitch_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `login_logout_log`
--
ALTER TABLE `login_logout_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `problem_list`
--
ALTER TABLE `problem_list`
  MODIFY `prob_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `request_outsourcing`
--
ALTER TABLE `request_outsourcing`
  MODIFY `outsource_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `shoutout_categories`
--
ALTER TABLE `shoutout_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shoutout_pages`
--
ALTER TABLE `shoutout_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shoutout_posts`
--
ALTER TABLE `shoutout_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shoutout_usernotices`
--
ALTER TABLE `shoutout_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shoutout_widgets`
--
ALTER TABLE `shoutout_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shoutout_words`
--
ALTER TABLE `shoutout_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `startup_reg`
--
ALTER TABLE `startup_reg`
  MODIFY `reg_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'unique identifier of the registration request', AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `technology`
--
ALTER TABLE `technology`
  MODIFY `tech_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identification of technology';

--
-- AUTO_INCREMENT for table `vertical`
--
ALTER TABLE `vertical`
  MODIFY `vertical_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique identification of vertical', AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `community_categorymetas`
--
ALTER TABLE `community_categorymetas`
  ADD CONSTRAINT `community_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `community_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `community_contentwords`
--
ALTER TABLE `community_contentwords`
  ADD CONSTRAINT `community_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `community_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `community_words` (`wordid`);

--
-- Constraints for table `community_postmetas`
--
ALTER TABLE `community_postmetas`
  ADD CONSTRAINT `community_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `community_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `community_posts`
--
ALTER TABLE `community_posts`
  ADD CONSTRAINT `community_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `community_posts` (`postid`),
  ADD CONSTRAINT `community_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `community_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `community_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `community_posts` (`postid`);

--
-- Constraints for table `community_posttags`
--
ALTER TABLE `community_posttags`
  ADD CONSTRAINT `community_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `community_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `community_words` (`wordid`);

--
-- Constraints for table `community_tagwords`
--
ALTER TABLE `community_tagwords`
  ADD CONSTRAINT `community_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `community_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `community_words` (`wordid`);

--
-- Constraints for table `community_titlewords`
--
ALTER TABLE `community_titlewords`
  ADD CONSTRAINT `community_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `community_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `community_words` (`wordid`);

--
-- Constraints for table `community_uservotes`
--
ALTER TABLE `community_uservotes`
  ADD CONSTRAINT `community_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `community_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `corp_contact`
--
ALTER TABLE `corp_contact`
  ADD CONSTRAINT `FK_corp_contact_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE;

--
-- Constraints for table `corp_tech`
--
ALTER TABLE `corp_tech`
  ADD CONSTRAINT `FK_corp_tech_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_corp_tech_technology` FOREIGN KEY (`tech_id`) REFERENCES `technology` (`tech_id`) ON DELETE CASCADE;

--
-- Constraints for table `corp_vertical`
--
ALTER TABLE `corp_vertical`
  ADD CONSTRAINT `FK_corp_vertical_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_corp_vertical_vertical` FOREIGN KEY (`vertical_id`) REFERENCES `vertical` (`vertical_id`) ON DELETE CASCADE;

--
-- Constraints for table `corp_vision`
--
ALTER TABLE `corp_vision`
  ADD CONSTRAINT `FK_corp_vision_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE;

--
-- Constraints for table `ideapitch_categorymetas`
--
ALTER TABLE `ideapitch_categorymetas`
  ADD CONSTRAINT `ideapitch_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `ideapitch_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `ideapitch_contentwords`
--
ALTER TABLE `ideapitch_contentwords`
  ADD CONSTRAINT `ideapitch_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `ideapitch_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `ideapitch_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `ideapitch_words` (`wordid`);

--
-- Constraints for table `ideapitch_postmetas`
--
ALTER TABLE `ideapitch_postmetas`
  ADD CONSTRAINT `ideapitch_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `ideapitch_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `ideapitch_posts`
--
ALTER TABLE `ideapitch_posts`
  ADD CONSTRAINT `ideapitch_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `ideapitch_posts` (`postid`),
  ADD CONSTRAINT `ideapitch_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `ideapitch_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `ideapitch_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `ideapitch_posts` (`postid`);

--
-- Constraints for table `ideapitch_posttags`
--
ALTER TABLE `ideapitch_posttags`
  ADD CONSTRAINT `ideapitch_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `ideapitch_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `ideapitch_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `ideapitch_words` (`wordid`);

--
-- Constraints for table `ideapitch_tagwords`
--
ALTER TABLE `ideapitch_tagwords`
  ADD CONSTRAINT `ideapitch_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `ideapitch_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `ideapitch_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `ideapitch_words` (`wordid`);

--
-- Constraints for table `ideapitch_titlewords`
--
ALTER TABLE `ideapitch_titlewords`
  ADD CONSTRAINT `ideapitch_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `ideapitch_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `ideapitch_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `ideapitch_words` (`wordid`);

--
-- Constraints for table `ideapitch_uservotes`
--
ALTER TABLE `ideapitch_uservotes`
  ADD CONSTRAINT `ideapitch_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `ideapitch_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `shoutout_categorymetas`
--
ALTER TABLE `shoutout_categorymetas`
  ADD CONSTRAINT `shoutout_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `shoutout_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `shoutout_contentwords`
--
ALTER TABLE `shoutout_contentwords`
  ADD CONSTRAINT `shoutout_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `shoutout_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `shoutout_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `shoutout_words` (`wordid`);

--
-- Constraints for table `shoutout_postmetas`
--
ALTER TABLE `shoutout_postmetas`
  ADD CONSTRAINT `shoutout_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `shoutout_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `shoutout_posts`
--
ALTER TABLE `shoutout_posts`
  ADD CONSTRAINT `shoutout_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `shoutout_posts` (`postid`),
  ADD CONSTRAINT `shoutout_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `shoutout_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `shoutout_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `shoutout_posts` (`postid`);

--
-- Constraints for table `shoutout_posttags`
--
ALTER TABLE `shoutout_posttags`
  ADD CONSTRAINT `shoutout_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `shoutout_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `shoutout_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `shoutout_words` (`wordid`);

--
-- Constraints for table `shoutout_tagwords`
--
ALTER TABLE `shoutout_tagwords`
  ADD CONSTRAINT `shoutout_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `shoutout_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `shoutout_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `shoutout_words` (`wordid`);

--
-- Constraints for table `shoutout_titlewords`
--
ALTER TABLE `shoutout_titlewords`
  ADD CONSTRAINT `shoutout_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `shoutout_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `shoutout_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `shoutout_words` (`wordid`);

--
-- Constraints for table `shoutout_uservotes`
--
ALTER TABLE `shoutout_uservotes`
  ADD CONSTRAINT `shoutout_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `shoutout_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `startup_contact`
--
ALTER TABLE `startup_contact`
  ADD CONSTRAINT `FK_startup_contact_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE;

--
-- Constraints for table `startup_corp_partner`
--
ALTER TABLE `startup_corp_partner`
  ADD CONSTRAINT `FK_startup_corp_partner_corp_auth` FOREIGN KEY (`corp_id`) REFERENCES `corp_auth` (`corp_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_startup_corp_partner_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE;

--
-- Constraints for table `startup_tech`
--
ALTER TABLE `startup_tech`
  ADD CONSTRAINT `FK_startup_tech_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_startup_tech_technology` FOREIGN KEY (`tech_id`) REFERENCES `technology` (`tech_id`) ON DELETE CASCADE;

--
-- Constraints for table `startup_verticals`
--
ALTER TABLE `startup_verticals`
  ADD CONSTRAINT `FK_startup_verticals_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_startup_verticals_vertical` FOREIGN KEY (`vertical_id`) REFERENCES `vertical` (`vertical_id`) ON DELETE CASCADE;

--
-- Constraints for table `startup_vision`
--
ALTER TABLE `startup_vision`
  ADD CONSTRAINT `FK_startup_vision_startup_auth` FOREIGN KEY (`startup_id`) REFERENCES `startup_auth` (`startup_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
