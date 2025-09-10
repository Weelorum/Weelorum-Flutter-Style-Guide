part of code_example;

class CodeExampleScreen extends BaseStatelessScreen with _CodeExampleActionHelper {
  CodeExampleScreen({
    super.key,
  });

  @override
  PreferredSizeWidget buildAppBar(final BuildContext context) {
    return getAppBar(context);
  }

  @override
  Widget buildBody(final BuildContext context) {
    final CodeExampleScreenViewModel viewModel = context.watch<CodeExampleScreenViewModel>();
    return _CodeExampleBody(
      isBusy: viewModel.isBusy,
    );
  }

  @override
  Widget? buildActionListener(final BuildContext context) {
    final CodeExampleScreenViewModel viewModel = context.watch<CodeExampleScreenViewModel>();
    final CodeExampleScreenAction action = viewModel.getAction();
    switch (action) {
      case ActionNone():
        {
          break;
        }
      case ActionClick():
        {
          WidgetsBindingManager().getPostFrame(
            () {
              viewModel.obtainEvent(
                EventNone(),
              );
              _showAssureDialog(
                context: context,
                onConfirm: () {
                  viewModel.obtainEvent(
                    EventOnConfirmDialog(),
                  );
                },
                contentText: context.setText(
                  Strings.will_be_soon_title,
                ),
              );
            },
          );
          break;
        }
      case ActionShowErrorToast():
        {
          WidgetsBindingManager().getPostFrame(
            () {
              viewModel.obtainEvent(
                EventNone(),
              );
              showMessageM(
                context,
                context.setText(
                  action.message,
                ),
                messageType: MessageType.error,
              );
            },
          );
          break;
        }
    }
    return const SizedBox.shrink();
  }
}
