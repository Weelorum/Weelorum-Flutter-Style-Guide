part of code_example;

class _CodeExampleBody extends BaseStatelessWidget {
  final bool isBusy;

  const _CodeExampleBody({
    this.isBusy = false,
  });

  @override
  Widget build(final BuildContext context) {
    if (isBusy) {
      return const ProgressWidget();
    }
    return const SizedBox.shrink();
  }
}
