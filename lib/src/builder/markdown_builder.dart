import 'package:child_builder/child_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_markdown/json_dynamic_widget_plugin_markdown.dart';
import 'package:json_theme/json_theme.dart';
import 'package:markdown/markdown.dart' as md;

/// Creates a Markdown widget based on the JSON structure.
class MarkdownBuilder extends JsonWidgetBuilder {
  MarkdownBuilder({
    required this.blockSyntaxes,
    required this.builders,
    required this.bulletBuilder,
    required this.checkboxBuilder,
    required this.controller,
    required this.data,
    required this.extensionSet,
    required this.imageBuilder,
    required this.imageDirectory,
    required this.inlineSyntaxes,
    required this.listItemCrossAxisAlignment,
    required this.onTapLink,
    required this.onTapText,
    required this.padding,
    required this.paddingBuilders,
    required this.physics,
    required this.selectable,
    required this.shrinkWrap,
    required this.softLineBreak,
    required this.styleSheet,
    required this.styleSheetTheme,
    required this.syntaxHighlighter,
  }) : super(numSupportedChildren: kNumSupportedChildren);

  static const kNumSupportedChildren = 0;
  static const kType = 'markdown';

  final List<md.BlockSyntax>? blockSyntaxes;
  final Map<String, MarkdownElementBuilder>? builders;
  final MarkdownBulletBuilder? bulletBuilder;
  final MarkdownCheckboxBuilder? checkboxBuilder;
  final ScrollController? controller;
  final String data;
  final md.ExtensionSet? extensionSet;
  final MarkdownImageBuilder? imageBuilder;
  final String? imageDirectory;
  final List<md.InlineSyntax>? inlineSyntaxes;
  final MarkdownListItemCrossAxisAlignment? listItemCrossAxisAlignment;
  final MarkdownTapLinkCallback? onTapLink;
  final VoidCallback? onTapText;
  final EdgeInsets? padding;
  final Map<String, MarkdownPaddingBuilder>? paddingBuilders;
  final ScrollPhysics? physics;
  final bool selectable;
  final bool shrinkWrap;
  final bool softLineBreak;
  final MarkdownStyleSheet? styleSheet;
  final MarkdownStyleSheetBaseTheme? styleSheetTheme;
  final SyntaxHighlighter? syntaxHighlighter;

  /// Builds the builder from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "blockSyntaxes": <List<md.BlockSyntax>>,
  ///   "builders": <Map<String, MarkdownElementBuilder>>,
  ///   "bulletBuilder": <MarkdownBulletBuilder>,
  ///   "checkboxBuilder": <MarkdownCheckboxBuilder>,
  ///   "controller": <ScrollController>,
  ///   "data": <String>,
  ///   "extensionSet": <md.ExtensionSet>,
  ///   "imageBuilder": <MarkdownImageBuilder>,
  ///   "imageDirectory": <String>,
  ///   "inlineSyntaxes": <List<md.InlineSyntax>>,
  ///   "listItemCrossAxisAlignment": <MarkdownListItemCrossAxisAlignment>,
  ///   "onTapLink": <MarkdownTapLinkCallback>,
  ///   "onTapText": <VoidCallback>,
  ///   "padding": <EdgeInsets>,
  ///   "paddingBuilders": <Map<String, MarkdownPaddingBuilder>>,
  ///   "physics": <ScrollPhysics>,
  ///   "selectable": <bool>,
  ///   "shrinkWrap": <bool>,
  ///   "softLineBreak": <bool>,
  ///   "styleSheet": <MarkdownStyleSheet>,
  ///   "styleSheetTheme": <MarkdownStyleSheetBaseTheme>,
  ///   "syntaxHighlighter": <SyntaxHighlighter>
  /// }
  /// ```
  ///
  /// See also:
  /// [decodeBlockSyntaxList]
  /// [decodeExtensionSet]
  static MarkdownBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    if (map == null) {
      throw Exception('[MarkdownBuilder]: map is null');
    }

    return MarkdownBuilder(
      blockSyntaxes: JsonMarkdownDecoder.decodeBlockSyntaxList(
        map['blockSyntaxes'],
        validate: false,
      ),
      builders: map['builders'],
      bulletBuilder: map['bulletBuilder'],
      checkboxBuilder: map['checkboxBuilder'],
      controller: map['controller'],
      data: map['data']?.toString() ?? '',
      extensionSet: JsonMarkdownDecoder.decodeExtensionSet(
        map['extensionSet'],
        validate: false,
      ),
      imageBuilder: map['imageBuilder'],
      imageDirectory: map['imageDirectory']?.toString(),
      inlineSyntaxes: JsonMarkdownDecoder.decodeInlineSyntaxList(
        map['inlineSyntaxes'],
        validate: false,
      ),
      listItemCrossAxisAlignment:
          JsonMarkdownDecoder.decodeMarkdownListItemCrossAxisAlignment(
        map['listItemCrossAxisAlignment'],
        validate: false,
      ),
      onTapLink: map['onTapLink'],
      onTapText: map['onTapText'],
      padding: ThemeDecoder.decodeEdgeInsetsGeometry(
        map['padding'],
        validate: false,
      ) as EdgeInsets?,
      paddingBuilders: map['paddingBuilders'],
      physics: ThemeDecoder.decodeScrollPhysics(
        map['physics'],
        validate: false,
      ),
      selectable: JsonClass.parseBool(map['selectable']),
      shrinkWrap: JsonClass.parseBool(map['shrinkWrap']),
      softLineBreak: JsonClass.parseBool(map['softLineBreak']),
      styleSheet: JsonMarkdownDecoder.decodeMarkdownStyleSheet(
        map['styleSheet'],
        validate: false,
      ),
      styleSheetTheme: JsonMarkdownDecoder.decodeMarkdownStyleSheetBaseTheme(
        map['styleSheetTheme'],
        validate: false,
      ),
      syntaxHighlighter: map['syntaxHighlighter'],
    );
  }

  /// Builds the widget from the give [data].
  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[MarkdownBuilder] does not support children.',
    );

    return Markdown(
      blockSyntaxes: blockSyntaxes,
      builders: const <String, MarkdownElementBuilder>{},
      bulletBuilder: bulletBuilder,
      checkboxBuilder: checkboxBuilder,
      controller: controller,
      data: this.data,
      extensionSet: extensionSet,
      imageBuilder: imageBuilder,
      imageDirectory: imageDirectory,
      inlineSyntaxes: inlineSyntaxes,
      key: key,
      listItemCrossAxisAlignment: listItemCrossAxisAlignment ??
          MarkdownListItemCrossAxisAlignment.baseline,
      onTapLink: onTapLink,
      onTapText: onTapText,
      padding: padding ?? const EdgeInsets.all(16.0),
      paddingBuilders: const <String, MarkdownPaddingBuilder>{},
      physics: physics,
      selectable: selectable,
      shrinkWrap: shrinkWrap,
      softLineBreak: softLineBreak,
      styleSheet: styleSheet,
      styleSheetTheme: styleSheetTheme,
      syntaxHighlighter: syntaxHighlighter,
    );
  }
}
