
<h3 class="football-bar">บอลเมื่อคืน ผลบอลย้อนหลัง</h3>

<?php 
if($this->match):
	$_i=0;
	foreach($this->match as $m):
		$l='';
		if($m['list']):
			$tn=time::$day[date('w',$m['tm']->sec)].' '.time::show($m['tm'],'date');
?>
<h3 class="match-bar">บอลวัน<?php echo $tn?></h3>

<table class="match" width="100%">
<thead>
<tr>
<th>เวลา</th>
<th colspan="2">ทีมเจ้าบ้าน</th>
<th>ราคา</th>
<th>ผลบอล</th>
<th colspan="2">ทีมเยือน</th>
</tr>
</thead>
<tbody>
<?php foreach($m['list'] as $k=>$v):?>
<?php if($l!=$v['lg']):?>
<tr>
<td colspan="7" class="h"><strong><?php echo $this->_league[$v['lg']]['t']?></strong> -  วัน<?php echo $tn?></td>
</tr>
<?php $l=$v['lg'];$i=0;endif?>
<tr class="l<?php echo $i%2?>">
<td class="t"><?php echo time::show($v['tm'],'time')?></td>
<td class="i"><a href="/football/match/<?php echo $v['_id']?>"><i><img src="http://s3.boxza.com/football/team/<?php echo $this->_team[$v['t1']['_id']]['fd']?>/s.png" alt="<?php echo $this->_team[$v['t1']['_id']]['t']?>"></i></a></td>
<td class="n"><a href="/football/match/<?php echo $v['_id']?>"> <?php echo $this->_team[$v['t1']['_id']]['t']?></a></td>
<td class="p"><span><?php echo $v['fp']?></span></td>
<td class="r"><?php if($v['ft']):?><a href="/match/<?php echo $v['_id']?>" title="ผลบอล <?php echo $this->_team[$v['t1']['_id']]['t']?> <?php echo $v['ft']?> <?php echo $this->_team[$v['t2']['_id']]['t']?>"><?php echo $v['ft']?></a><?php endif?></td>
<td class="n"><a href="/football/match/<?php echo $v['_id']?>"><?php echo $this->_team[$v['t2']['_id']]['t']?></a></td>
<td class="i"><a href="/football/match/<?php echo $v['_id']?>"><i><img src="http://s3.boxza.com/football/team/<?php echo $this->_team[$v['t2']['_id']]['fd']?>/s.png" alt="<?php echo $this->_team[$v['t2']['_id']]['t']?>"></i></a></td>
</tr>
<?php $i++;endforeach?>
</tbody>
</table>
<?php endif?>
<?php $_i++;endforeach?>
<?php endif?>




