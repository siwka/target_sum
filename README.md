<p>Given products and prices find combination of products that add up exactly to the target price specified if solution exist.</p>

<p>In mathematical language we will find all subsequences from a given sequence of numbers (with precision 2) that add exactly to a given total. This is NP-problem.</p>

<p>In this approach we will consider all possible solutions for equation:</p>

<pre><code>  Sum a[ i ] * x[ i ] = target     for i in (0..n)
</code></pre>

<p> where:
<ul>
    <li>Y      - sequence of numbers (with precision 2,
                 most known algorithms use small integers.</li>
    <li>X      - sequence of non-duplicate numbers x[i] < total</li>
    <li>A      - sequence of quantities of numbers a[i]</li>
    <li>target    - given sum</li>
    <li>n      - cardinal number of set (quantity of numbers in set)</li>
</ul>



<p>X is a subsequence selected from Y by elimination of duplicate values and each is less than *total*. In result each x[i] is given. Our goal is to find if above polynomial equation can be solved and if it is to give all sequences of values a[i]. We can define constrains for each element from A as follows:</p>

<pre><code>  a[i] 'less than' target/x[i]     for each i in (0..n)
</code></pre>

<p>Data is provided in csv file. First row contains a target price and each following row provides a name and a value.</p>

<ol>
<li>Read hash [k , v] from csv file.</li>
<li>Extract numbers to an array, remove duplicate numbers and numbers bigger than target.</li>
<li>Create supporting arrays: array with max values that each a [i] can have.</li>
<li>If k is a number of values to choose from and n is a length of sequence, there are k^n possible permutations with repetitions that are candidates of final solution. We will limit computation by providing constrains for k and for n.
Generated set of arrays contains all candidates for solution.</li>
<li>Match names with prices. If prices are duplicated list all of corresponding names.</li>
</ol>

<p>Since this is NP problem and we are looking for exact, not approximate number, limitations were introduced. Beside computational reason there is also limit of expectation of buying product if finance are limited. In the future other approach might be considered for larger a[i] numbers and longer sequences, finding only one solution, or use algorithm to find an approximate answer. Either mathematical or by generating permutation with repetition gradually as long as user is willing to wait for solution.</p>

<p>Program does not check for csv file expected data format, data type or its values. The main purpose is finding a solution.</p>

<p>Run with provided data files:</p>

<pre><code>ruby bin/calculate.rb data.csv
ruby bin/calculate.rb data1.csv
ruby bin/calculate.rb data2.csv
ruby bin/calculate.rb data3.csv    
</code></pre>

<p>note: not easy to find sensible tool for mathematical symbols</p>
