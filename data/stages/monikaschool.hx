function create() {
	importScript("data/scripts/pixel");
	if (PlayState.SONG.meta.name.toLowerCase() == "bara-no-yume") {
		bgGirls.animation.remove("danceLeft");
		bgGirls.animation.remove("danceRight");
		bgGirls.animation.addByIndices('danceLeft', 'BG fangirls dissuaded', CoolUtil.numberArray(14), "", 24, false);
		bgGirls.animation.addByIndices('danceRight', 'BG fangirls dissuaded', CoolUtil.numberArray(30, 15), "", 24, false);
	}
	bgGirls.animation.play("danceLeft", true); // horrible fix, please fix later
}

function postCreate(){
	if(PlayState.SONG.meta.name == "your-reality"){
		boyfriend.x += 100;
		boyfriend.y -= 50;
	}
}