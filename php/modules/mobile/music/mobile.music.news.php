<?php




if(is_numeric(_::$path[1]))
{
	require_once(__DIR__.'/mobile.music.news.view.php');
}
else
{
	require_once(__DIR__.'/mobile.music.news.home.php');
}

?>