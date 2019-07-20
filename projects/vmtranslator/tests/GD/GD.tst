load GD.asm,
output-file GD.out,
compare-to GD.cmp,
output-list RAM[0]%D1.6.1 RAM[1]%D1.6.1 RAM[2]%D1.6.1 
            RAM[3]%D1.6.1 RAM[4]%D1.6.1;

set RAM[0] 256,
set RAM[1] 300,
set RAM[2] 400,
set RAM[3] 500,
set RAM[4] 510,

repeat 300 {
  ticktock;
}

output;