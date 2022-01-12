import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_markdown/json_dynamic_widget_plugin_markdown.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SchemaValidator.enabled = false;

  if (kDebugMode) {
    Logger.root.level = Level.FINE;
    Logger.root.onRecord.listen((record) {
      debugPrint(
        '[${record.loggerName}]: ${record.message}',
      );
      if (record.error != null) {
        debugPrint('${record.error}');
      }
      if (record.stackTrace != null) {
        debugPrint('${record.stackTrace}');
      }
    });
  } else {
    Logger.root.level = Level.INFO;
    Logger.root.onRecord.listen((record) {
      debugPrint(
        '[${record.loggerName}]: ${record.level.name}: ${record.time}: ${record.message}',
      );
      if (record.error != null) {
        debugPrint('${record.error}');
      }
      if (record.stackTrace != null) {
        debugPrint('${record.stackTrace}');
      }
    });
  }

  var navigatorKey = GlobalKey<NavigatorState>();

  var registry = JsonWidgetRegistry.instance;

  JsonMarkdownPlugin.bind(registry);

  registry.navigatorKey = navigatorKey;

  var templates = {
    'json_dynamic_widget':
        'https://raw.githubusercontent.com/peiffer-innovations/json_dynamic_widget/main/README.md',
    'json_dynamic_widget_plugin_charts_flutter':
        'https://raw.githubusercontent.com/peiffer-innovations/json_dynamic_widget_plugin_charts_flutter/main/README.md',
    'json_dynamic_widget_plugin_expressions':
        'https://github.com/peiffer-innovations/json_dynamic_widget_plugin_expressions/raw/main/README.md',
    'json_dynamic_widget_plugin_font_awesome':
        'https://github.com/peiffer-innovations/json_dynamic_widget_plugin_font_awesome/raw/main/README.md',
    'json_dynamic_widget_plugin_ionicons':
        'https://github.com/peiffer-innovations/json_dynamic_widget_plugin_ionicons/raw/main/README.md',
    'json_dynamic_widget_plugin_lottie':
        'https://github.com/peiffer-innovations/json_dynamic_widget_plugin_lottie/raw/main/README.md',
    'json_dynamic_widget_plugin_markdown':
        'https://github.com/peiffer-innovations/json_dynamic_widget_plugin_markdown/raw/main/README.md',
    'json_dynamic_widget_plugin_material_icons':
        'https://github.com/peiffer-innovations/json_dynamic_widget_plugin_material_icons/raw/main/README.md',
    'json_dynamic_widget_plugin_rive':
        'https://github.com/peiffer-innovations/json_dynamic_widget_plugin_rive/raw/main/README.md',
    'json_dynamic_widget_plugin_svg':
        'https://github.com/peiffer-innovations/json_dynamic_widget_plugin_svg/raw/main/README.md',
  };

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        templates: templates,
      ),
      theme: ThemeData.light(),
    ),
  );
}

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.templates,
  }) : super(key: key);

  final Map<String, String> templates;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late List<MapEntry<String, String>> _templates;
  int _loading = -1;

  @override
  void initState() {
    super.initState();

    _templates = widget.templates.entries.toList();
  }

  Future<void> _navigate(int index, String title, String url) async {
    _loading = index;
    if (mounted) {
      setState(() {});
    }

    try {
      var response = await http.get(Uri.parse(url));
      var md = response.body;

      var registry = JsonWidgetRegistry.instance.copyWith();
      try {
        var data = JsonWidgetData.fromDynamic(
          json.decode(
              await rootBundle.loadString('assets/pages/markdown.json')),
          registry: registry,
        )!;
        registry.setValue('title', title);
        registry.setValue('data', md);

        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => JsonWidgetPage(data: data),
          ),
        );
      } finally {
        registry.dispose();
      }
    } finally {
      _loading = -1;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markdown Widget'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var entry = _templates[index];
          return Stack(
            children: [
              ListTile(
                onTap: () => _loading == -1
                    ? _navigate(index, entry.key, entry.value)
                    : null,
                title: Text(entry.key),
              ),
              if (_loading == index)
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: LinearProgressIndicator(),
                )
            ],
          );
        },
        itemCount: _templates.length,
      ),
    );
  }
}

class JsonWidgetPage extends StatelessWidget {
  JsonWidgetPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final JsonWidgetData data;

  @override
  Widget build(BuildContext context) => data.build(context: context);
}
