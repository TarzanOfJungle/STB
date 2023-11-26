enum WebsocketEvent {
  groupchatMessageReceived("ReceiveShoppingMessage");

  final String messageName;
  const WebsocketEvent(this.messageName);
}
