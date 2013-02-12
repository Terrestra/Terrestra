library terrestra;

import "dart:html";
import 'dart:json';
import 'dart:async';

part 'lib/chat.dart';
part 'lib/messages.dart';
part 'lib/terrestra_socket.dart';
part 'lib/configer.dart';

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
  playButton.onClick.listen((event) => startClientConnection());

}

/**
 * set display style of canvas to true and starts the TerrestraSocket Connection
 */
void startClientConnection() {
  //start websocket and
  new TerrestraSocket();
  
  //display the field 
  query('#canvas_container').attributes['style'] = 'filter:alpha(opacity=50); -moz-opacity:0.50; -khtml-opacity:0.20; opacity:0.90;';
  
  //queries the login div and hides it
  var loginDiv = query('#login');
  loginDiv.attributes['style'] = 'display:none';
  
  //queries the logo and hides it
  var logo = query('#logo');
  logo.attributes['style'] = 'display:none';
}


