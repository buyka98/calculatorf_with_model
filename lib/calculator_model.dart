class CalculatorModel {
  String currentValue;
  String? operator;
  String? previousValue;

  CalculatorModel({this.currentValue = "0", this.operator, this.previousValue});

  CalculatorModel copyWith({
    String? currentValue,
    String? operator,
    String? previousValue,
  }) {
    return CalculatorModel(
      currentValue: currentValue ?? this.currentValue,
      operator: operator ?? this.operator,
      previousValue: previousValue ?? this.previousValue,
    );
  }

  CalculatorModel reset({
    required String currentValue,
  }) {
    return CalculatorModel(
      currentValue: currentValue,
      operator: null,
      previousValue: null,
    );
  }

  @override
  String toString() {
    return """
  {currentValue : $currentValue, operator : $operator, previousValue : $previousValue}
""";
  }
}
