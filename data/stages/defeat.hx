var stophesalreadydead:Bool = false;

function onCountdown(e) {
	if (e.swagCounter == 4) {
		//defeat hud hide shit
		healthBar.visible = false;
		healthBarBG.visible = false;
		scoreTxt.visible = false;
		missesTxt.visible = false;
		accuracyTxt.visible = false;
		iconP2.visible = false;
		iconP1.visible = false;
	}
}

//todo: more flashy instant death
function postUpdate() {
	if (misses > 0 && !stophesalreadydead) {
		stophesalreadydead = true;
		camHUD.visible = false;
		inCutscene = true;
		canPause = false;
		camZooming = false;
		vocals.stop();
		camFollow.y = dad.getMidpoint().y - 200;
		camFollow.x = dad.getMidpoint().x - 950;	
		dad.playAnim('death', true);
		FlxG.sound.play(Paths.sound('black-death'));
		FlxTween.tween(FlxG.camera, {zoom: 1.2}, 1.5, {ease: FlxEase.circOut});
		new FlxTimer().start(0.6, function(tmr:FlxTimer)
		{
			gameOver();
		});
	}
}