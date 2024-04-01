importScript('songs/golfweek/nestedScripts/camera');
importScript('songs/golfweek/nestedScripts/ui');

var animArray:Array<String>=[];
public var bfturn = false;
public var _together = false;
var holeBeats = [];
var goodhit = false;

//uhh i added the change latest hole bc some times you would hit the note after the swing so it wouldnt update

function onPlayerHit(event){
    if(event.direction == 0){
        goodhit = true;
        changeLatestHole(1);
    }
    /*event.accuracy = 1;
    event.rating = 'sick';
    event.score = 300;*/
    event.healthGain = 2/6;
}
function onPlayerMiss(event){
    if(event.direction == 0){
        goodhit = false;
        changeLatestHole(-1);
    }

    event.healthGain = -((2/6)+0.0000001);
    displayRating('game/score/shit');
}

function create(){
    animArray = CoolUtil.coolTextFile(Paths.txt('golfWeek/'+PlayState.SONG.meta.displayName));

    for(anim in animArray)
        holeBeats.push(0);

    if(PlayState.SONG.meta.displayName== 'endless')
        importScript('songs/golfweek/nestedScripts/miku');

}

function holeIn(value)
    holeBeats[curBeat + 2] = value;

function changeLatestHole(val){
    var num = holeBeats.length-1;
    while(num > -1){
        if(holeBeats[num]!=0){
            holeBeats[num] = val;
            num = -2;
            return;
        }
        num--;
    }
}

public function checkNextEvent(){
    var i = 1;
    while(true){
        if(animArray[curBeat+i] != '-')
            return animArray[curBeat+i];
        i++;
    }
    return '';
}

function beatHit(){
    if(animArray[curBeat] != '-')
        scripts.call(animArray[curBeat]);

    switch(holeBeats[curBeat]){
        case 1:
            stage.stageSprites.get('golfbg').playAnim('goodhit');
        case -1:
            stage.stageSprites.get('golfbg').playAnim('badhit');
        default:
            stage.stageSprites.get('golfbg').playAnim('normal');
    }
}



function ready(){
    cancelTween();
    FlxTween.tween(FlxG.camera, {zoom: 1}, (Conductor.stepCrochet * 4 / 1000), {ease: FlxEase.elasticInOut});
    
    vocals.volume = 1;
    if(_together)
        gf.playAnim('ready2');
    else
        gf.playAnim('ready');

    if (!bfturn || _together){
        dad.playAnim('ready');
        dad.debugMode = true;//debug mode to stop idling
    }
    if(bfturn || _together){
        boyfriend.playAnim('ready');
        boyfriend.debugMode = true;//debug mode to stop idling
    }
    returnFoucs();
}

function and(){
    vocals.volume = 1;
    returnFoucs();
    
    if(!bfturn || _together)
        dad.playAnim('and');

    if(bfturn || _together)
        boyfriend.playAnim('and');

    if(_together)
        gf.playAnim('and3'); 
    else if(bfturn)
        gf.playAnim('and');
    else
        gf.playAnim('and2');
}

function swing(){
    foucsON('hole');

    gf.playAnim('swing');
    
    if (goodhit || !bfturn)
        holeIn(1);
    else
        holeIn(-1);

    
    dad.debugMode = false;//debug mode to stop idling
    boyfriend.debugMode = false;//debug mode to stop idling
    
   showNote('purple');                 
}


function goodjob(){
    FlxTween.tween(FlxG.camera, {zoom: 1}, (Conductor.stepCrochet * 4/ 1000), {ease: FlxEase.elasticInOut});
    
    bfturn = false;
    _together = false;
    if (goodhit)
        gf.playAnim('goodjob');
    else
        gf.playAnim('sad');
    
    foucsON('gf');
}

var strikeaTween;

var leanTween;

function strikea(){
    returnFoucs();
    
    if (!_together)
        strikeaTween = FlxTween.tween(FlxG.camera, {zoom: 1.02}, (Conductor.stepCrochet * 4.02 / 1000), {ease: FlxEase.cubeIn});
        
    vocals.volume = 1;
    gf.playAnim('strikea');
}

var poseTween;

function pose(){
    vocals.volume = 1;

    returnFoucs();

    if(!_together){
        cancelTween();

        poseTween = FlxTween.tween(FlxG.camera, {zoom: 1.3}, (Conductor.stepCrochet * 4 / 1000), {ease: FlxEase.quadOut});

        if (bfturn)
            cameraLeanTo(100,50);
        else
            cameraLeanTo(-100,50);
    }
    
    gf.playAnim('pose');
    
   showNote('green');
}

function together(){
    gf.playAnim('together');
    _together = true;
    
    returnFoucs();
}

function yourturn(){
    cancelTween();
    FlxTween.tween(FlxG.camera, {zoom: 1}, (Conductor.stepCrochet * 4 / 1000), {ease: FlxEase.elasticInOut});
    
    vocals.volume = 1;
    bfturn = true;
    
    returnFoucs();

    gf.playAnim('pose');
}

function returnFoucs(){
    if(!_together){
        if(bfturn)
            foucsON('boyfriend');
        else
            foucsON('dad');
    }else
        foucsON('both');
}

function miku()
    foucsON('miku');

function cancelTween(){
    if(poseTween != null && !poseTween.finished){
        poseTween.cancel();
        FlxG.camera.zoom = 1.3;
    }
    
    if(strikeaTween != null  && !strikeaTween.finished){
        strikeaTween.cancel();
        FlxG.camera.zoom = 1.02;
    }
}