<!-- BEGIN - BANNER : B -->
<?php if($this->_banner['b']):?>
<div style="overflow:hidden; margin:0px 0px 5px; text-align:center">
<ul class="_banner _banner-once">
<?php foreach($this->_banner['b'] as $_bn):?>
<li><?php echo $_bn?></li>
<?php endforeach?>
</ul>
</div>
<?php endif?>
<!-- END - BANNER : B -->

<ul class="breadcrumb" style="margin-bottom:10px;">
<li><a href="/" title="ตรวจหวย"><i class="icon-home"></i> ตรวจหวย</a></li>
<span class="divider">&raquo;</span>
<li class="active"><a href="/set" title="หวยหุ้น หวยหุ้นวันนี้"><i class="icon-list"></i> หวยหุ้น</a></li>
</ul>


<?php require(HANDLERS.'ads/ads.adsense.body2.php');?>

<table class="table table-bordered table-striped lottoset">
<caption>ดัชนีหุ้นไทย <small>(อัพเดทล่าสุด: <?php echo time::show($this->index['tm'],'datetime')?>)</small></caption>
<thead>
<tr>
<th></th>
<th>ล่าสุด</th>
<th>เปลี่ยน</th>
<th>%เปลี่ยน</th>
<th>สูงสุด</th>
<th>ต่ำสุด</th>
<th>ปริมาณ(’000)</th>
<th>มูลค่า(ล้านบาท)</th>
</tr>
</thead>
<tbody>
<?php for($i=0;$i<5;$i++):$j=($i*8);?>
<tr>
<td class="n"><?php echo $this->index['msg'][$j+0]?></td>
<td><?php echo $this->index['msg'][$j+1]?></td>
<?php if($this->index['msg'][$j+2]>=0):?>
<td><span class="badge badge-success"><?php echo $this->index['msg'][$j+2]?></span></td>
<td><span class="badge badge-success"><?php echo $this->index['msg'][$j+3]?></span></td>
<?php else:?>
<td><span class="badge badge-important"><?php echo $this->index['msg'][$j+2]?></span></td>
<td><span class="badge badge-important"><?php echo $this->index['msg'][$j+3]?></span></td>
<?php endif?>
<td><?php echo $this->index['msg'][$j+4]?></td>
<td><?php echo $this->index['msg'][$j+5]?></td>
<td><?php echo $this->index['msg'][$j+6]?></td>
<td><?php echo $this->index['msg'][$j+7]?></td>
</tr>
<?php endfor?>
</tbody>
</table>

<div style="margin:5px 0px"><?php require(HANDLERS.'ads/ads.adsense.body2-2.php');?></div>

<table class="table table-bordered lotto2">
<caption>หวยหุ้น หวยหุ้นวันนี้ หวยหุ้นวันที่ <?php echo time::show($this->set[0]['tm'],'date')?></caption>
<thead>
<tr>
<th colspan="2" class="s">เปิดเช้า</th>
<th colspan="2" class="s">ปิดเที่ยง</th>
<th colspan="2" class="s">เปิดบ่าย</th>
<th colspan="2" class="s">ปิดเย็น</th>
</tr>
<tr>
<th class="p">บน</th>
<th class="p">ล่าง</th>
<th class="p">บน</th>
<th class="p">ล่าง</th>
<th class="p">บน</th>
<th class="p">ล่าง</th>
<th class="p">บน</th>
<th class="p">ล่าง</th>
</tr>
</thead>
<tbody>
<tr>
<td><?php echo $this->set[0]['t11']?></td>
<td><?php echo $this->set[0]['t12']?></td>
<td><?php echo $this->set[0]['t21']?></td>
<td><?php echo $this->set[0]['t22']?></td>
<td><?php echo $this->set[0]['t31']?></td>
<td><?php echo $this->set[0]['t32']?></td>
<td><?php echo $this->set[0]['t41']?></td>
<td><?php echo $this->set[0]['t42']?></td>
</tr>
</tbody>
</table>


<div style="margin:5px 0px"><?php require(HANDLERS.'ads/ads.yengo.body2.php');?></div>

<table class="table table-bordered table-striped lotto2">
<caption>หวยหุ้นย้อนหลัง</caption>
<thead>
<tr>
<th rowspan="2" class="s">วันที่</th>
<th colspan="2" class="s">เปิดเช้า</th>
<th colspan="2" class="s">ปิดเที่ยง</th>
<th colspan="2" class="s">เปิดบ่าย</th>
<th colspan="2" class="s">ปิดเย็น</th>
</tr>
<tr>
<th class="p">บน</th>
<th class="p">ล่าง</th>
<th class="p">บน</th>
<th class="p">ล่าง</th>
<th class="p">บน</th>
<th class="p">ล่าง</th>
<th class="p">บน</th>
<th class="p">ล่าง</th>
</tr>
</thead>
<tbody>
<?php for($i=1;$i<count($this->set);$i++):?>
<tr>
<td><?php echo time::show($this->set[$i]['tm'],'date')?></td>
<td><?php echo $this->set[$i]['t11']?></td>
<td><?php echo $this->set[$i]['t12']?></td>
<td><?php echo $this->set[$i]['t21']?></td>
<td><?php echo $this->set[$i]['t22']?></td>
<td><?php echo $this->set[$i]['t31']?></td>
<td><?php echo $this->set[$i]['t32']?></td>
<td><?php echo $this->set[$i]['t41']?></td>
<td><?php echo $this->set[$i]['t42']?></td>
</tr>
<?php endfor?>
</tbody>
</table>


<div class="fb-comments" data-href="http://lotto.boxza.com/set" data-num-posts="5" data-width="710"></div>

<?php if($this->topic):?>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="hforum">
<caption><a href="/forum/c-192" target="_blank">กระทู้หวยหุ้น</a> <small>(<a href="/forum/new-topic/192" target="_blank">เพิ่มกระทู้ใหม่</a>)</small></caption>
<thead>
<tr><th>&nbsp;</th><th>หัวข้อ</th><th>ผู้ตั้ง</th><th>อ่าน</th><th>ตอบ</th><th>ล่าสุด</th></tr>
</thead>
<tbody>
<?php $i=0;?>
<?php foreach($this->topic as $val):?>
<tr class="l<?php echo $i%2?>">
	<td class="ticon"><i class="i0"></i></td>
	<td class="ttitle"><p><a href="/forum/topic/<?php echo $val['_id']?>" target="_blank"><?php echo $val['t']?></a></p></td>
    <td class="tpost"><p><?php $p=$this->user->profile($val['u']);?><a href="http://boxza.com/<?php echo $p['link']?>" target="_blank"><?php echo $p['name']?></a></p></td>
	<td class="tview"><?php echo number_format($val['do'])?></td>
	<td class="treply"><?php echo number_format($val['cm']['c'])?></td>
	<td class="ttime"><p>
	<?php 
	if($val['cm']['d']):
	?>
    <?php echo time::show($val['cm']['d'][0]['t'],'datetime',true)?>
    <?php else:?>
    <?php echo time::show($val['ds'],'datetime',true)?>
    <?php endif?></p>
	</td>
</tr>
<?php $i++;endforeach?>
</tbody>
</table>
<?php endif?>
