import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/auth/presentation/providers/auth_provider.dart';
import '../features/home/presentation/provider/sentence_provider.dart';

List<SingleChildWidget> listProviders() => [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => SentenceProvider()),
    ];
