<style>
.form-horizontal .control-group {
margin-bottom:8px;
padding-bottom: 10px;
border-bottom: 1px dashed #F0F0F0;
}
</style>

<link rel="stylesheet" type="text/css" href="http://s0.boxza.com/static/js/jquery/ui/jquery-ui-1.10.1.custom.min.css">
<script type="text/javascript" src="http://s0.boxza.com/static/js/jquery/ui/jquery-ui-1.10.1.custom.min.js"></script>


<div>


<ul class="breadcrumb" style="margin-bottom:5px;">
  <li><a href="/" title="ควบคุม"><i class="icon-home"></i> ควบคุม</a></li>
	<span class="divider">&raquo;</span> 
   <li><a href="/banner"><i class="icon-eye-open"></i> แบนเนอร์ทั้งหมด</a></li>
 
<?php if($this->access):?>
    <li class="pull-right"><a href="/banner"><i class="icon-eye-open"></i> กลับไปหน้ารวม</a></li>
<?php else:?>
 <li class="pull-right"><i class="icon-question-sign"></i> ไม่มีสิทธิ์แก้ไขข้อมูลภายในส่วนนี้</li>
<?php endif?>
</ul>
 
<h2 style="padding:5px; margin:5px; background:#f9f9f9; text-align:center">แก้ไขแบนเนอร์</h2>

<?php if($this->error):?>
<div class="alert alert-error">
  <a class="close" data-dismiss="alert" href="#">×</a>
  <h4 class="alert-heading">ผิดพลาด!</h4>
 <?php echo implode('<br>',$this->error);?>
</div>
<?php endif?>

<?php if($_SERVER['QUERY_STRING']=='completed'):?>
<div class="alert alert-success">
  <a class="close" data-dismiss="alert" href="#">×</a>
  <h4 class="alert-heading">เรียบร้อยแล้ว!</h4>
 ระบบทำการบันทึกข้อมูลเรียบร้อยแล้ว  (กลับไปยัง <a href="/banner">แบนเนอร์ทั้งหมด </a>)
</div>
<?php endif?>
<?php if($this->banner['pl']):?>
<div class="alert alert-info">  <h4 class="alert-heading">เผยแพร่แล้ว!</h4> แบนเนอร์นี้ทำการเผยแพร่แล้ว</div>
<?php endif?>
 <form method="post" action="<?php echo URL?>" enctype="multipart/form-data" id="sensubmit" class="form-horizontal">
 <fieldset>
 <div class="control-group<?php if($this->error['title']):?> error<?php endif?>">
<label class="control-label" for="input01">ชื่อแบนเนอร์:</label>
<div class="controls">
<input type="text" id="input01" class="span6" style="width:525px;" name="title" value="<?php echo htmlspecialchars($this->banner['t'],ENT_QUOTES,'utf-8')?>" required>
<p class="help-block">* บังคับกรอก</p>
</div>
</div>

 <div class="control-group">
<label class="control-label">ประเภท:</label>
<div class="controls">
<label class="checkbox inline"><input type="radio" name="type" onClick="checktype()" value="0"<?php echo !$this->banner['tyc']?' checked':''?>> รูปภาพ</label>
<label class="checkbox inline"><input type="radio" name="type" onClick="checktype()" value="1"<?php echo $this->banner['tyc']?' checked':''?>> โค๊ด</label>
</div>
</div>

<div id="type_img">
<div class="control-group">
<label class="control-label" for="input10">รูปภาพ / Flash:</label>
<div class="controls">
<?php if($this->banner['s']):?>
<?php if($this->banner['ex']=='swf'):?>
<object width="<?php echo $this->banner['w']?>" height="<?php echo $this->banner['h']?>"><param name="movie" value="http://s3.boxza.com/banner/<?php echo $this->banner['fd']?>/<?php echo $this->banner['s']?>"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><param name="wmode" value="transparent"><embed src="http://s3.boxza.com/banner/<?php echo $this->banner['fd']?>/<?php echo $this->banner['s']?>" type="application/x-shockwave-flash" width="<?php echo $this->banner['w']?>" height="<?php echo $this->banner['h']?>" allowscriptaccess="always" allowfullscreen="true" wmode="transparent"></embed></object>
<?php else:?>
<img src="http://s3.boxza.com/banner/<?php echo $this->banner['fd']?>/<?php echo $this->banner['s']?>"><br>
<?php endif?>
<div style="padding:5px; border:1px solid #ddd; background:#f5f5f5;">ประเภทไฟล์: <?php echo $this->banner['ex']?>, กว้าง: <?php echo $this->banner['w']?>, สูง: <?php echo $this->banner['h']?> </div>
<?php endif?>
<input type="file" id="input10" class="span3" size="20" name="o">
<p class="help-block">* บังคับเลือก - ระบบจะใช้รูปภาพเดิม โดยไม่มีการ resize</p>
</div>
</div>

