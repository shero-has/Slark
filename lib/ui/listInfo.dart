import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListInfo extends StatefulWidget {
  @override
  _ListInfoState createState() => _ListInfoState();
}

class _ListInfoState extends State<ListInfo> {
  bool _isEditingText = false;
  TextEditingController _listController;
  String initialListName = "List Name";
  String initialDiscription = "Add Description";

  @override
  void initState() {
    super.initState();
    _listController = TextEditingController(text: initialListName);
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();
  List<String> tasks = [
    'task1',
    'task2',
    'task3',
    'task4',
    'task5',
    'task6',
    'task7',
    'task8',
    'task9',
    'task10'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SLARK'),
        backgroundColor: Color(0xff7b68ee),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 15.0, right: 10.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width - 200,
                            child: _editTitleTextField(
                                initialListName, _listController, 1),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            //delete list
                            onPressed: () async {
                              final ConfirmAction action =
                                  await _asyncConfirmDialog(context);
                              print(action);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton.icon(
                        //Set the limit date
                        onPressed: () => _selectDate(context),
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.indigo,
                        ),
                        label: Text(
                          "Set due date",
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      height: 100.0,
                      child: TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Add Description',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff7b68ee),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: [
                      Text(
                        "Assignees",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      IconButton(
                        //Add Assignee
                        onPressed: () {},
                        icon: Icon(Icons.person_add_alt),
                        color: Colors.indigo,
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    height: 100.0,
                    color: Colors.indigo[50],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'List Tasks',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            //Add task to list
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.indigo,
                            ),
                          ),
                          IconButton(
                              //collapse tasks
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.indigo,
                              )),
                        ],
                      )
                    ],
                  ),
                  Container(
                    color: Colors.indigo[50],
                    height: 150,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        children: [tasksList(tasks)],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  tasksList(List list) {
    List<Widget> mytasks = [];
    for (var item in list) {
      mytasks.add(
        Column(
          children: [
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/taskInfo');
                },
                child: Text(
                  '$item',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ),
            ),
            Divider(
              thickness: 0.8,
              indent: 90.0,
              endIndent: 90.0,
            ),
          ],
        ),
      );
    }
    return Column(
      children: mytasks,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    print(selectedDate);
  }

  _editTitleTextField(initialText, controller, maxLine) {
    if (_isEditingText)
      return Center(
        child: TextField(
          maxLines: maxLine,
          onSubmitted: (newValue) {
            setState(() {
              initialListName = newValue;
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: _listController,
        ),
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(
        initialText,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

enum ConfirmAction { Cancel, Accept }
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete This List?'),
        content: const Text(
            'This will delete your list and its task from the workspace, confirm deletion?.'),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          // ignore: deprecated_member_use
          FlatButton(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}
