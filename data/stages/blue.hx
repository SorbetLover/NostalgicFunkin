function create(){
    stage.stageSprites.get('gameboy').playAnim('idle');
    stage.stageSprites.get('bluethoughts').playAnim('thought');
}

function beatHit(){
    if(stage.stageSprites.get('boombox').animation.curAnim.name == 'beat') 
        stage.stageSprites.get('boombox').playAnim('beat');
}

function stepHit(){
    if(stage.stageSprites.get('gameboy').animation.curAnim.name == 'chip' && (curStep%4==2)) 
        stage.stageSprites.get('gameboy').playAnim('chip');
}

//events

/*function onCameraMove(e){
    e.cancel();
    camFollow.x = FlxG.random.int(100,500);
}*/

function setGfSpeed(speed)
    strumLines.members[1].characters[0].danceInterval = speed;

function showThought(){
    for(thought in ['bluethoughts',"bfthought"]){
        var alpha = stage.stageSprites.get(thought).alpha;
        FlxTween.tween(stage.stageSprites.get(thought),{alpha: alpha == 1 ? 0.000000000000000000001 : 1},0.3);
    }

}

function changeThought(number)
    stage.stageSprites.get('bfthought').playAnim('thought'+number);

function showBoomBox()
    stage.stageSprites.get('boombox').alpha = 1;

function boomBoxBeat()
    stage.stageSprites.get('boombox').playAnim('beat');

function boomBoxRow()
    stage.stageSprites.get('boombox').playAnim('libera');

function gameboyIdle()
    stage.stageSprites.get('gameboy').playAnim('idle');

function gameboyChip()
    stage.stageSprites.get('gameboy').playAnim('chip');