<div class="control-group">
<label class="control-label" for="input12">ลิ้งค์ปลายทาง:</label>
<div class="controls">
<input type="text" id="input12" class="span6" style="width:525px;" name="link" value="<?php echo htmlspecialchars($this->banner['l'],ENT_QUOTES,'utf-8')?>">
</div>
</div>
</div>
<div id="type_code">
<div class="control-group">
<label class="control-label" for="input13">โค๊ด:</label>
<div class="controls">
<textarea id="input13" class="span6" style="width:525px; height:100px" name="code"><?php echo htmlspecialchars($this->banner['code'],ENT_QUOTES,'utf-8')?></textarea>
</div>
</div>
</div>
<div class="control-group">
<label class="control-label" for="input03">รายละเอียด:</label>
<div class="controls">
<textarea id="input03" class="span6" style="width:525px;" name="detail"><?php echo $this->banner['d']?></textarea>
</div>
</div>


<div class="control-group">
<label class="control-label" for="input01">ตำแหน่ง:</label>
<div class="controls">
<?php foreach($this->position as $k=>$v):?>
<div>
<strong><?php echo $v['t']?></strong><br>
<?php for($i=0;$i<count($v['l']);$i++):?>
<?php $c=($this->banner['p']&&is_array($this->banner['p'][$k]))?$this->banner['p'][$k]:array();?>
<?php echo $i?', ':''?><label class="checkbox inline"><input type="checkbox" name="position[<?php echo $k?>][]" value="<?php echo $v['l'][$i]?>"<?php echo in_array($v['l'][$i],$c)?' checked':''?>> <?php echo strtoupper($v['l'][$i])?></label>
<?php endfor?>
</div>
<?php endforeach?>
</div>
</div>

<div class="control-group">
<label class="control-label" for="input09">ลำดับในการแสดง:</label>
<div class="controls">
<input type="number" id="input09" class="span1" name="sort" value="<?php echo $this->banner['so']?>">
</div>
</div>


<div class="control-group">
<label class="control-label">เวลาในการแสดงผล:</label>
<div class="controls">จาก 
<input type="text" class="span2 date" name="date1" value="<?php echo date('Y-m-d',$this->banner['dt1']?$this->banner['dt1']->sec:time())?>" required> - ถึง
<input type="text" class="span2 date" name="date2" value="<?php echo date('Y-m-d',$this->banner['dt2']?$this->banner['dt2']->sec:time())?>" required>
</div>
</div>

 <div class="control-group">
<label class="control-label" for="input02">การเผยแพร่:</label>
<div class="controls category">
<label class="checkbox inline"><input type="radio" name="publish" value="1"<?php echo $this->banner['pl']?' checked':''?>> แสดงผล</label>
<label class="checkbox inline"><input type="radio" name="publish" value="0"<?php echo !$this->banner['pl']?' checked':''?>> ไม่แสดง</label>
</div>
</div>


<div class="form-actions">
<button type="submit" class="btn btn-primary">บันทึก</button>
<a class="btn" href="/admin">ยกเลิก</a>
</div>
</fieldset>
</form>
            
            

</div>

<script>
  $(function() {
    $( ".date" ).datepicker({
      dateFormat: 'yy-mm-dd',
    });
	checktype();
  });
function checktype()
{
	if($('input[name=type]:checked').val()=='1')
	{
		$('#type_code').css('display','block');
		$('#type_img').css('display','none');
	}
	else
	{
		$('#type_code').css('display','none');
		$('#type_img').css('display','block');
	}
}
</script>