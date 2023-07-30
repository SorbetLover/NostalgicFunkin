import openfl.Lib;

var chromaticAberration = new CustomShader("chromaticAberration");
var bright = new CustomShader("bright");
var enableFlxTrail = true;
var tabi_left:FlxSprite;
var tabi_down:FlxSprite;
var tabi_up:FlxSprite;
var tabi_right:FlxSprite;

function create() {
	camGame.addShader(chromaticAberration);
	camHUD.addShader(chromaticAberration);
	if (!PlayState.opponentMode) {camGame.addShader(bright);}
	
	// FlxTrail stuff
	if (!PlayState.opponentMode) {
		tabi_left = new FlxSprite(dad.x - 400, dad.y + 20);
		tabi_left.frames =  Paths.getSparrowAtlas("characters/Vs Tabi/MadTabi");
		tabi_left.animation.frameIndex = 23; // left
		tabi_left.antialiasing = true;
		insert(members.indexOf(dad), tabi_left);
		tabi_left.alpha = 0.00001;
	
		tabi_down = new FlxSprite(dad.x - 10, dad.y + 65);
		tabi_down.frames =  Paths.getSparrowAtlas("characters/Vs Tabi/MadTabi");
		tabi_down.animation.frameIndex = 0; // down
		tabi_down.antialiasing = true;
		insert(members.indexOf(dad), tabi_down);
		tabi_down.alpha = 0.0001;
	
		tabi_up = new FlxSprite(dad.x - 50, dad.y - 90);
		tabi_up.frames =  Paths.getSparrowAtlas("characters/Vs Tabi/MadTabi");
		tabi_up.animation.frameIndex = 41; // up
		tabi_up.antialiasing = true;
		insert(members.indexOf(dad), tabi_up);
		tabi_up.alpha = 0.00001;
	
		tabi_right = new FlxSprite(550, dad.y + 10);
		tabi_right.frames =  Paths.getSparrowAtlas("characters/Vs Tabi/MadTabi");
		tabi_right.animation.frameIndex = 31; // right
		tabi_right.antialiasing = true;
		insert(members.indexOf(dad), tabi_right);
		tabi_right.alpha = 0.00001;
	} else {
		tabi_down.visible = false;
		tabi_up.visible = false;
		tabi_right.visible = false;
		tabi_left.visible = false;
	}
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
	if (!FlxG.fullscreen || !PlayState.opponentMode) {
		shakeWindow(1);
	}
	// FlxTrail shit
	if (enableFlxTrail) {
		switch(event.direction) {
			case 0:
				tabi_left.alpha = 0.5;
				var bleh_left = new FlxTimer().start(0.5, function(singLEFT:FlxTimer){
					// tabi_left.alpha = 0.00001;
					FlxTween.tween(tabi_left, {alpha: 0.00001}, 0.1);
				});
			
			case 1:
				tabi_down.alpha = 0.5;
				var bleh_down = new FlxTimer().start(0.5, function(singDOWN:FlxTimer){
					// tabi_down.alpha = 0.00001;
					FlxTween.tween(tabi_down, {alpha: 0.00001}, 0.1);
				});
			
			case 2:
				tabi_up.alpha = 0.5;
				var bleh_up = new FlxTimer().start(0.5, function(singUP:FlxTimer){
				// tabi_up.alpha = 0.00001;
				FlxTween.tween(tabi_up, {alpha: 0.00001}, 0.1);
			});

			case 3:
				tabi_right.alpha = 0.5;
				var bleh_right = new FlxTimer().start(0.5, function(singRIGHT:FlxTimer){
				// tabi_right.alpha = 0.00001;
				FlxTween.tween(tabi_right, {alpha: 0.00001}, 0.1);
			});
		}
	}
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