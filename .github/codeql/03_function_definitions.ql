/**
 * @name Function definitions: strlen
 * @description Finds function definitions named `strlen`.
 * @kind problem
 * @problem.severity warning
 * @id learning-uboot/03-function-definitions
 */

import cpp

from Function f
where f.getName() = "strlen"
select f, "strlen found"
