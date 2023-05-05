Python provides a built-in ***csv*** module that allows you to 
simplifies work with CSV files. For more information on 
options and usage, please refer to the official documentation

- csv.reader(file): Creates a CSV reader object to read a CSV file
```Python
import csv

with open('example.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        print(', '.join(row))
```

- csv.writer(file):	Creates a CSV writer object to write a CSV file
```Python
import csv

with open('output.csv', 'w', newline='') as csvfile:
    writer = csv.writer(csvfile, delimiter=',')
    writer.writerow(['Name', 'Age', 'Gender'])
    writer.writerow(['John', 25, 'Male'])
    writer.writerow(['Mary', 30, 'Female'])
```
- csv.DictReader(file):	Creates a CSV reader object to read a CSV file as a dictionary
```Python
import csv

with open('example.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile, delimiter=',')
    for row in reader:
        print(row['Name'], row['Age'], row['Gender'])
```
- csv.DictWriter(file, fieldnames):	Creates a CSV writer object to write a CSV file as a dictionary
```Python
import csv

with open('output.csv', 'w', newline='') as csvfile:
    fieldnames = ['Name', 'Age', 'Gender']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames, delimiter=',')
    writer.writeheader()
    writer.writerow({'Name': 'John', 'Age': 25, 'Gender': 'Male'})
    writer.writerow({'Name': 'Mary', 'Age': 30, 'Gender': 'Female'})
```
- csv.field_size_limit([new_limit])	Gets or sets the maximum size of a CSV field
```Python
import csv

csv.field_size_limit(1000000)  # set field size limit to 1 MB

with open('example.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        # process each row of data here
        pass
```
