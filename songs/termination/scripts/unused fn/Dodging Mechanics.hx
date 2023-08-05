// the fact that this script is from 'Bad Time YCE Port' and The Basement Show YCE Port, yeah I made it :P
// also idk how to add the double,triple,and quadraple alert and dodging feature ;-;
var dodgeing = false;
var isblue = false;
var alarmsign = false;
var hellmode = true;
var AlarmMode = true;

function update(elapsed:Float){

	if(FlxG.keys.justPressed.SPACE)
		dodgeing = true;
        //remove(thing);
	//if(FlxG.keys.justPressed.SPACE && isblue && alarmsign)
    //    playBFsAnim("dodge", true);
}
var uhh:FlxSprite;
function uhh(){
    dodgeing = false;
	//switch(FlxG.random.int(0,1))
	/*{
		case 0:
			isblue = true;
			alarmsign = true;
			var uhh;
			if(AlarmMode)
				{
                    uhh = new FlxSprite(375, 60);   
                    uhh.updateHitbox();
                    uhh.cameras = [camHUD];
                    uhh.antialiasing = true;
                    uhh.scrollFactor.set(0, 0);
                    uhh.scale.set(1.1, 1.1);
                    var SparrowAtlasuhh = Paths.getSparrowAtlas("spacebar");
                    uhh.frames = SparrowAtlasuhh;
                    uhh.animation.addByPrefix("fuck you", "spacebar", 24, true);
                    uhh.animation.play("fuck you");
                    add(uhh);
                    FlxG.sound.play(Paths.sound("DODGE"));
                }
                var thing:FlxSprite = new FlxSprite(0, 0);
                var SparrowAtlasthing = Paths.getSparrowAtlas("spacebar");
                thing.frames = SparrowAtlasthing;
                thing.animation.addByPrefix("fuck you", "spacebar", 24, true);
                thing.animation.play("fuck you");
                thing.x = PlayState.boyfriend.x - (thing.width * 4);
                thing.y = PlayState.boyfriend.y + (thing.height * 2);
                FlxG.sound.play(Paths.sound("DODGE"));
                add(uhh);
                new FlxTimer().start(0.5, function(tmr)
                    {
                        alarmsign = false;
                        remove(uhh);
                        add(thing);
                        FlxG.sound.play(Paths.sound("Dodged"));
    
                        if(dodgeing)
                        {
                        if(hellmode)
                            {
                                FlxG.sound.play(Paths.sound("Dodged"));
                                //ded.visible = true;
                                new FlxTimer().start(1, function(tmr)
                                {
                                    health = 0;
                                });
                            }
                            else
                                {
                                    health -= 1;
                                    boyfriend.playAnim("singDOWNmiss",true);
                                }
                        }
    
                        new FlxTimer().start(0.5, function(tmr)
                            {
                                remove(thing);
                            });
                    });
                    case 1:*/
                        isblue = false;
                        var uhh;
                        switch(AlarmMode)
                        case 1:
                            {
                                uhh = new FlxSprite(134.5, 30);   
                                uhh.updateHitbox();
                                uhh.cameras = [camHUD];
                                uhh.antialiasing = true;
                                uhh.scrollFactor.set(0, 0);
                                uhh.scale.set(1.1, 1.1);
                                var SparrowAtlasuhh = Paths.getSparrowAtlas("stages/Vs QT/qt-port/attack_alert_NEW");
                                uhh.frames = SparrowAtlasuhh;
                                uhh.animation.addByPrefix("fuck you", "kb_attack_animation_alert-single", 24, true);
                                uhh.animation.play("fuck you");
                                add(uhh);
                                FlxG.sound.play(Paths.sound("hazard/alert"));
                            }
                        case 2:
                            {
                                uhh = new FlxSprite(134.5, 30);   
                                uhh.updateHitbox();
                                uhh.cameras = [camHUD];
                                uhh.antialiasing = true;
                                uhh.scrollFactor.set(0, 0);
                                uhh.scale.set(1.1, 1.1);
                                var SparrowAtlasuhh = Paths.getSparrowAtlas("stages/Vs QT/qt-port/attack_alert_NEW");
                                uhh.frames = SparrowAtlasuhh;
                                uhh.animation.addByPrefix("fuck you", "kb_attack_animation_alert-single", 24, true);
                                uhh.animation.play("fuck you");
                                add(uhh);
                                FlxG.sound.play(Paths.sound("hazard/alert"));
                            }
                            var thing:FlxSprite = new FlxSprite(375, -60);
                            var SparrowAtlasthing = Paths.getSparrowAtlas("stages/Vs QT/qt-port/attackv6");
                            thing.frames = SparrowAtlasthing;
                            thing.animation.addByPrefix("fuck you", "kb_attack_animation_prepare", 24, true);
                            thing.animation.addByPrefix("dodge", "kb_attack_animation_fire", 24, true);
                            thing.animation.play("fuck you");
                            thing.x = PlayState.boyfriend.x - (thing.width * 4);
                            thing.y = PlayState.boyfriend.y + (thing.height * 2);
                            FlxG.sound.play(Paths.sound("hazard/dodge01"));
                            add(uhh);
                            new FlxTimer().start(0.7, function(tmr)
                                {
                                    remove(uhh);
                                    add(thing);
                                    FlxG.sound.play(Paths.sound("hazard/alert"));
                
                                    if(dodgeing)
                                        playBFsAnim("dodge", true);
                                    else
                                    {
                                    if(hellmode)
                                        {
                                            FlxG.sound.play(Paths.sound("hazard/sawbladeHit"));
                                            //ded.visible = true;
                                            new FlxTimer().start(2, function(tmr)
                                            {
                                                health = 0;
                                            });
                                        }
                                        else
                                            {
                                                health -= 1;
                                                boyfriend.playAnim("singDOWNmiss",true);
                                            }
                                    }
                                    if(FlxG.keys.justPressed.SPACE)
                                        remove(thing);
                                    thing.animation.play("dodge");
                                    gf.animation.play("scared", true);
                
                                    //new FlxTimer().start(0.7, function(tmr)
                                    //    {
                                    //        remove(thing);
                                    //    });
                            });
    //}
}
function stepHit(){
    if (curStep == 72){
        uhh();
    }
    if (curStep == 340){
        uhh();
    }
    if (curStep == 421){
        uhh();
    }
    if (curStep == 508){
        uhh();
    }
    if (curStep == 854){
        uhh();
    }
    if (curStep == 1200){
        uhh();
    }
    if (curStep == 1287){
        uhh();
    }
    if (curStep == 1373){
        uhh();
    }
    if (curStep == 1557){
        uhh();
    }
    /*if (curStep == 1200){
        uhh();
    }
    if (curStep == 1200){
        uhh();
    }
    if (curStep == 1200){
        uhh();
    }
    if (curStep == 1200){
        uhh();
    }
    if (curStep == 1200){
        uhh();
    }
    if (curStep == 1200){
        uhh();
    }
    if (curStep == 1200){
        uhh();
    }
    if (curStep == 1200){
        uhh();
    }
    if (curStep == 1200){
        uhh();
    }
    if (curStep == 1200){
        uhh();
    }*/
    if (curStep == 1631){
        uhh();
    }

}