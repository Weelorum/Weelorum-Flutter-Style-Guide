part of code_example;

sealed class CodeExampleScreenEvent {}

final class EventNone extends CodeExampleScreenEvent {}

final class EventInit extends CodeExampleScreenEvent {}

final class EventClick extends CodeExampleScreenEvent {}

final class EventOnConfirmDialog extends CodeExampleScreenEvent {}

sealed class CodeExampleScreenAction {}

final class ActionNone extends CodeExampleScreenAction {}

final class ActionClick extends CodeExampleScreenAction {}

final class ActionShowErrorToast extends CodeExampleScreenAction {
  final String message;

  ActionShowErrorToast({required final this.message});
}

final class CodeExampleScreenViewState {
  final CodeExampleScreenEvent event;
  final CodeExampleScreenAction action;

  CodeExampleScreenViewState({
    required final this.event,
    required final this.action,
  });

  factory CodeExampleScreenViewState.init() {
    return CodeExampleScreenViewState(
      event: EventNone(),
      action: ActionNone(),
    );
  }

  CodeExampleScreenViewState copyWith({
    final CodeExampleScreenEvent? event,
    final CodeExampleScreenAction? action,
  }) {
    return CodeExampleScreenViewState(
      event: event ?? this.event,
      action: action ?? this.action,
    );
  }
}
