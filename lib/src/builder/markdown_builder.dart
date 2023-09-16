import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_markdown/json_dynamic_widget_plugin_markdown.dart';
import 'package:markdown/markdown.dart' as md;

part 'markdown_builder.g.dart';

/// Creates a Markdown widget based on the JSON structure.
@jsonWidget
abstract class _MarkdownBuilder extends JsonWidgetBuilder {
  const _MarkdownBuilder({
    super.args,
  });

  @JsonArgDecoder('blockSyntaxes')
  List<md.BlockSyntax>? _decodeBlockSyntaxes({
    required dynamic value,
  }) =>
      JsonMarkdownDecoder.decodeBlockSyntaxList(
        value,
        validate: false,
      );

  @JsonArgDecoder('extensionSet')
  md.ExtensionSet? _decodeExtensionSet({
    required dynamic value,
  }) =>
      JsonMarkdownDecoder.decodeExtensionSet(
        value,
        validate: false,
      );

  @JsonArgDecoder('inlineSyntaxes')
  List<md.InlineSyntax>? _decodeInlineSyntaxes({
    required dynamic value,
  }) =>
      JsonMarkdownDecoder.decodeInlineSyntaxList(
        value,
        validate: false,
      );

  @JsonArgDecoder('listItemCrossAxisAlignment')
  MarkdownListItemCrossAxisAlignment _decodeMarkdownListItemCrossAxisAlignment({
    required dynamic value,
  }) =>
      JsonMarkdownDecoder.decodeMarkdownListItemCrossAxisAlignment(
        value,
        validate: false,
      ) ??
      MarkdownListItemCrossAxisAlignment.baseline;

  @JsonArgDecoder('styleSheet')
  MarkdownStyleSheet? _decodeMarkdownStyleSheet({
    required dynamic value,
  }) =>
      JsonMarkdownDecoder.decodeMarkdownStyleSheet(
        value,
        validate: false,
      );

  @JsonArgDecoder('styleSheetTheme')
  MarkdownStyleSheetBaseTheme? _decodeMarkdownStyleSheetBaseTheme({
    required dynamic value,
  }) =>
      JsonMarkdownDecoder.decodeMarkdownStyleSheetBaseTheme(
        value,
        validate: false,
      );

  @JsonDefaultParam(
    'listItemCrossAxisAlignment',
    'MarkdownListItemCrossAxisAlignment.baseline',
  )
  @override
  Markdown buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}
