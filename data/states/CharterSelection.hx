import funkin.menus.FreeplayState.FreeplaySonglist;
import funkin.options.type.EditorIconOption;
import funkin.options.type.OptionType;
import funkin.options.type.TextOption;
import funkin.options.type.NewOption;
import funkin.options.OptionsScreen;
import funkin.editors.charter.Charter;
import funkin.editors.charter.ChartCreationScreen;
import funkin.editors.charter.SongCreationScreen;

function postCreate(){
    freeplayList = FreeplaySonglist.get(true);

    var list = [
        for(s in freeplayList.songs) new EditorIconOption(s.displayName, "Press ACCEPT to choose a difficulty to edit.", s.icon, function() {
            curSong = s;
            var list:Array<OptionType> = [
                for(d in s.difficulties) if (d != "") 
                    new TextOption(d, "Press ACCEPT to edit the chart for the selected difficulty", function() {
                        FlxG.switchState(new Charter(s.name, d));
                    })
            ];
            list.push(new NewOption("New Difficulty", "New Difficulty", function() {
                FlxG.state.openSubState(new ChartCreationScreen(saveChart));
            }));
            optionsTree.add(new OptionsScreen(s.name, "Select a difficulty to continue.", list));
        }, s.parsedColor)
    ];

    list.insert(0, new NewOption("New Song", "New Song", function() {
        FlxG.state.openSubState(new SongCreationScreen(saveSong));
    }));

    list.insert(0, new TextOption("ONLY SHOWS FREEPLAY LIST", "", function() {
        FlxG.sound.play(Paths.sound('Vs Whitty/ouchMyToe'));
        trace('FUCK YOU!!!!!!!!!!!!!! sowy didnt mean that :3 -7oltan');
    }));

    list[0].offset.x = 100;
    list[0].color = FlxColor.YELLOW;

    main.group.members = [];

    for(e in list)
        main.add(e);

    main.curSelected = -1;

    trace('tehe');
}