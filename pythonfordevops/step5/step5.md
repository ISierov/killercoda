Let's move on to the next task.

This is Apache log-file: ***apache.log***. We want to display statistics of addresses
that received code **404** in response. 

The format of this load is structured enough and amenable to analysis. 

We read the file and define a regular expression to break the line into the substrings
that we need.

**Don't forget** to <code>import re</code> before!

> There are many sites that show how work you regex: 
> - https://regex101.com/
> - https://regexr.com/
> - https://www.regextester.com/ etc.

Read file line by line and ungroup our line with the help of <code>re.match.groups</code>
Groups will be put in an array of elements.

Check if the field responsible for the response code is equal to **404**. If yes - we 
form a dictionary that contains data with computer address and count of codes **404** 
that it received.

In the end, we display the answer and close file.

Run our code and see how many times which address had a response code **404**.

<details> <summary>Here you can see solution</summary>

```
import re

input_file = open('apache.log')
regex = '([(\d\.)]+) - - \[(.*?)\] "(.*?)" (\d+) (\d+)'
code_resoponse_idx = 3
ip_idx = 0
code_resoponse = '404'

result = {}
for line in input_file:
    log = re.match(regex, line).groups()
    if log[code_resoponse_idx] == code_resoponse:
        try:
            result[log[ip_idx]] = result[log[ip_idx]] + 1
        except:
            result[log[ip_idx]] = 1
    
print(result)

input_file.close()
```
</details>

### *Note* that logs parse is one of the typical tasks of DevOps!

 So typical that there is developed a whole layer of special programs and libraries for 
 logs of typical servers, including for **Apache**. 