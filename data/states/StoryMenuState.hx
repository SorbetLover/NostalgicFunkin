import openfl.utils.Assets;

var weekImage;

function draw(){
    var text:String = 'TRACKS\n';
    for(e in weeks[curWeek].songs) {
        if (!e.hide) {
            var split = e.name.toUpperCase().split('/');
            text = text + '\n' + split[split.length-1];
        }
    }
    tracklist.text = text;
}

function postCreate(){
	weekImage = new FlxSprite(0,0);
    weekImage.alpha = 0.0000000000000000000001;
    insert(members.indexOf(characterSprites),weekImage);
}

function tryLoadingWeekImage(name){
    if(Assets.exists(Paths.image('menus/storymenu/backgrounds/'+name))){
        loadWeekImage(name);
        weekImage.alpha = 1;
    }else
        weekImage.alpha = 0.00000000000000000000000001;
}

function loadWeekImage(name){
    weekImage.loadGraphic(Paths.image('menus/storymenu/backgrounds/'+name));
    weekImage.updateHitbox();
    weekImage.antialiasing = true;
    weekImage.setPosition(weekBG.x+(weekBG.width/2)-(weekImage.width/2), weekBG.y+(weekBG.height/2)-(weekImage.height/2));//should be useful for unique sized bgs
}

function onChangeWeek(event)
    tryLoadingWeekImage(weeks[event.value].id);

function update() {
    switch (weekTitle.text) {
        case "Hardest Mod In The Corn Field", "Sequel To The Hardest Mod In The Corn Field":
            weekBG.color = FlxColor.black;
        default: weekBG.color = 0xFFF9CF51;

    }
}