/**
 * @name Short param for tmp
 * @kind problem
 * @problem.severity error
 * @id benny/tmp
 */
 
import java

from MethodAccess call, Method method, string stringExpression
where call.getMethod() = method
  and method.hasName("createTempFile")
  and method.getDeclaringType().hasQualifiedName("java.io", "File")
  and stringExpression = call.getArgument(0).(CompileTimeConstantExpr).getStringValue()
  and stringExpression.length() < 10
select call.getArgument(0), "Argument too short"
