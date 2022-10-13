import 'package:flutter/material.dart';

class CreateRoutine extends StatefulWidget {
  const CreateRoutine({Key? key}) : super(key: key);

  @override
  State<CreateRoutine> createState() => _CreateRoutineState();
}

class _CreateRoutineState extends State<CreateRoutine> {
  List<String> categories = ['work', 'school', 'home'];
  String dropDownValue = 'work';
  final _titleController = TextEditingController();
  final _timeController = TextEditingController();
  final _newCategoryController = TextEditingController();
  List<String> days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
  ];
  String dropdownDay = "monday";
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Routine'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _category(),
            const SizedBox(height: 24),
            _title(),
            const SizedBox(height: 24),
            _startTime(),
            const SizedBox(height: 24),
            _day(),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _category() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: DropdownButton(
                dropdownColor: Colors.white,
                isExpanded: true,
                value: dropDownValue,
                icon: const Icon(Icons.expand_more),
                items:
                    categories.map<DropdownMenuItem<String>>((String nvalue) {
                  return DropdownMenuItem<String>(
                      value: nvalue, child: Text(nvalue));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
              ),
            ),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'New Category',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  content: TextFormField(
                    controller: _newCategoryController,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Add',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    );
  }

  _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Title',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        TextFormField(
          controller: _titleController,
        ),
      ],
    );
  }

  _startTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Start TIme',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _timeController,
                enabled: false,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                _selectedTime(context);
              },
              icon: const Icon(Icons.calendar_month),
            ),
          ],
        ),
      ],
    );
  }

  _day() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Day',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: DropdownButton(
            isExpanded: true,
            value: dropdownDay,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: days.map<DropdownMenuItem<String>>((String day) {
              return DropdownMenuItem<String>(value: day, child: Text(day));
            }).toList(),
            onChanged: (String? newDay) {
              setState(() {
                dropdownDay = newDay!;
              });
            },
          ),
        ),
      ],
    );
  }

  _selectedTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.dial);

    if (timeOfDay != null && timeOfDay != selectedTime) {
      selectedTime = timeOfDay;
      setState(() {
        _timeController.text =
            "${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.name}";
      });
    }
  }
}
