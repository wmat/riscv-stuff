

with open("hello.bin", mode="rb") as bin_file:
    contents = bin_file.read()

ii = 0
for h in contents:
  print(f"{h:02x}", end='')
  ii += 1
  if ii % 4 == 0:
    print()
if ii % 4 != 0:
  print()

