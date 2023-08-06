function create(){	
    defaultCamZoom = 0.60;

    remove(comboGroup);
    remove(gf);
    remove(dad);
    remove(boyfriend);

    if (curSong =='gravity')
    {	
        darkSpaceBG = new FlxSprite(-500, -220);
        darkSpaceBG.frames = Paths.getSparrowAtlas('stages/Vs Void/space/darkSpaceBG');
        darkSpaceBG.animation.addByPrefix('bloop', 'Bg Bloop', 6, true);
        darkSpaceBG.updateHitbox();
        darkSpaceBG.antialiasing = true;
        darkSpaceBG.scrollFactor.set(0.1, 0.1);
        darkSpaceBG.setGraphicSize(Std.int(darkSpaceBG.width * 1.7));
        darkSpaceBG.updateHitbox();
        add(darkSpaceBG);
        insert(members.indexOf(dad)-1, darkSpaceBG);

        darkSpaceBG.animation.play('bloop', true);
    }
    else
    {
        var tintedSpaceBG:FlxSprite = new FlxSprite(-500, -220).loadGraphic(Paths.image('stages/Vs Void/space/tintedSpaceBG'));
        tintedSpaceBG.setGraphicSize(Std.int(tintedSpaceBG.width * 1.7));
        tintedSpaceBG.updateHitbox();
        tintedSpaceBG.antialiasing = true;
        tintedSpaceBG.scrollFactor.set(0.1, 0.1);
        tintedSpaceBG.active = false;
        add(tintedSpaceBG);
        insert(members.indexOf(dad)-1, tintedSpaceBG);
    }

    if (curSong =='security')
    {	
        holoEmptyV = new FlxSprite(-360, -360);
        holoEmptyV.frames = Paths.getSparrowAtlas('stages/Vs Void/space/holoEmpty-V');
        holoEmptyV.animation.addByPrefix('bop', 'Holo Boppers', 24, false);
        holoEmptyV.antialiasing = true;
        holoEmptyV.scrollFactor.set(0.2, 0.2);
        holoEmptyV.setGraphicSize(Std.int(holoEmptyV.width * 1.15));
        holoEmptyV.updateHitbox();
        add(holoEmptyV);
        insert(members.indexOf(dad)-1, holoEmptyV);	
        
        new FlxTimer().start(3.2, function(tmr:FlxTimer)
        {
            if(holoEmptyV.y == -330) FlxTween.tween(holoEmptyV, {y: -360}, 3.1, 
                {ease: FlxEase.quadInOut});
            else  FlxTween.tween(holoEmptyV, {y: -330}, 3.1, 
                {ease: FlxEase.quadInOut});
        }, 0);
    }
    else
    {
        holoEmpty = new FlxSprite(-360, -360);
        holoEmpty.frames = Paths.getSparrowAtlas('stages/Vs Void/space/holoEmpty');
        holoEmpty.animation.addByPrefix('bop', 'Holo Boppers', 24, false);
        holoEmpty.antialiasing = true;
        holoEmpty.scrollFactor.set(0.2, 0.2);
        holoEmpty.setGraphicSize(Std.int(holoEmpty.width * 1.15));
        holoEmpty.updateHitbox();
        add(holoEmpty);
        insert(members.indexOf(dad)-1, holoEmpty);
        
        holoEmptyAlt = new FlxSprite(-360, -360);
        holoEmptyAlt.frames = Paths.getSparrowAtlas('stages/Vs Void/space/holoEmptyAlt');
        holoEmptyAlt.animation.addByPrefix('bop', 'Holo Boppers', 24, false);
        holoEmptyAlt.antialiasing = true;
        holoEmptyAlt.scrollFactor.set(0.2, 0.2);
        holoEmptyAlt.setGraphicSize(Std.int(holoEmptyAlt.width * 1.15));
        holoEmptyAlt.updateHitbox();
        holoEmptyAlt.alpha = 0;
        add(holoEmptyAlt);
        insert(members.indexOf(dad)-1, holoEmptyAlt);
        
        new FlxTimer().start(3.2, function(tmr:FlxTimer)
        {
            if(holoEmpty.y == -330) FlxTween.tween(holoEmpty, {y: -360}, 3.1, 
                {ease: FlxEase.quadInOut});
            else  FlxTween.tween(holoEmpty, {y: -330}, 3.1, 
                {ease: FlxEase.quadInOut});
        }, 0);

        new FlxTimer().start(3.2, function(tmr:FlxTimer)
        {
            if(holoEmptyAlt.y == -330) FlxTween.tween(holoEmptyAlt, {y: -360}, 3.1, 
                {ease: FlxEase.quadInOut});
            else  FlxTween.tween(holoEmptyAlt, {y: -330}, 3.1, 
                {ease: FlxEase.quadInOut});
        }, 0);
    }

    /*phillyTrain = new FlxSprite(2000, -50).loadGraphic(Paths.image('space/zippyrocks'));
    if(FlxG.save.data.distractions){
        add(phillyTrain);
    }

    trainSound = new FlxSound().loadEmbedded(Paths.sound('asteroids_pass'));
    FlxG.sound.list.add(trainSound);*/
                
    var spacerocks:FlxSprite = new FlxSprite(-360, -30).loadGraphic(Paths.image('stages/Vs Void/space/darkSpacerocks'));	
    spacerocks.updateHitbox();			
    spacerocks.antialiasing = true;
    spacerocks.scrollFactor.set(0.4, 0.4);
    spacerocks.active = false;
    add(spacerocks);
    insert(members.indexOf(dad)-1, spacerocks);

    new FlxTimer().start(3, function(tmr:FlxTimer)
    {
        if(spacerocks.y == -65) FlxTween.tween(spacerocks, {y: -30}, 2.9, 
            {ease: FlxEase.quadInOut});
        else  FlxTween.tween(spacerocks, {y: -65}, 2.9, 
            {ease: FlxEase.quadInOut});
    }, 0);

    bgBreak = new FlxSprite(-320, -500);
    bgBreak.frames = Paths.getSparrowAtlas('stages/Vs Void/space/bgBreak');
    bgBreak.animation.addByPrefix('init', 'Initial', 12, false);
    bgBreak.animation.addByPrefix('break1', '1st Break', 12, false);
    bgBreak.animation.addByPrefix('break2', '2nd Break', 12, false);
    bgBreak.setGraphicSize(Std.int(bgBreak.width * 1.3));
    bgBreak.updateHitbox();
    bgBreak.antialiasing = true;
    bgBreak.scrollFactor.set(0.1, 0.1);
    add(bgBreak);
    insert(members.indexOf(dad)-1, bgBreak);

    bgBreak.animation.play('init', true);

    if (curSong =='security')
    {
        spacestageAlt = new FlxSprite(-500, -330);
        spacestageAlt.frames = Paths.getSparrowAtlas('stages/Vs Void/space/spacestageAlt');
        spacestageAlt.animation.addByPrefix('bop', 'Stage Bop', 24, false);
        spacestageAlt.antialiasing = true;
        spacestageAlt.setGraphicSize(Std.int(spacestageAlt.width * 1.2));
        spacestageAlt.updateHitbox();
        add(spacestageAlt);
        insert(members.indexOf(dad)-1, spacestageAlt);
    }
    else
    {
        spacestage = new FlxSprite(-500, -330);
        spacestage.frames = Paths.getSparrowAtlas('stages/Vs Void/space/spacestage');
        spacestage.animation.addByPrefix('bop', 'Stage Bop', 24, false);
        spacestage.antialiasing = true;
        spacestage.setGraphicSize(Std.int(spacestage.width * 1.2));
        spacestage.updateHitbox();
        add(spacestage);
        insert(members.indexOf(dad)-1, spacestage);	
    }

    var spacerocksFG:FlxSprite = new FlxSprite(-1620, -160).loadGraphic(Paths.image('stages/Vs Void/space/spacerocksFG'));
    spacerocksFG.setGraphicSize(Std.int(spacerocksFG.width * 1.3));
    spacerocksFG.updateHitbox();			
    spacerocksFG.antialiasing = true;
    spacerocksFG.scrollFactor.set(1.6, 1.6);
    spacerocksFG.active = false;
    add(spacerocksFG);
    insert(members.indexOf(boyfriend)+1, spacerocksFG);

    new FlxTimer().start(3, function(tmr:FlxTimer)
    {
        if(spacerocksFG.y == -120) FlxTween.tween(spacerocksFG, {y: -160}, 2.9, 
            {ease: FlxEase.quadInOut});
        else  FlxTween.tween(spacerocksFG, {y: -120}, 2.9, 
            {ease: FlxEase.quadInOut});
    }, 0);

    specialAnim = new FlxSprite(dad.x, dad.y -20);
    specialAnim.frames = Paths.getSparrowAtlas('stages/Vs Void/space/specialAnim');
    specialAnim.animation.addByPrefix('pose', 'Void Pose', 12, false);
    specialAnim.animation.addByPrefix('wink', 'Void Wink', 12, false);
    specialAnim.animation.addByPrefix('flinch', 'Flinch A', 12, false);
    specialAnim.animation.addByPrefix('secondflinch', 'Flinch B', 12, false);
    specialAnim.animation.addByPrefix('snap', 'Snap A', 12, false);
    specialAnim.animation.addByPrefix('secondsnap', 'Snap B', 12, false);
    specialAnim.updateHitbox();
    specialAnim.alpha = 0;
    specialAnim.antialiasing = true;
    specialAnim.updateHitbox();
    add(specialAnim);
    insert(members.indexOf(dad)+1, specialAnim);

    add(gf);
    add(dad);
    add(boyfriend);
    add(comboGroup);

    // Offsets
    if (curSong == "ultraviolet" || curSong == "gravity"){
        gf.y = 200;
        gf.x = 380;
        dad.x = -240;
        dad.y = 100;
        boyfriend.x = 730;
        boyfriend.y = 120;
    }
}
function update(elapsed:Float) {
}
function stepHit(curStep:Int) {
    switch (curStep){}
}
function beatHit(curBeat:Int) {
    switch (curBeat){
    }
    if (curSong == "ultraviolet"){
        
			switch (curBeat)
			{
				case 352:

					dad.alpha = 0;

					specialAnim.alpha = 1;

					FlxTween.tween(FlxG.camera, {zoom: 0.85}, 0.5, 
						{ease: FlxEase.expoOut});

				case 356:

					dad.alpha = 1;

					specialAnim.alpha = 0;
    }
}
    if (curSong == "gravity"){
        
				switch (curBeat)
				{
					case 338:

						camGame.shake(0.002, 0.5, null, true, null);

					case 339:

						camGame.shake(0.003, 0.5, null, true, null);

					case 340:

						FlxG.camera.flash(FlxColor.WHITE, 1.8);

						dad.alpha = 0;
						specialAnim.alpha = 1;

						holoEmpty.alpha = 0;

						holoEmptyAlt.alpha = 1;

						new FlxTimer().start(0.3, function(tmr:FlxTimer)
						{
							bgBreak.animation.play('break1', true);
						}, 1);

						camGame.shake(0.005, 0.5, null, true, null);
						camHUD.shake(0.003, 0.5, null, true, null);

						FlxTween.tween(FlxG.camera, {zoom: 0.75}, 2.1, 
							{ease: FlxEase.quadOut});

					case 345:

						//remove(dad);
						//dad = new Character(dad.x, dad.y, 'hurt-void');
						//add(dad);

					case 346:

						dad.alpha = 1;
						specialAnim.alpha = 0;

					case 366:

						dad.alpha = 0;
						specialAnim.alpha = 1;

					case 368:

						FlxG.camera.flash(FlxColor.BLACK, 1.5);

						dad.alpha = 1;
						specialAnim.alpha = 0;

						//remove(dad);
						//dad = new Character(dad.x, dad.y, 'darkcrazed-void');
						//add(dad);

						darkSpaceBG.alpha = 0.15;
						holoEmptyAlt.alpha = 0;

					case 424:

						FlxG.camera.flash(FlxColor.WHITE, 1.2);

						//remove(dad);
						//dad = new Character(dad.x, dad.y, 'crazed-void');
						//add(dad);

						darkSpaceBG.alpha = 1;
						holoEmptyAlt.alpha = 1;

					case 526:

						camGame.shake(0.003, 1.5, null, true, null);
					
					case 528:

						bgBreak.animation.play('break2', true);

						camGame.shake(0.006, 0.5, null, true, null);
						camHUD.shake(0.003, 0.5, null, true, null);
				
					case 564:

						FlxTween.tween(FlxG.camera, {zoom: 1.0}, 4.2, 
							{ease: FlxEase.quadIn});
				}
    }
    if (curSong == "security"){
        if (curBeat == 62){
            dad.playAnim("cough", true);
        }
        switch (curBeat)
        {
            case 32:
                camZooming = true;

                FlxTween.tween(FlxG.camera, {zoom: 0.85}, 0.7, 
                    {ease: FlxEase.expoOut});

            case 64:
                defaultCamZoom = 0.60;
        }
    }
}