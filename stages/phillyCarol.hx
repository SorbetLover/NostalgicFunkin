import funkin.game.PlayState;

var curColor:Int = 0;
var colors = [
	0xFF47ACFF,
	0xFFAA1848,
	0xFF472F74,
];

function create() {
	// defaultCamZoom = 0.5;
	light.color = colors[curColor];
}

function beatHit(curBeat:Int) {
	if (curBeat % 4 == 0) {
		// switches color
		var newColor = FlxG.random.int(0, colors.length-2);
		if (newColor >= curColor) newColor++;
		curColor = newColor;
		light.color = colors[curColor];
	}
}

function update(elapsed:Float) {
	if (Conductor.songPosition > 0)
		light.alpha = 1 - (FlxEase.cubeIn((curBeatFloat / 4) % 1) * 0.85);
	else
		light.alpha = 0;
}