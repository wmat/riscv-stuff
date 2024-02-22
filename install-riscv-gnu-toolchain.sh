# install-riscv-toolchain.sh
# example1: install-riscv-toolchain.sh # defaults to arch=rv32i, abi=ilp32
# example2: install-riscv-toolchain.sh rv32ix ilp32x # overrides defaults 

with_arch=${1:-rv32i}
with_abi=${2:-ilp32}

echo "arch=$with_arch, abi=$with_abi"

binpath=$HOME/riscv-gnu-toolchain/rv32i
srcpath=$(pwd)/riscv-gnu-toolchain

starttime=$(date)
echo

## mkdir -p ~/riscv-gnu-toolchain
## sudo apt-get update
## sudo apt-get install autoconf automake autotools-dev bc bison build-essential \
##   curl flex gawk gperf libexpat-dev libmpc-dev libmpfr-dev libgmp-dev libtool \
##   patchutils zlib1g-dev
## git clone https://github.com/riscv/riscv-gnu-toolchain
## pushd $srcpath
##
## ./configure --prefix=$binpath --with-arch=$with_arch --with-abi=$with_abi
##
## make


echo
echo "Toolchain Git Version:"
git log |head -3
echo
popd

echo
echo "The toolchain binary files are at: $binpath/bin"
echo "Disk utilization of the binary files is:"
du -csh $binpath
echo
ls $binpath/bin

echo
echo "The toolchain source files are at: $srcpath"
echo "Disk utilization of the source files is:"
du -csh $srcpath

echo
echo "To remove the source files (recommended):"
echo "  rm -rf $srcpath"

echo
echo "To add the toolchain to your path (recommended):"
echo '  export PATH=$PATH:'"$binpath/bin"

echo
echo "start time: $starttime"
echo "end time:   $(date)"


