import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddTab extends StatefulWidget {
    @override
    _AddTabState createState() => _AddTabState();
}

class _AddTabState extends State<AddTab> {
    DateTime _selectedValue = DateTime.now();
    void _showPicker(BuildContext context) {
        showCupertinoModalPopup(
                context: context,
                builder: (_) => Container(
                        height: 216,
                        child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (value) {
                                    setState((){
                                        _selectedValue = value;
                                    });
                                },
                                initialDateTime: _selectedValue,
                        ),
                ));
    }

    Widget baseCard() {
        final Size size = MediaQuery.of(context).size;
        return Card(
                margin: EdgeInsets.symmetric(horizontal: 15),
                elevation: 5,
                child: Container(
                        margin: EdgeInsets.only(top: 10, bottom: 0),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        constraints: BoxConstraints.expand(height: size.height * 0.45),
                        child: Column(
                                children: [
                                    _DatePickerItem(
                                            children: [
                                                const Text('Date'),
                                                CupertinoButton(
                                                        child: Text('$_selectedValue'),
                                                        onPressed: () => _showPicker(context),
                                                ),
                                            ],),
                                ]),
                ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
                appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                ),
                body: baseCard(),
        );
    }
}

class _DatePickerItem extends StatelessWidget {
    const _DatePickerItem({required this.children});

    final List<Widget> children;

    @override
    Widget build(BuildContext context) {
        return DecoratedBox(
                decoration: const BoxDecoration(
                        border: Border(
                                top: BorderSide(
                                        color: CupertinoColors.inactiveGray,
                                        width: 0.0,
                                ),
                                bottom: BorderSide(
                                        color: CupertinoColors.inactiveGray,
                                        width: 0.0,
                                ),
                        ),
                ),
                child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: children,
                        ),
                ),
        );
    }
}
