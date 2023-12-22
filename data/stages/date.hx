function create(){
	gf.visible = false;

	importScript('data/scripts/animatedDateIcon.hx');
	importScript('data/scripts/introDate.hx');
	importScript('data/scripts/heartsDate.hx');
	heartsLayer = 2;
	
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