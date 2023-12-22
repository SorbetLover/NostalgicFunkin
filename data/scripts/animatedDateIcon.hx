var iconP1Animated:FlxSprite;
function postCreate(){
    iconP1.alpha = 0.00000000000000001;
    iconP2.alpha = 0.00000000000000001;

    iconP1Animated = new FlxSprite(0,0);
    iconP1Animated.frames = Paths.getSparrowAtlas('icons/dateWeek/cw_icon');
    iconP1Animated.animation.addByIndices('22','cw_icon' ,[0],"", 0, false);
    iconP1Animated.animation.addByIndices('idle','cw_icon' ,[5],"", 0, false);
    iconP1Animated.animation.addByIndices('carol_date_boom','cw_icon' ,[1,2,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],"", 12, false);
    iconP1Animated.animation.addByIndices('win','cw_icon' ,[6,7,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9],"", 12, false);
    iconP1Animated.animation.play('idle');
    iconP1Animated.cameras = [camHUD];
    iconP1Animated.antialiasing = true;
    add(iconP1Animated);

    iconP2Animated = new FlxSprite(0,0);
    iconP2Animated.frames = Paths.getSparrowAtlas('icons/dateWeek/cw_icon');
    iconP2Animated.animation.addByIndices('idle','cw_icon' ,[0],"", 0, false);
    iconP2Animated.animation.addByIndices('win','cw_icon' ,[1,2,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],"", 12, false);
    iconP2Animated.animation.play('idle');
    iconP2Animated.cameras = [camHUD];
    iconP2Animated.antialiasing = true;
    add(iconP2Animated);
}

var isBeating:Bool = false;

function postUpdate(){
    iconP1Animated.x = iconP1.x+5;
    iconP1Animated.y = iconP1.y-17;
    iconP1Animated.scale.x = isBeating ? 1 : iconP1.scale.x;
    iconP1Animated.scale.y = isBeating ? 1 : iconP1.scale.y;

    iconP2Animated.x = iconP2.x-2;
    iconP2Animated.y = iconP2.y-3;
    iconP2Animated.scale.x = isBeating ? 1 : iconP2.scale.x;
    iconP2Animated.scale.y = isBeating ? 1 : iconP2.scale.y;

    isBeating = (health > 80/50);
    if (isBeating){
        if(iconP1Animated.animation.name != 'win'){
            iconP1Animated.animation.play('win');
            iconP2Animated.animation.play('win');
        }
    }else{
        iconP1Animated.animation.play('idle');
        iconP2Animated.animation.play('idle');
    }
}

function beatHit(){
    if(isBeating){
        iconP1Animated.animation.play('win',true);
        iconP2Animated.animation.play('win',true);
    }
}