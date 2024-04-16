extends Resource
class_name MathOperationResource

enum MATH_OPERATION { Add, Subtract, Multiply, Divide, RaiseToPower }
@export var operation : MATH_OPERATION

func operate(val1, val2) -> float:
	var float_val1 = val1 as float
	var float_val2 = val2 as float
	match operation:
		MATH_OPERATION.Add:
			return float_val1 + float_val2
		MATH_OPERATION.Subtract:
			return float_val1 - float_val2
		MATH_OPERATION.Multiply:
			return float_val1 * float_val2
		MATH_OPERATION.Divide:
			return float_val1 / float_val2
		MATH_OPERATION.RaiseToPower:
			return float_val1 ^ float_val2
	return 0.0
