import funkin.menus.FreeplayState.FreeplaySonglist;
import funkin.backend.utils.DiscordUtil;
import funkin.backend.utils.FlxInterpolateColor;
import funkin.backend.system.Main;
import flixel.text.FlxTextBorderStyle;
import funkin.savedata.FunkinSave;

/**
 * Array containing all of the songs metadatas
 */
public var songs:Array<ChartMetaData> = [];

/**
 * Currently selected song
 */
public var curSelected:Int = 0;

/**
 * Currently selected difficulty
 */
public var curDifficulty:Int = 1;

/**
 * Currently selected coop/opponent mode
 */
public var curCoopMode:Int = 0;

/**
 * Currently selected mod
 */
public var curMod:Int = 0;

/**
 * Text containing the score info (PERSONAL BEST: 0)
 */
public var scoreText:FlxText;

/**
 * Text containing the current difficulty (< HARD >)
 */
public var diffText:FlxText;

/**
* Text containing the current coop/opponent mode ([TAB] Co-Op mode)
*/
public var coopText:FlxText;

/**
 * mod text
 */
public var modTitle:FlxText;

/**
 * Currently lerped score. Is updated to go towards `intendedScore`.
 */
public var lerpScore:Int = 0;
/**
 * Destination for the currently lerped score.
 */
public var intendedScore:Int = 0;

/**
 * Assigned FreeplaySonglist item.
 */
public var songList:FreeplaySonglist;

/**
 * the mod list duh
 */
public var modList:Array<String>=[];

/**
 * ahem.
 */
public var modSongList:Map<String,Array<ChartMetaData>>=[];

/**
 * Black background around the score, the difficulty text and the co-op text.
 */
public var scoreBG:FlxSprite;

/**
 * Background.
 */
public var bg:FlxSprite;

/**
 * Mod Background.
 */
public var modBg:FlxSprite;

/**
 * Whenever the player can navigate and select
 */
public var canSelect:Bool = true;

/**
 * Group containing all of the alphabets
 */
public var grpSongs:FlxGroup;

/**
 * Array containing all of the icons.
 */
public var iconArray:Array<HealthIcon> = [];
     
/**
 * FlxInterpolateColor object for smooth transition between Freeplay colors.
 */
public var interpColor:FlxInterpolateColor;


function create(){
    CoolUtil.playMenuSong();
    
    songList = FreeplaySonglist.get();
	songs = songList.songs;

    modList = CoolUtil.coolTextFile(Paths.txt('freeplayModlist'));
    trace(modList);

    for(mod in modList)
        modSongList.set(mod,[]);

    for(i in 0...songs.length){
        var song = songs[i];
        song.ID = i;
        var nameOfTheWeek = song.week;
        if(!modList.contains(nameOfTheWeek))
            nameOfTheWeek = 'default';
        trace(nameOfTheWeek);
        var curSongList = modSongList.get(nameOfTheWeek);
        curSongList.push(song);
        modSongList.set(nameOfTheWeek,curSongList);
    }

	for(k=>s in songs) {
		if (s.name == Options.freeplayLastSong)
			curSelected = k;
	}

	if (songs[curSelected] != null) {
		for(k=>diff in songs[curSelected].difficulties) {
			if (diff == Options.freeplayLastDifficulty) {
				curDifficulty = k;
			}
		}
	}

    DiscordUtil.changePresence("In the Menus", null);

    bg = new FlxSprite(0, 0);
    CoolUtil.loadAnimatedGraphic(bg, Paths.image("menus/squrefreeplaybg"));
    if(songs.length > 0)
        bg.color = songs[0].color;
    bg.antialiasing = true;
    bg.alpha = 0.7;
    add(bg);

    
    trace('IT WORKED!!!');

    modBg = new FlxSprite();
    modBg.antialiasing = true;
    modBg.blend ="overlay";
    modBg.color = FlxColor.fromString("#050505");
    modBg.alpha = 0.4;
    add(modBg);

    grpSongs = new FlxGroup();
	add(grpSongs);

	for (i in 0...songs.length)
	{
		var songText:Alphabet = new Alphabet(0, (70 * i) + 30, songs[i].displayName, true, false);
		songText.isMenuItem = true;
		songText.targetY = i;
        songText.ID = i;
		grpSongs.add(songText);

		var icon:HealthIcon = new HealthIcon(songs[i].icon);
		icon.sprTracker = songText;

		// using a FlxGroup is too much fuss!
		iconArray.push(icon);
		add(icon);

    	// songText.x += 40;
		// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		// songText.screenCenter(X);
	}

    scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
    scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, 2/*RIGHT*/);

	scoreBG = new FlxSprite(scoreText.x - 6, 0).makeGraphic(1, 1, 0xFF000000);
	scoreBG.alpha = 0.6;
	add(scoreBG);

	diffText = new FlxText(scoreText.x, scoreText.y + 36, 0, "", 24);
	diffText.font = scoreText.font;
	add(diffText);

	coopText = new FlxText(diffText.x, diffText.y + diffText.height + 2, 0, "[TAB] Solo", 24);
	coopText.font = scoreText.font;
	add(coopText);

	add(scoreText);
    
    modTitle  = new FlxText(440, 5, 700);
    modTitle.setFormat("fonts/freeplay.ttf", 25, FlxColor.WHITE, "CENTER");
    modTitle.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
    modTitle.antialiasing = true;
    add(modTitle);
    
    changeMod(0,true);
    changeCoopMode(0, true);

	interpColor = new FlxInterpolateColor(bg.color);

    trace('IT WORKED!!!');
}


