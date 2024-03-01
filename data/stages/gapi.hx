var black:FLxSprite;
var meowing:Bool = false;

//mecha shi
var dochud:FlxSprite;
var dadheart:FlxSprite;
var bfheart:FlxSprite;

var hudSprites:Array<Dynamic> = [];
var beatSprites:Array<Dynamic> = [];

function create(){
    dad.danceInterval = 2;
    black = new FlxSprite().makeGraphic(FlxG.width,FlxG.height,FlxColor.BLACK);
    black.cameras = [camHUD];
    members.insert(0,black);
    starlight('false');

    dochud = new FlxSprite(13,490);
    dochud.loadGraphic(Paths.image('stages/skyVerse/gapi/doctor/docgui'));
    hudSprites.push(dochud);

    dadheart = new FlxSprite(44,550);
    dadheart.loadGraphic(Paths.image('stages/skyVerse/gapi/doctor/keithna heart'));
    hudSprites.push(dadheart);

    bfheart = new FlxSprite(1092,544);
    bfheart.loadGraphic(Paths.image('stages/skyVerse/gapi/doctor/kitheart'));
    hudSprites.push(bfheart);

    for(i in 0...6){
        var beat:FlxSprite = new FlxSprite(222+(106*i),538);
        beat.frames = Paths.getSparrowAtlas('stages/skyVerse/gapi/doctor/beat');
        beat.animation.addByIndices('beat','beat',[0,1,2,3],'',24,false);
        beat.animation.addByIndices('silent','beat',[4,5,6],'',24);
        beat.animation.play('beat');
        beat.ID = i;
        hudSprites.push(beat);
        beatSprites.push(beat);
    }

    for(sprite in hudSprites){
        sprite.cameras = [camHUD];
        sprite.antialiasing = true;
        add(sprite);
    }

    doctorHandler(4,'false');
}

function beatHit(){
    if(!startingSong){
        if(dad.getAnimName() == 'idle' && curBeat%dad.danceInterval == 0)
            dad.playAnim('idle',true,"dance");
    }

    //mecha
    dadheart.scale.x = 1.2;
    dadheart.scale.y = 1.2;
    
    bfheart.scale.x = 1.2;
    bfheart.scale.y = 1.2;
}

function onNoteHit(){
    if(meowing)
        dad.playAnim('hey',true);
}

//events

function onBeat(val)
    dad.danceInterval = val == "true" ? 1 : 2;

function starlight(val)
    FlxTween.tween(black,{alpha: ((val == "true") ? 1 : 0.0000000000000000000000001) },0.3);

function meow(val){
    strumLines.members[0].animSuffix = val == "true" ? 'animation suffix that doesnt exist so it cancels the animation' : '';
    meowing = val == "true";
}

//the FUCKING mechanic <3

var doctorEnabled:Bool = false;

var speedFactor:Int = 4;
var daBeats:Array<Int> = [1,0,0,0,0,0,0];

var curStep_:Int = 0;
var oldStep:Int = -1;

var daBeat:Int = 0;
var oldDabeat:Int = -1;

var startMS:Float = 0.0;

var canHit:Bool = false;

function doctorHandler(speed,beats){
    speedFactor = Std.parseInt(speed);

    daBeats = [];
    if(beats != 'false'){
        for(beat in beats.split(';'))
            daBeats.push(Std.parseInt(beat));
    }
    
    doctorEnabled = (beats != 'false');
    curStep_ = 0;
    oldStep = -1;
    oldDabeat = -1;
    startMS = inst.time;

    FlxTween.tween(FlxG.camera,{alpha:(doctorEnabled ? 0.5 : 1)},0.1);

    for(sprite in hudSprites){
        sprite.alpha = (doctorEnabled ? 1 : 0.00000000000000000001);
        sprite.offset.y = 0;
    }

    for(beat in beatSprites){
        if(daBeats[beat.ID] == 1)
            beat.animation.play('silent',true);
    }
        
}

function update(){
    for(sprite in hudSprites){
        sprite.offset.y = FlxMath.lerp(sprite.offset.y,300,0.1);
        sprite.scale.x = FlxMath.lerp(sprite.scale.x,1,0.01);
        sprite.scale.y = FlxMath.lerp(sprite.scale.y,1,0.01);
    }

    if(doctorEnabled){
        curStep_ = Math.floor((inst.time-startMS+Conductor.songOffset)/Conductor.stepCrochet);
        if(oldStep < curStep_)
            onStep();
        oldStep = curStep_;

        if(canHit){
            if(FlxG.keys.justPressed.SPACE){
                health += 0.1;
                canHit = false;
            }
        }

    }

}

function onStep(){
    daBeat = Math.floor(curStep_/speedFactor);
    if(oldDabeat < daBeat)
        onBeat();
    oldDabeat = daBeat;
}

function onBeat(){
    for(beat in beatSprites){
        if(beat.ID == daBeat && beat.animation.curAnim.name != 'silent')
            beat.animation.play('beat',true);
    }

    canHit = daBeat == 6;
}