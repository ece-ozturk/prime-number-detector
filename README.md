## Prime Number Detector
This is a prime number detector that detects first 256 prime numbers (from 2 to 1619) and displays them in a row on a 7-segment display. After displaying the 256<sup>th</sup>, it will roll over the beginning and continue to count.

**The project consists of**
- *an 8-bit up counter* (counts up to 255. each of the outputs will be matched with a prime number)
- *a frequency divider* (takes 100Mhz board clock and generates 2Hz clock signal to visualize the output on 7-seg easily)
- *a prime number detector* (generates a prime number for 256 inputs)
- *a binary to BCD converter* (using double dabble algorithm)
- *a 7-segment display driver*
