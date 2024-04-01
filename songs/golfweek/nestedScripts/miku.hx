import flixel.text.FlxTextAlign;
import flixel.text.FlxTextBorderStyle;

public var miku;
var flipped = false;
var lyrics;
var lyricsArray;
var startWaveFrame;

function create(){
    //stage.stageSprites.get('nightsky').alpha = 1;

    //FlxTween.tween(stage.stageSprites.get('nightsky'),{alpha:1}, ((Conductor.crochet * 8) / 1000), {ease: FlxEase.cubeIn});

    miku = new FlxSprite(564, -286.2);
    miku.frames = Paths.getSparrowAtlas('characters/golfweek/miku');
    miku.animation.addByIndices("idle", "mikuAnim", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], "", 24, true);
    miku.animation.addByPrefix("perform", "mikuAnim", 24, false);
    miku.antialiasing = true;
    miku.animation.play("idle");
    miku.scrollFactor.set(0.95, 0.95);
    insert(members.indexOf(gf),miku);

    lyricsArray = CoolUtil.coolTextFile(Paths.txt('golfWeek/endlessLyrics'));

    lyrics = new FlxText(0,100,1280,"",32,true);
    lyrics.scrollFactor.set();
    lyrics.cameras = [camHUD];
    lyrics.alignment = FlxTextAlign.CENTER;
    lyrics.borderStyle = FlxTextBorderStyle.OUTLINE_FAST;
    lyrics.borderSize = 4;
    add(lyrics);
}

function onSongStart()
    miku.animation.play("perform");

function flipMiku(flip)
    flipped = (flip == 'true');

function update(){
    if(miku.animation.curAnim.finished)
        miku.animation.play("perform", true, false, startWaveFrame);
}

function beatHit(){
    if(startingSong) return;

	if (lyricsArray[curBeat] != "-") lyrics.text = lyricsArray[curBeat];
	if (lyricsArray[curBeat] == "*") lyrics.text = '';

	var fff = Math.round(Conductor.songPosition / 1000 * 24);
			
    if(!(fff >= miku.animation.curAnim.numFrames)){
        miku.animation.play("perform", true, false, fff);
        if(curBeat == 359)
            startWaveFrame = fff;
    }


	miku.flipX = flipped;
}