<p>From a given set  of numbers list all subsets that add exactly to given total.</p>

<p>Generally we consider all possible solutions for equation:</p>

<ul>
    <li>x - set of numbers</li>
    <li>a - quantity of numbers</li>
    <li>target - given sum</li>
    <li>n - cardinal number of set (quantity of numbers in set)</li>
</ul>

<pre><code>  Sum a[i]x[i] = target for i in (0..n)
</code></pre>

<p>Data is provided in csv file, in first row target sume is provided and in each following row a name and value.</p>

<ol>
<li>Read hash[k,v] from csv</li>
<li>Extract to array values, removing duplicate numbers and numbers bigger than target.</li>
<li>Create supporting arrays</li>
<li>Last constrain set of arrays contains all candidates for solution, will be used to find all solutions (quantity of numbers considered as solution to equation); an option not added might be stopped upon finding first solution.</li>
</ol>

<p>File working_menu.rb is a working version of the final program. Improved program at this stage works for limited numbers accordingly to common sense of customers. Hard coded limitations are temporary &amp; necessary for calculation length purpose.
This is before different way will be provided to generalize permutation with repetition gradually.</p>

<p>At this moment I am not sure if mathematical or coding solution should be my priority.</p>

<p>note: README.md will be improved after learning how to use mathematical symbols here.</p>

<p>Run:</p>

<pre><code>ruby working_menu.rb data.csv - working draft
</code></pre>

<p>program in progress:
at the stage that it is giving solutions)</p>

<pre><code>ruby bin/calculate.rb data.csv
ruby bin/calculate.rb data1.csv
ruby bin/calculate.rb data2.csv
ruby bin/calculate.rb data3.csv    
</code></pre>
