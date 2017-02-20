<?php

$d2=strtotime(date('Y-m-d 11:00:00'));
if($d2<time())
{
	$time=date('d/m/',$d2).(date('Y',$d2)+543).'%2000:00:00';
}
else
{
	$d2=$d2-(86400);
	$time=date('d/m/',$d2).(date('Y',$d2)+543).'%2000:00:00';
}

echo 'http://www.goldtraders.or.th/DailyPrices_Print.aspx?as='.$time.'<br><br>';

$html=_::http()->get('http://www.goldtraders.or.th/DailyPrices_Print.aspx?as='.$time);


$thai=array();
$s='<table cellspacing="2" cellpadding="2" id="MainGridView"';
$i=strpos($html,$s);
if($i>-1)
{
	$tmp=substr($html,$i);
	$s='</table>';
	$i=strpos($tmp,$s);
	if($i>-1)
	{
		$tmp=substr($tmp,0,$i+strlen($s));	
		
		$u=0;
		$c=explode('<tr',$tmp);
		for($i=2;$i<count($c);$i++)
		{
			$day=array();
			//echo $c[$i]."\r\n\r\n";	
			$d=explode('</td>',$c[$i]);
			for($j=0;$j<count($d)-1;$j++)
			{
				$x=strpos($d[$j],'>');
				//$v=trim(str_replace(array('&nbsp;','n/a'),' ',substr($d[$j],$x+1)));
				$v=trim(strip_tags(str_replace(array('&nbsp;','n/a'),' ',substr($d[$j],$x+1))));
				$day[]=$v;
			}
			$thai[]=$day;
			$u++;
		}
	}
}




// <table cellspacing="2" cellpadding="2" id="ForeignGridView"
$other=array();
$s='<table cellspacing="2" cellpadding="2" id="ForeignGridView"';
$i=strpos($html,$s);
if($i>-1)
{
	$tmp=substr($html,$i);
	$s='</table>';
	$i=strpos($tmp,$s);
	if($i>-1)
	{
		$tmp=substr($tmp,0,$i+strlen($s));	
		
		$u=0;
		$c=explode('<tr',$tmp);
		for($i=2;$i<count($c);$i++)
		{
			$day=array();
			//echo $c[$i]."\r\n\r\n";	
			$d=explode('</td>',$c[$i]);
			for($j=0;$j<count($d)-1;$j++)
			{
				$x=strpos($d[$j],'>');
				$v=trim(strip_tags(str_replace(array('&nbsp;','n/a'),' ',substr($d[$j],$x+1))));
				$day[]=$v;
			}
			$other[]=$day;
			$u++;
		}
	}
}

print_r($thai);
print_r($other);

if($thai[0][2]&&$thai[0][3]&&$thai[1][2]&&$thai[1][3])
{
	_::db()->update('msg',array('_id'=>'gold'),array('$set'=>array('thai'=>$thai,'other'=>$other)));
}


?>