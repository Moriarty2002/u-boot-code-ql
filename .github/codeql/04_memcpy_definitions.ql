/**
 * @name Function definitions: memcpy
 * @description Finds function definitions named `memcpy`.
 * @kind problem
 * @problem.severity warning
 * @id learning-uboot/04-memcpy-definitions
 */

import cpp

from Function f
where f.getName() = "memcpy"
select f, "memcpy found"
