#!/bin/bash

error=0
for version in '5.6' '7.0' '7.1' '7.2'; do
    . `echo $(dirname $0)"/../phpswitch.sh"` $version -s > /dev/null
    switched=$(php -v | grep -e '^PHP' | cut -d' ' -f2 | cut -d. -f1,2)
    if [ "$version" != "$switched" ]; then
        error=1
        echo -n 'E'
    fi
    echo -n '.'
done
echo

exit $error
