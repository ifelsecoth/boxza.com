<?php 
	$pages=array(
							//		array('t'=>'9GAG in Thai','id'=>'160866484017913','min'=>100),
									array('t'=>'คิดว่าดีก็ทำต่อไป','id'=>'185668594895616','min'=>100),
									array('t'=>'บ่นบ่น','id'=>'119275421551380','min'=>100),
									array('t'=>'Jaytherabbit','id'=>'503977206328815','min'=>100),
									array('t'=>'Eat All Day','id'=>'425434517512362','min'=>100),
									array('t'=>'สมาคมกวนTEEN 18+','id'=>'276439945704187','min'=>100),
									array('t'=>'ความรู้ท่วมหัวเอาตัวไม่รอด','id'=>'377972818972771','min'=>100),
									array('t'=>'โสดแสนD','id'=>'215561678464052','min'=>100),
									array('t'=>'ข้อความโดนๆ','id'=>'164486926939395','min'=>100),
									array('t'=>'หน้ากลม','id'=>'145147339021153','min'=>100),
									array('t'=>'Minions thailand','id'=>'206907329467617','min'=>100),
									array('t'=>'The Smurfs Thailand','id'=>'537003989706910','min'=>100),
									array('t'=>'Dora GAG','id'=>'313284625423348','min'=>100),
									array('t'=>'หมึกซึม','id'=>'332998630119285','min'=>100),
									array('t'=>'พอใจ','id'=>'390054464415577','min'=>100),
							//		array('t'=>'ลึกๆ','id'=>'294688280665847','min'=>100),
									array('t'=>'Timixabie','id'=>'299590466830861','min'=>100),
									array('t'=>'กระดาษสีครีม','id'=>'552419978152008','min'=>100),
									array('t'=>'Jod 8riew','id'=>'420017908056802','min'=>100),
									array('t'=>'คมเกิ๊น','id'=>'418024494891447','min'=>100),
									array('t'=>'Message','id'=>'229198730561050','min'=>100),
									array('t'=>'คนอะไรเป็นแฟนหมี','id'=>'514030908708895','min'=>100),
									array('t'=>'นี่เพื่อนไงจำไม่ได้หรอ','id'=>'334236760084743','min'=>100),
									
									
									//คนอะไรเป็นแฟนหมี/514030908708895
									//นี่เพื่อนไงจำไม่ได้หรอ/334236760084743
									
									
									array('t'=>'ภาพคอมเม้นฮ่าๆ','id'=>'216748941823775','min'=>50),
									array('t'=>'แจกรูปโพสต์ใต้คอมเม้นเฟสบุ๊ค','id'=>'586593644724225','min'=>100),
									array('t'=>'รวมรูปคอมเม้นฮาฮา','id'=>'1376048759290010','min'=>100),
									
									
									
									array('t'=>'ทูนหัวของบ่าว','id'=>'130185063856737','min'=>100),
									array('t'=>'จอนนี่แมวศุภลักษณ์','id'=>'311696612273483','min'=>100),
									array('t'=>'เฉโปแมวโง่','id'=>'1225060557634025','min'=>100),
									array('t'=>'แฟนคลับแมวกล่อง','id'=>'198496713513140','min'=>100),
									array('t'=>'แฟนคลับแมวตะกร้า','id'=>'178944882137764','min'=>100),
									array('t'=>'แฟนคลับเจ้าเหมียวสนูปปี้','id'=>'392237460795185','min'=>100),
									array('t'=>'รังของแมวก๊อง','id'=>'1534696463431854','min'=>100),
									
									
									
	);
	$db=_::db();
	
	$cur=$db->findone('msg',array('_id'=>'fbimage'));
	
	echo 'ค้นหา fb id : '.$cf['id'].'<br>';
	$cf=$db->findone('user',array('_id'=>1),array('sc.fb.token'=>1));
	$curpage = $cur['page'];
	$curpage++;
	if($curpage>=count($pages))
	{
		$curpage=0;
	}
	$db->update('msg',array('_id'=>'fbimage'),array('$set'=>array('page'=>$curpage)));
	$page=$pages[$curpage];
	
	require_once(HANDLERS.'facebook/facebook.php');
	facebook::$CURL_OPTS[CURLOPT_TIMEOUT]=300;
	$facebook=new facebook(array('appId'=>_::$config['social']['facebook']['appid'],'secret'=>_::$config['social']['facebook']['secret']));
	$facebook->setAccessToken($cf['sc']['fb']['token']);
	$facebook->setExtendedAccessToken();
	
	
	echo 'token: '.$cf['sc']['fb']['token'].'<br>';
	print_r($page);
	
	date_default_timezone_set('Asia/Bangkok');

	//$post = $facebook->api('/'.$page['id'].'/posts');
	
	$post = $facebook->api(array('method' => 'fql.query', 'query' => 'SELECT post_id,message , created_time, type,like_info.like_count, comment_info.comment_count, share_info.share_count, attachment  FROM stream WHERE source_id='.$page['id'].' and filter_key=\'owner\' ORDER BY created_time desc limit 0,20'));
	//_::time();
	echo '<pre>';
	//print_r($post);
	if(is_array($post)&&is_array($post))
	{
		$p=array();
		for($i=0;$i<count($post);$i++)
		{
			$lk=intval($post[$i]['like_info']['like_count']);
			$sh=intval($post[$i]['share_info']['share_count']);
			$cm=intval($post[$i]['comment_info']['comment_count']);
			
			//print_r($post[$i]);
			$img=$post[$i]['attachment']['media'][0]['src'];
			echo '--'.($lk.'+'.$sh.'+'.$cm).'>'.$page['min'].' -- '.$img.' = ';
			$all = $lk+$sh+$cm;
			if($all>$page['min'] && isset($post[$i]['attachment']['media']) 
																		&& isset($post[$i]['attachment']['media'][0]) 
																		&& isset($post[$i]['attachment']['media'][0]['photo']) 
																		&& isset($post[$i]['attachment']['media'][0]['photo']['images']) 
																		&& isset($post[$i]['attachment']['media'][0]['photo']['images'][0]))
			{
				$fimg = false;
				$md = $post[$i]['attachment']['media'][0]['photo']['images'];
				for($q=0;$q<count($md);$q++)
				{
					$_w=intval($md[$q]['width']);
					$_h=intval($md[$q]['height']);
					if($_w>=400 && $_h>=400 && $md[$q]['src'])
					{
						$fimg = $md[$q]['src'];	
					}
				}
				if(!$fimg)
				{
					$_pd = $post[$i]['attachment']['media'][0]['photo']['pid'];
					$_wi = $post[$i]['attachment']['media'][0]['photo']['width'];
					$_he = $post[$i]['attachment']['media'][0]['photo']['height'];
					if($_wi>=400 && $_he>=400)
					{
						if($post_src = $facebook->api(array('method' => 'fql.query', 'query' => "SELECT src_big FROM photo where pid = '".$_pd."'")))
						{
							//print_r($post_src);
							echo ' <strong style="color:#090">OK3 - </strong> - '.$post_src[0]['src_big'];
								
							if($post_src[0]['src_big'])
							{
								$fimg = $post_src[0]['src_big'];	
							}
						}
					}
					// SELECT src_big FROM photo where pid = '130185063856737_1073745830';
				}
				if($fimg)
				{
					echo ' <strong style="color:#090">OK2</strong> ';
					//print_r($post['data'][$i]);
					$t=strtotime($post[$i]['created_time']);
					$ar=array(
											'pid'=>$post[$i]['post_id'],
											'ms'=>$post[$i]['message'],
											'lk'=>$lk,
											'sh'=>$sh,
											'cm'=>$cm,
											'p'=>$page['t'],
											'fb'=>$page['id'],
											'fbid'=>$post[$i]['attachment']['media'][0]['photo']['fbid'],
											'ds'=>new MongoDate($t),
											'du'=>new MongoDate(time()),
										);
					if($p=$db->findone('fbimage2',array('pid'=>$ar['pid']),array('_id'=>1)))
					{
						echo "\r\n ---Found--- \r\n";
						unset($ar['pid']);
						$db->update('fbimage2',array('_id'=>$p['_id']),array('$set'=>$ar));
					}
					else
					{
						echo "\r\n ---Not Found--- \r\n";
						if($_posted=$db->insert('fbimage2',$ar))
						{
							echo "\r\n ---Inserted--- \r\n";
							$fd = _::folder()->fd($_posted);
							$folder = substr($fd,0,2).'/'.substr($fd,2,2);
							$name = substr($fd,4,2);
							
							//$q = _::upload()->send('s2','fbimage',$md[$fimg]['src'],array('folder'=>$folder,'name'=>$name));
							$q = _::upload()->send('s2','fbimage',$fimg,array('folder'=>$folder,'name'=>$name));
							if($q['status']=='OK')
							{
								$db->update('fbimage2',array('_id'=>$_posted),array('$set'=>array('fd'=>$folder,'n'=>$name)));
								echo '
								http://s2.boxza.com/fbimage/'.$folder.'/'.$name.'_n.jpg
								
								';
							}
							else
							{
								$db->remove('fbimage2',array('_id'=>$_posted));
								echo '
								----- NOT OK = '.print_r($q,true).' -----
								';
							}
						}
					}
				}
			}
			else
			{
				echo ' NO';
			}
			echo '<br>';
		}
	}
?>