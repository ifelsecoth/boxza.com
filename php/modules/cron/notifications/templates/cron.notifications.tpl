<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo $this->title?></title>
</head>
<body style="background:#fff; text-align:center; padding:20px;font-family:Tahoma;font-size:12px; color:#333; text-decoration:none">
<div align="center">
  <div style="width:700px; padding:10px;border:1px solid #CCCCCC;background:#FFFFFF; text-align:left; color:#333;">
    <h1 style="color:#0399BE; text-decoration:none;padding:5px; margin:5px; font-size:18px">BoxZa Social Network ของคนไทย</h1>
    <div style="border:1px dashed #CCCCCC; background:#FFFFFF; padding:3px; color:#333">
      <h2 align="center" style="color:#000000; font-size:16px;">มีเพื่อน <?php echo count($this->us)?> คน กำลังติดต่อกับคุณบน BoxZa Social Network ของคนไทย</h2>
      <div style="border:1px dashed #CCCCCC; background:#f9f9f9; padding:10px;">
        <?php for($i=0;$i<count($this->ms);$i++):?>
        <div style="font-size:14px; padding:5px; margin:0px 0px 5px; background:#fff;">
          <div style="float:left; width:60px; height:60px; margin:5px 15px 5px 5px;border:1px solid #ccc; background-color:#fff; line-height:0px"><a href="http://boxza.com/<?php echo $this->ms[$i]['u']['link']?>" title="<?php echo $this->ms[$i]['u']['name']?>" style="display:block;line-height:0px"><img src="<?php echo $this->ms[$i]['u']['img']?>" alt="<?php echo $this->ms[$i]['u']['name']?>" style="width:50px; height:50px; margin:5px;"></a></div>
          <div style="float:left; width:500px; line-height:2em;">
            <div><a href="http://boxza.com/<?php echo $this->ms[$i]['u']['link']?>" title="<?php echo $this->ms[$i]['u']['name']?>" style="text-decoration:none"><strong style="color:#0399BE"><?php echo $this->ms[$i]['u']['name']?></strong></a></div>
            <div><?php echo $this->ms[$i]['t']?> ที่ BoxZa Social Network ของคนไทย</div>
            <?php if($this->ms[$i]['m']):?>
            <div style="padding:10px; border:1px solid #ddd;"><?php echo $this->ms[$i]['m']?></div>
            <?php endif?>
            <table cellpadding="0" cellspacing="5" border="0" style="background-color:#fff;">
              <tr>
                <td style="background-color: #00a6fc;color: #fff; height:30px; line-height:30px;"><a href="<?php echo $this->ms[$i]['l']['href']?>" style="display:block;height:30px; line-height:30px;text-align: center;text-decoration: none;font-size: 14px; padding: 0px 14px; background-color: #00a6fc;color: #fff;"><?php echo $this->ms[$i]['l']['text']?></a></td>
              </tr>
            </table>
          </div>
          <div style="clear:both"></div>
        </div>
        <?php endfor?>
      </div>
      <h3 style="color:#0399BE; padding:15px 5px 0px 5px; margin:5px 5px 5px 5px; border-top:1px dashed #CCCCCC; font-size:14px">ขอบคุณที่ใช้บริการ</h3>
      <div style="padding:0px 5px 5px 5px; margin:0px 5px 5px 5px; "><a href="http://boxza.com/" style="color:#0399BE; text-decoration:none;">boxza.com</a><span style="color:#777"> - สังคมออนไลน์ของคนไทย</span></div>
    </div>
     <div style="padding:10px; margin:5px 0px; background-color:#f9f9f9; line-height:1.6em; color:#333;"> 
      หากไม่ต้องการรับอีเมลเหล่านี้อีกในอนาคต? <a href="http://social.boxza.com/settings" style="color:#0399BE;">คลิกที่นี่.</a><br>
      <a href="http://www.inet-rev.co.th/" style="text-decoration:none;"><strong style="color:#0399BE;">iNet Revolutions Co.,Ltd.</strong></a>
       50/816 หมู่ 9, ตำบล บางพูด, อำเภอ ปากเกร็ด, จังหวัด นนทบุรี 11120 โทร : 02-503-3177, โทรสาร : 02-503-3178
     </div>
  </div>
</div>
</body>
</html>
