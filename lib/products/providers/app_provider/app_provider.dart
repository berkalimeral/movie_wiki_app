import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/language/language.dart';

final appProvider = StateProvider((ref) => Language.english);
