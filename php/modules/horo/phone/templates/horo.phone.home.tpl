
<div class="no-box">
<p>ตัวเลขเบอร์มือถือของคุณมีความหมาย อยากรู้เพียงแค่กรอกเบอร์มือถือ</p>
<h3>ดูดวงของคุณจากเบอร์มือถือ</h3>
<div class="l1">ค้นหาเบอร์ <select class="tbox horo-sel" name="n0"><?php for($i=80;$i<=96;$i++):?><option value="0<?php echo $i?>">0<?php echo $i?></option><?php endfor?></select> -
<?php for($i=1;$i<=7;$i++):?><?php if($i==4):?> - <?php endif?><input type="text" class="tbox horo-no" name="n<?php echo $i?>" maxlength="1"> <?php endfor?> <input type="button" class="button" value="ดูผลทำนาย" onClick="horoshow()"></div>
<div class="l2">ผลรวมเบอร์โทรศัพท์ของคุณ <span class="horo-rs">0</span></div>
</div>

<?php require(HANDLERS.'ads/ads.adsense.body2.php');?>

<div class="no-hot">
<h3>ผลรวมตัวเลขเด่น</h3>
<div style="margin:0px 10px">
<ul class="du thumbnails row-count-2">
<?php $i=0;foreach($this->phone as $v):?>
<li class="n<?php echo (intval($i/2)%2)?> span6">
<i><a href="/phone/<?php echo $v['_id']?>.html"><?php echo $v['_id']?></a></i>
<p><a href="/phone/<?php echo $v['_id']?>.html"><?php echo mb_substr($v['d'],0,170,'utf-8')?>...</a></p>
<span></span>
</li>
<?php $i++;endforeach?>
</ul>
</div>
</div>

<div style="margin:5px 0px"><?php require(HANDLERS.'ads/ads.yengo.body2.php');?></div>