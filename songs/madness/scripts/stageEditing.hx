function postCreate() {
    stage.getSprite("island").scale.x = 1.4;
    stage.getSprite("hue").alpha -= 0.3;
    stage.getSprite("hue").blend = "screen";
}