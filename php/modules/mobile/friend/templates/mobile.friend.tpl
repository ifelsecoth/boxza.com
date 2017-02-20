<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="http://ogp.me/ns/fb#">
<head>
<meta charset="UTF-8">
<title><?php echo _::$meta['title']?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"> 
<link rel="stylesheet" type="text/css" href="http://s0.boxza.com/static/css/mobile.friend.css?<?php echo APP_VERSION?>">
<link rel="icon" type="image/x-icon" href="http://<?php echo HOST?>/favicon.ico">
<script type="text/javascript" src="http://s0.boxza.com/static/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://s0.boxza.com/static/js/boxza.js"></script>
</head>
<body class="<?php echo APP_OS?>">
<div class="bar">
<div>
<?php if($this->parent):?><a href="<?php echo $this->parent?>" class="bar-back"></a><?php endif?>
<div class="bar-title">หาเพื่อน+ <span><script type="text/javascript"> __th_page="mobile-friend";</script><script type="text/javascript" src="http://hits.truehits.in.th/data/t0030667.js"></script><noscript><img src="http://hits.truehits.in.th/noscript.php?id=t0030667" alt="Thailand Web Stat" border="0" width="14" height="17" /></noscript></span></div>
<a href="/friend/print" class="bar-print"></a>
<a href="<?php echo URL?>" class="bar-refresh"></a>
<a href="/friend/logout" class="bar-logout"></a>
</div>
</div>
<ul class="tabs"><li><a href="/friend" class="<?php echo !_::$path[0]?'active':''?>"><span>ค้นหาเพื่อน</span></a></li><li><a href="/friend/girl" class="<?php echo _::$path[0]=='girl'?'active':''?>"><span>เพื่อนหญิง</span></a></li><li><a href="/friend/boy" class="<?php echo _::$path[0]=='boy'?'active':''?>"><span>เพื่อนชาย</span></a></li><li><a href="/friend/gay" class="<?php echo _::$path[0]=='gay'?'active':''?>"><span>เพื่อนเกย์</span></a></li><li><a href="/friend/lesbian" class="<?php echo _::$path[0]=='lesbian'?'active':''?>"><span>เพื่อนเลสเบี้ยน</span></a></li><li><a href="/friend/ladyboy" class="<?php echo _::$path[0]=='ladyboy'?'active':''?>"><span>เพื่อนสาวประเภท2</span></a></li><li><a href="/friend/apps" class="<?php echo _::$path[0]=='apps'?'active':''?>"><span>แอพแนะนำ</span></a></li></ul>

<?php echo _::$content?>
</body>
</html>