import 'flavors.dart';
import 'main_dev.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.development;
  await runner.main();
}
