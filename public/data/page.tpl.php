<?php
// $Id: page.tpl.php,v 1.28.2.1 2009/04/30 00:13:31 goba Exp $
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="<?php print $language->language ?>" xml:lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">
<head>
<?php print $head ?>
<title><?php print $head_title ?></title>
<?php print $styles ?><?php print $scripts ?>
<script type="text/javascript"><?php /* Needed to avoid Flash of Unstyle Content in IE */ ?> </script>
</head>
<body>
<div class="master">
  <div class="header">
    <div class="top_links">
      <div class="hdr_rht_link">
      <?php if ($topheadermenus) { ?>
      <?php print $topheadermenus; ?>
      <?php } ?>
      </div>
      <div class="sech_area"> <?php print $search_box ?> </div>
    </div>
    <div class="logo"><a href="index.html"><img src="<?php print base_path() . path_to_theme();?>/images/logo.jpg" alt="Logo" border="0" /></a></div>
    <div class="top_banner">Ensuring the highest level of customers satisfaction us a <br />
      better Company in our field</div>
    <div class="contact_area">Contact Us | 408-379-7000</div>
    <div class="hdr_lft_link">Licensed &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insured &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&amp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bonded</div>
  </div>
  <div class="main_menu">
    <?php if (isset($primary_links)) { ?>
      <?php print theme('links', $primary_links, array('class' => 'links', 'id' => 'navlist')) ?>
      <?php } ?>
  </div>
  <div class="banner_disp">
    <div class="lft_bnr">
      <div class="blue_box"> <span class="big_text">Trust</span> someone you love to a Company that <span class="big_text">Cares</span>. Our Managed Homecare Services are more <span class="big_text">Flexible</span>. Affordable and come with Reliability, <span class="big_text">Support</span> and <span class="big_text">Quality.</span></div>
      <div class="orng_box"> Crearing Same and Comfort </div>
    </div>
    <div class="cntr_bnr"></div>
  </div>
  <div class="mid_links">
    <?php if (isset($secondary_links)) { ?>
      <?php print theme('links', $secondary_links, array('class' => 'links', 'id' => 'subnavlist')) ?>
      <?php } ?>
  </div>
  <div class="content_area">
    <table border="0" cellpadding="0" cellspacing="0" id="content">
      <tr>
        <?php if ($left) { ?>
        <td id="sidebar-left"><?php print $left ?></td>
        <?php } ?>
        <td valign="top" align="left"><?php if ($mission) { ?>
          <div id="mission"><?php print $mission ?></div>
          <?php } ?>
          <div id="main"><div class="top_content"><?php print $breadcrumb ?><?php print $topcontent ?></div>
            <h1 class="title"><?php print $title ?></h1>
            <div class="tabs"><?php print $tabs ?></div>
            <?php if ($show_messages) { print $messages; } ?>
            <?php print $help ?> <?php print $content; ?> <?php print $feed_icons; ?> </div></td>
        <?php if ($right) { ?>
        <td id="sidebar-right"><?php print $right ?></td>
        <?php } ?>
      </tr>
    </table>
  </div>
  <div class="mid_links2">
    <?php if ($lowerhomemenus) { ?>
      <?php print $lowerhomemenus; ?>
      <?php } ?>
  </div>
  <div class="footer">
    <div class="ftr_left"> Copyright &copy;2010 Cloverleaf Care Inc. All rights reserved. </div>
  </div>
</div>
<?php print $closure ?>
</body>
</html>