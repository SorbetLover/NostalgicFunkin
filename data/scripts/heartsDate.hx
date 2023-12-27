class HeartThingy extends flixel.FlxSprite 
{
	public var fadedelay:Int = 0;
	public var framee:Int = 0;
	public var speed:Float = 0;
	public function new() 
	{
		super(0,0);
		frames = Paths.getSparrowAtlas("stages/date/heartthingy");
		animation.addByPrefix("bump", "heartthing", 24, true);
		scrollFactor.set(0.8,0.8);
		antialiasing = true;
        active = false;
        visible = false;
        //reset(X,Y,SPEED);
	}

    public function reset(){
        this.x = FlxG.random.int(-200, 1280);
        this.y = 500;
		speed = FlxG.random.float(0.8, 1.2);
		fadedelay = FlxG.random.int(240, 360);
		active = true;
		alpha = 0.9;
        framee = 0;
        visible = true;
    }
	
	public function update(elapsed:Float):Void 
	{
		
		y-= speed;
		framee ++;
		
		if (framee > fadedelay)
			alpha -= 0.01;
		
		animation.play("bump"); 
		if (alpha > 0)
			super.update(elapsed);
		else{
			active = false;
			visible = false;
		}
	}
	
}

var heartsThings:FlxSpriteGroup;
public static var heartsLayer:Int = 0;
public var heartsStartBeat:Int = 135;

function postCreate(){
    heartsThings = new FlxSpriteGroup();
    add(heartsThings);
    members.remove(heartsThings);
    members.insert(heartsLayer,heartsThings);

    trace(Conductor.bpm/3.8);
    for(i in 0...Conductor.bpm/3.8)
        heartsThings.add(new HeartThingy());
}

function stepHit(){
    if(curBeat > heartsStartBeat){
        for(heart in heartsThings.members){
            if(!heart.active){
                heart.reset();
                break;
            }
        }
    }
}