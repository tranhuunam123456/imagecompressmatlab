function output=main(input1,x)
input=imread(input1);
[enco,tables] = JPEG_ENCO(input,x);
output = JPEG_DECO(enco,tables,x);


end