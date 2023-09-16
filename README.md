<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [json_dynamic_widget_plugin_markdown](#json_dynamic_widget_plugin_markdown)
  - [Table of Contents](#table-of-contents)
  - [Live Example](#live-example)
  - [Introduction](#introduction)
  - [Using the Plugin](#using-the-plugin)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# json_dynamic_widget_plugin_markdown

## Table of Contents

* [Live Example](#live-example)
* [Introduction](#introduction)
* [Using the Plugin](#using-the-plugin)


## Live Example

* [Web](https://peiffer-innovations.github.io/json_dynamic_widget_plugin_markdown/web/index.html#/)


## Introduction

Plugin to the [JSON Dynamic Widget](https://peiffer-innovations.github.io/json_dynamic_widget) to provide Charts support utilizing the [markdown](https://pub.dev/packages/markdown).


## Using the Plugin

```dart
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget_plugin_markdown/json_dynamic_widget_plugin_markdown.dart';


void main() {
  // Ensure Flutter's binding is complete
  WidgetsFlutterBinding.ensureInitialized();

  // ...

  // Get an instance of the registry
  var registry = JsonWidgetRegistry.instance;

  // Bind the plugin to the registry.  This is necessary for the registry to
  // find the widget provided by the plugin
  JsonMarkdownPluginRegistrar.registerDefaults(registry: registry);

  // ...
}
```

