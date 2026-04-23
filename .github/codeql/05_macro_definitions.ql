/**
 * @name Macro definitions: ntoh*
 * @description Finds macro definitions whose names match `ntoh*`.
 * @kind problem
 * @problem.severity warning
 * @id learning-uboot/05-macro-definitions
 */

import cpp

from Macro m
where m.getName().regexpMatch("^ntoh.")
select m, "ntoh* macro found by compact regex condition"
