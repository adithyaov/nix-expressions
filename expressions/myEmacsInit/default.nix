with (import <nixpkgs> {});
runCommand "myEmacsInit"
  { srcs = [ ./src/package-init.el ./src/init.el ./src/custom.el ] ; }
  ''
siteLisp="$out/share/emacs/site-lisp"
content=""
mkdir -p $siteLisp
for i in $srcs
do
  value=`cat $i`
  content="$content\n$value"
done
echo -e "$content" >> "$siteLisp/default.el"
''
