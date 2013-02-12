library terrestra;

import "dart:html";
import 'dart:json';
import 'dart:async';

part 'lib/chat.dart';
part 'lib/messages.dart';
part 'lib/terrestra_socket.dart';

main() {
  //init the listener(s) for the startsite
  init();
}

/**
 * initialize page index
 * 
 */
init() {
  var playButton = query('#playButton');
  
  //on click show gamefield
  playButton.onClick.listen((event) => showGameField());

  int i = 0;

  

}

/**
 * set display style of canvas to true
 */
void showGameField() {
  //start websocket and
  new TerrestraSocket();
  //display the field 
  query('#canvas_container').attributes['style'] = 'filter:alpha(opacity=50); -moz-opacity:0.50; -khtml-opacity:0.20; opacity:0.90;';
  
  var loginDiv = query('#login');
  loginDiv.attributes['style'] = 'display:none';
  
  var logo = query('#logo');
  logo.attributes['style'] = 'display:none';
}


