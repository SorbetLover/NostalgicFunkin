import funkin.editors.ui.UITextBox;
import funkin.editors.ui.UIText;

var didAlr = false;
var weekTextBox;
var recharterTextBox;

function postUpdate(){
    if(!didAlr)
        postCreate();
}

function postCreate() {
    didAlr = true;

    weekTextBox = new UITextBox(needsVoicesCheckbox.x-150,needsVoicesCheckbox.y+50, metadata.week, 130);
    add(weekTextBox);
    add(new UIText(weekTextBox.x, weekTextBox.y - 24, 0, "week"));

    recharterTextBox = new UITextBox(weekTextBox.x+140, weekTextBox.y, metadata.recharter, 130);
    add(recharterTextBox);
    add(new UIText(recharterTextBox.x, recharterTextBox.y - 24, 0, "recharter"));

    var ogFunc = saveButton.callback;
    saveButton.callback = function(){
        ogFunc();
		PlayState.SONG.meta.week = weekTextBox.label.text;
        if(!(recharterTextBox.label.text == null || recharterTextBox.label.text == ''))
		    PlayState.SONG.meta.recharter = recharterTextBox.label.text;
    };
}