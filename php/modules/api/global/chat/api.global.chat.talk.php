<?php

$ask=trim(mb_substr(htmlspecialchars(trim(mb_strtolower($chat->cmd,'utf-8')), ENT_QUOTES, 'utf-8'),0,150,'utf-8'));
$ans=trim(mb_substr(htmlspecialchars(trim($_GET['answer']), ENT_QUOTES, 'utf-8'),0,150,'utf-8'));


if(!_::$my)
{

}
elseif(!$ask || !$ans)
{
	
}
elseif(preg_match('/'.$chat->badword.'/i',$ask,$c)||preg_match('/'.$chat->badword.'/i',$ans,$c))
{
		_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'ไม่สามารถพิมข้อความดังกล่าวได้ กรุณาใช้คำสุภาพนะคะ');
}
else
{
	
}
?>