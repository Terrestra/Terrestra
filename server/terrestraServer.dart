library terrestra;

import "dart:io";
import "dart:json";

part 'lib/worldServer.dart';
part 'lib/terestraConnection.dart';
part 'lib/messages.dart';
part 'lib/config.dart';

part 'entities/character.dart';
part 'entities/entity.dart';
part 'entities/mob.dart';
part 'entities/player.dart';

main() {
  //get the serverconfig
  Config config = new Config();
  Map systemConfig = config.getConfig();
  
  HttpServer server = new HttpServer();
  WebSocketHandler wsHandler = new WebSocketHandler();

  server.addRequestHandler((req) => req.path == "/ws", wsHandler.onRequest);

  WorldServer world1 = new WorldServer(1, 10);

  wsHandler.onOpen = (WebSocketConnection conn) {

    Player player = new Player(new TerestraConnection(conn, world1), world1);
    world1.addPlayer(player);
  };

  server.listen(systemConfig['server.adress'], systemConfig['server.port']);
  print("Server up and running!");
}