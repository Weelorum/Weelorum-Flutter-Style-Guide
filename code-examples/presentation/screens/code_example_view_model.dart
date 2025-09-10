part of code_example;

class CodeExampleScreenViewModel extends BaseViewModel {
  CodeExampleScreenViewState _viewState = CodeExampleScreenViewState.init();

  CodeExampleScreenViewModel() {
    obtainEvent(
      EventInit(),
    );
  }

  CodeExampleScreenAction getAction() => _viewState.action;

  void _setAction(final CodeExampleScreenAction newAction) {
    if (newAction == getAction()) {
      return;
    }
    _viewState = _viewState.copyWith(action: newAction);
    notifyListeners();
  }

  Future<void> obtainEvent(final CodeExampleScreenEvent event) async {
    switch (event) {
      case EventNone():
        {
          _setAction(
            ActionNone(),
          );
          break;
        }
      case EventClick():
        {
          _reduceClick();
          break;
        }
      case EventInit():
        {
          _reduceInit();
          break;
        }
      case EventOnConfirmDialog():
        {
          _reduceConfirmDialog();
          break;
        }
    }
  }

  Future<void> _reduceConfirmDialog() async {
    setBusy(true);

    /// TODO: add logic
    setBusy(false);
  }

  void _reduceClick() {
    /// TODO: add logic
    _setAction(
      ActionClick(),
    );
  }

  Future<void> _reduceInit() async {
    /// setBusy is using for loading
    setBusy(true);

    /// TODO: add logic
    setBusy(false);
  }
}
