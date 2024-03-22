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

mkdir -p ~/riscv-gnu-toolchain
sudo dnf update
sudo dnf install autoconf automake bc bison kernel-devel texinfo \
  curl flex gawk gperf expat-devel libmpc-devel mpfr-devel gmp-devel libtool \
  patchutils zlib-devel
git clone https://github.com/riscv/riscv-gnu-toolchain
pushd $srcpath

./configure --prefix=$binpath --with-arch=$with_arch --with-abi=$with_abi

make

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


