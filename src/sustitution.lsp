(defun multiple_sustitution (listaACambiar listaCambios)
    (prog (result)
        (setf result listaACambiar)
        (dolist (cambio listaCambios) 
            (format t "~%       DEBUG:sustitution.lsp:multiple_sustitution: applying sustitution [ ~S ] to [ ~S ]" cambio result) 
            (setf result (sustitution listaACambiar cambio))
            (format t "~%       DEBUG:sustitution.lsp:multiple_sustitution: sustitution [ ~S ] result [ ~S ]" cambio result)
        )
        (return-from multiple_sustitution result)
    )
)

(defun sustitution (listaACambiar cambio)
    (cond
        ((is_atom listaACambiar)
            (return-from sustitution NIL)
        )
        ( (is_atom listaACambiar)
            (return-from sustitution NIL)
        )
        (T
            (dolist (var listaACambiar)
                (setf tempList (list var))
                (when (listp var)
                    (sustitution var cambio)
                )
                (when (equal tempList (rest cambio))
                    (setf tempVar (getPosition var listaACambiar))
                    (setf (nth tempVar listaACambiar) (first cambio))
                )
            )
            (return-from sustitution listaACambiar)
        )
    )
)

(defun getPosition(element list &optional(n 0))
    (cond
        ((null list) list)
        ((equal (car list) element) n)
        (t (getPosition element (cdr list) (+ n 1)))
    )
)
