<h3 class="sticker-bar">มาใหม่</h3>

<ul class="sticker-list">
    <?php for($i=0;$i<count($this->app);$i++):?>
    <li>
    <a href="/sticker/view/<?php echo $this->app[$i]['_id'].$this->cur?>">
    <img src="http://s3.boxza.com/sticker/cover/<?php echo $this->app[$i]['fd']?>/s.png">
    <div><?php echo $this->app[$i]['t']?></div>
    </a>
    </li>
    <?php endfor?>
</ul>

<div class="page-nav">
<?php if($this->page>1):?>
<a href="/sticker/recent<?php echo $this->page>2?'/page-'.($this->page-1):''?>">ย้อนกลับ</a>
<?php endif?>
<?php if($this->page<$this->maxpage):?>
<a href="/sticker/recent/page-<?php echo $this->page+1?>">ถัดไป</a>
<?php endif?>
</div>