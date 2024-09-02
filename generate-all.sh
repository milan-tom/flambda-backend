set -e -u -o pipefail

original=false
main=false
latest=true

if [ "$original" = true ]; then
  ./scripts/profile-compiler-build.sh summary-original.csv ""
fi
if [ "$main" = true ]; then
  ./scripts/profile-compiler-build.sh summary-main.csv "regalloc-param=BLOCK_TEMPORARIES:on"
fi
if [ "$latest" = true ]; then
  ./scripts/profile-compiler-build.sh summary-latest.csv "regalloc-param=BLOCK_TEMPORARIES:on"
fi

if [ "$original" = true ]; then
  ./scripts/profile-compiler-build.sh summary-original-func.csv "granularity=func"
fi
if [ "$main" = true ]; then
  ./scripts/profile-compiler-build.sh summary-main-func.csv "regalloc-param=BLOCK_TEMPORARIES:on,granularity=func"
fi
if [ "$latest" = true ]; then
  ./scripts/profile-compiler-build.sh summary-latest-func.csv "regalloc-param=BLOCK_TEMPORARIES:on,granularity=func"
fi

if [ "$original" = true ]; then
  ./scripts/profile-compiler-build.sh summary-original-block.csv "granularity=block"
fi
if [ "$main" = true ]; then
  ./scripts/profile-compiler-build.sh summary-main-block.csv "regalloc-param=BLOCK_TEMPORARIES:on,granularity=block"
fi
if [ "$latest" = true ]; then
  ./scripts/profile-compiler-build.sh summary-latest-block.csv "regalloc-param=BLOCK_TEMPORARIES:on,granularity=block"
fi
