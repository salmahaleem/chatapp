class RoomModel {
  String id;
  String lastMessage;
  String lastMessageTime;
  List<String> members;
  String createdAt;

  RoomModel({
    required this.id,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.members,
    required this.createdAt
  });

  factory RoomModel.fromJson(Map<String,dynamic> json){
    return RoomModel(
        id : json['id'] ?? ' ',
        lastMessage : json['lastMessage'] ?? ' ',
        lastMessageTime : json['lastMessageTime'] is int
        ? DateTime.fromMillisecondsSinceEpoch(json['lastMessageTime']).toIso8601String()
            : json['lastMessageTime'] ?? ' ',
        members:List<String>.from(json['members'] ?? []) ,
        createdAt: json['created_at'] is int
            ? DateTime.fromMillisecondsSinceEpoch(json['created_at']).toIso8601String()
            : json['created_at'] ?? ' ',
    );
  }

  Map<String,dynamic>toJson(){
    return {
      'id': id,
      'lastMessage' : lastMessage,
      'lastMessageTime' : lastMessageTime,
      'members' : members,
      'createdAt' : createdAt
    };
}
}