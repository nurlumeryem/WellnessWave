import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String description;
  final Color color;

  const TaskCard({
    Key? key,
    required this.title,
    required this.description,
    required this.color,
  }) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              _isExpanded
                  ? widget.description
                  : '${widget.description.substring(0, 50)}...',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (widget.description.length > 50)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(_isExpanded ? 'Kapat' : 'Daha Fazla'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
