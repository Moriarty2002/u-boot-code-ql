/**
 * @name Network byte swap expressions
 * @description Identifies expressions produced by `ntoh*` macro invocations.
 * @kind problem
 * @problem.severity warning
 * @id learning-uboot/09-class-network-byteswap
 */

import cpp

class NetworkByteSwap extends Expr {
  NetworkByteSwap() {
    exists(MacroInvocation mi |
      mi.getMacroName().regexpMatch("^ntoh.") and
      this = mi.getExpr()
    )
  }
}

from NetworkByteSwap n
select n, "Network byte swap"
