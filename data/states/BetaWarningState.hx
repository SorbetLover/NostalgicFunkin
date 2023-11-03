import funkin.backend.FunkinText;
var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image("betawarning")).screenCenter();
var redText:FunkinText;

function postCreate() {
    insert(0, bg);

    redText = new FunkinText(16, disclaimer.y + 160, FlxG.width - 32, "FNF is never meant for kids. Player discretion is advised.", 34);
    redText.color = 0xFFFF4444;
    redText.bold = true;
    redText.alignment = "center";
    add(redText);

    titleAlphabet.y = disclaimer.y - 120;
    disclaimer.screenCenter();
    disclaimer.text = "This engine is still in a alpha state. That means majority of the features are either buggy or unfinished. If you find any bugs, please report them to the Codename Engine GitHub.\n\nAlso this modpack has flashing lights, camera effects, gore, loud music, dark themes.\n\n\n\nPress ENTER to continue.";

    // disclaimer.blend = "add";
    // redText.blend = "add";
}