import flixel.math.FlxRandom;

var vine:FlxSprite;
public var lastGrab:Float = 0;
public var grabbed:Bool = false;
public var grabInput = false;

function postCreate() {
	vine = new FlxSprite(250, 470);
	vine.antialiasing = true;
	// load these once so it doesn't lag when we load em
	vine.frames = Paths.getSparrowAtlas("stages/Bushwhack/ZardyWeek2_Vines");
	vine.animation.addByPrefix("vine", "Vine Whip instance", Math.floor(24), false);
	vine.setGraphicSize(Std.int(vine.width * 0.85));

	vine.alpha = 0;

	insert(2, vine);
}

function grabThatMF() {
	trace("IM GRABBING THAT MF");
	grabbed = true;
	vine.alpha = 1;
	vine.animation.play("vine");
	boyfriend.animation.finishCallback = function(name) {/**Nothing**/
	};
	trace("playin grab");
	playerStrums.forEach(function(strum:StrumNote) {
		FlxTween.tween(strum, {alpha: 0.5}, 0.3);
	});
}

var originalXX:Float = 0;
var originalYY:Float = 0;
var funnyArray:Array<Note> = [];

function generateAndShowRandomNotes(?length:Int = 4) {
	trace("creating da notes");
	for (i in funnyArray)
		remove(i);

	funnyArray = [];

	var randomNotes = [];
	for (i in 0...length)
		randomNotes.push(FlxG.random.int(0, 3));

	var index = 0;

	for (i in randomNotes) {
		trace("note " + i);
		var pog = new Note(playerStrums, {id: i}, false, 0, 0);
		add(pog);

		pog.setGraphicSize(Std.int(pog.width * 0.75));
		funnyArray.push(pog);
		pog.alpha = 0;
		FlxTween.tween(pog, {alpha: 1}, 0.3);

		pog.x = boyfriend.x + (pog.width * index);
		pog.y = boyfriend.y - 135;

		index++;
	}
}

function update(elapsed:Float) {
	// Testing even more CNE note shit
	// var b = new Note(playerStrums, {id: 3}, false, 0, 0);
	// add(b);
	// b.screenCenter();

	if (!grabbed)
		if (vine.animation.frameIndex == 0) {
			vine.animation.stop();
			vine.alpha = 0;
		}

	if (grabbed) {
		if (vine.animation.frameIndex >= 35 && vine.animation.frameIndex <= 37 && boyfriend.animation.curAnim.name != "heldByVine") {
			FlxG.sound.play(Paths.sound("Vs Zardy/bf_grabbed_by_vine"));
			grabInput = true;
			trace("I'm GRABBED!! - BF");
			boyfriend.playAnim("heldByVine", true);
			generateAndShowRandomNotes(4);
		}
		if (vine.animation.frameIndex == 56 && !vine.animation.paused) {
			trace("pause!");
			vine.animation.pause();
		}
	}

	var notesToHit = false;

	for (i in cpu.notes.members)
		if (i.mustPress && i.strumTime - Conductor.songPosition <= 3000 && i.strumTime - Conductor.songPosition >= -3000)
			notesToHit = true;

	FlxG.watch.addQuick("Grab time", lastGrab - Conductor.songPosition);
	FlxG.watch.addQuick("Notes?", notesToHit);
	FlxG.watch.addQuick("Grabbed?", grabbed);

	// if (!notesToHit && lastGrab != -1 && lastGrab - Conductor.songPosition <= -20000 &&  !grabbed  && FlxG.sound.music.length - Conductor.songPosition > 6000 )
	// {
	//     boyfriend.playAnim("idle", true);
	// strumLineNotes.forEach(function(spr:FlxSprite){
	//         if (spr.animation.finished){
	//             spr.animation.play('static');
	//             spr.centerOffsets();
	//         }
	//     });

	//     lastGrab = -1;
	//     grabThatMF();
	// }
	if (grabbed && grabInput) {
		var pressArray:Array<Bool> = [
			controls.NOTE_LEFT_P,
			controls.NOTE_DOWN_P,
			controls.NOTE_UP_P,
			controls.NOTE_RIGHT_P
		];

		var redo = false;

		var toRemoved:Array<Note> = [];

		for (i in 0...pressArray.length) {
			var bool = pressArray[i];

			if (funnyArray.length != 0)
				if (funnyArray[0].noteData == i && bool /*|| PlayStateChangeables.botPlay*/) {
					toRemoved.push(funnyArray[0]);
				} else if (bool) {
					redo = true;
				}

			for (i in toRemoved) {
				if (funnyArray.contains(i)) {
					funnyArray.remove(i);
					FlxTween.tween(i, {alpha: 0}, 0.3, {
						onComplete: function(tw) {
							remove(i);
							i.destroy();
						}
					});
				}
			}
			if (bool)
				continue;
		}

		if (funnyArray.length == 0) {
			grabbed = false;
			lastGrab = Conductor.songPosition;
			if (boyfriend.animation.name == "heldByVine") {
				boyfriend.playAnim("axe", true);

				grabInput = false;
			}
			// this entire if statement is so stupid and bad
			// i'm really lazy so i'm doing this
			// sorry

			new FlxTimer().start(0.2, function(time) {
				FlxG.sound.play(Paths.sound('Vs Zardy/bf_vine_defeat'));
				vine.animation.play("vine", true, true);
				playerStrums.forEach(function(strum:StrumNote) {
					FlxTween.tween(strum, {alpha: 1}, 0.3);
				});
			});

			// new FlxTimer().start(1, function(time){
			//     grabInput = false;
			// });

			boyfriend.animation.finishCallback = function(n:String) {
				if (n == "axe") {
					FlxG.sound.play(Paths.sound('Vs Zardy/bf_axe_chop'));
					boyfriend.playAnim("dodge", true);
					trace("IM FREE");
				}
			};
		}

		if (redo) {
			health -= 0.15;
			for (ii in funnyArray) {
				remove(ii);
				ii.destroy();
			}

			funnyArray = [];
			generateAndShowRandomNotes(4);
		}
	}

	switch (curBeat) {
		case 96:
			grabThatMF();
		case 160:
			grabThatMF();
	}
}
