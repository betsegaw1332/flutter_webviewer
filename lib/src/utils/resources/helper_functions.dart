abstract class HelperFunctions {
  static String? validateTextField(String? inputText) {
    final isMatched = RegExp(
            r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?')
        .hasMatch(inputText!);

    return isMatched ? null : "Not a valid url";
  }
}
