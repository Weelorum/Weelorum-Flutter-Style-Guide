# Weelorum-Flutter-Style-Guide
* [Fields](#fields)
* [Typing](#typing)
* [Line](#line)
* [Params](#params)
* [Extensions](#extensions)
* [Comma Putting](#comma-putting)
* [Attachments](#attachments)
* [Null Safety](#null-safety)
* [Code Duplicates](#code-duplicates)
* [Imports](#imports)
* [Empty State](#empty-state)

## Fields
Generally, written in lowerCamelCase, and with final params.

BAD: 
```dart
class FieldsModel {
   String ID;
   String NAmE;
   Function(String) Change_Name;

  FieldsModel({
    required this.ID,
    required this.NAmE,
    required this.Change_Name,
  });
}
```
GOOD:
```dart
final class FieldsModel {
  final String id;
  final String name;
  final Function(String) changeName;

  FieldsModel({
    required this.id,
    required this.name,
    required this.changeName,
  });
}
```
## Typing
All objects, variebles, lists, etc, must include type

BAD: 
```dart
var typingValue = 'typing';
final typingValue = 'typing';
```
GOOD:
```dart
const String typingValue = 'typing';
```
BAD:
```dart
var withoutTypeList = [1,2,3,4];
```
GOOD:
```dart
List<int> typedList = <int>[1,2,3,4];
```
BAD:
```dart
void _setElement(){
    final List<String> stringsList = ["1","2","3",];
    final String element = stringsList.firstWhere((e) => e == "1");
  }
```
GOOD:
```dart
void _setElement(){
    final List<String> stringsList = ["1","2","3",];
    final String element = stringsList.firstWhere((final String e) => e == "1");
  }
```
Function & methods typing

BAD:
```dart
 _setElement(){
    final List<String> stringsList = ["1","2","3",];
    final String element = stringsList.firstWhere((final String e) => e == "1");
  }
```
GOOD:
```dart
void _setElement(){
    final List<String> stringsList = ["1","2","3",];
    final String element = stringsList.firstWhere((final String e) => e == "1");
  }


String setElement() {
    final List<String> stringsList = [
      "1",
      "2",
      "3",
    ];
    return stringsList.firstWhere(
      (final String e) => e == "1",
    );
  }
```


## Line 
Lines should be no longer than 100 characters long.

## Params
Prefer final params in methods & functions

BAD:
```dart
 void nonFinalMethod(String id){
    
  }
```
GOOD:
```dart
  void finalMethod(final String id){

  }

```

## Extensions
   When you try add string with some symbols or values or some sum of int or double, etc... you must use extensions.

BAD:
```dart
  Widget showText(
    BuildContext context,
    int count,
  ) {
    return Text("Total count: $count");
  }
```
GOOD:
```dart

abstract class AppConstantStrings {
  static const String totalCount = "Total count";
}

abstract class AppFormats {
  static const String colonWithSpace = ": ";
  static const String space = " ";
}

extension StringsExtensions on String {
  String addColonWithSpaceWithInValue({required final int count}) {
    return addColonWithSpace() + count.toString();
  }

  String addColonWithSpace() {
    return this + AppFormats.colonWithSpace;
  }
}

   Widget showText(
    final BuildContext context,
    final int count,
  ) {
    return Text(
      AppConstantStrings.totalCount.addColonWithSpaceWithInt(count: count),
    );
  }
}
```

## Comma Putting
You must put comma after every second argue

BAD:
```dart

void commaBadExample(String one, String, two) {}

class CommaWidget extends StatelessWidget {
  final String one;
  final String two;

  const CommaWidget({required this.one, required this.two, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```
GOOD:
```dart

  void commaGoodExample(
    final String one,
    final String two,
  ) {}

class CommaWidget extends StatelessWidget {
  final String one;
  final String two;

  const CommaWidget({
    required this.one,
    required this.two,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return const Placeholder();
  }
}

```

## Attachments
You must check bad result in methods and functions and return something, this will remove a lot of attachments 


BAD:
```dart
  Future<void> attachmentExample({required final List<String>? exampleList}) async {
    if (exampleList != null && exampleList.isNotEmpty) {
      exampleList.add('value');
    } else {
      debugPrint("List is null or empty");
    }
  }
```
GOOD:
```dart
   Future<void> attachmentExample({required final List<String>? exampleList}) async {
    if(exampleList == null || exampleList.isEmpty){
      return debugPrint("List is null or empty");
    }
    exampleList.add('value');
  }

```
## Null Safety
Avoid using "!" in nullable variables, objects, and even if you check that variable is not null, you still can not use "!", 
you must create extension.

BAD:
```dart
   Widget showText(
    BuildContext context,
    String? textExample,
  ) {
    return Text(textExample!);
  }
```
GOOD:
```dart
  abstract class AppFormats {
  static const String emptyString = "";
}

extension StringsExtensions on String? {
  String orEmpty() {
    return this  ?? AppFormats.emptyString;
  }
}

 Widget showText(
    final BuildContext context,
    final String? textExample,
  ) {
    return Text(
      textExample.orEmpty(),
    );
  }

```

## Code Duplicates
To avoid a lot of code duplicate, you must create helper classes with variebles, for paadings, string, durations, border radii,numbers etc.
BAD:
```dart
Widget badExample(BuildContext context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text('bad example', maxLines: 1)),
      Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text('bad example 2', maxLines: 3))
    ]);
  }
```
GOOD:
```dart
abstract class AppConstantStrings {
  static const String totalCount = "Total count";
}
abstract class AppRadii {
  ///circular radii
  static const Radius circular12 = Radius.circular(AppDimens.grid_12);

  ///border radii all
  static const BorderRadius borderRadiusAll12 = BorderRadius.all(circular12);
}

abstract class AppPaddingsAndMargins{
  static const EdgeInsets all16 = EdgeInsets.all(AppDimens.font_16);
}

abstract class AppDimens{
  ///values(int)
  static const int value_2 = 2;
  ///grids
  static const double grid_12 = 12;
  ///fonts
  static const double font_16 = 16;
}

Widget example(
    final BuildContext context,
  ) {
    return Container(
      padding: AppPaddingsAndMargins.all16,
      decoration: const BoxDecoration(
        borderRadius: AppRadii.borderRadiusAll12,
      ),
      child: const Text(
        AppConstantStrings.totalCount,
        maxLines: AppDimens.value_2,
      ),
    );
  }
```

## Imports
You must create library class (we call this class index) that will include all imports and parts of current module.
BAD:
```dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BadExample extends StatelessWidget {
  const BadExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(DateTime.now().toString(),),
        Gap(16),
      ],
    );
  }
}

```
GOOD:
```dart
///create library file (index.dart)
library example_library;

///imports
import 'package:flutter/material.dart';

///parts of module
///and here will be path to your widget/screen/component
part "'presentation/screens/example.dart';"
```
```dart
///On your widget/screen/component you will declare :
part of example_library;

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(final BuildContext context) {
    return const SizedBox.shrink();
  }
}
```

## Empty State
To show some empty widget, we are using SizedBox.shrink() this will creates a box that will become as small as its parent allows.
But sometimes we use Offstage();
Offstage hides a widget from view but keeps it in the layout tree, while SizedBox.shrink() creates an invisible widget that takes up no space.

BAD:
```dart

class EmptyBadExample extends StatelessWidget {
  const EmptyBadExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class EmptyBadExample extends StatelessWidget {
  const EmptyBadExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
```
GOOD:
```dart
class EmptyWidgetExample extends StatelessWidget {
  const EmptyWidgetExample({super.key});

  @override
  Widget build(final BuildContext context) {
    return const SizedBox.shrink();
  }
}

abstract class AppConstantStrings {
  static const String totalCount = "Total count";
}

class EmptyOffstageExample extends StatelessWidget {
  final bool isHideContent;
  const EmptyOffstageExample({
    required this.isHideContent,
    super.key,
});

  @override
  Widget build(final BuildContext context) {
    return Offstage(
      offstage: isHideContent,
      child: _content(),
    );
  }

  Widget _content() {
    return const Text(AppConstantStrings.totalCount);
  }
}

```
