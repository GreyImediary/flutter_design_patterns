import 'example_state_base.dart';

class ExampleStateWithoutSingleton extends ExampleStateBase {
  ExampleStateWithoutSingleton() {
    initialText = 'A new ExampleStateWithoutSingleton';
    stateText = initialText;
  }
}