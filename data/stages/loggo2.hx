var xx = 420.95;
var yy = 1700;
var xx2 = 652.9;
var yy2 = 1700;
var ofs = 50;

function stepHit(curStep) {
	if(curStep == 0) {
		defaultCamZoom = 0.9;
	}
	if (curStep % 8 == 0)
		peopleloggo.animation.play("bop", true);
}

function postCreate() {
	camHUD.bgColor = 0x96000000;
}

function postUpdate() {
	if(curCameraTarget == 0) {
		//defaultCamZoom = 0.9;
	switch(dad.animation.curAnim.name) {
		case 'singLEFT' | 'singLEFT-alt':
			camFollow.setPosition(xx-ofs,yy);
		case 'singRIGHT' | 'singRIGHT-alt':
			camFollow.setPosition(xx+ofs,yy);
		case 'singUP' | 'singUP-alt':
			camFollow.setPosition(xx,yy-ofs);
		case 'singDOWN' | 'singDOWN-alt':
			camFollow.setPosition(xx,yy+ofs);
		default:
			camFollow.setPosition(xx,yy);
	}
	} else {
		//defaultCamZoom = 0.9;
		if(dad.animation.curAnim.name == 'idle') {
			camFollow.setPosition(xx2,yy2);
		} else {
			switch(boyfriend.animation.curAnim.name) {
				case 'singLEFT' | 'singLEFT-alt':
					camFollow.setPosition(xx2-ofs,yy2);
				case 'singRIGHT' | 'singRIGHT-alt':
					camFollow.setPosition(xx2+ofs,yy2);
				case 'singUP' | 'singUP-alt':
					camFollow.setPosition(xx2,yy2-ofs);
				case 'singDOWN' | 'singDOWN-alt':
					camFollow.setPosition(xx2,yy2+ofs);
				default:
					camFollow.setPosition(xx2,yy2);
			}
		}
	}
}