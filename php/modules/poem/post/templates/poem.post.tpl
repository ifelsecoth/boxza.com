<script>
var cate=<?php echo json_encode($this->cate)?>;
function ccate(e){var v=$(e).val(),d='<option value="">เลือกรายการ</option>';if(v){if(cate[v]){for(var i=0;i<cate[v].l.length;i++)d+='<option value="'+cate[v].l[i]['_id']+'">'+cate[v].l[i]['t']+'</option>'}};$('select[name=catesub]').html(d);}
</script>


<ul class="breadcrumb" style="margin-bottom:5px;">
  <li><a href="/" title="กลอน"><i class="icon-home"></i> กลอน</a></li>
 <li><span class="divider">&raquo;</span> <a href="/manage" title="จัดการประกาศของคุณ">จัดการกลิตเตอร์ของคุณ</a></li>
 <li><span class="divider">&raquo;</span> เพิ่มกลิตเตอร์ใหม่</li>
 </ul>
 <div style="padding:5px; background:#fff;">
<h2 style="padding:5px; margin:5px; background:#f9f9f9; text-align:center">เพิ่มกลิตเตอร์ใหม่</h2>
 <form method="post" action="<?php echo URL?>" enctype="multipart/form-data" id="sensubmit" class="form-horizontal">
 <fieldset>
 <div class="control-group<?php if($this->error['cate']):?> error<?php endif?>">
<label class="control-label" for="input02">ประเภทกิลเตอร์:</label>
<div class="controls">
<?php 
$c = 0;
foreach($this->cate as $k=>$v):
	if($v['l']):
		if($c) echo '</div>';
		$c=$k;
?>
<h4 style="margin:5px 0px 5px 0px"><?php echo $v['t']?></h4>
<div style="border-bottom:1px dashed #ccc; padding:0px 5px 5px">
<?php continue;endif?>
<label style="display:inline-block; width:120px; height:20px; line-height:20px;"><input type="checkbox" name="cate[]" value="<?php echo $k?>"<?php echo in_array($k,(array)$this->post['cate'])?' checked':''?>> <?php echo $v['t']?></label>
<?php endforeach?>
</div>
<?php if($this->error['cate']):?><div><?php echo $this->error['cate']?></div><?php endif?>
<p class="help-inline">* บังคับเลือก อย่องน้อย 1 ประเภท</p>
</div>
</div>
 <div class="control-group<?php if($this->error['detail']):?> error<?php endif?>">
<label class="control-label" for="input09">ข้อความในรูปภาพ:</label>
<div class="controls">
<textarea id="input09" style="height:60px;" class="span6" name="detail" maxlength="1000" minlength="10" required><?php echo $this->post['detail']?></textarea>
<?php if($this->error['detail']):?><div><?php echo $this->error['detail']?></div><?php endif?>
<p class="help-block">* บังคับกรอก,  ข้อความในรูปภาพ หรืออธิบายเกี่ยวกับรูปภาพ (อย่างน้อย 10 ตัวอักษร)</p>
</div>
</div>
 <div class="control-group<?php if($this->error['o']):?> error<?php endif?>">
<label class="control-label" for="input10">รูปภาพ:</label>
<div class="controls">
<input type="file" id="input10" class="span3" size="20" name="o" required>
<?php if($this->error['o']):?><div><?php echo $this->error['o']?></div><?php endif?>
<p class="help-block">* บังคับเลือก, ขนาดรูปต้องใหญ่กว่า 150x150 pixel<br><br>
<strong style="color:#ff0000">*** ห้ามอัพโหลดรูปภาพส่วนตัว หรือรูปภาพที่ไม่ใช่กลิตเตอร์โดยเด็ดขาด มิฉะนั้นทีมงานจะทำการลบโดยทันที ***</strong>
</p>
</div>
</div>
<div class="form-actions">
<button type="submit" class="btn btn-primary">เพิ่มกลิตเตอร์</button>
<button class="btn" type="reset">ยกเลิก</button>
</div>
</fieldset>
</form>
</div>
            
            
