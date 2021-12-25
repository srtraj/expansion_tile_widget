CustomExpansionTileWidget(
headerTitle: "Overview",
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
