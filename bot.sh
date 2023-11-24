#!/usr/bin/env bash

info="Fixed bugs, ran maintenance for $(date)"
echo "OS detected: $OSTYPE"

case "$OSTYPE" in
    darwin*)
        cd "`dirname $0`" || exit 1
        ;;

    linux*)
        cd "$(dirname "$(readlink -f "$0")")" || exit 1
        ;;

    *)
        echo "OS unsupported (submit an issue on GitHub!)"
        ;;
esac

echo "$info" >> ./contracts/output.txt
echo "$info"
echo

# Ship it
git add .
git commit -m "$info"
git push origin master # or "master" on old setups

cd -
