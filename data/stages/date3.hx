var farris_seat:FlxSpriteGroup;

function create(){
	gf.visible = false;

	importScript('data/scripts/animatedDateIcon.hx');
	importScript('data/scripts/walkingCharacterDate.hx');
	importScript('data/scripts/introDate.hx');
	importScript('data/scripts/heartsDate.hx');
	heartsLayer = 5;

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

	stage.stageSprites.get('characters_walking').y = -10;

	farris_seat = new FlxSpriteGroup();
	farris_seat.scrollFactor.set(0.6, 0.6);
	for (i in 0...24){
		var fs = new FlxSprite(225.85,371.1);
		fs.loadGraphic(Paths.image("stages/date/farris_seat"));
		fs.antialiasing = true;
		farris_seat.add(fs);
	}
	add(farris_seat);
    members.remove(farris_seat);
    members.insert(5,farris_seat);

	stage.stageSprites.get('farris_wheel').beatAnims = [];
	stage.stageSprites.get('sky_heartbass').beatAnims = [];
	stage.stageSprites.get('sky_heartbass').animation.play('boom',true);
	stage.stageSprites.get('farris_wheel').animation.play("thing" + FlxG.random.int(1, 4));
}

function beatHit(){
	stage.stageSprites.get('sky_heartbass').animation.play('boom',true);
	stage.stageSprites.get('farris_wheel').animation.play("thing" + FlxG.random.int(1, 4));

	stage.stageSprites.get('backboppers').y += 30;
	stage.stageSprites.get('frontboppers').y += 30;
	FlxTween.tween(stage.stageSprites.get('backboppers'), {y:-149.45}, (Conductor.stepCrochet * 3 / 1000), {ease:FlxEase.circOut});
	FlxTween.tween(stage.stageSprites.get('frontboppers'), {y:-39.55}, (Conductor.stepCrochet * 3 / 1000), {ease:FlxEase.circOut});
}

function update(){
	stage.stageSprites.get('plane').x -= 1;
	if(stage.stageSprites.get('plane').x < -610) stage.stageSprites.get('plane').x = 1800;
	stage.stageSprites.get('farris_wheel').angle += 0.25;
	
	for (i in 0...24){
		var fss = farris_seat.members[i];
		var _angle = (farris_wheel.angle + (i/24)*360) * (Math.PI/180); // Convert to radians
		var rotatedX = Math.cos(_angle) * (350 - 227) - Math.sin(_angle) * (350-153.85) + 227;
		var rotatedY = Math.sin(_angle) * (350 - 227) + Math.cos(_angle) * (350 - 153.85) + 153.85;
	
		fss.setPosition(rotatedX-15, rotatedY);
	}
}