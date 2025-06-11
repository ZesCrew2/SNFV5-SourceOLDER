import haxe.ds.StringMap;

import hxvlc.flixel.FlxVideoSprite;
import flixel.FlxG;
import flixel.sound.FlxSound;

var debug_mode = true;
var update_delay = 2;
var in_pause = false;

var video_spr:FlxVideoSprite;

function create(){
}

function pause(){
    if (video_spr != null){
        video_spr.pause();
        if (FlxG.signals.focusLost.has(video_spr.pause)){
            FlxG.signals.focusLost.remove(video_spr.pause);
        }
        if (FlxG.signals.focusGained.has(video_spr.resume)){
            FlxG.signals.focusGained.remove(video_spr.resume);
        }
    }
    
}

function resume(){
    if (video_spr != null){
        video_spr.resume();
        if (!FlxG.signals.focusLost.has(video_spr.pause)){
            FlxG.signals.focusLost.add(video_spr.pause);
        }
        if (!FlxG.signals.focusGained.has(video_spr.resume)){
            FlxG.signals.focusGained.add(video_spr.resume);
        }
    }
    
}

function create_video(){
    video_spr = new FlxVideoSprite();
    video_spr.autoPause = false;
    video_spr.cameras = [game.camHUD];
    video_spr.load(backend.Paths.video('pdlyrics'), [':no-audio']);
    
    video_spr.bitmap.onFormatSetup.add(function(){
        final scale:Float = Math.min(FlxG.width / video_spr.bitmap.bitmapData.width, FlxG.height / video_spr.bitmap.bitmapData.height);
 
        video_spr.setGraphicSize(video_spr.bitmap.bitmapData.width * scale, video_spr.bitmap.bitmapData.height * scale);
        video_spr.updateHitbox();
        video_spr.screenCenter();
    });
    video_spr.bitmap.onEndReached.add(function(){
        remove(video_spr);
        video_spr.destroy();
    });
    if (FlxG.signals.focusLost.has(video_spr.pause)){
        FlxG.signals.focusLost.remove(video_spr.pause);
    }
    if (FlxG.signals.focusGained.has(video_spr.resume)){
        FlxG.signals.focusGained.remove(video_spr.resume);
    }
    if (!FlxG.signals.focusLost.has(video_spr.pause)){
        FlxG.signals.focusLost.add(video_spr.pause);
    }
    if (!FlxG.signals.focusGained.has(video_spr.resume)){
        FlxG.signals.focusGained.add(video_spr.resume);
    }
    video_spr.play();
    insert(game.members.indexOf(game.uiGroup) + 1, video_spr);
    
}
function preload_video(){
    var fake_video_spr = new FlxVideoSprite();
    fake_video_spr.autoPause = false;
    fake_video_spr.cameras = [game.camHUD];
    fake_video_spr.load(backend.Paths.video('pdlyrics'), [':no-audio']);
    
    fake_video_spr.bitmap.onEndReached.add(function(){
        remove(fake_video_spr);
        fake_video_spr.destroy();
    });
    fake_video_spr.play();
    fake_video_spr.alpha = 0.0001;
    add(fake_video_spr);
    
}