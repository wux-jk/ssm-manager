//音乐删除
function clearMusic(){
	$("#musicDiv").remove();
}
//打开音乐
clearMusic();
function addMusic(img,music,word){
	$.messager.show({
		title:'提示',
		height:'300px',
		msg:'<h3>"'+word+'"</h3> '+' <img src="'+img+'" width="100px" height="100px"/>',
		timeout:3000,
		showType:'slide'
	});
	$("body").append('<div id="musicDiv"><audio autoplay="autoplay"  loop="loop" preload="auto" src="'+music+'"></audio></div>');
	window.setTimeout('clearMusic()', 5000);

}
