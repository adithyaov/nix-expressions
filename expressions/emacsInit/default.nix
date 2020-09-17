with (import <nixpkgs> {});
runCommand "emacsInit"
  { srcs = [ ./src/package-init.el ./src/init.el ./src/custom.el ] ; }
  ''
lisp="$out/share/emacs/site-lisp"
default="$lisp/default.el"
elisp="$lisp/elisp"
mkdir -p $lisp
mkdir -p $elisp
touch $default
for i in $srcs
do
  cat $i >> $default
done
cp ${./elisp}/*.el $elisp
''
