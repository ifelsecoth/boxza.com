
<ul class="breadcrumb">
    <li><a href="/" title="สติกเกอร์"><i class="icon-home"></i> สติกเกอร์</a></li>
    <span class="divider">&raquo;</span>
    <li><a href="/cate-<?php echo $this->c?>" title="สติกเกอร์<?php echo $this->cate[$this->c]['t']?>"><?php echo $this->cate[$this->c]['t']?></a></li>
</ul>

<h4 class="ht"><i></i>สติกเกอร์ ประเภท<?php echo $this->cate[$this->c]['t']?></h4>
<ul class="thumbnails row-count-2 fbapp">
    <?php for($i=0;$i<count($this->app);$i++):$u=$this->user->profile($this->app[$i]['u']);?>
    <li class="span6">
    <a href="/view/<?php echo $this->app[$i]['_id']?>" class="thumbnail" target="_blank">
    <img src="http://s3.boxza.com/sticker/<?php echo $this->app[$i]['fd']?>/s.jpg">
    <div><?php echo $this->app[$i]['t']?></div>
    <p class="do">เล่น: <?php echo number_format(intval($this->app[$i]['do']))?>, โดย <?php echo $u['name']?></p>
    <p class="de"><?php echo $this->app[$i]['d']?></p>
    </a>
    </li>
    <?php endfor?>
</ul>

<div align="center"><?php echo $this->pager?></div>
