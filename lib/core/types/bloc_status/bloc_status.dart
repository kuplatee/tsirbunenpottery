enum Status {
  error,
  dirty,
  loading,
  ok,
  submitting,
  success,
}

class BlocStatus {
  final Status status;
  final String? message;

  const BlocStatus(this.status, {this.message});

  bool get isLoading => status == Status.loading;
  bool get isError => status == Status.error;
  bool get isOk => status == Status.ok;
  bool get isSubmitting => status == Status.submitting;
  bool get isSuccess => status == Status.success;
}
