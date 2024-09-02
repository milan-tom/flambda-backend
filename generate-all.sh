set -e -u -o pipefail

./scripts/profile-compiler-build.sh summary-original.csv ""
./scripts/profile-compiler-build.sh summary-latest.csv "regalloc-param=BLOCK_TEMPORARIES:on"
./scripts/profile-compiler-build.sh summary-original-func.csv "granularity=func"
./scripts/profile-compiler-build.sh summary-latest-func.csv "regalloc-param=BLOCK_TEMPORARIES:on,granularity=func"
./scripts/profile-compiler-build.sh summary-original-block.csv "granularity=block"
./scripts/profile-compiler-build.sh summary-latest-block.csv "regalloc-param=BLOCK_TEMPORARIES:on,granularity=block"
./scripts/profile-compiler-build.sh temp-testing.csv "regalloc-param=BLOCK_TEMPORARIES:on"
