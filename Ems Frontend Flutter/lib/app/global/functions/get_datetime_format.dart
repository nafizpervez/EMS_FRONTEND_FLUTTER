String getDateTimeString(String dt) {
  final t = DateTime.parse(dt);
  return "${t.year}-${t.month}-${t.day} ${t.hour}:${t.minute}:00";
}

String getDTString(DateTime d, DateTime t) {
  return "${d.year}-${d.month}-${d.day} ${t.hour}:${t.minute}:00";
}
