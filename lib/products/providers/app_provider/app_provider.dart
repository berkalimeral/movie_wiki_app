import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/enums/language/language.dart';

final appProvider = StateProvider((ref) => Language.english);
