set -e -u -o pipefail

original=true
main=true
latest=false

file=true
func=false
block=false

if [ "$file" = true ]; then
  if [ "$original" = true ]; then
    ./scripts/profile-compiler-build.sh summary-original.csv ""
  fi
  if [ "$main" = true ]; then
    ./scripts/profile-compiler-build.sh summary-main.csv "regalloc-param=BLOCK_TEMPORARIES:on"
  fi
  if [ "$latest" = true ]; then
    ./scripts/profile-compiler-build.sh summary-latest.csv "regalloc-param=BLOCK_TEMPORARIES:on"
  fi
fi

if [ "$func" = true ]; then
  if [ "$original" = true ]; then
    ./scripts/profile-compiler-build.sh summary-original-func.csv "granularity=func"
  fi
  if [ "$main" = true ]; then
    ./scripts/profile-compiler-build.sh summary-main-func.csv "regalloc-param=BLOCK_TEMPORARIES:on,granularity=func"
  fi
  if [ "$latest" = true ]; then
    ./scripts/profile-compiler-build.sh summary-latest-func.csv "regalloc-param=BLOCK_TEMPORARIES:on,granularity=func"
  fi
fi

if [ "$block" = true ]; then
  if [ "$original" = true ]; then
    ./scripts/profile-compiler-build.sh summary-original-block.csv "granularity=block"
  fi
  if [ "$main" = true ]; then
    ./scripts/profile-compiler-build.sh summary-main-block.csv "regalloc-param=BLOCK_TEMPORARIES:on,granularity=block"
  fi
  if [ "$latest" = true ]; then
    ./scripts/profile-compiler-build.sh summary-latest-block.csv "regalloc-param=BLOCK_TEMPORARIES:on,granularity=block"
  fi
fi
