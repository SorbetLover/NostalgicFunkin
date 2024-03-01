var void:FlxSprite;
var black:FlxSprite;

function create(){
    trace('hello :)');

	black = new FlxSprite().makeSolid(FlxG.width + 1000, FlxG.height + 1000, FlxColor.BLACK);
	black.screenCenter();
	black.scrollFactor.set();
	black.alpha = 1;
	add(black);

        dialogueBgAlpha = 0;
		void = new FlxSprite(0, 1500);
		void.frames = Paths.getSparrowAtlas('stages/Vs Void/week1_cutscene');
		void.animation.addByPrefix('anim1', 'Cutscene First', 12, false);
		void.animation.addByPrefix('anim2', 'Cutscene Second', 12, false);
		void.animation.addByPrefix('anim3', 'Cutscene Third', 12, false);
		void.setGraphicSize(Std.int(void.width * 1.8));
		void.antialiasing = true;
		void.updateHitbox();
		add(void);

		void.screenCenter(FlxAxes.X);

		void.scrollFactor.set(0,0);

		void.animation.play('anim1', true);

		new FlxTimer().start(0.3, function(tmr:FlxTimer)
		{
			FlxG.sound.play(Paths.sound('Vs Void/cutSounds/VoidVoiceline1'), 0.8);
		}, 1);

		new FlxTimer().start(2.2, function(tmr:FlxTimer)
		{
			FlxG.sound.play(Paths.sound('Vs Void/cutSounds/Whoosh'), 1.0);

		}, 1);

		new FlxTimer().start(3.3, function(tmr:FlxTimer)
		{
			FlxTween.tween(void,{y: -300}, 3, {ease: FlxEase.expoOut});

		}, 1);

		new FlxTimer().start(6.5, function(tmr:FlxTimer)
		{
			void.animation.play('anim2', true);

			FlxG.sound.play(Paths.sound('Vs Void/cutSounds/VoidFace'), 1.0);
		}, 1);

		new FlxTimer().start(8.5, function(tmr:FlxTimer)
		{
			void.animation.play('anim3', true);

		}, 1);

		new FlxTimer().start(10.4, function(tmr:FlxTimer)
		{
			void.alpha = 0;

		}, 1);

		new FlxTimer().start(11.0, function(tmr:FlxTimer)
		{
            dialogueBgAlpha = 0;
            dialogueBgAlpha = 0.5;
            game.startCutscene(null, function() close());
		}, 1);
}