library terrestra;

import "dart:html";
import 'dart:json';
import 'dart:async';
import 'package:simple_audio/simple_audio.dart';

part 'lib/chat.dart';
part 'lib/Types.dart';
part 'lib/terrestra_socket.dart';
part 'lib/asset_manager.dart';
part 'view/game.dart';
part 'view/gameClient.dart';
part 'entities/character.dart';
part 'entities/player.dart';
part 'entities/mob.dart';
part 'entities/entity.dart';

Game game;
TerrestraSocket socket;

/**
 * 
 * Main of terrestra application
 * 
 */
main() {
  //init the listener(s) for the startsite
  init();
  
  print(document.documentElement.clientWidth);
}

/**
 * initialize page index
 * 
 */
init() {
  var playButton = query('#playButton');
  //on click show gamefield
  playButton.onClick.listen((event) => startGameInterface());
  
  window.onKeyDown.listen((KeyboardEvent key) {
    if(game != null){
      game.onKeyDown(key);
    }
  });
  
  window.onKeyUp.listen((KeyboardEvent key) {
    if(game != null){
      game.onKeyDown(key);
    }
  });

}

  void onKeyDown(KeyboardEvent key){
    print(key.keyCode);
    if(game != null){
      game.onKeyDown(key);
    }
  }

  void onKeyReleased(KeyboardEvent key){
    if(game != null){
      game.onKeyReleased(key);
    }
  }

/**
 * set display style of canvas to true and starts the TerrestraSocket Connection
 */
void startGameInterface() {
  var assetManager = new AssetManager();
  

  game = new Game(assetManager);
  
  //start websocket and
  socket = new TerrestraSocket();

  //build new audioManager on this base path
  AudioManager audioManager = new AudioManager("public/audio");
  AudioClip terrestraClip = audioManager.makeClip("terrestra", "terrestra.wav");
  //added simple audio lib and used for example
  
  //testload
  assetManager.queueDownload("public/image/up_sprite.gif");
  
  //callback to start after loading all sprites of quere
  assetManager.downloadAll(() {
    
    //display the field 
    query('#canvas_container').attributes['style'] = 'filter:alpha(opacity=50); -moz-opacity:0.50; -khtml-opacity:0.20; opacity:0.90;';
    
    //queries the login div and hides it
    var loginDiv = query('#login');
    loginDiv.attributes['style'] = 'display:none';
    
    //queries the logo and hides it
    var logo = query('#logo');
    logo.attributes['style'] = 'display:none';
    
    // Load sound data into clip.
    terrestraClip.load().then((_) {
      // Assign clip to music system.
      audioManager.music.clip = terrestraClip;
      // Play music.
      audioManager.music.play();
    });
  });
}