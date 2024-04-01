function create()
    beatHit();

function beatHit(){
    if(PlayState.SONG.meta.displayName== 'endless')
        stage.stageSprites.get('sky').playAnim('night',true);
    else
        stage.stageSprites.get('sky').playAnim('day',true);
}