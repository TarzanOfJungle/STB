enum WebsocketEvent {
  groupchatMessageReceived("ReceiveShoppingMessage"),
  groupchatMessageDeleted("ReceiveShoppingMessageDeleted"),
  
  productAssignmentCreated("ReceiveProductAssignmentCreated"),
  productAssignmentUpdated("ReceiveProductAssignmentUpdated"),
  productAssignmentDeleted("ReceiveProductAssignmentDeleted"),
  
  purchaseCreated("ReceivePurchaseCreated"),
  purchaseUpdated("ReceivePurchaseUpdated"),
  purchaseDeleted("ReceivePurchaseDeleted"),

  shoppingCreated("ReceiveShoppingCreated"),
  shoppingUpdated("ReceiveShoppingUpdated"),
  shoppingDeleted("ReceiveShoppingDeleted"),

  userAssigned("ReceiveUserAssigned"),
  userUnassigned("ReceiveUserUnassigned"),

  friendshipRequestCreated("ReceiveFriendshipRequestCreated"),
  friendshipRequestStatusUpdated("ReceiveFriendshipRequestStatusUpdated"),
  friendshipRequestDeleted("ReceiveFriendshipRequestDeleted"),
  friendshipDeleted("ReceiveFriendshipDeleted"),

  userChatMessageReceived("ReceiveUserMessage"),
  userChatMessageDeleted("ReceiveUserMessageDeleted");

  final String messageName;
  const WebsocketEvent(this.messageName);
}
