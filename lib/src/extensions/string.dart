extension StringExtension on String {
  int toInt() => int.parse(isEmpty ? "0" : this);
}
