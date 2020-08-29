class Alert {
  final String id;
  final String cameraName;
  final String priority;
  final String objects;
  final String clipPath;
  final String gifPath;
  final String timeStamp;

  const Alert(
      {this.id,
      this.cameraName,
      this.priority,
      this.objects,
      this.clipPath,
      this.gifPath,
      this.timeStamp});

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json['id'],
      cameraName: json['camera_name'],
      objects: json['objects'],
      clipPath: json['clip_location'],
      gifPath: json['gif_location'],
      timeStamp: json['creation_timestamp'],
      priority: json['priority'],
    );
  }
}
