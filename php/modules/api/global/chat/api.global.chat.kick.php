<?php

if($chat->myadmin||in_array($chat->myid,$chat->super))
{
	$par=explode(' ',$chat->cmd,2);
	$uid=strtolower(trim($par[0]));

	if(in_array($uid,$chat->super)&&!in_array($chat->myid,$chat->super))
	{
		$chat->mysystem=1;
		$chat->inserttext(array('ty'=>'kick','m'=>'เตะสวนกลับ <span>'.$chat->myname.'</span> [ID: '.$chat->myid.'] ออกจากห้องแชทนี้  ด้วยข้อหา "ระบบเตะสวนกลับอัตโนมัติ"','par'=>array('uid'=>$chat->myid),'c'=>21));
	}
	else
	{
		$nick=getnicks($chat->cache,$chat->room);
		$chat->inserttext(array('ty'=>($uid=='1'?'ms':'kick'),'m'=>'เตะ <span>'.($nick[$uid]['n']?$nick[$uid]['n']:'').'</span> [ID: '.$uid.'] ออกจากห้องแชทนี้ '.($par[1]?' ด้วยข้อหา "'.$par[1].'"':''),'par'=>array('uid'=>$uid),'c'=>21));
	}
}
else
{
	_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'คุณไม่มีสิทธิ์ใช้งานส่วนนี้');
}


?>