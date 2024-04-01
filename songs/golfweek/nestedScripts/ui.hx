import flixel.effects.FlxFlicker;
var noteIndicator:FlxSprite;

function create(){  
    strumLines.visible = false;

	noteIndicator = new FlxSprite(100, 100);
    noteIndicator.frames = Paths.getSparrowAtlas('game/notes/default');
    noteIndicator.alpha = 0;
    noteIndicator.animation.addByPrefix('green', 'green0');
    noteIndicator.animation.addByPrefix('purple', 'purple0');
    noteIndicator.animation.play('purple');
    noteIndicator.antialiasing = true;
    noteIndicator.scrollFactor.set();
    noteIndicator.cameras = [camHUD];
    add(noteIndicator);
}

public function showNote(anim){
    noteIndicator.alpha = 1;
    noteIndicator.scale.set(1.1, 1.1);
    noteIndicator.animation.play(anim);
    FlxTween.tween(noteIndicator.scale, {x:1,y:1}, 0.2, {ease:FlxEase.linear,onComplete:function(e)
    {
        FlxTween.tween(noteIndicator, {alpha:0}, 0.3, {ease:FlxEase.linear});
    }});
}

function ready(){
    if (!bfturn || _together){
        FlxFlicker.flicker(iconP2, 0);
        if (!_together)
            FlxFlicker.stopFlickering(iconP1);
    }
    if(bfturn || _together){
        FlxFlicker.flicker(iconP1, 0);
        if (!_together)
            FlxFlicker.stopFlickering(iconP2);
    }
}

function goodjob(){
    FlxFlicker.stopFlickering(iconP1);
    if(checkNextEvent() != 'miku' && checkNextEvent() != 'ready' && checkNextEvent() != 'together')
        FlxFlicker.flicker(iconP2, 0);
}

function together(){
    FlxFlicker.flicker(iconP1, 0);
    FlxFlicker.flicker(iconP2, 0);
}

function yourturn(){
    if(checkNextEvent() != 'ready')
        FlxFlicker.flicker(iconP1, 0);
    FlxFlicker.stopFlickering(iconP2);
}