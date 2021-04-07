;; load shell environment variables when launching Emacs outside shell

(defun in-list-p (elem list &optional comp-fn)
  "Returns t whether elem is present in list. Returns nil otherwise."
  (let ((comp (if comp-fn comp-fn 'eq)))
    (when list
      (if (apply comp (list elem (car list)))
	  t
	(in-list-p elem (cdr list) comp)))))

(defun load-unix-shell-env ()
  "Adds the shell environment variables to Emacs' process environment."
  (interactive)
  (let* ((env (shell-command-to-string "$SHELL -i -c 'printenv'"))
	 (entries (split-string env "\n" t)))
    (mapc (lambda (entry)
	    (add-to-list 'process-environment entry))
	  entries)))

(when (and window-system
	   (in-list-p system-type '(darwin gnu/linux)))
  (load-unix-shell-env))
