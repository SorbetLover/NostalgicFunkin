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
	camHUD.bgColor = 0x96000000;
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
		if(dad.animation.curAnim.name == 'idle') {
			camFollow.x = xx2;
			camFollow.y = yy2;
		} else {
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
}