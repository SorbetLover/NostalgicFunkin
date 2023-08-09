// function grabThatMF(){

//     trace("IM GRABBING THAT MF");

//     grabbed = true;

//     vine.alpha = 1;

//     vine.animation.play("vine");

//     boyfriend.animation.finishCallback = function(name)
//     {
//         // nothing
//     };

//     trace("playin grab");
// }

// function generateAndShowRandomNotes(?length:Int = 4){
//     trace("creating da notes");
//     for(i in funnyArray)
//         remove(i);

//     funnyArray = [];

//     var randomNotes = [];
//     for(i in 0...length)
//         randomNotes.push(new FlxRandom().int(0,3));
    
//     var index = 0;

//     for(i in randomNotes)
//     {
//         trace("note " + i);
//         var pog = new Note(playerStrums, i, null, 0,0);
//         add(pog);

//         pog.setGraphicSize(Std.int(pog.width * 0.75));

//         funnyArray.push(pog);

//         pog.alpha = 0;

//         FlxTween.tween(pog,{alpha: 1},0.3);

//         pog.x = boyfriend.x + (pog.width * index);
//         pog.y = boyfriend.y - 135;

//         index++;
//     }

// }

// function update(elapsed:Float) {
//     if (Stage.curStage == 'bushwack' && !grabbed)
//         if (vine.animation.frameIndex == 0)
//         {
//             vine.animation.stop();
//             vine.alpha = 0;
//         }

//         if (Stage.curStage == 'bushwack' && grabbed)
//             {
//                 if (vine.animation.frameIndex >= 35 && vine.animation.frameIndex <= 37 && boyfriend.animation.curAnim.name != "heldByVine")
//                 {
//                     FlxG.sound.play(Paths.sound("bf_grabbed_by_vine","ChallengeWeek"));
//                     grabInput = true;
//                     trace("AHH");
//                     boyfriend.playAnim("heldByVine");
//                     generateAndShowRandomNotes(lengthOfNotes);
//                 }
    
//                 if (vine.animation.frameIndex == 56 && !vine.animation.paused)
//                 {
//                     trace("pause!");
//                     vine.animation.pause();
//                 }
//             }

//             if (Stage.curStage == 'bushwack' && songStarted)
// 				{
// 					var notesToHit = false;
		
// 					for(i in notes)
// 						if (i.mustPress && i.strumTime - Conductor.songPosition <= 3000 && i.strumTime - Conductor.songPosition >= -3000)
// 							notesToHit = true;
		
// 					FlxG.watch.addQuick("Grab time", lastGrab - Conductor.songPosition);
// 					FlxG.watch.addQuick("Notes?", notesToHit);
// 					FlxG.watch.addQuick("Grabbed?", grabbed);
		
		
// 					if (!notesToHit && lastGrab != -1 && lastGrab - Conductor.songPosition <= -20000 / songMultiplier && !grabbed  && FlxG.sound.music.length - Conductor.songPosition > 6000)
// 					{
// 						boyfriend.playAnim("idle");
// 						strumLineNotes.forEach(function(spr:FlxSprite)
// 							{
// 								if (spr.animation.finished)
// 								{
// 									spr.animation.play('static');
// 									spr.centerOffsets();
// 								}
// 							});
// 						lastGrab = -1;
// 						grabThatMF();
// 					}
// 				}
//                 if (grabbed && grabInput)
//                     {
//                         var pressArray:Array<Bool> = [controls.LEFT_P, controls.DOWN_P, controls.UP_P, controls.RIGHT_P];
            
//                         var redo = false;
            
//                         var toRemoved = [];
            
//                         for (i in 0...pressArray.length)
//                         {
//                             var bool = pressArray[i];
            
//                             if (funnyArray.length != 0)
//                                 if (funnyArray[0].noteData == i && bool || PlayStateChangeables.botPlay)
//                                 {
//                                     toRemoved.push(funnyArray[0]);
//                                 }
//                                 else if (bool)
//                                     redo = true;
            
//                             for (i in toRemoved)
//                             {
//                                 if (funnyArray.contains(i))
//                                 {
//                                     funnyArray.remove(i);
//                                     FlxTween.tween(i, {alpha: 0}, 0.3, {
//                                         onComplete: function(tw)
//                                         {
//                                             remove(i);
//                                             i.destroy();
//                                         }
//                                     });
//                                 }
//                             }
//                             if (bool)
//                                 continue;
//                         }
            
//                         if (funnyArray.length == 0)
//                         {
//                             grabbed = false;
//                             lastGrab = Conductor.songPosition;
//                             if (boyfriend.animation.name == "heldByVine")
//                             {
//                                 boyfriend.playAnim("axe");
//                             }
            
//                             // this entire if statement is so stupid and bad
//                             // i'm really lazy so i'm doing this
//                             // sorry
            
//                             new FlxTimer().start(0.2, function(time)
//                             {
//                                 FlxG.sound.play(Paths.sound('bf_vine_defeat', "ChallengeWeek"));
//                                 vine.animation.play("vine", true, true);
//                             });
            
//                             new FlxTimer().start(1, function(time)
//                             {
//                                 grabInput = false;
//                             });
            
//                             boyfriend.animation.finishCallback = function(n:String)
//                             {
//                                 if (n == "axe")
//                                 {
//                                     FlxG.sound.play(Paths.sound('bf_axe_chop', "ChallengeWeek"));
//                                     boyfriend.playAnim("dodge");
//                                     trace("pog");
//                                 }
//                             };
//                         }
            
//                         if (redo)
//                         {
//                             health -= 0.15;
//                             for(ii in funnyArray)
//                             {
//                                 remove(ii);
//                                 ii.destroy();
//                             }
            
//                             funnyArray = [];
//                             generateAndShowRandomNotes();
//                         }
//                     }
// }

