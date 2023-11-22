function onWeekSelect(e) {
    if (e.difficulty == "rechart") PlayState.loadWeek(weeks[curWeek], difficulty.contains("Rechart"));
}