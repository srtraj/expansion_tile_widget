# CustomExpansionTileWidget

A **CustomExpansionTileWidget** is An edited version of Expansion Tile that allows you customize header tile and expanded list.

#### Example
```dart
CustomExpansionTileWidget(
        headerTitle: "Overview",
        headerDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Colors.blueAccent),
          color: Colors.yellow
          ),
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.green,
            ),
            child: const Center(
              child: Text("List1"),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.red,
            ),
            child: const Center(
              child: Text("List2"),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.blueAccent,
            ),
            child: const Center(
              child: Text("List3"),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.orangeAccent,
            ),
            child: const Center(
              child: Text("List4"),
            ),
          ),
        ],
      ),
```

### Parameters

Attribute | Data type | Description
--- | --- | --- 
headerLeading | Widget? | A widget to display before the title
headerTitle | String | Primary title for List view
headerDecoration | Decoration? | It allows you to decorate the header tile
headerPadding | EdgeInsets? | Specifies padding for header tile
headerHeight | double? | height parameter for Header tile ,default height is 50px
headerTextStyle | TextStyle? | It allows you to customize default style of headerTitle
onExpansionChanged  | ValueChanged<bool>? | When the widget starts expanding, this function is called with the value true. When the tile starts collapsing, this function is called with the value false
children | List<Widget> | The widgets that are displayed when the tile expands
headerTileColor | Color? | The color of the header tile
headerTrailing | Widget? | A widget to display after the headerTitle
isHeaderTrailingAnimation| bool |default animation added to headerTrailing Widget if it is true.
initiallyExpanded| bool | Specifies if the expansionWidget is initially expanded (true) or collapsed, default is false
animationDuration| Duration? | The length of time of animation ,default is 200 ms 
