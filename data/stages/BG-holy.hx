// uhh yeah..
import openfl.geom.ColorTransform;

var whiteBG = new FlxSprite();
function create(){

    sky.scale.set(1.1, 1);
    train.scale.set(1.4, 1.8);
    bgLamp.scale.set(1.1, 1.2);
    floorLamps.scale.set(1.1, 1.2);
    
    whiteBG.makeSolid(FlxG.width * 3, FlxG.height * 3, FlxColor.WHITE).alpha = 0.0001;
	whiteBG.x = whiteBG.y = -1000;
	insert(1, whiteBG);
}

function badApple(turn:String){
    if (turn == "on"){
        whiteBG.alpha = 1;
        boyfriend.color = 0x0000000;
        dad.color = 0x0000000;
        iconP1.color = 0x0000000;
        iconP2.color = 0x0000000;
        gf.color = 0x0000000;
        women.color = 0x0000000;
        Objects.color = 0x0000000;
        floor.color = 0x0000000;
        bgLamp.color = 0x0000000;

        sky.alpha = 0.0001;
        train.alpha = 0.0001;
        floorLamps.alpha = 0.0001;
    }
    if (turn == "off"){
        whiteBG.alpha = 0.0001;
        boyfriend.color = 0xFFFFFFF;
        dad.color = 0xFFFFFFF;
        iconP1.color = 0xFFFFFFF;
        iconP2.color = 0xFFFFFFF;
        gf.color = 0xFFFFFFF;
        women.color = 0xFFFFFFF;
        Objects.color = 0xFFFFFFF;
        floor.color = 0xFFFFFFF;
        bgLamp.color = 0xFFFFFFF;

        sky.alpha = 1;
        train.alpha = 1;
        floorLamps.alpha = 1;
    }
}

/*function postCreate(){
    gunFront1 = new FlxSprite();
	gunFront1.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront1.scrollFactor.set(1,1);
	gunFront1.updateHitbox();
    gunFront1.x = -2000;
    gunFront1.y = -1024;
    gunFront1.alpha = 0.0001;
	gunFront1.antialiasing = true;
	add(gunFront1);

    gunFront2 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront2.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront2.scrollFactor.set(1,1);
	gunFront2.updateHitbox();
    gunFront2.alpha = gunFront1.alpha;
	gunFront2.antialiasing = true;
	add(gunFront2);

    gunFront3 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront3.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront3.scrollFactor.set(1,1);
	gunFront3.updateHitbox();
    gunFront3.alpha = gunFront1.alpha;
	gunFront3.antialiasing = true;
	add(gunFront3);
    
    gunFront4 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront4.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront4.scrollFactor.set(1,1);
	gunFront4.updateHitbox();
    gunFront4.alpha = gunFront1.alpha;
	gunFront4.antialiasing = true;
	add(gunFront4);
    
    gunFront4 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront4.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront4.scrollFactor.set(1,1);
	gunFront4.updateHitbox();
    gunFront4.alpha = gunFront1.alpha;
	gunFront4.antialiasing = true;
	add(gunFront4);
    
    gunFront5 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront5.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront5.scrollFactor.set(1,1);
	gunFront5.updateHitbox();
    gunFront5.alpha = gunFront1.alpha;
	gunFront5.antialiasing = true;
	add(gunFront5);
    
    gunFront6 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront6.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront6.scrollFactor.set(1,1);
	gunFront6.updateHitbox();
    gunFront6.alpha = gunFront1.alpha;
	gunFront6.antialiasing = true;
	add(gunFront6);
    
    gunFront7 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront7.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront7.scrollFactor.set(1,1);
	gunFront7.updateHitbox();
    gunFront7.alpha = gunFront1.alpha;
	gunFront7.antialiasing = true;
	add(gunFront7);
    
    gunFront8 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront8.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront8.scrollFactor.set(1,1);
	gunFront8.updateHitbox();
    gunFront8.alpha = gunFront1.alpha;
	gunFront8.antialiasing = true;
	add(gunFront8);
    
    gunFront9 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront9.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront9.scrollFactor.set(1,1);
	gunFront9.updateHitbox();
    gunFront9.alpha = gunFront1.alpha;
	gunFront9.antialiasing = true;
	add(gunFront9);
    
    gunFront10 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront10.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront10.scrollFactor.set(1,1);
	gunFront10.updateHitbox();
    gunFront10.alpha = gunFront1.alpha;
	gunFront10.antialiasing = true;
	add(gunFront10);
    
    gunFront11 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront11.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront11.scrollFactor.set(1,1);
	gunFront11.updateHitbox();
    gunFront11.alpha = gunFront1.alpha;
	gunFront11.antialiasing = true;
	add(gunFront11);
    
    gunFront12 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront12.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront12.scrollFactor.set(1,1);
	gunFront12.updateHitbox();
    gunFront12.alpha = gunFront1.alpha;
	gunFront12.antialiasing = true;
	add(gunFront12);
    
    gunFront13 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront13.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront13.scrollFactor.set(1,1);
	gunFront13.updateHitbox();
    gunFront13.alpha = gunFront1.alpha;
	gunFront13.antialiasing = true;
	add(gunFront13);
    
    gunFront14 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront14.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront14.scrollFactor.set(1,1);
	gunFront14.updateHitbox();
    gunFront14.alpha = gunFront1.alpha;
	gunFront14.antialiasing = true;
	add(gunFront14);
    
    gunFront15 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront15.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront15.scrollFactor.set(1,1);
	gunFront15.updateHitbox();
    gunFront15.alpha = gunFront1.alpha;
	gunFront15.antialiasing = true;
	add(gunFront15);
    
    gunFront16 = new FlxSprite(gunFront1.x, gunFront1.y);
	gunFront16.loadGraphic(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'));
	gunFront16.scrollFactor.set(1,1);
	gunFront16.updateHitbox();
    gunFront16.alpha = gunFront1.alpha;
	gunFront16.antialiasing = true;
	add(gunFront16);

    gunFront1.cameras = [camHUD];
    gunFront2.camera = [camHUD];
    gunFront3.camera = [camHUD];
    gunFront4.camera = [camHUD];
    gunFront5.camera = [camHUD];
    gunFront6.camera = [camHUD];
    gunFront7.camera = [camHUD];
    gunFront8.camera = [camHUD];
    gunFront9.camera = [camHUD];
    gunFront10.camera = [camHUD];
    gunFront11.camera = [camHUD];
    gunFront12.camera = [camHUD];
    gunFront13.camera = [camHUD];
    gunFront14.camera = [camHUD];
    gunFront15.camera = [camHUD];
    gunFront16.camera = [camHUD];
}

var on:Bool = false;
function update(e) {
    if (on){
    gunFront1.alpha = 1;
	FlxTween.tween(gunFront1, {x:-976}, 0.02, {ease: FlxEase.linear});
	FlxTween.tween(gunFront1, {y:-2048}, 0.04, {ease: FlxEase.linear});
    } 
}*/
function beatHit(curBeat:Int) {
    if (curBeat % 2 == 0) women.animation.play("struggle", true);
    if (curSong == "salvation"){
        switch (curBeat) {
            case 408, 472, 672, 732: camHUD.flash();
            case 544, 742: 
                camHUD.flash();
                badApple("on");

            case 608, 876:
                camHUD.flash(); 
                badApple("off");
        }
    }
}
function stepHit(curStep:Int){
    if (curSong == "salvation")
        if (curStep > 1632 && curStep < 1888 || curStep > 2688 && curStep < 2928) camHUD.shake(0.008, 0.04);
}
