# MidtermGenerator

## Randomized Written Problems for Midterm Generation

Provides files necessary to host a ``R`` shiny app that produces randomized midterms unique to students.

- Students will visit the hosted shiny url,
- enter a unique identifier,
- and download a customized midterm.

### Instructions:

1. Modify ``preamble-latex.tex`` as necessary
2. Modify ``midterm.rmd`` 
  - with ``R`` code that generates variable parameters for questions
  - with questions according to a typical LaTeX document *(see ``midterm.rmd`` for examples)*
3. Modify ``app.R`` 
  - Change ``BroncoID`` to a unique student identifier **(for example, last four digits of some student number)**

These files should then be hosted as a ``R`` shiny app.  

### Comment:

It is recommended to make a privatized ``solutions.r`` script that takes in the student identifier and prints customized solutions for easier grading.
