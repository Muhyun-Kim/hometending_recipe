
import 'package:flutter/material.dart';

class HowToMakeInputForm extends StatelessWidget {
  const HowToMakeInputForm({
    super.key,
    required this.howToMakeController,
  });

  final TextEditingController howToMakeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '3. 作り方',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: howToMakeController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText:
                          '例：\n1.グラスに氷を入れる\n2.ウォッカを1Oz入れる\n3.残りをオレンジジュースを入れる\n4.バースプーンなどでよく混ぜる',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

