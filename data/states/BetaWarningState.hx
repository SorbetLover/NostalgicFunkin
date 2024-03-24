import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import funkin.backend.system.Main;

function postCreate() {
    var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image("betawarning")).screenCenter();
    insert(0, bg);

    titleAlphabet.y = disclaimer.y - 120;
    disclaimer.screenCenter();
    disclaimer.applyMarkup("This engine is still in a" + '* ' + Main.releaseCycle + ' *' + "state. That means *majority of the features* are either *buggy* or *non finished*. If you find any bugs, please report them to the Codename Engine GitHub.\n\nAlso this modpack has flashing lights, camera effects, gore, loud music, dark themes.\n\n*Player discretion is advised.*\n\nPress ENTER to continue",
			[
				new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF4444), "*")
			]
		);
}