import 'package:stars/counter/counter.dart';
import 'package:stars/navigation/paths.dart';

final navigationPages = {
  const PageRoutePath.starList(): const CounterPage(),
  const PageRoutePath.spaceDetail(): const CounterDetail(),
};
