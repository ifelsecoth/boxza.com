<ul class="breadcrumb">
    <li><a href="/" title="สติกเกอร์"><i class="icon-home"></i> สติกเกอร์</a></li>
    <span class="divider">&raquo;</span>
    <li><a href="/recent" title="สติกเกอร์มาใหม่">มาใหม่</a></li>
</ul>

<h3 class="ht"><i></i> <a href="/recent">สติกเกอร์มาใหม่</a></h3>

<ul class="thumbnails row-count-4">
    <?php for($i=0;$i<count($this->sticker);$i++):?>
    <li class="span3 text-center">
    <a href="/view/<?php echo $this->sticker[$i]['_id']?>" class="thumbnail" target="_blank">
    <img src="http://s3.boxza.com/sticker/cover/<?php echo $this->sticker[$i]['fd']?>/s.png">
    <div><?php echo $this->sticker[$i]['t']?></div>
    </a>
    </li>
    <?php endfor?>
</ul>

<div align="center"><?php echo $this->pager?></div>
