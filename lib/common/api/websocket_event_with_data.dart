import 'package:split_the_bill/common/api/websocket_event.dart';

class WebsocketEventWithData<T> {
  final WebsocketEvent event;
  final T data;

  const WebsocketEventWithData(this.event, this.data);
}
