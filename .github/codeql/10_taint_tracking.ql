/**
 * @name Network byte swap flows to memcpy
 * @description Tracks data from network byte swap macros (ntoh*) to the length argument of `memcpy`.
 * @kind path-problem
 * @problem.severity warning
 * @id learning-uboot/10-taint-tracking
 */

import cpp
import semmle.code.cpp.dataflow.TaintTracking

class NetworkByteSwap extends Expr {
  NetworkByteSwap() {
    exists(MacroInvocation mi |
      mi.getMacroName().regexpMatch("^ntoh(l|s|ll)$") and
      this = mi.getExpr()
    )
  }
}

module MyConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    source.asExpr() instanceof NetworkByteSwap
  }

  predicate isSink(DataFlow::Node sink) {
    exists(FunctionCall fc |
      fc.getTarget().getName() = "memcpy" and
      sink.asExpr() = fc.getArgument(2)
    )
  }
}

module MyTaint = TaintTracking::Global<MyConfig>
import MyTaint::PathGraph

from MyTaint::PathNode source, MyTaint::PathNode sink
where MyTaint::flowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"
