
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
			kill();
		}
	}
	
}

var heartsThings:FlxSpriteGroup;

var characters_walking2:FlxSprite;
var characters_walking:FlxSprite;
public var moveNOWWW:Bool = true;

var chars:Array<String> = ["daliaayanna", "sarvruv", "koukapi","selsunday","macybob","tabifunsize","solnik","garcanchor","susyukichi","eddsworld","silly","jadssmokey","cvalkolsan","violetruria","bobbosip","jojo","dionnekaya"];
var chars2:Array<String> = ["hexabigail","mikutricky", "nenedarnell" ,"pompomstatic","lnosans","unified","starlight","weedbud","natecre","kermojordo"];
public static var charswhohavewalked:Array<String> = [];
public static var charswhohavewalked2:Array<String> = [];

var stopSTOPITSTOPITNOW:Int = 270;

function create(){
	gf.visible = false;

	importScript('data/scripts/animatedDateIcon.hx');

    heartsThings = new FlxSpriteGroup();

    add(heartsThings);
    members.remove(heartsThings);
    members.insert(5,heartsThings);

	characters_walking2 = this.stage.stageSprites.get('characters_walking2');
	characters_walking = this.stage.stageSprites.get('characters_walking');

	for(i in 0...chars2.length)
		characters_walking2.animation.addByIndices(chars2[i], "characters_walking_bg", [0+i*12, 1+i*12, 2+i*12, 3+i*12, 4+i*12, 5+i*12, 6+i*12, 7+i*12, 8+i*12, 9+i*12, 10+i*12, 11+i*12], "", 24, true);

	characters_walking2.animation.play(chars2[FlxG.random.int(0,chars2.length-1)]);

	for(i in 0...chars.length)
		characters_walking.animation.addByIndices(chars[i], "characters_walking", [0+i*12, 1+i*12, 2+i*12, 3+i*12, 4+i*12, 5+i*12, 6+i*12, 7+i*12, 8+i*12, 9+i*12, 10+i*12, 11+i*12], "", 24, true);

	characters_walking.animation.addByIndices("dionnekaya", "characters_walking", [192,193,194,195,196,197,198,199,200,201,202,203], "", 24, true);
								
	randomCharacter();
	
	
	var shade:FlxSprite = new FlxSprite(-451.05,-560.15).loadGraphic(Paths.image("stages/date/shade"));
	shade.scrollFactor.set();
	shade.blend = "multiply";					
	add(shade);

	var light:FlxSprite = new FlxSprite(155.05,-282.9).loadGraphic(Paths.image("stages/date/light"));
	light.antialiasing = true;
	light.blend = "add";
	light.alpha = 0.53;		
	add(light);		
					
	var deco:FlxSprite = new FlxSprite(-176.95,-28).loadGraphic(Paths.image("stages/date/deco"));
	deco.scrollFactor.set(1.5,1.5);
	deco.antialiasing = true;
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
	title.animation.addByIndices("title", "title", [2,3],"", 12);
	title.animation.play("title");
	title.antialiasing = true;
	title.screenCenter();
	title.scrollFactor.set();
	add(title);

	if (!isStoryMode){
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
		camFollow.y = -900;
		//camFollow.x -= 200;
		FlxG.camera.focusOn(camFollow.getPosition());
	}
}


function stepHit(){
    if(curBeat > 135)
        heartsThings.add(new HeartThingy(FlxG.random.int(0, 1280),500,FlxG.random.float(0.8, 1.2)));
}

function randomCharacter(){
	characters_walking.animation.play(chars[FlxG.random.int(0, chars.length-1)]);
	if(characters_walking.animation.name == 'bopbosip')//**disappointed**
		randomCharacter();
}

function update(){
	
					if (characters_walking.animation.curAnim.name == "selsunday" || characters_walking.animation.curAnim.name == "jojo" ){
						if(moveNOWWW)characters_walking.x += 8;
						if (characters_walking.x > 1434.4){
							if (characters_walking.animation.curAnim.name == characters_walking.animation.curAnim.name && charswhohavewalked.contains(characters_walking.animation.curAnim.name)){//if it's still the same character
								characters_walking.animation.play(chars[FlxG.random.int(0, chars.length - 1)]);//change the character (i should make this a function)
								if (curBeat > stopSTOPITSTOPITNOW) moveNOWWW = false;
							
								}else{
									charswhohavewalked.push(characters_walking.animation.curAnim.name);
								}
						}
					}else if(chars.lastIndexOf(characters_walking.animation.curAnim.name) % 2 == 0){
						if(moveNOWWW)characters_walking.x -= 2;
						if (characters_walking.x < -900){
							if (characters_walking.animation.curAnim.name == characters_walking.animation.curAnim.name  && charswhohavewalked.contains(characters_walking.animation.curAnim.name)){//if it's still the same character
								characters_walking.animation.play(chars[FlxG.random.int(0, chars.length - 1)]);//change the character
								if (curBeat > stopSTOPITSTOPITNOW) moveNOWWW = false;
							
								}else{
									if(!charswhohavewalked.contains(characters_walking.animation.curAnim.name))charswhohavewalked.push(characters_walking.animation.curAnim.name);
								}
						}
					}else {
						if(moveNOWWW)characters_walking.x += 2;
						if (characters_walking.x > 1434.4){
							if (characters_walking.animation.curAnim.name == characters_walking.animation.curAnim.name  && charswhohavewalked.contains(characters_walking.animation.curAnim.name)){//if it's still the same character
								randomCharacter();
								if (curBeat > stopSTOPITSTOPITNOW) moveNOWWW = false;
								
								}else{
									if(!charswhohavewalked.contains(characters_walking.animation.curAnim.name))charswhohavewalked.push(characters_walking.animation.curAnim.name);
								}
						}
					}
						if(chars2.lastIndexOf(characters_walking2.animation.curAnim.name) % 2 == 0){
							characters_walking2.x -= 2.1;
							if (characters_walking2.x < -1000 && characters_walking2.animation != null && characters_walking2.animation.curAnim != null){
								if (characters_walking2.animation.curAnim.name == characters_walking2.animation.curAnim.name && charswhohavewalked2.contains(characters_walking2.animation.curAnim.name)){//if it's still the same character
									characters_walking2.animation.play(chars2[FlxG.random.int(0, chars2.length-1)]);//change the character
									
								}else{
									if(!charswhohavewalked2.contains(characters_walking2.animation.curAnim.name))charswhohavewalked2.push(characters_walking2.animation.curAnim.name);
								}
							}
						}else{
							characters_walking2.x += 2.1;
							if (characters_walking2.x > 1634.4 && characters_walking2.animation != null && characters_walking2.animation.curAnim != null){
								if (characters_walking2.animation.curAnim.name == characters_walking2.animation.curAnim.name && charswhohavewalked2.contains(characters_walking2.animation.curAnim.name)){//if it's still the same character
									
									characters_walking2.animation.play(chars2[FlxG.random.int(0, chars2.length-1)]);//change the character (i should make this a function)
									
								}else{
									if(!charswhohavewalked2.contains(characters_walking2.animation.curAnim.name))charswhohavewalked2.push(characters_walking2.animation.curAnim.name);
								}
							}
						}
						
				if (charswhohavewalked2.length >= chars2.length) charswhohavewalked2 = [];
				if (charswhohavewalked.length >= chars.length) charswhohavewalked = [];

				
					
}