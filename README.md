<span style="float:left">
<img src="./img/tor_fr_icon.png" >
</img>
</span>

# README 


## tfr synopsis
tfr, original name "tor-fr", is a productive tool that sync-up and share your files, directories instantly, efficently and elegantly.

## supported platform or OS


platform | info 
---|---
Linux | x64 Linux 
Windows | x64 Win7/Win10 
Pi | Raspaberry Pi 3 B+, armv7 
Macintosh | Macintosh/Apple/Darwin 


this are these already tested platforms, actually, it should work on more platforms. let me know if it works for you.

## deps & env

### install some cpan packages you need. 
please firstly set up your environment by following command:

```
sudo cpan -i pp
sudo cpan -i Redis
sudo cpan -i Term::ReadKey
sudo cpan -i Term::ProgressBar
```
### set up you redis-server
you need have your redis-server startup. and remember its host ip and port.
and then you need run a command to set up version key in your DB.

```
redis-cli -h <HOSTNAME> set TOR_FR_VERSION_KEY 2019.04.01
```

where the "2019.04.01" may be changed as time goes, but should be the same with the version number in source code `tfr.PL`.

## to build

the build system is smart enough , just run:
``` 
perl build.PL
```

you will get the executed file.



## before your run
the default redis host ip is your localhost. but you can change that by putting the `tfr.config` file to the same folder as your 
binary file `tfr.exe (windows)` or `tfr (non-windows)`. you can tune it a bit as your wish.

## usage

**synopsis**

```
tfr tor <filename> [-pw <your_password>]
tfr fr [jd_xx]
tfr -v
```

### Tor

**synopsis**


**usage example**

*show version* 

```
tfr -v
```

*pass stdin*
```
echo 'xxxx' | tfr tor

```

*pass string as argument*
```
tfr tor 'xxx'
```


*pass file as argument*
```
tfr tor main.cpp
```


*pass folder*
```
tfr tor my_folder_name 
tfr tor .
tfr tor /a/b/c/you_path_of_file_or_directory
tfr tor `pwd`
```


### Fr

*no jd_xx arg*
```
tfr fr 
```


*has jd_xx*
```
tfr fr jd_xx
```
*has jd_xx and -pw*
```
tfr fr jd_xx -pw <your_password>
tfr fr -pw <your_password>
```

## to do
- test cases 


---
<div syle="font-size:41px" align=right >
    Written by Jidor Tang tlqtangok@126.com. Copyright 2018-2019
</div>
