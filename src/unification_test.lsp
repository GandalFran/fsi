(load "load.lsp")

(setf test_unification_var_first '((? x) A) )
(setf test_unification_var_second '((f h) (? y)) )
(format t "~%INFO:unification_test.lsp: constant: (unification ~S ~S)" test_unification_var_first test_unification_var_second)
(setf test_unification_var_result (unification test_unification_var_first test_unification_var_second))
(format t "~%INFO:unification_test.lsp: constant: (unification ~S ~S) = ~S (expected: ???)" test_unification_var_first test_unification_var_second test_unification_var_result)
