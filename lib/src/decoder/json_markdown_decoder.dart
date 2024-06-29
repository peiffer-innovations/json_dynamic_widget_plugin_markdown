import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:json_class/json_class.dart';
import 'package:json_theme/json_theme.dart';
import 'package:markdown/markdown.dart' as md;

class JsonMarkdownDecoder {
  static const _baseSchemaUrl =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/json_dynamic_widget_plugin_markdown';

  /// Expects the [map] to be either a [md.BlockSyntax] or a [String]
  /// containing one of the following values:
  ///
  /// * `blockquote`
  /// * `code`
  /// * `empty`
  /// * `fenced_code`
  /// * `header`
  /// * `horizontal_rule`
  /// * `ordered_list`
  /// * `paragraph`
  /// * `setext_header`
  /// * `setext_header_with_id`
  /// * `table`
  /// * `unordered_list`
  static md.BlockSyntax? decodeBlockSyntax(
    dynamic map, {
    bool validate = true,
  }) {
    md.BlockSyntax? result;

    if (map is md.BlockSyntax?) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/block_syntax',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'blockquote':
          result = const md.BlockquoteSyntax();
          break;

        case 'code':
          result = const md.CodeBlockSyntax();
          break;

        case 'empty':
          result = const md.EmptyBlockSyntax();
          break;

        case 'fenced_code':
          result = const md.FencedCodeBlockSyntax();
          break;

        case 'header':
          result = const md.HeaderSyntax();
          break;

        case 'horizontal_rule':
          result = const md.HorizontalRuleSyntax();
          break;

        case 'html':
          result = const md.HtmlBlockSyntax();
          break;

        case 'ordered_list':
          result = const md.OrderedListSyntax();
          break;

        case 'paragraph':
          result = const md.ParagraphSyntax();
          break;

        case 'setext_header':
          result = const md.SetextHeaderSyntax();
          break;

        case 'setext_header_with_id':
          result = const md.SetextHeaderWithIdSyntax();
          break;

        case 'table':
          result = const md.TableSyntax();
          break;

        case 'unordered_list':
          result = const md.UnorderedListSyntax();
          break;

        default:
          throw Exception(
            '[decodeBlockSyntax]: unknown map encountered: [$map]',
          );
      }
    }

    return result;
  }

  static List<md.BlockSyntax>? decodeBlockSyntaxList(
    dynamic map, {
    bool validate = true,
  }) {
    List<md.BlockSyntax>? result;

    if (map is List<md.BlockSyntax>) {
      result = map;
    } else if (map is md.BlockSyntax) {
      result = [map];
    } else if (map is Map) {
      result = [
        decodeBlockSyntax(
          map,
          validate: false,
        )!
      ];
    } else if (map is Iterable) {
      result = [];
      for (var item in map) {
        result.add(
          decodeBlockSyntax(
            item,
            validate: false,
          )!,
        );
      }
    } else if (map != null) {
      throw Exception('[decodeBlockSyntaxList]: unknown map value: [$map]');
    }

    return result;
  }

  /// Expects the [map] to be either a [md.ExtensionSet] or a [String]
  /// containing one of the following values:
  ///
  /// * `common_mark`
  /// * `git_hub_flavored`
  /// * `git_hub_web`
  /// * `none`
  static md.ExtensionSet? decodeExtensionSet(
    dynamic map, {
    bool validate = false,
  }) {
    md.ExtensionSet? result;

    if (map is md.ExtensionSet) {
      result = map;
    } else if (map != null) {
      switch (map) {
        case 'common_mark':
          result = md.ExtensionSet.commonMark;
          break;

        case 'git_hub_flavored':
          result = md.ExtensionSet.gitHubFlavored;
          break;

        case 'git_hub_web':
          result = md.ExtensionSet.gitHubWeb;
          break;

        case 'none':
          result = md.ExtensionSet.none;
          break;

        default:
          throw Exception('[decodeExtensionSet]: unknown map value: [$map]');
      }
    }

    return result;
  }

  /// Expects the [map] to be either a [md.InlineSyntax] or a JSON object with a
  /// `type` matching one of:
  ///
  /// * `autolink`
  /// * `autolink_extension`
  /// * `code`
  /// * `email`
  /// * `emoji`
  /// * `html`
  /// * `line_break`
  /// * `tag`
  /// * `text`
  ///
  /// ... and the following optional values if the type is `tag` or `text`:
  /// ```json
  /// {
  ///   "allowIntraWord": <bool>,
  ///   "pattern": <String>,
  ///   "requiresDelimiterRun": <bool>,
  ///   "startCharacter": <int>,
  ///   "sub": <String>
  /// }
  /// ```
  static md.InlineSyntax? decodeInlineSyntax(
    dynamic map, {
    bool validate = true,
  }) {
    md.InlineSyntax? result;

    if (map is md.InlineSyntax?) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/inline_syntax',
        value: map,
        validate: validate,
      ));

      final type = map['type'];
      switch (type) {
        case 'autolink':
          result = md.AutolinkSyntax();
          break;

        case 'autolink_extension':
          result = md.AutolinkExtensionSyntax();
          break;

        case 'code':
          result = md.CodeSyntax();
          break;

        case 'delimiter':
          result = md.DelimiterSyntax(
            map['pattern'].toString(),
            allowIntraWord: JsonClass.parseBool(map['allowIntraWord']),
            requiresDelimiterRun: JsonClass.parseBool(
              map['requiresDelimiterRun'],
            ),
            startCharacter: JsonClass.parseInt(map['startCharacter']),
          );
          break;

        case 'email':
          result = md.EmailAutolinkSyntax();
          break;

        case 'emoji':
          result = md.EmojiSyntax();
          break;

        case 'html':
          result = md.InlineHtmlSyntax();
          break;

        case 'line_break':
          result = md.LineBreakSyntax();
          break;

        case 'text':
          result = md.TextSyntax(
            map['pattern'].toString(),
            startCharacter: JsonClass.parseInt(map['']),
            sub: map['sub']?.toString() ?? '',
          );
          break;

        default:
          throw Exception(
            '[decodeBlockSyntax]: unknown type encountered: [$type]',
          );
      }
    }

    return result;
  }

  static List<md.InlineSyntax>? decodeInlineSyntaxList(
    dynamic map, {
    bool validate = true,
  }) {
    List<md.InlineSyntax>? result;

    if (map is List<md.InlineSyntax>) {
      result = map;
    } else if (map is md.InlineSyntax) {
      result = [map];
    } else if (map is Map) {
      result = [
        decodeInlineSyntax(
          map,
          validate: false,
        )!
      ];
    } else if (map is Iterable) {
      result = [];
      for (var item in map) {
        result.add(
          decodeInlineSyntax(
            item,
            validate: false,
          )!,
        );
      }
    } else if (map != null) {
      throw Exception('[decodeInlineSyntaxList]: unknown map value: [$map]');
    }

    return result;
  }

  /// Expects the [map] to be either a [MarkdownListItemCrossAxisAlignment] or a
  /// [String] containing one of the following values:
  ///
  /// * `baseline`
  /// * `start`
  static MarkdownListItemCrossAxisAlignment?
      decodeMarkdownListItemCrossAxisAlignment(dynamic map,
          {bool validate = true}) {
    MarkdownListItemCrossAxisAlignment? result;

    if (map is MarkdownListItemCrossAxisAlignment) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/markdown_list_item_cross_axis_alignment',
        value: map,
        validate: validate,
      ));
      switch (map) {
        case 'baseline':
          result = MarkdownListItemCrossAxisAlignment.baseline;
          break;

        case 'start':
          result = MarkdownListItemCrossAxisAlignment.start;
          break;

        default:
          throw Exception(
            '[decodeBlockSyntax]: unknown map encountered: [$map]',
          );
      }
    }

    return result;
  }

  static TableCellVerticalAlignment? decodeTableCellVerticalAlignment(
    dynamic map, {
    bool validate = false,
  }) {
    TableCellVerticalAlignment? result;

    if (result is TableCellVerticalAlignment) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/table_cell_vertical_alignment',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'baseline':
          result = TableCellVerticalAlignment.baseline;
          break;

        case 'bottom':
          result = TableCellVerticalAlignment.bottom;
          break;

        case 'fill':
          result = TableCellVerticalAlignment.fill;
          break;

        case 'intrinsicHeight':
          result = TableCellVerticalAlignment.intrinsicHeight;
          break;

        case 'middle':
          result = TableCellVerticalAlignment.middle;
          break;

        case 'top':
          result = TableCellVerticalAlignment.top;
          break;

        default:
          throw Exception(
            '[decodeTableCellVerticalAlignment]: unknown map encountered: [$map]',
          );
      }
    }

    return result;
  }

  /// Decodes the object from a Map-like dynamic structure.  This expects the
  /// JSON format to be of the following structure:
  ///
  /// ```json
  /// {
  ///   "a": <TextStyle>,
  ///   "blockSpacing": <double>,
  ///   "blockquote": <TextStyle>,
  ///   "blockquoteAlign": <WrapAlignment>,
  ///   "blockquoteDecoration": <BoxDecoration>,
  ///   "blockquotePadding": <EdgeInsetsGeometry>,
  ///   "checkbox": <TextStyle>,
  ///   "code": <TextStyle>,
  ///   "codeblockAlign": <WrapAlignment>,
  ///   "codeblockDecoration": <BoxDecoration>,
  ///   "codeblockPadding": <EdgeInsetsGeometry>,
  ///   "del": <TextStyle>,
  ///   "em": <TextStyle>,
  ///   "h1": <TextStyle>,
  ///   "h1Align": <WrapAlignment>,
  ///   "h1Padding": <EdgeInsetsGeometry>,
  ///   "h2": <TextStyle>,
  ///   "h2Align": <WrapAlignment>,
  ///   "h2Padding": <EdgeInsetsGeometry>,
  ///   "h3": <TextStyle>,
  ///   "h3Align": <WrapAlignment>,
  ///   "h3Padding": <EdgeInsetsGeometry>,
  ///   "h4": <TextStyle>,
  ///   "h4Align": <WrapAlignment>,
  ///   "h4Padding": <EdgeInsetsGeometry>,
  ///   "h5": <TextStyle>,
  ///   "h5Align": <WrapAlignment>,
  ///   "h5Padding": <EdgeInsetsGeometry>,
  ///   "h6": <TextStyle>,
  ///   "h6Align": <WrapAlignment>,
  ///   "h6Padding": <EdgeInsetsGeometry>,
  ///   "horizontalRuleDecoration": <BoxDecoration>,
  ///   "img": <TextStyle>,
  ///   "listBullet": <TextStyle>,
  ///   "listBulletPadding": <EdgeInsetsGeometry>,
  ///   "listIndent": <double>,
  ///   "orderedListAlign": <WrapAlignment>,
  ///   "p": <TextStyle>,
  ///   "pPadding": <EdgeInsetsGeometry>,
  ///   "strong": <TextStyle>,
  ///   "superscriptFontFeatureTag": <String>,
  ///   "tableBody": <TextStyle>,
  ///   "tableBorder": <TableBorder>,
  ///   "tableCellsDecoration": <BoxDecoration>,
  ///   "tableCellsPadding": <EdgeInsetsGeometry>,
  ///   "tableColumnWidth": <TableColumnWidth>,
  ///   "tableHead": <TextStyle>,
  ///   "tableHeadAlign": <TextAlign>,
  ///   "tablePadding": <EdgeInsetsGeometry>,
  ///   "tableVerticalAlignment": <TableCellVerticalAlignment>,
  ///   "textAlign": <WrapAlignment>,
  ///   "textScaler": <TextScaler>,
  ///   "unorderedListAlign": <WrapAlignment>
  /// }
  /// ```
  ///
  /// See also:
  /// * [ThemeDecoder.decodeBoxDecoration]
  /// * [ThemeDecoder.decodeEdgeInsetsGeometry]
  /// * [ThemeDecoder.decodeTableBorder]
  /// * [ThemeDecoder.decodeTableColumnWidth]
  /// * [ThemeDecoder.decodeTextStyle]
  /// * [ThemeDecoder.decodeWrapAlignment]
  static MarkdownStyleSheet? decodeMarkdownStyleSheet(
    dynamic map, {
    bool validate = true,
  }) {
    MarkdownStyleSheet? result;

    if (map is MarkdownStyleSheet) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/markdown_style_sheet',
        value: map,
        validate: validate,
      ));
      result = MarkdownStyleSheet(
        a: ThemeDecoder.decodeTextStyle(
          map['a'],
          validate: false,
        ),
        blockSpacing: JsonClass.parseDouble(map['blockSpacing']),
        blockquote: ThemeDecoder.decodeTextStyle(
          map['blockquote'],
          validate: false,
        ),
        blockquoteAlign: ThemeDecoder.decodeWrapAlignment(
              map['blockquoteAlign'],
              validate: false,
            ) ??
            WrapAlignment.start,
        blockquoteDecoration: map['decoration'],
        blockquotePadding: ThemeDecoder.decodeEdgeInsetsGeometry(
            map['blockquotePadding'],
            validate: false) as EdgeInsets?,
        checkbox: ThemeDecoder.decodeTextStyle(
          map['checkbox'],
          validate: false,
        ),
        code: ThemeDecoder.decodeTextStyle(
          map['code'],
          validate: false,
        ),
        codeblockAlign: ThemeDecoder.decodeWrapAlignment(map['codeblockAlign'],
                validate: false) ??
            WrapAlignment.start,
        codeblockDecoration: map['codeblockDecoration'],
        codeblockPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['codeblockPadding'],
          validate: false,
        ) as EdgeInsets?,
        del: ThemeDecoder.decodeTextStyle(
          map['del'],
          validate: false,
        ),
        em: ThemeDecoder.decodeTextStyle(
          map['em'],
          validate: false,
        ),
        h1: ThemeDecoder.decodeTextStyle(
          map['h1'],
          validate: false,
        ),
        h1Align: ThemeDecoder.decodeWrapAlignment(
              map['h1Align'],
              validate: false,
            ) ??
            WrapAlignment.start,
        h1Padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['h1Padding'],
          validate: false,
        ) as EdgeInsets?,
        h2: ThemeDecoder.decodeTextStyle(
          map['h2'],
          validate: false,
        ),
        h2Align: ThemeDecoder.decodeWrapAlignment(
              map['h2Align'],
              validate: false,
            ) ??
            WrapAlignment.start,
        h2Padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['h2Padding'],
          validate: false,
        ) as EdgeInsets?,
        h3: ThemeDecoder.decodeTextStyle(
          map['h3'],
          validate: false,
        ),
        h3Align: ThemeDecoder.decodeWrapAlignment(
              map['h3Align'],
              validate: false,
            ) ??
            WrapAlignment.start,
        h3Padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['h3Padding'],
          validate: false,
        ) as EdgeInsets?,
        h4: ThemeDecoder.decodeTextStyle(
          map['h4'],
          validate: false,
        ),
        h4Align: ThemeDecoder.decodeWrapAlignment(
              map['h4Align'],
              validate: false,
            ) ??
            WrapAlignment.start,
        h4Padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['h4Padding'],
          validate: false,
        ) as EdgeInsets?,
        h5: ThemeDecoder.decodeTextStyle(
          map['h5'],
          validate: false,
        ),
        h5Align: ThemeDecoder.decodeWrapAlignment(
              map['h5Align'],
              validate: false,
            ) ??
            WrapAlignment.start,
        h5Padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['h5Padding'],
          validate: false,
        ) as EdgeInsets?,
        h6: ThemeDecoder.decodeTextStyle(
          map['h6'],
          validate: false,
        ),
        h6Align: ThemeDecoder.decodeWrapAlignment(
              map['h6Align'],
              validate: false,
            ) ??
            WrapAlignment.start,
        h6Padding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['h6Padding'],
          validate: false,
        ) as EdgeInsets?,
        horizontalRuleDecoration: map['horizontalRuleDecoration'],
        img: ThemeDecoder.decodeTextStyle(
          map['img'],
          validate: false,
        ),
        listBullet: ThemeDecoder.decodeTextStyle(
          map['listBullet'],
          validate: false,
        ),
        listBulletPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['listBulletPadding'],
          validate: false,
        ) as EdgeInsets?,
        listIndent: JsonClass.parseDouble(map['listIndent']),
        orderedListAlign: ThemeDecoder.decodeWrapAlignment(
              map['orderedListAlign'],
              validate: false,
            ) ??
            WrapAlignment.start,
        p: ThemeDecoder.decodeTextStyle(
          map['p'],
          validate: false,
        ),
        pPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['pPadding'],
          validate: false,
        ) as EdgeInsets?,
        strong: ThemeDecoder.decodeTextStyle(
          map['strong'],
          validate: false,
        ),
        superscriptFontFeatureTag: map['superscriptFontFeatureTag'],
        tableBody: ThemeDecoder.decodeTextStyle(
          map['tableBody'],
          validate: false,
        ),
        tableBorder: ThemeDecoder.decodeTableBorder(
          map['tableBorder'],
          validate: false,
        ),
        tableCellsDecoration: ThemeDecoder.decodeBoxDecoration(
          map['tableCellsDecoration'],
          validate: false,
        ),
        tableCellsPadding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['tableCellsPadding'],
          validate: false,
        ) as EdgeInsets?,
        tableColumnWidth: ThemeDecoder.decodeTableColumnWidth(
          map['tableColumnWidth'],
          validate: false,
        ),
        tableHead: ThemeDecoder.decodeTextStyle(
          map['tableHead'],
          validate: false,
        ),
        tableHeadAlign: ThemeDecoder.decodeTextAlign(
          map['tableHeadAlign'],
          validate: false,
        ),
        tablePadding: ThemeDecoder.decodeEdgeInsetsGeometry(
          map['tablePadding'],
          validate: false,
        ) as EdgeInsets?,
        tableVerticalAlignment: decodeTableCellVerticalAlignment(
              map['tableVerticalAlignment'],
              validate: false,
            ) ??
            TableCellVerticalAlignment.middle,
        textAlign: ThemeDecoder.decodeWrapAlignment(
              map['textAlign'],
              validate: false,
            ) ??
            WrapAlignment.start,
        textScaler: map['textScaler'],
        unorderedListAlign: ThemeDecoder.decodeWrapAlignment(
              map['textAlign'],
              validate: false,
            ) ??
            WrapAlignment.start,
      );
    }

    return result;
  }

  /// Expects the [map] to be either a [MarkdownStyleSheetBaseTheme] or a
  /// [String] containing one of the following values:
  ///
  /// * `cupertino`
  /// * `material`
  /// * `platform`
  static MarkdownStyleSheetBaseTheme? decodeMarkdownStyleSheetBaseTheme(
    dynamic map, {
    bool validate = true,
  }) {
    MarkdownStyleSheetBaseTheme? result;

    if (map is MarkdownStyleSheetBaseTheme) {
      result = map;
    } else if (map != null) {
      assert(SchemaValidator.validate(
        schemaId: '$_baseSchemaUrl/markdown_style_sheet_base_theme',
        value: map,
        validate: validate,
      ));

      switch (map) {
        case 'cupertino':
          result = MarkdownStyleSheetBaseTheme.cupertino;
          break;

        case 'material':
          result = MarkdownStyleSheetBaseTheme.material;
          break;

        case 'platform':
          result = MarkdownStyleSheetBaseTheme.platform;
          break;

        default:
          throw Exception(
            '[decodeMarkdownStyleSheetBaseTheme]: unknown map encountered: [$map]',
          );
      }
    }

    return result;
  }
}
