#!/bin/bash

# Step 1: Replace "Software" with "IT"
sed 's/,Software,/,IT,/g' employees.txt > temp.txt

# Step 2: Remove rows where Employee Age is less than 30
awk -F, '$3 >= 30' temp.txt > updated_employees.txt

# Step 3: Calculate and print average salary by department
awk -F, '
{
    dept[$4] += $5;
    count[$4]++;
}
END {
    for (d in dept) {
        avg = dept[d] / count[d];
        printf "%s: %.0f\n", d, avg;
    }
}
' updated_employees.txt

# Clean up temporary files
rm temp.txt
