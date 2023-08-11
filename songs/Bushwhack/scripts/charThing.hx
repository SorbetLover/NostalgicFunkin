var mic:FlxSprite;
var hand:FlxSprite;
var otherHand:FlxSprite;

function postCreate() {
    strumLines.members[0].characters[1].visible = false;
}

function postUpdate(elapsed:Float) {
    // for (d in cpuStrums)
    //     d.alpha -= 0.001;
}

function cableSpawn(){
        trace("cable boy");

        FlxTween.tween(camGame,{zoom: 1.6},1);
        
        FlxTween.tween(dad,{x: defaultX},1);
        mic.alpha = 1;
        mic.x = dad.x;
        remove(otherHand);
        FlxG.sound.play(Paths.sound("micfuckinhit","Vs Zardy"));
        FlxTween.tween(mic,{x: mic.x + 3400},2,{
        onUpdate: function(tw) {
            if (mic.overlaps(boyfriend) && grabbed && health != 0)
            {
                FlxG.sound.play(Paths.sound("bf_mic_hit","Vs Zardy"));
                health = 0;
                lastGrab = Conductor.songPosition;
                FlxG.camera.flash(FlxColor.RED,1,null,true);
                boyfriend.playAnim("dead");

                if (FlxG.sound.music != null)
                {
                    FlxG.sound.music.stop();
                    vocals.stop();
                }
            }
            mic.angle += 4;
        },
        onComplete: function(tw) {
            remove(mic);
            if (health != 0)
            {
                stopMoving = false;
                FlxTween.tween(camGame,{zoom: Stage.camZoom},0.4);
                remove(iconP2);
                iconP2 = new HealthIcon(dad.curCharacter,false);
                iconP2.y = healthBar.y - (iconP2.height / 2);
                iconP2.setGraphicSize(Std.int(FlxMath.lerp(150, iconP2.width, 0.50)));
                iconP2.alpha = 0;
                iconP2.cameras = [camHUD];
                add(iconP2);
                FlxTween.tween(iconP2,{alpha:1},0.3);
            }
        }});
}

function stepHit() {
    if (curStep == 1910)
        {
            FlxTween.tween(dad,{alpha:0},0.3);
            FlxTween.tween(iconP2,{alpha:0},0.3);
            mic = new FlxSprite(dad.x+ 300,dad.y - 100).loadGraphic(Paths.image("stages/Bushwhack/Mic"));
            mic.alpha = 0;

            mic.setGraphicSize(Std.int(mic.width * 0.4));

            mic.antialiasing = true;

            hand = new FlxSprite(mic.x - hand.width,mic.y).loadGraphic(Paths.image("stages/Bushwhack/Arm0"));
            hand.y += 40;

            hand.alpha = 0;

            hand.setGraphicSize(Std.int(hand.width * 0.4));

            add(hand);

            otherHand = new FlxSprite(hand.x,hand.y).loadGraphic(Paths.image("stages/Bushwhack/Grab"));
            otherHand.setGraphicSize(Std.int(otherHand.width * 0.4));
            otherHand.alpha = 0;
            add(otherHand);

            FlxTween.tween(mic,{alpha: 1},0.1);

            add(mic);
        }

        if (curStep == 1920)
        {
            // cable crow stuff
            remove(dad);

            stopMoving = true;
            var newX = dad.x - 1300;
            var newY = dad.y - 135;
            dad.destroy();
            dad = new Character(newX,newY,"cableCrowPog");
            add(dad);

            hand.alpha = 1;

            FlxTween.tween(hand,
                {x: mic.x - 2600},1,{onComplete: function (tw) {
                remove(hand);
                FlxG.sound.play(Paths.sound("cable_claw_impact","Vs Zardy"));
                otherHand.x = hand.x - 335;
                otherHand.y = hand.y;
                otherHand.alpha = 1;
                mic.alpha = 0;
                FlxG.sound.play(Paths.sound("cable_claw_retract","Vs Zardy"));
                FlxTween.tween(otherHand,{x: dad.x - 2700},0.8, {onComplete: function (fuck:FlxTween) {
                    cableSpawn();
                }});
            }});

        }
}

// function beatHit(curBeat) {
//     if (curBeat == 160) {
//         // remove(iconP2);
//         // iconP2.destroy();
//         // iconP2 = new HealthIcon("cableCrow", false);
//         // iconP2.y = healthBar.y - (iconP2.height / 1.5);
//         // iconP2.offset.set(500);
//         // iconP2.updateHitbox();
//         // iconP2.cameras =  [camHUD];
//         // iconP2.health = health;
//         // add(iconP2);
//         // this.update(0);
//     }
// }