var characters_walking2:FlxSprite;
var chars2:Array<String> = ["hexabigail","mikutricky", "nenedarnell" ,"pompomstatic","lnosans","unified","starlight","weedbud","natecre","kermojordo"];
public static var charswhohavewalked2:Array<String> = [];

function create(){
	gf.visible = false;

	importScript('data/scripts/animatedDateIcon.hx');
	importScript('data/scripts/walkingCharacterDate.hx');
	importScript('data/scripts/introDate.hx');
	importScript('data/scripts/heartsDate.hx');
	heartsLayer = 5;

	characters_walking2 = this.stage.stageSprites.get('characters_walking2');

	for(i in 0...chars2.length)
		characters_walking2.animation.addByIndices(chars2[i], "characters_walking_bg", [0+i*12, 1+i*12, 2+i*12, 3+i*12, 4+i*12, 5+i*12, 6+i*12, 7+i*12, 8+i*12, 9+i*12, 10+i*12, 11+i*12], "", 24, true);

	characters_walking2.animation.play(chars2[FlxG.random.int(0,chars2.length-1)]);
	
	var shade:FlxSprite = new FlxSprite(-451.05,-560.15).loadGraphic(Paths.image("stages/date/shade"));
	shade.scrollFactor.set();
	shade.blend = "multiply";					
	add(shade);

	var light:FlxSprite = new FlxSprite(155.05,-282.9).loadGraphic(Paths.image("stages/date/light"));
	light.antialiasing = true;
	light.blend = "add";
	light.alpha = 0.53;		
	add(light);		
					
	var deco:FlxSprite = new FlxSprite(-176.95,-28).loadGraphic(Paths.image("stages/date/deco"));
	deco.scrollFactor.set(1.5,1.5);
	deco.antialiasing = true;
	add(deco);
}

function update(){
	if(chars2.lastIndexOf(characters_walking2.animation.curAnim.name) % 2 == 0){
		characters_walking2.x -= 2.1;
		if (characters_walking2.x < -1000){
			if (charswhohavewalked2.contains(characters_walking2.animation.curAnim.name))//if it's still the same character
				characters_walking2.animation.play(chars2[FlxG.random.int(0, chars2.length-1)]);//change the character
			else
				charswhohavewalked2.push(characters_walking2.animation.curAnim.name);
		}
	}else{
		characters_walking2.x += 2.1;
		if (characters_walking2.x > 1634.4){
			if (charswhohavewalked2.contains(characters_walking2.animation.curAnim.name))//if it's still the same character	
				characters_walking2.animation.play(chars2[FlxG.random.int(0, chars2.length-1)]);//change the character (i should make this a function)						
			else
				charswhohavewalked2.push(characters_walking2.animation.curAnim.name);
		}
	}
						
	if (charswhohavewalked2.length >= chars2.length) charswhohavewalked2 = [];
}