Search in folder `itacademyfiles` and  in all sub folders all files where the name has `le` and add that information to file `./sixth/pointzero/info.txt`

<br>

<details>
<summary>Solution</summary>

```
find ./itacademyfiles/ -name "*le*" -type f >> ./sixth/pointzero/info.txt
```{{exec}}
</details>
