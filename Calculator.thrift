
struct OperationResult{
    1: i32 codeResult;
    2: double result;
}


service CalculatorService {
    OperationResult Sum(1: double firstNumber, 2: double secondNumber)
    OperationResult Subtraction(1: double firstNumber, 2: double secondNumber)
    OperationResult Division(1: double firstNumber, 2: double secondNumber)
    OperationResult Multiplication(1: double firstNumber, 2: double secondNumber)
}