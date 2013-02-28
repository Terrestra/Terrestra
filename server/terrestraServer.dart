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
  
  WorldServer world1 = new WorldServer(1, 10);
  
  HttpServer.bind(systemConfig['server.adress'], systemConfig['server.port'])
  .then((HttpServer server) {
    server.transform(new WebSocketTransformer()).listen((WebSocket webSocket) {
      
      //Hier darf nix stehen also müssen wir schauen wie wir dann
      //nen neuen Spieler hinzufügen
      //Bzw. irgendwas stimmt mit der Connection nicht ganz weil er meint dass
      //er schon einen Subscriber hat. Naja mal schauen
      
      //Player player = new Player(new TerestraConnection(webSocket, world1), world1);
      //world1.addPlayer(player);
      
      webSocket.listen((event) {
        if (event is MessageEvent) {
          /* Handle message. */
        } else if (event is CloseEvent) {
          /* Handle closed. */
        }
      });
    });
  });

  print("Server up and running!");
}