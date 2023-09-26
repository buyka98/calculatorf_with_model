import 'package:calculatorf_with_model/calculator_model.dart';

String handleNumber(String value, CalculatorModel state) {
  if (state.currentValue == "0") {
    return value;
  }
  return "${state.currentValue}$value";
}

CalculatorModel handleEqual(CalculatorModel state) {
  String? operator = state.operator;
  double current = double.parse(state.currentValue);
  double previous = double.parse(state.previousValue!);
  late double resultAmount;
  switch (operator) {
    case "+":
      {
        resultAmount = previous + current;
        break;
      }
    case "-":
      {
        resultAmount = previous - current;
        break;
      }
    case "*":
      {
        resultAmount = previous * current;
        break;
      }
    case "/":
      {
        resultAmount = previous / current;
        break;
      }
    default:
      return state;
  }

  return state.reset(
      currentValue: resultAmount.remainder(1) == 0
          ? resultAmount.toInt().toString()
          : resultAmount.toStringAsFixed(3));
}

CalculatorModel calculator(String type, String? value, CalculatorModel state) {
  switch (type) {
    case "number":
      return state.copyWith(currentValue: handleNumber(value!, state));
    case "clear":
      return CalculatorModel();
    case "posneg":
      {
        var result = double.parse(state.currentValue) * -1;
        return state.copyWith(
            currentValue: result.remainder(1) == 0
                ? result.toInt().toString()
                : result.toStringAsFixed(3));
      }
    case "percentage":
      return state.copyWith(
          currentValue:
              (double.parse(state.currentValue) * 0.01).toStringAsFixed(3));

    case "operator":
      return state.copyWith(
          operator: value,
          previousValue: state.currentValue,
          currentValue: "0");
    case "equal":
      return handleEqual(state);
    default:
      return state;
  }
}
