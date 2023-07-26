// Hscript version of ExtendedCentral's Tabi health gimmick Lua script
// Plus some color flash thing that was in KE
import flixel.util.FlxColor;

var tabiHealthBar = true;
var drainHealth = true;
var moveBar = true;
var samShit:FlxSprite;

function create() {
    if (tabiHealthBar)
        @:bypassAccessor maxHealth += 0.8;
}
function postCreate() {
	health += 1.1;

    samShit = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
	samShit.alpha = 0.05;
	samShit.color = FlxColor.BLACK;
	add(samShit);
	samShit.cameras = [camHUD];
	samShit.visible = false;
    // canDie = false;
}

function update() {
    if (tabiHealthBar) {
        if (healthBar.x > 50.5 && healthBarBG > 50.5) {moveBar = true;}
    }
}

function onPlayerHit(event) {
	health += 0.050; //0.050

    if (health > 1.950 && moveBar == true) {
        healthBar.x -= 20;
        healthBarBG.x -= 20;
    }

    if (healthBar.x < 50.5 && healthBarBG.x < 50.5) {
        healthBar.x += 0;
        healthBarBG.x += 0;
        moveBar = false;
    }

    if (healthBar.x > 50.5 && healthBarBG.x > 50.5) {
        healthBar.x += 0;
        healthBarBG.x += 0;
        moveBar = true;
    }
}

function onDadHit(event:NoteHitEvent) {
    // I know this code looks dogshit but "it just works" - Tod
    var randomActivate = FlxG.random.int(0, 10);
    function colorFlashThing() {
        if (randomActivate <= 5) {
            // trace(randomActivate);
            samShit.visible = true;
        } else {
            samShit.visible = false;
        }
    }

    colorFlashThing();
    
    samShit.color = FlxG.random.color(FlxColor.BLACK, FlxColor.WHITE);

    if (tabiHealthBar) {
        if (healthBar.x < 343.5 && healthBarBG.x < 343.5) {
            healthBar.x += 5;
            healthBarBG.x += 5;
        }
    }

    if (drainHealth == true && healthBar.x > 343.2 || healthBarBG.x > 343.2) {
        health -= 0.03; //0.03
    }

    if (event.note.isSustainNote) {
        health -= 0.0005;
        // trace("Yo Hold note");
    }

	if (!FlxG.save.data.shakeShit)
    	camGame.shake(0.03, 0.02, null, true);
}