#if PRELOAD_ALL
/**
 * How much time a song stays selected until it autoplays.
 */
public var timeUntilAutoplay:Float = 1;
/**
 * Whenever the song autoplays when hovered over.
 */
public var disableAutoPlay:Bool = false;
/**
 * Whenever the autoplayed song gets async loaded.
 */
public var disableAsyncLoading:Bool = #if desktop false #else true #end;
/**
 * Time elapsed since last autoplay. If this time exceeds `timeUntilAutoplay`, the currently selected song will play.
 */
public var autoplayElapsed:Float = 0;
/**
 * Whenever the currently selected song instrumental is playing.
 */
public var songInstPlaying:Bool = true;
/**
 * Path to the currently playing song instrumental.
 */
public var curPlayingInst:String = null;
#end

function update(elapsed){
	if (FlxG.sound.music != null && FlxG.sound.music.volume < 0.7)
        FlxG.sound.music.volume += 0.5 * elapsed;


    lerpScore = Math.floor(lerp(lerpScore, intendedScore, 0.4));

    if (Math.abs(lerpScore - intendedScore) <= 10)
        lerpScore = intendedScore;

	if (canSelect) {
        changeSelection( (FlxG.mouse.wheel > 0 ? -1 : 0) + (FlxG.mouse.wheel < 0 ? 1 : 0) );
		changeSelection((controls.UP_P ? -1 : 0) + (controls.DOWN_P ? 1 : 0));
		changeDiff((controls.LEFT_P ? -1 : 0) + (controls.RIGHT_P ? 1 : 0));
		changeCoopMode((FlxG.keys.justPressed.TAB ? 1 : 0));
        changeMod((FlxG.keys.justPressed.Q ? -1 : 0) + (FlxG.keys.justPressed.E ? 1 : 0));
		// putting it before so that its actually smooth
		updateOptionsAlpha();
	}

	scoreText.text = "PERSONAL BEST:" + lerpScore;
	scoreBG.scale.set(Math.max(Math.max(diffText.width, scoreText.width), coopText.width) + 8, (coopText.visible ? coopText.y + coopText.height : 66));
	scoreBG.updateHitbox();
	scoreBG.x = FlxG.width - scoreBG.width;

	scoreText.x = coopText.x = scoreBG.x + 4;
	diffText.x = Std.int(scoreBG.x + ((scoreBG.width - diffText.width) / 2));

	interpColor.fpsLerpTo(songs[curSelected].parsedColor, 0.0625);
	bg.color = interpColor.color;

	if (controls.BACK)
    {
        CoolUtil.playMenuSFX(2/*CANCEL*/, 0.7);
        FlxG.switchState(new MainMenuState());
    }
    
	#if PRELOAD_ALL
	var dontPlaySongThisFrame = false;
	autoplayElapsed += elapsed;
	if (!disableAutoPlay && !songInstPlaying && (autoplayElapsed > timeUntilAutoplay || FlxG.keys.justPressed.SPACE)) {
		if (curPlayingInst != (curPlayingInst = Paths.inst(modSongList.get(modList[curMod])[curSelected].name, modSongList.get(modList[curMod])[curSelected].difficulties[curDifficulty]))) {
			var huh:Void->Void = function() FlxG.sound.playMusic(curPlayingInst, 0);
			if(!disableAsyncLoading) Main.execAsync(huh);
			else huh();
		}
		songInstPlaying = true;
		if(disableAsyncLoading) dontPlaySongThisFrame = true;
	}
	#end
    
	if (controls.ACCEPT #if PRELOAD_ALL && !dontPlaySongThisFrame #end)
		select();

    if(controls.RESET)//debuging
        FlxG.switchState(new FreeplayState());
}

public function select() {
    updateCoopModes();

    if (modSongList.get(modList[curMod])[curSelected].difficulties.length <= 0) return;

    Options.freeplayLastSong = modSongList.get(modList[curMod])[curSelected].name;
    Options.freeplayLastDifficulty = modSongList.get(modList[curMod])[curSelected].difficulties[curDifficulty];

    PlayState.loadSong(modSongList.get(modList[curMod])[curSelected].name, modSongList.get(modList[curMod])[curSelected].difficulties[curDifficulty], __opponentMode, __coopMode);
    FlxG.switchState(new PlayState());
}

public function changeSelection(change:Int = 0, force:Bool = false)
{
	if (change == 0 && !force) return;

	curSelected = FlxMath.wrap(curSelected + change, 0, modSongList.get(modList[curMod]).length-1);
	CoolUtil.playMenuSFX(0, 0.7);

	changeDiff(0, true);

    var modBgName = modSongList.get(modList[curMod])[curSelected].BG;
    if(modBgName == null)
        modBgName = 'default';
    modBg.loadGraphic(Paths.image("menus/freeplay/" +modBgName));
    
    var modText = modSongList.get(modList[curMod])[curSelected].week;
    if (modText == null)
        modText = 'unknown';

    //modTitle.text = "Mod: " + modText;

	#if PRELOAD_ALL
		autoplayElapsed = 0;
		songInstPlaying = false;
	#end

	coopText.visible = modSongList.get(modList[curMod])[curSelected].coopAllowed || modSongList.get(modList[curMod])[curSelected].opponentModeAllowed;
}

public function changeDiff(change:Int = 0, force:Bool = false)
{
	if (change == 0 && !force) return;

	var curSong = modSongList.get(modList[curMod])[curSelected];
	var validDifficulties = curSong.difficulties.length > 0;

	curDifficulty = validDifficulties ? FlxMath.wrap(curDifficulty + change, 0, curSong.difficulties.length-1) : 0;

	updateScore();

	if (curSong.difficulties.length > 1)
		diffText.text = '< '+curSong.difficulties[curDifficulty]+' >';
	else
		diffText.text = validDifficulties ? curSong.difficulties[curDifficulty] : "-";
}

public function changeMod(change:Int = 0, force:Bool = false)
{
    if (change == 0 && !force) return;
    
    curMod = FlxMath.wrap(curMod + change, 0, modList.length-1);
    
    modTitle.text = "Mod: " + modList[curMod];

    curSelected = 0;
    changeSelection(0,true);
    updateOptionsAlpha(true);
}
    
/**
 * Array containing all labels for Co-Op / Opponent modes.
 */
public var coopLabels:Array<String> = [
	"[TAB] Solo",
	"[TAB] Opponent Mode",
	"[TAB] Co-Op Mode",
	"[TAB] Co-Op Mode (Switched)"
];

public function changeCoopMode(change:Int = 0, force:Bool = false) {
    if (change == 0 && !force) return;
    if (!modSongList.get(modList[curMod])[curSelected].coopAllowed && !modSongList.get(modList[curMod])[curSelected].opponentModeAllowed) return;

    var bothEnabled = modSongList.get(modList[curMod])[curSelected].coopAllowed && modSongList.get(modList[curMod])[curSelected].opponentModeAllowed;

    curCoopMode = FlxMath.wrap(curCoopMode + change, 0, bothEnabled ? 3 : 1);

    updateScore();

    if (bothEnabled) {
        coopText.text = coopLabels[curCoopMode];
    } else {
        coopText.text = coopLabels[curCoopMode * (modSongList.get(modList[curMod])[curSelected].coopAllowed ? 2 : 1)];
    }
}

function updateScore() {
    if (modSongList.get(modList[curMod])[curSelected].difficulties.length <= 0) {
        intendedScore = 0;
        return;
    }
    updateCoopModes();
    var changes:Array<HighscoreChange> = [];
    if (__coopMode) changes.push(CCoopMode);
    if (__opponentMode) changes.push(COpponentMode);
    var saveData = FunkinSave.getSongHighscore(modSongList.get(modList[curMod])[curSelected].name, modSongList.get(modList[curMod])[curSelected].difficulties[curDifficulty], changes);
    intendedScore = saveData.score;
}

var __opponentMode:Bool = false;
var __coopMode:Bool = false;

function updateCoopModes() {
    __opponentMode = false;
    __coopMode = false;
    if (modSongList.get(modList[curMod])[curSelected].coopAllowed && modSongList.get(modList[curMod])[curSelected].opponentModeAllowed) {
        __opponentMode = curCoopMode % 2 == 1;
        __coopMode = curCoopMode >= 2;
    } else if (modSongList.get(modList[curMod])[curSelected].coopAllowed) {
        __coopMode = curCoopMode == 1;
    } else if (modSongList.get(modList[curMod])[curSelected].opponentModeAllowed) {
        __opponentMode = curCoopMode == 1;
    }
}

function updateOptionsAlpha(?snap:Bool = false) {
    var bullShit:Int = 0;

    for(item in grpSongs.members)
        item.targetY = 100;
    for(song in modSongList.get(modList[curMod]))
    {
        for(item in grpSongs.members){
            if(item.ID == song.ID){        
                item.targetY = bullShit - curSelected;
                if(snap)
                    item.y = (FlxMath.remapToRange(item.targetY, 0, 1, 0, 1.3) * 120) + (FlxG.height * 0.48);

                //if(modSongList.get(modList[curMod]).contains(songs[bullShit]))
                    item.alpha = lerp(item.alpha, #if PRELOAD_ALL songInstPlaying ? 0.45 : #end 0.6, 0.25);
                //else
                //  item.alpha = 0;

                if (item.targetY == 0)
                    item.alpha =  1;

                bullShit++;
            }
        }
    }

    for (i in 0...iconArray.length)
        iconArray[i].alpha = grpSongs.members[i].alpha;

}