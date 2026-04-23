/**
 * @name memcpy calls
 * @description Finds calls to `memcpy`.
 * @kind problem
 * @problem.severity warning
 * @id learning-uboot/06-memcpy-calls
 */

import cpp

from FunctionCall fc
where fc.getTarget().getName() = "memcpy"
select fc, "memcpy call found compact version"
