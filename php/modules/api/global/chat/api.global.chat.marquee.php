<?php


$par=explode(' ',$chat->cmd,2);
$direction=strtolower(trim($par[0]));
$ms=trim(mb_substr(htmlspecialchars($par[1], ENT_QUOTES, 'utf-8'),0,500,'utf-8'));

$is_myroom=false;
if(in_array($chat->room,array(1,2,3,4,5,6,7)))
{
	$chat->badword='(ควย|ฆวย|เย็ด|พ่อง|อีดอก|กูเ|กูบ|kukamusic|แม่ง|แมร่ง|เหี้ย|เงี่ยน|มึง|xat\.com|เสือก|สัส|สาส|คูก้า|happy2pays|slim\-sure)';
	$is_myroom=true;
}

$bt=0;
if(preg_match('/'.$chat->badword.'/i',$ms,$c)||preg_match('/0([8|9]{1})([0-9]{5,10})/',$ms,$c))
{
	if($chat->myadmin||in_array($chat->myid,$chat->super))
	{
		_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'ไม่สามารถพิมข้อความดังกล่าวได้ กรุณาใช้คำสุภาพนะคะ');
	}
	else
	{
		if($is_myroom)
		{
			if(_::$my)
			{
				$bt=300;
			}
			else
			{
				$bt=3600*3;
			}
		}
		else
		{
			if(_::$my)
			{
				_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'ไม่สามารถพิมข้อความดังกล่าวได้ กรุณาใช้คำสุภาพนะคะ');
			}
			else
			{
				$bt=1800;
			}
		}
		if($bt)
		{
			$chat->data['ban']['_id'][$uid]=time()+$bt;
			$chat->data['ban']['ip'][$_SERVER['REMOTE_ADDR']]=time()+$bt;
			
			$chat->inserttext(array(
			'u'=>-1,
			'mb'=>1,
			'n'=>'ระบบ',
			'l'=>'',
			'i'=>'http://s1.boxza.com/profile/00/00/00/s.jpg',
			'am'=>3,
			'rk'=>rand(1,5),
			'vid'=>'',
			'ty'=>'kick','m'=>'เตะ <span>'.$chat->myname.'</span> [ID: '.$chat->myid.'] [IP: '.$_SERVER['REMOTE_ADDR'].'] ออกจากห้องแชทนี้ และแบน '.floor($bt/60).' นาที ด้วยข้อหา คำหยาบ/คำต้องห้าม','par'=>array('uid'=>$chat->myid),'c'=>21
			));
		}
	}
	$ms='';
}
elseif(stripos($ms,'chat.boxza.com/')>-1)
{
	_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'ไม่สามารถโฆษณาภายในห้องแชทด้วยกันได้');
	$ms='';
}


if($ms)
{
	$ms=trim(preg_replace('/([^"|^\'|^>])http:\/\/([a-z0-9\.]+)?boxza\.com([^\s,]*)/i','$1<a href="http://$2boxza.com$3" target="_blank" rel="nofollow">http://$2boxza.com$3</a>',' '.$ms.' '));
	if(_::$my)
	{
		if(in_array($direction,array('left','right','up','down')))
		{
			if($chat->mybux >= 150)
			{
				$chat->mybux-=150;
				_setmybux($chat->mybux);
				if(in_array($direction,array('up','down')))
				{
					$msg='<marquee direction="'.$direction.'" height="80" onMouseOver="this.stop()" onMouseOut="this.start()"> '.$ms.' </marquee>';
				}
				else
				{
					$msg='<marquee direction="'.$direction.'" onMouseOver="this.stop()" onMouseOut="this.start()"> '.$ms.' </marquee>';
				}
				$chat->inserttext(array('ty'=>'ms','m'=>$msg,'c'=>21));
				_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'คุณมีคะแนนเหลือ '.number_format($chat->mybux).' คะแนน');
			}
			else
			{
				_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'คุณมีคะแนนไม่เพียงพอ');
			}
		}
		else
		{
			_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'กำหนดทิศทางไม่ถูกต้อง ( /marquee [left|right|up|down] [ข้อความ] ) - เสีย 150 คะแนน/ครั้ง');
		}
	}
	else
	{
		_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'คำสั่งนี้เฉพาะสมาชิกเท่านั้น');
	}
}
elseif($direction)
{
	_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'ข้อความไม่ถูกต้อง ( /marquee [left|right|up|down] [ข้อความ] ) - เสีย 150 คะแนน/ครั้ง');	
}
else
{
	_::$content[] = array('method'=>'chatbox','type'=>'notice','data'=>'วิธีใช้งานข้อความเลื่อนไปมา ( /marquee [left|right|up|down] [ข้อความ] ) - เสีย 150 คะแนน/ครั้ง');	
}
?>
