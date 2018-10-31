# Edit Distance Calculator
Edit distance is one of the popular ways to measure the dissimilarities between two strings based on counting the number of operations required to transfer one string into the other string.

There are 3 basic string operations, namely -
* Insertion - no. of steps involved = 1
* Deletion - no. of steps involved = 1
* Substitution - no. of steps involved = 2

If the characters of the strings are same then we do not require any operation i.e no. of steps involved = 0.
The aim is to compute the minimum no. of steps required to convert one string into another string.
## Running the code
* Give the following command in the MATLAB command terminal
  ```MATLAB
  editdistmain.m
  ```
* Enter the first and second strings between which edit distance is to be calculated.

## Back-Tracing
Back-Tracing is used to formulate the sequence of operations to follow to successfully transfer one string to other string.

## Output Format
* The minimum edit distance(value at D(M,N)) is displayed.
* The sequence of operations in an ordered form are displayed.

## Limitations and assumptions
There was an ambiguity over the order of precedence of insertion, deletion and substitution operations.
For back-tracing we need to store the choice we made to reach the particular value(i.e we either did a substitution, an insertion or a deletion). If the minima value for all 3 comes out to be the same then substitution is given the highest order of precedence.
If value of substitution equals another operation and that is the minima then also substitution is given a higher order of precedence.

This assumption might affect the back-tracing operation order in some cases(though I have not found a case till now) but will not affect the value of minimum edit distance.
