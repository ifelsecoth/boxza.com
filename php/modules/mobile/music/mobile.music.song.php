<?php

if(is_numeric(_::$path[1]))
{
	require_once(__DIR__.'/mobile.music.song.view.php');
}
else
{
	require_once(__DIR__.'/mobile.music.song.home.php');
}
?>