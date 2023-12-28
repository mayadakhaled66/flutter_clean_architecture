import 'package:socket_io_client/socket_io_client.dart' as IO;

class ServerSocketProvider {
  static final ServerSocketProvider _serverSocketProvider =
  ServerSocketProvider._internal();
  static late IO.Socket _socket;

  factory ServerSocketProvider(String serverUrl,Function(dynamic) onEventIsReceived,{String? eventName}) {
    init(serverUrl,onEventIsReceived);
    return _serverSocketProvider;
  }
  ServerSocketProvider._internal();


  static void init (String serverUrl, Function(dynamic) onEventIsReceived,{String? eventName}){
   _socket = IO.io(serverUrl);//'http://localhost:3000'
    _socket.onConnect((_) {
      print('connect');
      // socket.emit('msg', 'connected');
    });
    _socket.on('event', (data) => onEventIsReceived(data));
    _socket.onDisconnect((_) => print('disconnect'));
  }
}