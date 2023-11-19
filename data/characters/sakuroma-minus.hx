//var alt = null;
var sings = ["LEFT", "DOWN", "UP", "RIGHT"];

function onPlaySingAnim(event) {
	var daAlt = '';
	if(event.altAnim) daAlt = '-alt';
	else if(FlxG.random.bool(50)) daAlt = '-alt';

	var animToPlay:String = sings[Std.int(Math.abs(event.noteData))] + daAlt;

	/*var char:Character = boyfriend;

	if(char != null) {
		if(event.isSustainNote) {
			if(char.animation.name == 'idle' || char.animation.name.startsWith('dance')) {
				char.playAnim(animToPlay);
			}
		} else {
			char.playAnim(animToPlay, true);
		}
		char.holdTimer = 0;
	}*/

}