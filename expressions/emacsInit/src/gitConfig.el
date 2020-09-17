(defun my/git--prompt-change (cmd value)
  (let ((prev-value (s-trim (shell-command-to-string cmd))))
    (unless (string= value prev-value)
      (when (y-or-n-p (concat prev-value "->" value " : " cmd ))
	(shell-command (concat cmd " " value))))))

(my/git--prompt-change "git config --global user.name" "adithyaov")
(my/git--prompt-change "git config --global user.email"
		       "adi.obilisetty@gmail.com")
