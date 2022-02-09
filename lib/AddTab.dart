import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import './theme.dart';

class AddTab extends StatefulWidget {
    @override
    _AddTabState createState() => _AddTabState();
}

class _AddTabState extends State<AddTab> {
    DateTime _selectDay = DateTime.now();
    DateTime _selectTime = DateTime.now();
    var isSelected = [true, false];
    void _showDatePicker(BuildContext context) {
        showCupertinoModalPopup(
                context: context,
                builder: (_) => Container(
                        height: 216,
                        child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (value) {
                                    setState((){
                                        _selectDay = value;
                                    });
                                },
                                initialDateTime: _selectDay,
                        ),
                ));
    }

    void _showTimePicker(BuildContext context) {
        showCupertinoModalPopup(
                context: context,
                builder: (_) => Container(
                        height: 216,
                        child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: (value) {
                                    setState((){
                                        _selectTime = value;
                                    });
                                },
                                initialDateTime: _selectTime,
                        ),
                ));
    }

    Widget toggleButton() {
        return ToggleButtons(
                borderColor: CustomTheme.of(context).theme.addTabToggleBorder,
                fillColor: CustomTheme.of(context).theme.addTabToggleText,
                borderWidth: 1,
                selectedBorderColor: CustomTheme.of(context).theme.addTabToggleBorder,
                selectedColor: CustomTheme.of(context).theme.addTabToggleBack,
                color: CustomTheme.of(context).theme.addTabToggleBack,
                borderRadius: BorderRadius.circular(10),
                children: <Widget>[
                    Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                    'Income',
                                    style: TextStyle(fontSize: 14),
                            ),
                    ),
                    Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                    'Expense',
                                    style: TextStyle(fontSize: 14),
                            ),
                    ),
                ],
                onPressed: (int index) {
                    setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                        }
                    });
                },
                isSelected: isSelected,
                );
    }

    Widget moneyField() {
        return TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                ], 
        );
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
                                                Text(
                                                        'Date',
                                                        style: TextStyle(
                                                                fontSize: 18.0,
                                                                color: CustomTheme.of(context).theme.addTabTitle,
                                                        ),
                                                ),
                                                CupertinoButton(
                                                        child: Text(
                                                                DateFormat.yMMMd().format(_selectDay),
                                                                style: TextStyle(
                                                                        fontSize: 18.0,
                                                                        color: CustomTheme.of(context).theme.addTabText,
                                                                ),
                                                        ),
                                                        onPressed: () => _showDatePicker(context),
                                                ),
                                            ],),
                                    _DatePickerItem(
                                            children: [
                                                Text(
                                                        'Time',
                                                        style: TextStyle(
                                                                fontSize: 18.0,
                                                                color: CustomTheme.of(context).theme.addTabTitle,
                                                        ),
                                                ),
                                                CupertinoButton(
                                                        child: Text(
                                                                DateFormat.jm().format(_selectTime),
                                                                style: TextStyle(
                                                                        fontSize: 18.0,
                                                                        color: CustomTheme.of(context).theme.addTabText,
                                                                ),
                                                        ),
                                                        onPressed: () => _showTimePicker(context),
                                                ),
                                            ],),
                                    _DatePickerItem(
                                            children: [
                                                Container(
                                                        margin: EdgeInsets.symmetric(vertical: 10,),
                                                        height: 30,
                                                        child: toggleButton(),
                                                ),
                                                Container(
                                                        width: 100,
                                                        child: moneyField(),
                                                ),
                                            ],
                                            ),
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
                decoration: BoxDecoration(
                        border: Border(
                                top: BorderSide(
                                        color: CustomTheme.of(context).theme.addTabText,
                                        width: 0.0,
                                ),
                                bottom: BorderSide(
                                        color: CustomTheme.of(context).theme.addTabDivider,
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
