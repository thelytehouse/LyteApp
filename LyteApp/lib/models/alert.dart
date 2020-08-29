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
}
