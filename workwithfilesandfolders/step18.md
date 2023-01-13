Search all files with `.txt` extansion in folder `itacademyfiles` and in subdirectories which have size 0byte and 
add that information in new file `./sixth/deleteemptyfiles`

<br>

<details>
<summary>Solution</summary>

```
find -name "*txt" -type f -size 0b > ./sixth/deleteemptyfiles
```{{exec}}
</details>
