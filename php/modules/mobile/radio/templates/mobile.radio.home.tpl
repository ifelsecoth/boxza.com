<ul class="home-list">
<?php foreach($this->radio as $v):?>
<li>
<a href="/radio/play?t=<?php echo urlencode($v['t'])?>&im=<?php echo urlencode($v['im'])?>&file=<?php echo urlencode($v['file'])?>&swf=<?php echo urlencode($v['swf'])?>">
<img src="http://s0.boxza.com/static/images/radio/<?php echo $v['im']?>">
<h1><?php echo $v['t']?></h1>
<h2>สามารถฟังผ่านเว็บได้ที่ http://radio.boxza.com/<?php echo $v['l']?></h2>
</a>
</li>
<?php endforeach?>
</ul>

