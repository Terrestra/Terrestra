library terrestra;

import "dart:io";
import "dart:json";

part 'lib/worldServer.dart';
part 'lib/terestraConnection.dart';
part 'lib/messages.dart';
part 'entities/character.dart';
part 'entities/entity.dart';
part 'entities/mob.dart';
part 'entities/player.dart';

main() {
  HttpServer server = new HttpServer();
  WebSocketHandler wsHandler = new WebSocketHandler();

  server.addRequestHandler((req) => req.path == "/ws", wsHandler.onRequest);

  WorldServer world1 = new WorldServer(1, 10);

  wsHandler.onOpen = (WebSocketConnection conn) {

    Player player = new Player(new TerestraConnection(conn, world1), world1);
    world1.addPlayer(player);
  };

  server.listen("192.168.2.111",8080);
  print("Server up and running!");
}