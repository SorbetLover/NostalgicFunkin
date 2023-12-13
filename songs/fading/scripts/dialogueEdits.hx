import funkin.game.cutscenes.DialogueCutscene;
import funkin.game.cutscenes.dialogue.DialogueBox;

function postUpdate() {
    if (subState != null && subState.curLine != null) {
        subState.dialogueBox.text.color = 0xFF0DF07E;
    }
}