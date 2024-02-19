
static var redirectStates:Map<FlxState, String> = [
    FreeplayState => "FreeplayCustomState"
];

function preStateSwitch() {
    for (redirectState in redirectStates.keys())
        if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}

function new() {
    if (FlxG.save.data.shaderShit == null) FlxG.save.data.shaderShit = true;
    if (FlxG.save.data.shakeShit == null) FlxG.save.data.shakeShit = true;
    if (FlxG.save.data.flashFX == null) FlxG.save.data.flashFX = true;
    if (FlxG.save.data.bushNote == null) FlxG.save.data.bushNote = true;
    
    if (FlxG.save.data.kadeUI == null) FlxG.save.data.kadeUI = false;
    if (FlxG.save.data.fastPress == null) FlxG.save.data.fastPress = false;
    if (FlxG.save.data.oldLogo == null) FlxG.save.data.oldLogo = false;
}