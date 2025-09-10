part of code_example;

mixin _CodeExampleActionHelper {
  Future<Widget?> _showAssureDialog({
    required final BuildContext context,
    required final Function() onConfirm,
    required final String contentText,
  }) {
    return showDialog(
      context: context,
      builder: (final BuildContext context) {
        return BaseDialog(
          title: Strings.are_you_sure_dialog_title,
          centerTitle: false,
          confirmActionText: Strings.action_ok,
          onConfirmClick: onConfirm,
          onCancelClick: () => context.pop(),
          child: Text(
            context.setText(contentText),
            style: Styles.dialogSmallContentStyle,
          ),
        );
      },
    );
  }
}
