var game;

var lines:Array<String> = [
    '1:are you boyf-',
    "2:shi there is nobody here",
    "3:lemme jus manifest\nboyfriend"
];

var curLine = 0;
var dialogBox:FlxSprite;
var pauseMusic:FlxSound;
var dialogText:FlxText;

function create(){
	persistentUpdate = true;
	persistentDraw = true;

    pauseMusic = FlxG.sound.load(Paths.music('chan-site'), 1, true);
    pauseMusic.persist = false;
    pauseMusic.group = FlxG.sound.defaultMusicGroup;
    pauseMusic.play(false);

    game = PlayState.instance;

    FlxG.camera.zoom = 0.9;
    game.camHUD.visible = false;

    game.camFollow.x = game.dad.getCameraPosition().x;
    game.camFollow.y = game.dad.getCameraPosition().y;

    dialogBox = new FlxSprite(game.dad.x+300,game.dad.y-50);
    dialogBox.frames = Paths.getSparrowAtlas('stages/skyVerse/blue/dialog');
    dialogBox.animation.addByIndices('start','Symbol 54',[0,1],'',24,false);
    dialogBox.animation.addByIndices('loop','Symbol 54',[2,3,4,5],'',24,true);
    dialogBox.animation.play('start');
    add(dialogBox);

    dialogText  = new FlxText(dialogBox.x, dialogBox.y, 0,"gay");
    dialogText.setFormat("fonts/freeplay.ttf", 30, FlxColor.BLACK, "CENTER");
    dialogText.antialiasing = true;
    add(dialogText);

    changeLineTo(curLine);

    trace('cutscene blue--------------------');
}

function changeLineTo(num){
    var data = lines[num].split(':');
    var anim = data[0];
    var text = data[1];
    
    game.dad.playAnim('dialog'+anim);
    dialogBox.animation.play('start');

    dialogText.text = text;
    if(dialogText.width > 300)
        dialogText.fieldWidth = 300;
    else
        dialogText.fieldWidth = 0;
    dialogText.text = text;

    dialogText.x = (dialogBox.x+(dialogBox.width/2)-(dialogText.width/2))+45;
    dialogText.y = (dialogBox.y+(dialogBox.height/2)-(dialogText.height/2))+10;

    trace(text);
}

function update(){
    if(dialogBox.animation.curAnim.name == 'start' && dialogBox.animation.curAnim.finished)     
        dialogBox.animation.play('loop');

    dialogText.visible = dialogBox.animation.curAnim.name == 'loop';

    if(FlxG.keys.justPressed.ENTER){
        if(curLine+1 > lines.length-1){
            game.dad.playAnim('idle');
            game.camHUD.visible = true;
            FlxG.sound.destroySound(pauseMusic);
            close();
        }
        else{
            curLine++;
            changeLineTo(curLine);
        }
    }
}