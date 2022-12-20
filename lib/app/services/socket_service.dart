import 'package:chomoi/data/providers/network/api_endpoint.dart';
import 'package:socket_io_client/socket_io_client.dart' as client;
import 'package:get/get.dart';

abstract class SocketService {
  static SocketService get get => Get.find<SocketService>();

  client.Socket get socket;

  void init();

  void emitSignIn({required String userId});

  void emitChat({
    required String message,
    required String sourceId,
    required String targetId,
    required String chatBoxId,
    required String path,
  });

  void dispose();
}

class SocketServiceImpl extends GetxService implements SocketService {
  @override
  Future<SocketService> init() async {
    _socket = client.io(APIEndpoint.choMoiSocket, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    _socket.connect();
    return this;
  }

  late client.Socket _socket;

  @override
  void onClose() {
    _socket.dispose();
    super.onClose();
  }

  @override
  client.Socket get socket => _socket;

  @override
  void emitChat({
    required String message,
    required String sourceId,
    required String targetId,
    required String chatBoxId,
    required String path,
  }) {
    socket.emit('message', {
      'message': message,
      'sourceId': sourceId,
      'targetId': targetId,
      'chat_box_id': chatBoxId,
      'path': path,
    });
  }

  @override
  void emitSignIn({required String userId}) {
    socket.emit('signIn', userId);
  }

  @override
  void dispose() {
    _socket.dispose();
  }
}
