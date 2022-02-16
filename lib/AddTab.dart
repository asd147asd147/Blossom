import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import './theme.dart';

class AddTab extends StatefulWidget {
    @override
    _AddTabState createState() => _AddTabState();
}

class _AddTabState extends State<AddTab> {
    DateTime _selectDay = DateTime.now();
    DateTime _selectTime = DateTime.now();
    var isSelected = [true, false];
    var money = 0;
    IconData? iconData;
    late TextEditingController detailController, costController;
    List<Map<String,String>> detailList = [];

    @override
    void initState() {
        super.initState();
        detailController = TextEditingController();
        costController = TextEditingController();
        costController.text = 'KRW 0';
    }

    @override
    void dispose() {
        costController.dispose();
        detailController.dispose();
        super.dispose();
    }

    void _showDatePicker(BuildContext context) {
        showCupertinoModalPopup(
                context: context,
                builder: (_) => Container(
                        height: 216,
                        child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                maximumDate: DateTime.now(),
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

    Widget subjectField() {
        return TextField(
                decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                                fontSize: 18.0,
                                color: CustomTheme.of(context).theme.addTabText,
                        ),
                        hintText: 'Only English',
                        contentPadding: EdgeInsets.only(right: 14),
                ),
                style: TextStyle(
                        fontSize: 18.0,
                        color: CustomTheme.of(context).theme.addTabText,
                ),
                textAlign: TextAlign.end,
        );
    }

    Widget detailField() {
        return TextField(
                decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: CustomTheme.of(context).theme.addTabText,
                        ),
                        hintText: 'Only English',
                        contentPadding: EdgeInsets.only(right: 14),
                ),
                controller: detailController,
                style: TextStyle(
                        fontSize: 14.0,
                        color: CustomTheme.of(context).theme.addTabText,
                ),
                textAlign: TextAlign.end,
        );
    }

    Widget moneyField() {
        return TextField(
                decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: CustomTheme.of(context).theme.addTabText,
                        ),
                        hintText: 'KRW 0',
                        contentPadding: EdgeInsets.only(right: 14),
                ),
                controller: costController,
                style: TextStyle(
                        fontSize: 14.0,
                        color: CustomTheme.of(context).theme.addTabText,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                inputFormatters: <TextInputFormatter>[
                    CurrencyTextInputFormatter(
                            locale: 'ko',
                            decimalDigits: 0,
                            symbol: 'KRW ',
                    ),
                    //FilteringTextInputFormatter.digitsOnly,
                ], 
        );
    }

    IconData getIcon() {
        return IconData(iconData?.codePoint ?? Icons.check.codePoint, fontFamily: 'MaterialIcons');
    }

    Widget receipt(){
        return Card(
                margin: EdgeInsets.symmetric(horizontal: 15),
                elevation: 5,
                child: Container(
                        margin: EdgeInsets.only(top: 10, bottom: 0),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Column(
                                children: [
                                    Text(
                                            'Receipt',
                                            style: TextStyle(
                                                    color: CustomTheme.of(context).theme.homeTimelineMainText,
                                                    fontSize: 20.0,
                                            ),
                                    ),
                                    ListView.builder(
                                            padding: EdgeInsets.all(3.0),
                                            physics: const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: detailList.length,
                                            itemBuilder: (BuildContext context, int index) {
                                                return ListTile(
                                                        contentPadding: EdgeInsets.only(left: 20.0, right: 15.0),
                                                        title: Text(
                                                                detailList[index]['detail']!,
                                                                style: TextStyle(
                                                                        color: CustomTheme.of(context).theme.homeTimelineSubText,
                                                                        fontSize: 17.0,
                                                                ),
                                                        ),
                                                        trailing: Text(
                                                                detailList[index]['cost']!,
                                                                style: TextStyle(
                                                                        color: CustomTheme.of(context).theme.homeTimelineSubText,
                                                                        fontSize: 17.0,
                                                                ),
                                                                textAlign: TextAlign.right,
                                                        ),
                                                );
                                            },
                                            ),
                                    Container(
                                            margin: EdgeInsets.symmetric(horizontal: 10),
                                            height: 1.2,
                                            decoration: BoxDecoration(
                                                    color: CustomTheme.of(context).theme.homeTimelineIndicator,
                                            ),
                                    ),
                                    ListTile(
                                            contentPadding: EdgeInsets.only(left: 20.0, right: 15.0),
                                            title: Text(
                                                    'Total',
                                                    style: TextStyle(
                                                            color: CustomTheme.of(context).theme.homeTimelineSubText,
                                                            fontSize: 17.0,
                                                    ),
                                            ),
                                            trailing: Text(
                                                    'KRW 0',
                                                    style: TextStyle(
                                                            color: CustomTheme.of(context).theme.homeTimelineSubText,
                                                            fontSize: 17.0,
                                                    ),
                                                    textAlign: TextAlign.right,
                                            ),
                                    ),
                                    ElevatedButton(
                                            child: Text('Accept'),
                                            style: ElevatedButton.styleFrom(
                                                    primary: CustomTheme.of(context).theme.addTabElvatedButton,
                                            ),
                                            onPressed: () {
                                                Navigator.pop(context);
                                            },
                                    ),
                                    ],
                                ),
                        ),
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
                        constraints: BoxConstraints.expand(height: 320),
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
                                                Text(
                                                        'Type',
                                                        style: TextStyle(
                                                                fontSize: 18.0,
                                                                color: CustomTheme.of(context).theme.addTabTitle,
                                                        ),
                                                ),
                                                Container(
                                                        margin: EdgeInsets.symmetric(vertical: 10,),
                                                        height: 30,
                                                        child: toggleButton(),
                                                ),
                                            ]),
                                    _DatePickerItem(
                                            children: [
                                                Text(
                                                        'Subject',
                                                        style: TextStyle(
                                                                fontSize: 18.0,
                                                                color: CustomTheme.of(context).theme.addTabTitle,
                                                        ),
                                                ),
                                                Container(
                                                        width: 150,
                                                        child: subjectField(),
                                                ),
                                            ]),
                                    _DatePickerItem(
                                            children: [
                                                Text(
                                                        'Icon',
                                                        style: TextStyle(
                                                                fontSize: 18.0,
                                                                color: CustomTheme.of(context).theme.addTabTitle,
                                                        ),
                                                ),
                                                IconButton(
                                                        icon: Icon(
                                                                getIcon(),
                                                                color: CustomTheme.of(context).theme.addTabText,
                                                        ),
                                                        onPressed: () async {
                                                            iconData = await FlutterIconPicker.showIconPicker(context, iconPackModes: [IconPack.material]);
                                                            setState(() {});
                                                        }
                                                ),
                                            ]),
                                    ElevatedButton(
                                            child: Text('Add Detail'),
                                            style: ElevatedButton.styleFrom(
                                                    primary: CustomTheme.of(context).theme.addTabElvatedButton,
                                            ),
                                            onPressed: () async {
                                                final detailInfo = await openDialog();
                                                if(detailInfo == null || detailInfo.isEmpty) return;
                                                detailList.add(detailInfo);
                                                detailController.text = '';
                                                costController.text = 'KRW 0';
                                                setState(() {});
                                            },
                                    ),
                                    ]),
                ),
        );
    }

    Future<Map<String,String>?> openDialog() => showDialog<Map<String,String>>(
            context: context,
            builder: (context) => AlertDialog(
                    title: Text('Detail'),
                    content: Container(
                            height: 100,
                            child:Column(
                            children: [
                                _DatePickerItem(
                                        children: [
                                            Text(
                                                    'Name',
                                                    style: TextStyle(
                                                            fontSize: 15.0,
                                                            color: CustomTheme.of(context).theme.addTabTitle,
                                                    ),
                                            ),
                                            Container(
                                                    width: 150,
                                                    child: detailField(),
                                            ),
                                        ],
                                ),
                                _DatePickerItem(
                                        children: [
                                            Text(
                                                    'Money',
                                                    style: TextStyle(
                                                            fontSize: 15.0,
                                                            color: CustomTheme.of(context).theme.addTabTitle,
                                                    ),
                                            ),
                                            Container(
                                                    width: 150,
                                                    child: moneyField(),
                                            ),
                                        ],
                                ),
                            ],
                            ),
                    ),
                    actions: [
                        TextButton(
                                child: Text('Add'),
                                onPressed: submit,
                        ),
                    ],
            ),
    );

    void submit() {
        Navigator.of(context).pop({'detail': detailController.text, 'cost': costController.text});
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
                appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                ),
                body: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                                children: [
                                    baseCard(),
                                    Divider(),
                                    receipt(),
                                ],
                        ),
                ),
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
