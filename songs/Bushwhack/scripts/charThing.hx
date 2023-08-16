var mic:FlxSprite;
var hand:FlxSprite;
var otherHand:FlxSprite;

function postCreate() {
    // Whoever came up with this is a genius
    strumLines.members[0].characters[1].visible = false; // hide cablecrow
}

function cameraStatic() {
    if (curBeat >= 480 && curBeat <= 484 && curCameraTarget == 1) {
        camFollow.setPosition(400, 500); // cam before mic grab
    } else {
        return false;
    }
}

function postUpdate(elapsed:Float) {cameraStatic();}

function cableSpawn(){
        trace("cable boy");

        FlxTween.tween(camGame,{zoom: 1.6},1);
        
        FlxTween.tween(strumLines.members[0].characters[1],{x: dad.x, y: dad.y + 20},1);
        mic.alpha = 1;
        mic.x = strumLines.members[0].characters[1].x;
        remove(otherHand);
        FlxG.sound.play(Paths.sound("Vs Zardy/micfuckinhit"));
        FlxTween.tween(mic,{x: mic.x + 3400},2,{ /**mic go weeeeeeeeeeee**/
        onUpdate: function(tw) {
            // FOR GIMMICK SHIT

            if (mic.overlaps(boyfriend) && grabbed && health != 0)
            {
                FlxG.sound.play(Paths.sound("Vs Zardy/bf_mic_hit"));
                health = -1;
                lastGrab = Conductor.songPosition;
                FlxG.camera.flash(FlxColor.RED,1,null,true);
            }
            mic.angle += 4;
        },
        onComplete: function(tw) {
            remove(mic);
            if (health != 0)
            {
                FlxTween.tween(camGame,{zoom: defaultCamZoom},0.4);
                remove(iconP2);
                iconP2 = new HealthIcon("cableCrow", false);
                iconP2.alpha = 0;
                iconP2.y = healthBar.y - (iconP2.height / 1.5);
                iconP2.cameras =  [camHUD];
                // iconP2.updateHitbox();
                iconP2.health = health;
                insert(members.indexOf(healthBar)+1, iconP2);
                FlxTween.tween(iconP2,{alpha:1},0.3);
                this.update(0);
            }
        }});
}

function stepHit() {
    if (curStep == 1910)
        {
            FlxTween.tween(dad,{alpha:0},0.3); // Brrraaaaaghh - Zardy
            FlxTween.tween(iconP2,{alpha:0},0.3);
            mic = new FlxSprite(dad.x + 200,dad.y - 100).loadGraphic(Paths.image("stages/Bushwhack/Mic"));
            mic.alpha = 0;

            mic.setGraphicSize(Std.int(mic.width * 0.4));

            mic.antialiasing = true;

            hand = new FlxSprite(0,mic.y).loadGraphic(Paths.image("stages/Bushwhack/Arm0"));
            hand.x = mic.x - hand.width;
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

        if (curStep == 1920){
            // cable crow stuff
            remove( strumLines.members[0].characters[0]);

            strumLines.members[0].characters[1].visible = true; // show cable crow
            strumLines.members[0].characters[1].x = dad.x - 1300;
            strumLines.members[0].characters[1].y = dad.y - 135;

            hand.alpha = 1;

            FlxTween.tween(hand,
                {x: mic.x - 2600},1,{onComplete: function (tw) {
                remove(hand);
                FlxG.sound.play(Paths.sound("Vs Zardy/cable_claw_impact"));
                otherHand.x = hand.x - 335;
                otherHand.y = hand.y;
                otherHand.alpha = 1;
                mic.alpha = 0;
                FlxG.sound.play(Paths.sound("Vs Zardy/cable_claw_retract"));
                FlxTween.tween(otherHand,{x: /*it's my turn now*/ strumLines.members[0].characters[1].x - 2700},0.8, {onComplete: function (fuck:FlxTween) {
                    cableSpawn();
                }});
            }});

        }
}