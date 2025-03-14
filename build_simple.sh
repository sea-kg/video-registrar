#!/bin/bash
check_ret() {
    if [ $1 -ne 0 ]; then
        echo ""
        echo "!!! FAIL: $2"
        echo "********************************************************************************"
        echo ""
        exit $1
    else
        echo ""
        echo "*** SUCCESS: $2"
        echo "********************************************************************************"
        echo ""
    fi
}

cmake -H. -B./tmp/linux-x64-release -DCMAKE_BUILD_TYPE=Release
check_ret $? "configure"

cmake --build ./tmp/linux-x64-release --config Release
check_ret $? "build"

# cd ./tmp/release && ctest --output-on-failure