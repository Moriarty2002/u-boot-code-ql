/**
 * @name Macro expressions: ntoh*
 * @description Finds top-level expressions of invocations of `ntoh*` macros.
 * @kind problem
 * @problem.severity warning
 * @id learning-uboot/08-macro-expressions
 */

import cpp

from MacroInvocation mi
where mi.getMacroName().regexpMatch("^ntoh.")
select mi.getExpr(), "ntoh* macro top level expression found by regex"
