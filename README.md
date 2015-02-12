<p>From a given sequence  of numbers with precision 2 list all subsets that add exactly to given total.</p>

<p>Generally we consider all possible solutions for equation:</p>

<ul>
    <li>X1     - sequence of numbers with precision 2 </li>
    <li>X      - sequence of non-duplicate numbers x[i]</li>
    <li>A      - sequence of quantities of numbers a[i]</li>
    <li>target - given sum</li>
    <li>n      - cardinal number of set (quantity of numbers in set)</li>
</ul>

<pre><code>  Sum a[i]x[i] = target     for i in (0..n)
</code></pre>

<p>X is selected subset of X1 without duplicated and values grater than total. This way x[i] is given. Our goal is to find if polynomial equation can be solved and if it is give all segences of values a[i]. We can define constrains for each element from A as follows:</p>

<pre><code>  a[i] < target/x[i]     for each i in (0..n)
</code></pre>

<p>..</p>

<p>Data is provided in csv file, in first row target sume is provided and in each following row a name and value.</p>

<ol>
<li>Read hash[k,v] from csv</li>
<li>Extract to array values, removing duplicate numbers and numbers bigger than target.</li>
<li>Create supporting arrays</li>
<li>Last constrain set of arrays contains all candidates for solution, will be used to find all solutions (quantity of numbers considered as solution to equation); an option not added might be stopped upon finding first solution.</li>
</ol>

<p>File working_menu.rb is a working version of the final program. Improved program at this stage works for limited numbers accordingly to common sense of customers. Hard coded limitations are temporary &amp; necessary for calculation length purpose.
This is before different way will be provided to generalize permutation with repetition gradually.</p>

<p>Program does not check for csv file expected data format.</p>

<p>Run:</p>

<pre><code>ruby bin/calculate.rb data.csv
ruby bin/calculate.rb data1.csv
ruby bin/calculate.rb data2.csv
ruby bin/calculate.rb data3.csv    
</code></pre>

<p>note: README.md will be improved after learning how to use mathematical symbols here.</p>