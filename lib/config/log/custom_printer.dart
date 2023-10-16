import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class CustomPrinter extends LogPrinter {
  static final Map<Level, AnsiColor> defaultLevelColors = {
    Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: const AnsiColor.fg(4),
    Level.info: const AnsiColor.fg(12),
    Level.warning: const AnsiColor.fg(208),
    Level.error: const AnsiColor.fg(196),
    Level.fatal: const AnsiColor.fg(199),
  };

  static final levelEmojis = {
    Level.debug: '🔅',
    Level.info: '💡',
    Level.warning: '❕',
    Level.error: '⛔',
  };

  @override
  List<String> log(LogEvent event) {
    final color = defaultLevelColors[event.level];
    final emoji = levelEmojis[event.level];
    final date = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd~HH:mm:ss');
    final formattedDate = formatter.format(date);
    return [color!('$emoji $formattedDate ${event.message}')];
  }
}
