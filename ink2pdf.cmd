@echo off
set /p fname=input a file name:
if exist imag_source\%fname%.pdf_tex (
    pdflatex "\def\fname{%fname%} \input{ink2fff.tex}"
    pdflatex "\def\fname{%fname%} \input{fff2pdf.tex}" 
    rename fff2pdf.pdf %fname%.pdf
    move %fname%.pdf imag_out\%fname%.pdf
    del *.aux *.log *.out *.lof *.fff *.auxlock
) else (
    echo imag_source\%fname%.pdf_tex is not exist!
)