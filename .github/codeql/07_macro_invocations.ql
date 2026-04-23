/**
 * @name Macro invocations: ntoh*
 * @description Finds invocations of macros whose names match `ntoh*`.
 * @kind problem
 * @problem.severity warning
 * @id learning-uboot/07-macro-invocations
 */

import cpp

from MacroInvocation mi
where mi.getMacroName().regexpMatch("^ntoh.")
select mi, "ntoh* macro invocation found by regex"
