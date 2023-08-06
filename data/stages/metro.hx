function create(){	
    defaultCamZoom = 0.75;

    remove(comboGroup);
    remove(gf);
    remove(dad);
    remove(boyfriend);

    var metroSky:FlxSprite = new FlxSprite(-300, -220).loadGraphic(Paths.image('stages/Vs Void/space/metroSky'));
    metroSky.setGraphicSize(Std.int(metroSky.width * 1.3));
    metroSky.updateHitbox();
    metroSky.antialiasing = true;
    metroSky.scrollFactor.set(0.1, 0.1);
    metroSky.active = false;
    add(metroSky);

    var metroCityBG:FlxSprite = new FlxSprite(-200, 230).loadGraphic(Paths.image('stages/Vs Void/space/metroCityBG'));
    metroCityBG.setGraphicSize(Std.int(metroCityBG.width * 1.2));
    metroCityBG.updateHitbox();
    metroCityBG.antialiasing = true;
    metroCityBG.scrollFactor.set(0.2, 0.2);
    metroCityBG.updateHitbox();
    metroCityBG.active = false;
    add(metroCityBG);

    var metroLightB:FlxSprite = new FlxSprite(-120, 50).loadGraphic(Paths.image('stages/Vs Void/space/metroLightB'));
    metroLightB.setGraphicSize(Std.int(metroLightB.width * 1.1));
    metroLightB.updateHitbox();
    metroLightB.antialiasing = true;
    metroLightB.scrollFactor.set(0.4, 0.4);
    metroLightB.updateHitbox();
    metroLightB.active = false;
    metroLightB.angle = -20;
    add(metroLightB);

    new FlxTimer().start(0.01, function(tmr:FlxTimer)
        {
            if(metroLightB.angle == -20) 
                FlxTween.angle(metroLightB, metroLightB.angle, 45, 4, {ease: FlxEase.quadInOut});
            if (metroLightB.angle == 45) 
                FlxTween.angle(metroLightB, metroLightB.angle, -20, 4, {ease: FlxEase.quadInOut});
        }, 0);

    var metroLightG:FlxSprite = new FlxSprite(680, 50).loadGraphic(Paths.image('stages/Vs Void/space/metroLightG'));
    metroLightG.setGraphicSize(Std.int(metroLightG.width * 1.1));
    metroLightG.updateHitbox();
    metroLightG.antialiasing = true;
    metroLightG.scrollFactor.set(0.4, 0.4);
    metroLightG.updateHitbox();
    metroLightG.active = false;
    metroLightG.angle = 20;
    add(metroLightG);

    new FlxTimer().start(0.01, function(tmr:FlxTimer)
        {
            if(metroLightG.angle == 20) 
                FlxTween.angle(metroLightG, metroLightG.angle, -45, 5, {ease: FlxEase.quadInOut});
            if (metroLightG.angle == -45) 
                FlxTween.angle(metroLightG, metroLightG.angle, 20, 5, {ease: FlxEase.quadInOut});
        }, 0);

    var metroRoof:FlxSprite = new FlxSprite(-570, 40).loadGraphic(Paths.image('stages/Vs Void/space/metroRoof'));
    metroRoof.setGraphicSize(Std.int(metroRoof.width * 1.4));
    metroRoof.updateHitbox();
    metroRoof.antialiasing = true;
    metroRoof.active = false;
    add(metroRoof);

    add(gf);
    add(dad);
    add(boyfriend);
    add(comboGroup);

    // Offsets
        gf.y = 100;
        gf.x = 400;
        dad.x = -40;
        dad.y = 120;
        boyfriend.x = 845;
        boyfriend.y = 160;
}
function update(elapsed:Float) {
}
function stepHit(curStep:Int) {
    switch (curStep){}
}
function beatHit(curBeat:Int) {
    switch (curBeat){
    }
    switch (curBeat)
    {
        case 0:
            gfSpeed = 2;
        case 64:
            gfSpeed = 1;
        case 320:
            gfSpeed = 2;
        case 352:
            gfSpeed = 1;
        case 448:
            gfSpeed = 2;
    }		
}