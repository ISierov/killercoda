Search all files with `.txt` extansion in folder `itacademyfiles` and in directories with nesting level 2 and 
add that information to file `./sixth/pointzero/metadata.txt`

<br>

<details>
<summary>Solution</summary>

```
find -maxdepth 2 -name "*txt" -type f >> ./sixth/pointzero/metadata.txt
```{{exec}}
</details>
