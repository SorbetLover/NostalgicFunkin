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

function update() {
    if (weekTitle.text == "Hardest Mod In The Corn Field" || weekTitle.text == "Sequel To The Hardest Mod In The Corn Field") {
        weekBG.color = FlxColor.black;
    } else {
        weekBG.color =  0xFFF9CF51;
    }
}