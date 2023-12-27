import flixel.animation.FlxAnimationController;

// stage for Tic Tac Foe, Hit N' Strike(ugly ass song) and Acrimony.
var crowd2:FlxSprite;

function postCreate(){
	//define bg anims becouse i cant make it STOP IF ITS ON THE XML FOR SOME REASON

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


//bf shit
boyfriend.scale.set(1.4,1.4);
boyfriend.x += 100;
boyfriend.y -= 80;

//song char shit
switch(PlayState.instance.curSong){
	case "tic tac foe": dad.scale.set(1.4,1.4);  dad.y -= 190; dad.x -= 100; 
}
}

function postUpdate(){
	if(crowd2.animation.curAnim.name == "cheer"){
		crowd2.y = 1190;
	}else{ crowd2.y = 1200; }
}
function beatHit(curBeat){
	crowd2.animation.play("idle");
	crowd1.animation.play("idle");

// if(curBeat % 4 == 0){

// crowd2.animation.play("cheer");
// }
}