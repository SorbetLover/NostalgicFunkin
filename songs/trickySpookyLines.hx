/**
    Tricky's shaky and sudden lines
**/

var spookyText:FlxText;
var spookyRendered:Bool = false;
var spookySteps:Int = 0;

public var TrickyLinesSing:Array<String> = [
    "SUFFER","INCORRECT", "INCOMPLETE", "INSUFFICIENT", 
    "INVALID", "CORRECTION", "MISTAKE", 
    "REDUCE", "ERROR", "ADJUSTING", 
    "IMPROBABLE", "IMPLAUSIBLE", "MISJUDGED"
];

public var ExTrickyLinesSing:Array<String> = [
    "YOU AREN'T HANK", "WHERE IS HANK", "HANK???",
    "WHO ARE YOU", "WHERE AM I", "THIS ISN'T RIGHT",
    "MIDGET", "SYSTEM UNRESPONSIVE", "WHY CAN'T I KILL?????"
];

public var TrickyLinesMiss:Array<String> = [
    "TERRIBLE", "WASTE", "MISS CALCULTED",
    "PREDICTED", "FAILURE", "DISGUSTING", 
    "ABHORRENT", "FORESEEN", "CONTEMPTIBLE", 
    "PROGNOSTICATE", "DISPICABLE", "REPREHENSIBLE"
];

var tstatic:FlxSprite = new FlxSprite(0,0).loadGraphic(Paths.image('TrickyStatic'), true, 320, 180);

function postCreate() {
    TrickyLinesSing = CoolUtil.coolTextFile('data/trickySpookyLines/trickySingStrings.txt');
    TrickyLinesMiss = CoolUtil.coolTextFile('data/trickySpookyLines/trickyMissStrings.txt');
    ExTrickyLinesSing = CoolUtil.coolTextFile('data/trickySpookyLines/trickyExSingStrings.txt');

    if (!FlxG.save.data.flashFX) disableScript();

    switch(curStage) {
        case "nevadaPh1", "nevadaPh2", "nevadaPh3":
            tstatic.antialiasing = true;
            tstatic.scrollFactor.set(0,0);
            tstatic.setGraphicSize(Std.int(tstatic.width * 8.3));
            tstatic.animation.add('static', [0, 1, 2], 24, true);
            tstatic.animation.play('static');
            tstatic.screenCenter(FlxAxes.Y);

            tstatic.alpha = 0;
            add(tstatic);
    }
    if (curStage == 'nevadaPh3') {
        tstatic.setGraphicSize(Std.int(tstatic.width * 15));
        tstatic.x += 300;
    }

}

function createSpookyText(text:String, x:Float = -1111111111111, y:Float = -1111111111111){
		spookySteps = curStep;
		spookyRendered = true;
		tstatic.alpha = 0.5;
		FlxG.sound.play(Paths.sound('Vs Tricky/staticSound'));
		spookyText = new FlxText((x == -1111111111111 ? FlxG.random.float(dad.x + 40,dad.x + 120) : x), (y == -1111111111111 ? FlxG.random.float(dad.y + 200, dad.y + 300) : y));
		spookyText.setFormat("fonts/impact.ttf", 128, FlxColor.RED);
		spookyText.bold = true;
		spookyText.text = text;
		add(spookyText);

        if (curStage == 'nevadaPh3') {
            spookyText.size = 200;
            spookyText.x -= 350;
        } else {
            spookyText.setPosition(dad.x - 220, dad.y - 100);
        }
}

function postUpdate() {
    if (spookyRendered) // move shit around all spooky like
        {
            spookyText.angle = FlxG.random.int(-5,5); // change its angle between -5 and 5 so it starts shaking violently.
            //tstatic.x = tstatic.x + FlxG.random.int(-2,2); // move it back and fourth to repersent shaking.
            if (tstatic.alpha != 0) tstatic.alpha = FlxG.random.float(0.1,0.5); // change le alpha too :)
        }
}

// function onPlayerMiss(e) {
//     if (e.character.curCharacter.toLowerCase().contains("tricky") && FlxG.random.bool(e.character.curCharacter == "tricky" ? 10 : 4) && !spookyRendered && curStage == "nevadaPh1" || curStage == "nevadaPh2" || curStage == "nevadaPh3") {
//         createSpookyText(TrickyLinesMiss[FlxG.random.int(0,TrickyLinesMiss.length)]);
//     }
// }

function onNoteHit(e) {
    switch(e.character.curCharacter) {
        case 'trickyMask': // 1% chance
            if (FlxG.random.bool(1) && !spookyRendered && !e.note.isSustainNote) 
                createSpookyText(TrickyLinesSing[FlxG.random.int(0,TrickyLinesSing.length)]);

        case 'tricky': // 20% chance
            if (FlxG.random.bool(20) && !spookyRendered && !e.note.isSustainNote) 
                createSpookyText(TrickyLinesSing[FlxG.random.int(0,TrickyLinesSing.length)]);
            
        case 'trickyPhase3': // 45% chance
            if (FlxG.random.bool(45) && !spookyRendered && !e.note.isSustainNote) {
                    createSpookyText(TrickyLinesSing[FlxG.random.int(0,TrickyLinesSing.length)]);
                }
                
            if (FlxG.save.data.shakeShit) FlxG.camera.shake(0.02, 0.2);
        // case 'exTricky': // 60% chance
        //     if (FlxG.random.bool(60) && !spookyRendered && !note.isSustainNote) // create spooky text :flushed:
        //         {
        //             createSpookyText(ExTrickyLinesSing[FlxG.random.int(0,ExTrickyLinesSing.length)]);
        //         }
    }
}

var resetSpookyText:Bool = true;

function resetSpookyTextManual(){
    trace('reset spooky');
    spookySteps = curStep;
    spookyRendered = true;
    tstatic.alpha = 0.5;
    FlxG.sound.play(Paths.sound('Vs Tricky/staticSound'));
    resetSpookyText = true;
}

function manuallymanuallyresetspookytextmanual(){
    remove(spookyText);
    spookyRendered = false;
    tstatic.alpha = 0;
}

function stepHit(curStep) {
    if (spookyRendered && spookySteps + 3 < curStep) {
			if (resetSpookyText) {
				remove(spookyText);
				spookyRendered = false;
			}
			tstatic.alpha = 0;
			// if (curStage == 'auditorHell') tstatic.alpha = 0.1;
		}
}