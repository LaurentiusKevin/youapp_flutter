import 'package:flutter/material.dart';

class EditableChipsInput extends StatefulWidget {
  final List<String> initialChips;
  final String? hintText;
  final ValueChanged<List<String>>? onChanged;

  const EditableChipsInput({
    super.key,
    this.initialChips = const [],
    this.hintText,
    this.onChanged,
  });

  @override
  State<EditableChipsInput> createState() => _EditableChipsInputState();
}

class _EditableChipsInputState extends State<EditableChipsInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final List<String> _chips = [];

  @override
  void initState() {
    super.initState();
    _chips.addAll(widget.initialChips);
  }

  void _addChip(String value) {
    final chip = value.trim();
    if (chip.isNotEmpty && !_chips.contains(chip)) {
      setState(() {
        _chips.add(chip);
        _controller.clear();
        widget.onChanged?.call(_chips);
      });
    }
  }

  void _removeChip(String value) {
    setState(() {
      _chips.remove(value);
      widget.onChanged?.call(_chips);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      constraints: const BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0x0fd9d9d9).withValues(alpha: 0.06),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 17.0, bottom: 8.0, right: 17.0, top: 8.0),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ..._chips.map(
              (chip) => Chip(
                backgroundColor: Colors.blueGrey.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // soft edges
                  side: BorderSide.none, // removes the border
                ),
                label: Text(chip),
                deleteIcon: const Icon(Icons.close, size: 18),
                onDeleted: () => _removeChip(chip),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
              child: IntrinsicWidth(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: Colors.transparent,
                    hintText: widget.hintText ?? 'Add item',
                    border: InputBorder.none,
                  ),
                  onSubmitted: _addChip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
