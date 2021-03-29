extension UnicodeString on String {
  String? decodeUnicode() {
    final Pattern unicodePattern = new RegExp(r'\\u([0-9A-Fa-f]{4})');
    final String newStr =
        this.replaceAllMapped(unicodePattern, (Match unicodeMatch) {
      final int hexCode = int.parse(unicodeMatch.group(1)!, radix: 16);
      final unicode = String.fromCharCode(hexCode);
      return unicode;
    });
    return newStr;
  }

  String unescape() {
    var escape1 = this;
    if (escape1.indexOf("\\u") == -1) return escape1;
    var processed = "";
    var position = escape1.indexOf("\\u");
    while (position != -1) {
      if (position != 0) processed += escape1.substring(0, position);
      var token = escape1.substring(position + 2, position + 6);
      escape1 = escape1.substring(position + 6);
      processed += token.decodeUnicode()!;
      position += escape1.indexOf("\\u");
    }
    processed += escape1;
    return processed;
  }
}
