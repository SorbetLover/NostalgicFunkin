var time = 1.5;
function update(e) {
    time += e;
    camGame.angle += Math.sin(time) * -0.05;
}

function create() {
	var whiteSquare = new FlxSprite();
	whiteSquare.makeGraphic(6000, 6000, FlxColor.WHITE);
	whiteSquare.x = "-490";
	whiteSquare.y = "-490";
	insert(members.indexOf(The_void), whiteSquare);
}