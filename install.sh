
for i in emacs emacs.d; do
    symlink_install $BOZ_CONFIG_HOME/emacs/$i $BOZ_CONFIG_DEST/.$i
done

[ -d $BOZ_CONFIG_DEST/.emacs.tmp ] || mkdir $BOZ_CONFIG_DEST/.emacs.tmp

