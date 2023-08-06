//import flixel.addons.display.FlxBackdrop;
//import openfl.geom.ColorTransform;

//var bgApple = new FlxSprite().makeGraphic(FlxG.width*200,FlxG.height*200,0xFFFFFF);
//incase if needed
/*function resetColor(sprite:FlxSprite) {
    sprite.color = 0xFFffffff;
    sprite.setColorTransform();
    sprite.colorTransform.redMultiplier = 1;
    sprite.colorTransform.blueMultiplier = 1;
    sprite.colorTransform.greenMultiplier = 1;
    sprite.colorTransform.alphaMultiplier = 1;
    sprite.colorTransform.redOffset = 0;
    sprite.colorTransform.blueOffset = 0;
    sprite.colorTransform.greenOffset = 0;
    sprite.colorTransform.alphaOffset = 0;
    sprite.dirty = true;
}*/
//function badApple(choose:String/*, timer:String*///){
    /*if (choose == "a"){
    remove(gf);
    remove(boyfriend);
    remove(dad);
    boyfriend.colorTransform.color = (0x000000);
    dad.colorTransform.color = (0x000000);
    gf.colorTransform.color = (0x000000);
    sky.colorTransform.color = (0x000000);
    train.colorTransform.color = (0xFFFFFF);
    floor.colorTransform.color = (0x000000);
    bgLamp.colorTransform.color = (0xFFFFFF);
    floorLamps.colorTransform.color = (0x000000);
    women.colorTransform.color = (0x000000);
    Objects.colorTransform.color = (0x000000);
    healthBar.colorTransform.color = (0x000000);
    iconP1.colorTransform.color = (0x000000);
    iconP2.colorTransform.color = (0x000000);
    add(bgApple);
    bgApple.screenCenter();
    add(gf);
    add(dad);
    add(boyfriend);
    }
    if (choose == "b"){
    remove(bgApple);
    boyfriend.colorTransform = new ColorTransform();
    dad.colorTransform = new ColorTransform();
    gf.colorTransform = new ColorTransform();
    sky.colorTransform = new ColorTransform();
    train.colorTransform = new ColorTransform();
    floor.colorTransform = new ColorTransform();
    bgLamp.colorTransform = new ColorTransform();
    floorLamps.colorTransform = new ColorTransform();
    women.colorTransform = new ColorTransform();
    Objects.colorTransform = new ColorTransform();
    healthBar.colorTransform = new ColorTransform();
    iconP1.colorTransform = new ColorTransform();
    iconP2.colorTransform = new ColorTransform();
    }
}*/
function create(){
    sky.scale.set(1.1, 1);
    train.scale.set(1.4, 1.8);
    bgLamp.scale.set(1.1, 1.2);
    floorLamps.scale.set(1.1, 1.2);

	/*gunFront = new FlxBackdrop(Paths.image('stages/Vs Mami/HOLY_gunsfrontconstant'), 1, 1, true, true);
	//gunFront.setPosition(316.67,133.33);
    gunFront.cameras = [camHUD];
	gunFront.scrollFactor.set();
	gunFront.updateHitbox();
	gunFront.velocity.set(90, 180);
    gunFront.alpha = 1;
	gunFront.antialiasing = true;
	add(gunFront);*/

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
}

var on:Bool;
function update(e) {
    if (on == true){
    gunFront1.alpha = 1;
	FlxTween.tween(gunFront1, {x:-976}, 0.1, {ease: FlxEase.linear});
	FlxTween.tween(gunFront1, {y:-2048}, 0.65, {ease: FlxEase.linear});
    } 
}
function beatHit(curBeat:Int) {
    if (curBeat % 2 == 0){
        women.animation.play("struggle", true);
    }
    if (curSong == "salvation"){
    if (curBeat == 408){
        camHUD.flash();
        on = true;
    }
    if (curBeat == 472){
        camHUD.flash();
        on = false;
    }
    if (curBeat == 544){
        //badApple("a");
    }
    if (curBeat == 608){
        camHUD.flash();
        //badApple("b");
    }
    if (curBeat == 672){
        camHUD.flash();
        on = true;
    }
    if (curBeat == 732){
        camHUD.flash();
        on = false;
    }
    if (curBeat == 742){
        camHUD.flash();
        //badApple("a");
    }
    if (curBeat == 876){
        camHUD.flash();
        //badApple("b");
    }
}
}