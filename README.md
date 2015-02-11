List all subsets of numbers from given set that add to exact total.

Generally we consider all possible soliutions for equation:
  x - set of numbers
  a - quantity of numbers
  target - given sum
  n - cardinal number of set (quantity of numbers in set)

Sum a[i]x[i] = target for i in (0..n)

Data is given in csv file, in each row there is name and value

  1. Read hash[k,v] from csv
  2. Extract to array values, removing duplicate numbers and numbers bigger than target.
  3. Creating arrays for other constrains
  4. Last constrain set of arrays contains all candidates for solution, will be used to find all solutions (quantity of numbers considered as solution to equation); an option: might be stoped upon finding first.

File working_menu.rb is a working version of the final program. Improved program at this stage works for limited numbers accordingly to common sense of customers. In reality this is a temporary limitation for calculation length purpose: 7 is a maximum number of duplicates for max 7 different choices (8 require significant longer waiting for results).
This is before I will find diiferent way of generalizing permutation with repetition gradually (might be using different or not using a method from library).
At this moment I am not sure if mathematical or coding solution should be my priority.

note: README.md will be improved after learning how to use mathematical symbols here.

Run:
    ruby working_menu.rb data.csv - working draft

program in progress:
at the stage that it is giving solutions)

    ruby bin/calculate.rb data.csv
    ruby bin/calculate.rb data1.csv
    ruby bin/calculate.rb data2.csv
    ruby bin/calculate.rb data3.csv    