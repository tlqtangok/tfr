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


this are only tested platforms, actually, it should work on more platforms. let me know if it works for you.

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



## to run
the default redis host ip is your localhost. but you can change that by putting the `tfr.config` file to the same folder as your 
binary file `tfr.exe (windows)` or `tfr (non-windows)`. you can tune it a bit as your wish.


## to do
- test cases 

