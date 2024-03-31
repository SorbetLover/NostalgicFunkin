var game;
var dialogueList;

function create(){
    //setup
	persistentUpdate = true;
	persistentDraw = true;

    game = PlayState.instance;

    //defaults
    game.camFollow.x = game.dad.getCameraPosition().x;
    game.camFollow.y = game.dad.getCameraPosition().y;
    FlxG.camera.zoom = 0.8;

	var black:FlxSprite = new FlxSprite(0,0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	black.scrollFactor.set();
    black.cameras = [game.camHUD];
	add(black);

    game.iconP1.visible = false;
    game.iconP2.visible = false;
    game.healthBarBG.visible = false;
    game.healthBar.visible = false;
    game.scoreTxt.visible = false;
    game.missesTxt.visible = false;
    game.accuracyTxt.visible = false;
    
	new FlxTimer().start(0.3, function(tmr:FlxTimer)
    {
        black.alpha -= 0.15;
    
        if (black.alpha > 0)
            tmr.reset(0.3);
        else
        {
            createDialog();
    
            remove(black);
        }
    });

    dialogueList = CoolUtil.coolTextFile(Paths.txt('golfWeek/golfDia'));
}

var bgFade;
var box;
var portraitLeft;
var swagDialogue;
var dropText;

function createDialog(){
	bgFade = new FlxSprite(0,0).makeGraphic(FlxG.width,FlxG.height, 0xFFB3DFd8);
	bgFade.scrollFactor.set();
	bgFade.alpha = 0;
    bgFade.cameras = [game.camHUD];
	add(bgFade);

	new FlxTimer().start(0.83, function(tmr:FlxTimer)
	{
		bgFade.alpha += (1 / 5) * 0.7;
		if (bgFade.alpha > 0.7)
			bgFade.alpha = 0.7;
	}, 5);

    
	portraitLeft = new FlxSprite(76.05, 130.05);
	portraitLeft.frames = Paths.getSparrowAtlas('dialogue/characters/carol-golf');
	portraitLeft.animation.addByPrefix('enter', 'port', 24, false);
	portraitLeft.updateHitbox();
	portraitLeft.scrollFactor.set();
    portraitLeft.cameras = [game.camHUD];
	add(portraitLeft);

	box = new FlxSprite(0,0);
    box.loadGraphic(Paths.image('dialogue/boxes/golfDia'));
	box.screenCenter(FlxAxes.x);
    box.cameras = [game.camHUD];
	add(box);

    
	dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
	dropText.font = 'Pixel Arial 11 Bold';
	dropText.color = 0xFFD89494;
    dropText.cameras = [game.camHUD];
	add(dropText);
    
	swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
	swagDialogue.font = 'Pixel Arial 11 Bold';
	swagDialogue.color = 0xFF3F2021;
	swagDialogue.sounds = [FlxG.sound.load(Paths.sound('dialogue/text-pixel'), 0.6)];
    swagDialogue.cameras = [game.camHUD];
	add(swagDialogue);

    startDialogue();
}

function startDialogue(){
	swagDialogue.resetText(dialogueList[0]);
	swagDialogue.start(0.04, true);

	portraitLeft.animation.play('enter',true);
}

var ended = false;

function update(){
    dropText.text = swagDialogue.text;
    if(FlxG.keys.justPressed.ANY && !ended){
        FlxG.sound.play(Paths.sound('dialogue/next-pixel'), 0.8);

		if (dialogueList[1] == null && dialogueList[0] != null){
            ended = true;
			new FlxTimer().start(0.2, function(tmr:FlxTimer)
			{
				box.alpha -= 1 / 5;
				bgFade.alpha -= 1 / 5 * 0.7;
				portraitLeft.alpha -= 1 / 5 * 0.7;
				swagDialogue.alpha -= 1 / 5;
				dropText.alpha = swagDialogue.alpha;
			}, 5);

			new FlxTimer().start(1.2, function(tmr:FlxTimer)
			{
                game.iconP1.visible = true;
                game.iconP2.visible = true;
                game.healthBarBG.visible = true;
                game.healthBar.visible = true;
                game.scoreTxt.visible = true;
                game.missesTxt.visible = true;
                game.accuracyTxt.visible = true;
                close();
			});
        }
        else{      
		    dialogueList.remove(dialogueList[0]);
		    startDialogue();
        }
    }
}