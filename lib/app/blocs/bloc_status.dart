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
}
