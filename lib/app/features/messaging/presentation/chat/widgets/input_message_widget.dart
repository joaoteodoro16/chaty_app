import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputMessageWidget extends StatefulWidget {
  final String conversationId;
  final String myUid;
  final String otherUid;
  final String? myName;
  final String? otherName;

  const InputMessageWidget({
    super.key,
    required this.conversationId,
    required this.myUid,
    required this.otherUid,
    this.myName,
    this.otherName,
  });

  @override
  State<InputMessageWidget> createState() => _InputMessageWidgetState();
}

class _InputMessageWidgetState extends State<InputMessageWidget> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    await context.read<ChatCubit>().send(
      conversationId: widget.conversationId,
      myUid: widget.myUid,
      otherUid: widget.otherUid,
      text: text,
      myName: widget.myName,
      otherName: widget.otherName,
    );

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 54, 54, 54),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  controller: _controller,
                  style: context.textStyles.textRegular.copyWith(
                    color: Colors.white,
                  ),
                  onFieldSubmitted: (_) => _send(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: _send,
              icon: Icon(
                Icons.arrow_circle_right_sharp,
                color: AppColors.primary,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
