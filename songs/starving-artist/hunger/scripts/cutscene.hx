import funkin.game.cutscenes.DialogueCutscene;
import flixel.util.FlxAxes;
function create() importScript("data/scripts/scrollSpeed toggle");
// var playedSound:Bool = false;

function postCreate() {
	if (playCutscenes) playCutscenes = true;
	// if (playedSound) FlxG.sound.play(Paths.sound("brokenpad"));
}

// function postUpdate(elapsed) {
// 	if (subState != null) {
// 		// trace(subState.charMap["rebeccaNormal"]);
// 		switch (subState.curLine.callback) {
// 			case "center char":
// 				subState.charMap["rebeccaNormal"].screenCenter(FlxAxes.X);
// 			case "move cam":
// 				FlxTween.tween(subState.dialogueCamera, {x: 100}, 1, {ease: FlxEase.quadInOut});
// 			case "move cam way back":
// 				FlxTween.tween(subState.dialogueCamera, {x: -100}, 1, {ease: FlxEase.quadInOut});
// 			case "cam default pos":
// 				FlxTween.tween(subState.dialogueCamera, {x: 0}, 1, {ease: FlxEase.quadInOut});
// 			case "play sound":
// 				if (!playedSound) FlxG.sound.play(Paths.sound("brokenpad")); playedSound = true;
// 				subState.charMap["rebeccaNormal"].x += 20;
			
// 			default:
// 				subState.charMap["rebeccaNormal"].x = 200;
// 		}
// 	}
// }