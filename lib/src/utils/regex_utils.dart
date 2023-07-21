class RegexUtils {
  static String removeTrailing({required String originString}) {
    String newString = "";
    if (originString.endsWith("==")) {
      newString = originString.substring(0, originString.length - 2);
    }
    return newString;
  }
}
