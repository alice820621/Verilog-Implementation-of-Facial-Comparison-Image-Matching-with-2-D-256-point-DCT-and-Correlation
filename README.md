# Verilog-Implementation-of-Facial-Comparison-Image-Matching-with-2-D-256-point-DCT-and-Correlation
(Capstone Masters Project) Image Matching utilizing fast 1-D 256-point discrete cosine transform (DCT) running at 100MHz. The 256-point DCT has 16 layers with 128 operations each. Images are processed through the Verilog device in 1-D, transposed using a Python script, and processed through the Verilog device again as 2-D. The result is a correlation between two images via Python.

Some codes are used for planing or testing if the algorithm works, but not used in this project at the end.

Codes running order in this project:
	-> grayscale.py
	-> dct256.v (1st)
	-> transpose.py
	-> dct256.v (2nd)
	-> err_check.py
	-> correlation.py
	


Codes used in this project  

Verilog  
- dct256.v		a fast 1-D 256-point DCT, the top Verilog module  
- bfly.v		a cosine list used for butterfly's twiddle factor, the sub Verilog module  
- dct256_tb.v		a testbench for dct256.v  

Python  
- grayscale.py		a resizing and grayscaling for ten photos, generating an input text file for Verilog device  
- transpose.py		a transpose for the first 1-D DCT output of the Verilog device  
- err_check.py		an error checking between build-in DCT and the output of the Verilog device  
- correlation.py	a correlation for ten photos  



Codes used for planing or testing the project  

Python  
- print.py		a space for printing the needed Verilog code  
- tw_to_bin.py		a fixed point conversion for twiddle factor from decimal to binary with 7-bit integer and 10/15/30-bit decimal  
- dct256_buildin.py	a build-in 1-D DCT including transpose  
- dct256.py		a fast 1-D 256-point DCT, comparing the error between normal DCT and fast DCT  
- dct16.py		a fast 1-D 16-point DCT, not used in this project  
- dec_to_bin.py		a fixed point conversion from decimal to binary with 10-bit integer and 10-bit decimal, not used in this project  

Matlab  
- correlation.m		a correlation algorithm for two photos, not used in this project  




