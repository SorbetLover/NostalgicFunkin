var file:FlxSprite;
var title:FlxSprite;

function postCreate(){
	film = new FlxSprite(0, 0);
	film.frames = Paths.getSparrowAtlas("stages/date/film");
	film.animation.addByPrefix("idle", "film", 24);
	film.antialiasing = true;
	film.screenCenter();
	film.animation.play("idle");
	film.scrollFactor.set();
	add(film);

	title = new FlxSprite(0, 0);
	title.frames = Paths.getSparrowAtlas("stages/date/title");
	title.animation.addByIndices("whitroll", "title", [0,1],"", 12);
	title.animation.addByIndices("perfume", "title", [2,3],"", 12);
	title.animation.addByIndices("heartbass", "title", [4,5],"", 12);
	title.antialiasing = true;
	title.screenCenter();
	title.animation.play(curSong);
	title.scrollFactor.set();
	add(title);

	if (!playCutscenes){
		film.alpha = 0;
		title.alpha = 0;
	}
}
var stillInCountDown:Bool = true;

function onStartCountdown(event){	
	event.cancel();
	startedCountdown = true;
	startingSong = true;
	Conductor.songPosition = -(0.5*1000);
	startTimer = new FlxTimer().start((Conductor.crochet / 1000)*4, function(tmr:FlxTimer)
	{
		film.animation.stop();
		film.active = false;
		title.active = false;
						
		FlxTween.tween(film, {alpha: 0}, Conductor.crochet / 1000, {ease: FlxEase.cubeInOut});
		FlxTween.tween(title, {alpha: 0}, Conductor.crochet / 1000, {ease: FlxEase.cubeInOut});
		stillInCountDown = false;
	});
}

function draw(){
	if(stillInCountDown){
		if(playCutscenes)
			camFollow.y = -900;
		//camFollow.x -= 200;
		FlxG.camera.focusOn(camFollow.getPosition());
	}
}