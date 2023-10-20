import openfl.Lib;
import flixel.addons.effects.FlxTrail;

var chromaticAberration = new CustomShader("chromaticAberration");
var bright = new CustomShader("bright");

function create() {
	camGame.addShader(chromaticAberration);
	camHUD.addShader(chromaticAberration);
	if (!PlayState.opponentMode) {camGame.addShader(bright);}
	
	var tabiTrail = new FlxTrail(dad, null, 4, 24, 0.6, 0.9);
	tabiTrail.beforeCache = dad.beforeTrailCache;
	tabiTrail.afterCache = dad.afterTrailCache;
	insert(members.indexOf(overlayingsticks) - 1, tabiTrail);
}

// Shaky screen by Ne_Eo
function shakeWindow(magnitude:Float){
	if (FlxG.save.data.shakeShit || PlayState.opponentMode) {
		return false;
	} else {
		var randX:Bool = FlxG.random.bool(50);
		var randY:Bool = FlxG.random.bool(50);

		var xm = Std.int(Lib.application.window.width / (100 * magnitude));

		Lib.application.window.x += xm * (randX ? 1 : -1);
		Lib.application.window.y += xm * (randY ? 1 : -1);

		new FlxTimer().start(0.01, function(tmr:FlxTimer)
		{
			Lib.application.window.x -= xm * (randX ? 1 : -1);
			Lib.application.window.y -= xm * (randY ? 1 : -1);
		});
	}
}

function onPlayerHit(event:NoteHitEvent) {
	if (!FlxG.fullscreen || PlayState.opponentMode)
		shakeWindow(0);
}

function onDadHit(event:NoteHitEvent) {
	if (!FlxG.fullscreen || !PlayState.opponentMode)
		shakeWindow(1);
}

function update() {
    // sprite.alpha = health / 1;
    if (health / 2.8 - 1 && !FlxG.save.data.shaderShit) {
        bright.iTime = 2 / 32;
        bright.contrast = 2 / 8;
    } else {
        bright.iTime = health / 2.8;
        bright.contrast = health / 2.8;
    }	

	if (!FlxG.save.data.shakeShit)
    	camHUD.shake(0.005, (60 / Conductor.bpm), null, true, FlxAxes.X);
}

 // Camera stuff

function postUpdate(elapsed:Float) {
    camFollow.setPosition(650 * 2, 750);

	switch (curCameraTarget) {
		case 0:
			if (FlxG.save.data.shakeShit || !PlayState.opponentMode) {
				camGame.shake(0, 0, null, false);
			} else {
				camGame.shake(0.01, 0.01, null, true);
			}
			chromaticAberration.iTime = 2;
        	camFollow.setPosition(550 * 2, 750);
			FlxTween.tween(FlxG.camera, {zoom: 0.85}, (Conductor.stepCrochet * 4 / 2000), {ease: FlxEase.elasticInOut});
        	FlxG.camera.zoom = FlxMath.lerp(defaultCamZoom, FlxG.camera.zoom, 0.95);
		case 1:
			chromaticAberration.iTime = 0;
        	camFollow.setPosition(650 * 2, 750);
			FlxTween.tween(FlxG.camera, {zoom: 0.7}, (Conductor.stepCrochet * 4 / 2000), {ease: FlxEase.elasticInOut});
       		FlxG.camera.zoom = FlxMath.lerp(defaultCamZoom, FlxG.camera.zoom, 0.95);
	}

	if (FlxG.save.data.shaderShit)
		chromaticAberration.iTime = 0;
}

// Script by yashermania for changing noteskin

function onNoteCreation(event) {
	event.cancel();
	var note = event.note;
	
	if (!event.cancel) {
		switch (event.noteType) {
			default:
				note.frames = Paths.getFrames('game/notes/TabiNote');
			switch (event.strumID % 4 ) {
				case 0:
					note.animation.addByPrefix('scroll', 'purple0');
					note.animation.addByPrefix('hold', 'purple hold piece');
					note.animation.addByPrefix('holdend', 'pruple end hold');
				case 1:
					note.animation.addByPrefix('scroll', 'blue0');
					note.animation.addByPrefix('hold', 'blue hold piece');
					note.animation.addByPrefix('holdend', 'blue hold end');
				case 2:
					note.animation.addByPrefix('scroll', 'green0');
					note.animation.addByPrefix('hold', 'green hold piece');
					note.animation.addByPrefix('holdend', 'green hold end');
				case 3:
					note.animation.addByPrefix('scroll', 'red0');
					note.animation.addByPrefix('hold', 'red hold piece');
					note.animation.addByPrefix('holdend', 'red hold end');
			}
			note.scale.set(0.7, 0.7);
			note.updateHitbox();
		}
	}
}

function onStrumCreation(event) {
	event.cancel();
	var strum = event.strum;

	if (!event.cancel) {
		strum.frames = Paths.getFrames('game/notes/TabiNote');
		strum.animation.addByPrefix('green', 'arrowUP');
		strum.animation.addByPrefix('blue', 'arrowDOWN');
		strum.animation.addByPrefix('purple', 'arrowLEFT');
		strum.animation.addByPrefix('red', 'arrowRIGHT');
		strum.antialiasing = true;
		strum.scale.set(0.7,0.7);
		
		switch (event.strumID % 4) {
			case 0:
				strum.animation.addByPrefix("static", 'arrowLEFT0');
				strum.animation.addByPrefix("pressed", 'left press', 12, false);
				strum.animation.addByPrefix("confirm", 'left confirm', 24, false);
			case 1:
				strum.animation.addByPrefix("static", 'arrowDOWN0');
				strum.animation.addByPrefix("pressed", 'down press', 12, false);
				strum.animation.addByPrefix("confirm", 'down confirm', 24, false);
			case 2:
				strum.animation.addByPrefix("static", 'arrowUP0');
				strum.animation.addByPrefix("pressed", 'up press', 12, false);
				strum.animation.addByPrefix("confirm", 'up confirm', 24, false);
			case 3:
				strum.animation.addByPrefix("static", 'arrowRIGHT0');
				strum.animation.addByPrefix("pressed", 'right press', 12, false);
				strum.animation.addByPrefix("confirm", 'right confirm', 24, false);
		}	
		strum.updateHitbox();
	}
}