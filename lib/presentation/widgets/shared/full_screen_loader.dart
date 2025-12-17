import 'package:flutter/material.dart';
import 'package:podtimer/l10n/app_localizations.dart';
import 'package:podtimer/l10n/misc/loading_messages/loading_messages_localizations.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String?> getLoadingMessages(context) {
    final s = LoadingMessagesLocalizations.of(context);

    final messages = [
      s?.loading_message_1,
      s?.loading_message_2,
      s?.loading_message_3,
      s?.loading_message_4,
      s?.loading_message_5,
      s?.loading_message_6,
      s?.loading_message_7,
      s?.loading_message_8,
      s?.loading_message_9,
      s?.loading_message_10,
      s?.loading_message_11,
      s?.loading_message_12,
      s?.loading_message_13,
      s?.loading_message_14,
      s?.loading_message_15,
      s?.loading_message_16,
      s?.loading_message_17,
      s?.loading_message_18,
      s?.loading_message_19,
      s?.loading_message_20,
    ];
    return Stream.periodic(const Duration(milliseconds: 3000), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localizations.wait),
            const SizedBox(height: 10),
            const CircularProgressIndicator(strokeWidth: 2),
            const SizedBox(height: 10),
            StreamBuilder(
              stream: getLoadingMessages(context),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Text(localizations.loading);
                return Text(snapshot.data!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
