class HeartThingy extends flixel.FlxSprite 
{
	public var fadedelay:Int = 0;
	public var framee:Int = 0;
	public var speed:Float = 0;
	public function new(X,Y,SPEED:Float=1) 
	{
		super(X,Y);
		speed = SPEED;
		fadedelay = FlxG.random.int(240, 360);
		frames = Paths.getSparrowAtlas("stages/date/heartthingy");
		animation.addByPrefix("bump", "heartthing", 24, true);
		scrollFactor.set(0.8,0.8);
		antialiasing = true;
		active = true;
		alpha = 0.9;
	}
	
	public function update(elapsed:Float):Void 
	{
		
		y-= speed;
		framee ++;
		
		if (framee > fadedelay){
			alpha -= 0.01;
		}
		
		animation.play("bump"); 
		if (alpha > 0){
			super.update(elapsed);
		}else{
			active = false;
			visible = false;
		}
	}
	
}



var heartsThings:FlxSpriteGroup;
var film:FlxSprite;
var title:FlxSprite;
function create(){
	gf.visible = false;

	importScript('data/scripts/animatedDateIcon.hx');

    heartsThings = new FlxSpriteGroup();

    add(heartsThings);
    members.remove(heartsThings);
    members.insert(2,heartsThings);

	
	var shade:FlxSprite = new FlxSprite(-451.05,-560.15).loadGraphic(Paths.image("stages/date/shade"));
	shade.scrollFactor.set();
	shade.active = false;
	shade.blend = "multiply";
					
	var light:FlxSprite = new FlxSprite(155.05,-282.9).loadGraphic(Paths.image("stages/date/light"));
	light.active = false;
	light.antialiasing = true;
	light.blend = "add";
	light.alpha = 0.53;
					
					
	var deco:FlxSprite = new FlxSprite(-176.95,-28).loadGraphic(Paths.image("stages/date/deco"));
	deco.scrollFactor.set(1.5,1.5);
	deco.active = false;
	deco.antialiasing = true;
					
	add(shade);
	add(light);
	add(deco);

	
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

	/*if (!isStoryMode){
		film.alpha = 1;
		title.alpha = 1;
	}*/
}

function stepHit(){
    if(curBeat > 135){
        heartsThings.add(new HeartThingy(FlxG.random.int(0, 1280),500,FlxG.random.float(0.8, 1.2)));
		altContext = '-alt';
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
		camFollow.y = -900;
		//camFollow.x -= 200;
		FlxG.camera.focusOn(camFollow.getPosition());
	}
}