/// Interface for future curve fitting / prediction models.
/// Pure-Dart linear fit is implemented here; polynomial/exponential deferred.
/// TODO(stage4): add FuturePolynomialFitService, FutureExponentialFitService.
abstract class FitService {
  /// Given (x, y) pairs, return predicted y values at [predictAt] x positions.
  List<double> predict(
      List<double> xs, List<double> ys, List<double> predictAt);
}

/// Minimal pure-Dart linear (OLS) fit — no external packages needed.
class LinearFitService implements FitService {
  const LinearFitService();

  @override
  List<double> predict(
      List<double> xs, List<double> ys, List<double> predictAt) {
    assert(xs.length == ys.length && xs.isNotEmpty);
    final n = xs.length.toDouble();
    final sumX = xs.fold(0.0, (a, b) => a + b);
    final sumY = ys.fold(0.0, (a, b) => a + b);
    final sumXY =
        List.generate(xs.length, (i) => xs[i] * ys[i]).fold(0.0, (a, b) => a + b);
    final sumX2 =
        xs.map((x) => x * x).fold(0.0, (a, b) => a + b);
    final denom = n * sumX2 - sumX * sumX;
    if (denom == 0) return predictAt.map((_) => sumY / n).toList();
    final slope = (n * sumXY - sumX * sumY) / denom;
    final intercept = (sumY - slope * sumX) / n;
    return predictAt.map((x) => slope * x + intercept).toList();
  }
}
