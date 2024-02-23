import funkin.editors.ui.UITextBox;
import funkin.editors.ui.UIText;

var didAlr = false;
var weekTextBox;

function postUpdate(){
    if(!didAlr)
        postCreate();
}

function postCreate() {
    didAlr = true;

    weekTextBox = new UITextBox(needsVoicesCheckbox.x,needsVoicesCheckbox.y+80, metadata.week, 130);
    add(weekTextBox);
    add(new UIText(weekTextBox.x, weekTextBox.y - 24, 0, "week"));

    var ogFunc = saveButton.callback;
    saveButton.callback = function(){
        ogFunc();
		PlayState.SONG.meta.week = weekTextBox.label.text;
    };
}