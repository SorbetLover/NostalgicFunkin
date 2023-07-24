function switchChar(charToSwitch:String, character:String, icon:String) {
    switch (charToSwitch) {
        case "dad":
            remove(dad);
            dad = new Character(dad.x, dad.y, character);
            dad.updateHitbox();
            add(dad);

            iconP2.loadGraphic(Paths.image('icons/' + icon), true, 150, 150);
            iconP2.animation.add("char", [for(i in 0...iconP2.frames.frames.length) i], 0, false);
            iconP2.antialiasing = true;
            iconP2.animation.play("char");
        
        case "bf":
            remove(boyfriend);
            boyfriend = new Character(boyfriend.x, boyfriend.y, character, true);
            boyfriend.updateHitbox();
            add(boyfriend);

            iconP1.loadGraphic(Paths.image('icons/' + icon), true, 150, 150);
            iconP1.animation.add("char", [for(i in 0...iconP1.frames.frames.length) i], 0, false);
            iconP1.antialiasing = true;
            iconP1.animation.play("char");

        case "gf":
            remove(gf);
            gf = new Character(gf.x, gf.y, character);
            gf.updateHitbox();
            add(gf);
    }
}

function stepHit()
{
    switch (curStep)
    {
        case 896:
        switchChar('dad', 'updikeEdgy', 'updike');
    }
}