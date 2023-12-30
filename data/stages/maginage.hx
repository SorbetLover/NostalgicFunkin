import flixel.animation.FlxAnimationController;

// stage for Tic Tac Foe, Hit N' Strike(ugly ass song) and Acrimony.
var crowd2:FlxSprite;
var crowd1:FlxSprite;
var boombox:FlxSprite;
function postCreate(){
     

	//define bg anims becouse i cant make it STOP IF ITS ON THE XML FOR SOME REASON

boombox = new FlxSprite(1300, 1800);
boombox.frames = Paths.getSparrowAtlas("stages/maginage/boombox");
boombox.scale.set(1.2,1.2);
boombox.antialiasing = true;

boombox.animation.addByPrefix('idle', 'boombox', 24, true, false,false);
boombox.animation.stop();
insert(members.indexOf(bgshit) +1, boombox);
boombox.alpha = 0;


crowd2 = new FlxSprite(500, 1200);
crowd2.frames = Paths.getSparrowAtlas("stages/maginage/Crowd2");
crowd2.scale.set(1.2,1.2);
crowd2.antialiasing = true;

crowd2.animation.addByPrefix('idle', 'Crowd2_Idle', 24, true, false,false);
crowd2.animation.addByPrefix('cheer', 'cheer', 24, true, false,false);
crowd2.animation.stop();
insert(members.indexOf(bgshit) +1, crowd2);
crowd2.alpha = 0;


crowd1 = new FlxSprite(500, 1200);
crowd1.frames = Paths.getSparrowAtlas("stages/maginage/Crowd1");
crowd1.scale.set(1.2,1.2);
crowd1.antialiasing = true;

crowd1.animation.addByPrefix('idle', 'Crowd', 24, true, false,false);
crowd1.animation.stop();
insert(members.indexOf(bgshit) + 1, crowd1);
crowd1.alpha = 0;

abbyT = new FlxSprite(0, 0);
abbyT.frames = Paths.getSparrowAtlas("stages/maginage/abbyTransformation");
abbyT.scale.set(1.3,1.3);
abbyT.antialiasing = true;

abbyT.animation.addByPrefix('idle', 'AbbyTransform', 24, true, false,false);
abbyT.animation.stop();
insert(members.indexOf(strumLines.members[0].characters[1]) + 1, abbyT);
abbyT.alpha = 0;



//bf shit
boyfriend.scale.set(1.4,1.4);
boyfriend.x += 100;
boyfriend.y -= 80;

//song char shit
switch(PlayState.instance.curSong){
	case "tic tac foe": dad.scale.set(1.4,1.4);  dad.y -= 190; dad.x -= 100; boombox.alpha = 1;
    case "hit n' strike": dad.scale.set(1.2,1.2);  dad.y -= 300; dad.x -= 100; crowd1.alpha = 1; boombox.alpha = 1;
    case "acrimony": dad.scale.set(1.3,1.3);  strumLines.members[0].characters[1].scale.set(1.3,1.3); dad.y -= 70; dad.x -= 100; crowd2.alpha = 1; boombox.alpha = 1;
    
}
abbyT.x = strumLines.members[0].characters[0].x - 534;
abbyT.y = strumLines.members[0].characters[0].y - 54;
strumLines.members[0].characters[1].alpha = 0;
}

function postUpdate(){
	if(PlayState.instance.curSong == "acrimony"){
	switch(curCameraTarget){
        case 1:
            camGame.followLerp = 0.06;
        case 0:
            camGame.followLerp = 2;
        }
    }
}
function beatHit(curBeat){
	crowd2.animation.play("idle");
	crowd1.animation.play("idle");
	boombox.animation.play("idle");

// if(curBeat % 4 == 0){

// crowd2.animation.play("cheer");
// }
}

function stepHit(curStep){
	if(PlayState.instance.curSong == "acrimony"){

		switch(curStep){
			case 1048:
			new FlxTimer().start(2.0, function(Timer:FlxTimer)
			{ FlxG.sound.play(Paths.sound("maginage/transitionmicbreak")); });

			abbyT.alpha = 1;
			strumLines.members[0].characters[0].alpha = 0;
			abbyT.animation.play("idle", false);
			new FlxTimer().start(5.0, function(Timer:FlxTimer)
				{
					abbyT.alpha = 0;
					strumLines.members[0].characters[1].alpha = 1;
			});		
		}
	}
}
