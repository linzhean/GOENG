import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

class HtmlToStringParser {
  const HtmlToStringParser();

  String extractPlainText(String htmlString) {
    final document = parse(htmlString);
    final buffer = StringBuffer();

    for (final node in document.body?.nodes ?? []) {
      if (node is Text) {
        buffer.write(node.text);
      } else if (node is Element && node.localName == "xref") {
        buffer.write(node.text);
      }
    }

    return buffer.toString();
  }
}
