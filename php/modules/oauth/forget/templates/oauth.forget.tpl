

   <div class="olg-log">
      <h2>เปลี่ยนรหัสผ่าน</h2>
       <div>
       <?php if($this->found):?>
       
       <div style="padding:20px; text-align:center; border:1px solid #eee; margin:5px; line-height:2.2em">
       <h4>เรียบร้อยแล้ว</h4>
       ระบบทำการส่งข้อมูลรหัสผ่านใหม่ ไปยังอีเมล์ของท่านเรียบร้อยแล้ว
       </div>
       <?php else:?>
       <div style="padding:20px; text-align:center; border:1px solid #eee; margin:5px; line-height:2.2em">
       <h4>เกิดข้อผิดพลาด</h4>
       การยืนยันขอเปลี่ยนรหัสผ่านไม่ถูกต้อง หรือคุณทำการยืนยันไปเรียบร้อยแล้ว กรุณาเช็คอีเมล์ของท่านอีกครั้ง
       </div>
       <?php endif?>
       </div>
   </div>
   <div class="olg-log">
   <h2>เข้าสู่ระบบ</h2>
       <div>
           <form method="post" action="/login">
           <input type="hidden" name="type" value="login">
         <ul>
            <li class="email"><p>อีเมล์</p> <input name="email" type="email" class="tbox"></li>
               <li class="password"><p>รหัสผ่าน</p> <input name="password" type="password" class="tbox"></li>
               <li><p></p><label> <input name="aways" type="checkbox" value="1"> เข้าสู่ระบบอัตโนมัติ</label></li>
               <li class="btnlogin"><p></p><input type="submit" value=" เข้าระบบ " class="olg-btn olg-btn-lg"> | <a href="javascript:;" onClick="_.box.open('#forget')">ลืมรหัสผ่าน</a></li>
            <li><p>หรือ </p> <a href="/login/facebook/" class="olg-btn olg-btn-fb" rel="nofollow">เข้าระบบด้วยบัญชี Facebook</a></li>
               
           </ul>
           </form> 
       </div>
</div>


<div id="forget" class="gbox" style="width:450px">
<form onSubmit="_.ajax.gourl('/login','forget',this);_.box.close();return false;">
<div class="gbox_header">ลืมรหัสผ่าน</div>
<div class="gbox_content" style="text-align:left;">
<table cellpadding="10" cellspacing="1" border="0" width="100%" class="tbservice">
<tr><td class="colum">อีเมล์</td><td align="left"><input type="text" name="email" class="tbox" style="width:200px"></td></tr>
</table>
</div>
<div class="gbox_footer"><input type="submit" class="button blue" value=" ขอเปลี่ยนรหัสผ่าน "> <input type="button" class="button" value=" ปิดหน้าต่างนี้ " onClick="_.box.close()"></div>
</form>
</div>

