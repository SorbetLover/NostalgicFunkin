import openfl.Lib;
var isbobmad:Bool = true;
var bobmadshake:FlxSprite;
var bobsound:FlxSound;

function create() {
    bobmadshake = new FlxSprite( -198, -118).loadGraphic(Paths.image('stages/bob/hell/hello'));
    bobmadshake.scrollFactor.set(0, 0);
    bobmadshake.visible = false;

    bobsound = new FlxSound().loadEmbedded(Paths.sound('bob/bobscreen'));
    add(bobmadshake);
}

function beatHit(b) {
    if (b % gfSpeed == 0 && FlxG.save.data.shakeShit)
	{
		camHUD.shake(0.02, 0.2);
		FlxG.camera.shake(0.005, 0.2);
	}


    if (FlxG.random.bool(10) && isbobmad)
        Bobismad();
}

function resetBobismad():Void
{
	camHUD.visible = true;
	bobsound.pause();
	bobmadshake.visible = false;
	bobsound.volume = 0;
	isbobmad = true;
}

function Bobismad()
{
	camHUD.visible = false;
	bobmadshake.visible = true;
	bobsound.play();
	bobsound.volume = 1;
	isbobmad = false;
	if (!FlxG.fullscreen) shakescreen();
	new FlxTimer().start(0.5 , function(tmr:FlxTimer)
	{
		resetBobismad();
	});
}

function shakescreen()
{
	new FlxTimer().start(0.01, function(tmr:FlxTimer)
	{
		Lib.application.window.move(Lib.application.window.x + FlxG.random.int( -10, 10),Lib.application.window.y + FlxG.random.int( -8, 8));
	}, 50);
}