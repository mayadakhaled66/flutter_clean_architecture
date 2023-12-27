class NotificationData {
  String title ;
  String body ;
  int? id;
  String? channelName;
  String? channelId;
  String? token;
  NotificationData(this.title, this.body,{ this.id,this.channelId,this.channelName,
      this.token});
}