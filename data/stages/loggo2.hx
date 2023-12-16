var xx = 420.95;
var yy = 1700;
var xx2 = 652.9;
var yy2 = 1700;
var ofs = 50;

function stepHit(curStep) {
	if (curStep % 8 == 0)
		peopleloggo.animation.play("bop", true);
}

function postCreate() {
	var darknessLojo:FlxSprite = new FlxSprite(-800, -800).makeGraphic(FlxG.width * 3, FlxG.height * 3, 0xFF000000);
	darknessLojo.antialiasing = true;
	darknessLojo.alpha = 0.5;
	darknessLojo.scrollFactor.set(0, 0);
	add(darknessLojo);
	darknessLojo.cameras = [camGame];
}

function postUpdate() {
	if(curCameraTarget == 0) {
		defaultCamZoom = 0.9;
	switch(dad.animation.curAnim.name) {
		case 'singLEFT' | 'singLEFT-alt':
			camFollow.x = xx - ofs;
			camFollow.y = yy;
		case 'singRIGHT' | 'singRIGHT-alt':
			camFollow.x = xx + ofs;
			camFollow.y = yy;
		case 'singUP' | 'singUP-alt':
			camFollow.x = xx;
			camFollow.y = yy - ofs;
		case 'singDOWN' | 'singDOWN-alt':
			camFollow.x = xx;
			camFollow.y = yy + ofs;
		default:
			camFollow.x = xx;
			camFollow.y = yy;
	}
	} else {
		defaultCamZoom = 0.9;
	switch(boyfriend.animation.curAnim.name) {
		case 'singLEFT' | 'singLEFT-alt':
			camFollow.x = xx2 - ofs;
			camFollow.y = yy2;
		case 'singRIGHT' | 'singRIGHT-alt':
			camFollow.x = xx2 + ofs;
			camFollow.y = yy2;
		case 'singUP' | 'singUP-alt':
			camFollow.x = xx2;
			camFollow.y = yy2 - ofs;
		case 'singDOWN' | 'singDOWN-alt':
			camFollow.x = xx2;
			camFollow.y = yy2 + ofs;
		default:
			camFollow.x = xx2;
			camFollow.y = yy2;
	}
	}
}