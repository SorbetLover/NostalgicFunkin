
var chars:Array<String> = ["daliaayanna", "sarvruv", "koukapi","selsunday","macybob","tabifunsize","solnik","garcanchor","susyukichi","eddsworld","silly","jadssmokey","cvalkolsan","violetruria","dionnekaya","jojo"];
var charswhohavewalked:Array<String> = [];
var characters_walking:FlxSprite;
var moveNOWWW:Bool = true;
var stopSTOPITSTOPITNOW:Int = 270;

function randomCharacter(){
    var charactersTHATdidntWALK = chars.copy();
    for(char in chars){
        for (alrwalked in charswhohavewalked){
            if(char == alrwalked)
                charactersTHATdidntWALK.remove(char);
        }
    }


	characters_walking.animation.play(charactersTHATdidntWALK[FlxG.random.int(0, charactersTHATdidntWALK.length-1)]);
}

function postCreate(){
	characters_walking = this.stage.stageSprites.get('characters_walking');

	for(i in 0...chars.length)
		characters_walking.animation.addByIndices(chars[i], "characters_walking", [0+i*12, 1+i*12, 2+i*12, 3+i*12, 4+i*12, 5+i*12, 6+i*12, 7+i*12, 8+i*12, 9+i*12, 10+i*12, 11+i*12], "", 24, true);
	randomCharacter();
}

function update(){
    var overLimit:Bool = false;
    if(chars.indexOf(characters_walking.animation.curAnim.name) % 2 == 0){
        if(moveNOWWW)characters_walking.x -= 2;
        if (characters_walking.x < -900)
            overLimit = true;
    }else {
        if(moveNOWWW)characters_walking.x += (characters_walking.animation.curAnim.name == "selsunday" || characters_walking.animation.curAnim.name == "jojo" ) ? 8 : 2;
        if (characters_walking.x > 1434.4)
            overLimit = true;
    }

    if(overLimit){
        if (charswhohavewalked.contains(characters_walking.animation.curAnim.name)){//if it's still the same character
            randomCharacter();
            trace(chars.indexOf(characters_walking.animation.curAnim.name));
            if(chars.lastIndexOf(characters_walking.animation.curAnim.name) % 2 == 0)
                characters_walking.x = 1434.4;
            else
                characters_walking.x = -900;
            if (curBeat > stopSTOPITSTOPITNOW) 
                moveNOWWW = false;
        }else
            charswhohavewalked.push(characters_walking.animation.curAnim.name);
    }

    if (charswhohavewalked.length >= chars.length) charswhohavewalked = [];
}