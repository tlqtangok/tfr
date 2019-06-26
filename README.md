<span style="float:left">
<img src="./img/tor_fr_icon.png" >
</img>
</span>

# README 
===

## tfr synopsis
tfr, original name "tor-fr", is a productive tool that sync-up and share your files, directories instantly, efficently and elegantly.

in the very beginning, Jidor Tang /[github](https://github.com/tlqtangok)/ and LjessonS Liu /[github](https://github.com/LjessonS)/ start this project 
to help themselves to solve many frequently small files and folder transferring from A-machine to B-machine. But eventually, Jidor Tang
found it is so usefully, so we begin to have it go "open source" at 2019-06-26, ShenZhen, China.

## supported platform or OS


platform | download | info | command download
---|---|---|---
Linux | [download](https://raw.githubusercontent.com/tlqtangok/tfr/master/rel/linux/tfr) | x64 Linux | `curl https://raw.githubusercontent.com/tlqtangok/tfr/master/rel/linux/tfr > tfr`
Windows | [download](https://raw.githubusercontent.com/tlqtangok/tfr/master/rel/win/tfr.exe) | x64 Win7/Win10 | `curl https://raw.githubusercontent.com/tlqtangok/tfr/master/rel/win/tfr.exe > tfr.exe`
Pi | [download](https://raw.githubusercontent.com/tlqtangok/tfr/master/rel/pi/tfr) | Raspaberry Pi 3 B+, armv7 | `curl https://raw.githubusercontent.com/tlqtangok/tfr/master/rel/pi/tfr > tfr`
Macintosh | [download](https://raw.githubusercontent.com/tlqtangok/tfr/master/rel/darwin/tfr) | Macintosh/Apple/Darwin | `curl https://raw.githubusercontent.com/tlqtangok/tfr/master/rel/darwin/tfr > tfr`


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
- more test cases 

---
## change log 

- to do
    - intellgent set the net-speed next time.
    

- 2019-6-26
    - add homepage on github
    - core verification data:  for 814M .tar ball file + localhost,  tfr t : time all: 12.75min  upload data time: 10.43min; tfr f : time all: 5.92m,  download time: 2.96min
    

- 2019-4-1
    - add host_name, port config file.
    
    
- 2019-3-23
    - add `-pw` for fr, too. change version to `2019.03.23`
    
    
- 2019-3-13
    - add record for jd_xx and fn, so the search history filelist


- 2019-3-12
    - add visitor list "show_visitor" sub module , with pw disable at my vm or win. change version to "die" if not 2019.03.12
    

- 2019-3-5
    - fix a bug when FOLDER_FN.tar.gz , while FN is a exist local file
    
    
- 2019-2-27
    - fix bug when progress bar status can be more than 100%.


- 2019-2-26
    - fix bug time_assume is not passed to callee function in redis set process.
    - give more slim-granularity to progress bar, update in 1/2 seconds.
    

- 2019-2-23
    - automatically prompt for changing srv's version in build.PL
    - add "20xx.xx.xx:die" in srv's version string
    - add statistic infomation in `TOR_SPEED_IP`,`FR_SPEED_IP` for tor transferring and fr recieving.
    - depracate tor.PL fr.PL, instead, use one single file tfr.PL.
    
    
- 2019-2-22
    - add filename key in tor process , and get it first time
    - add precise progress bar 
    - change new version to 2019.02.22
        
    
- 2019-2-21
    - hide password's inputting.
    - add progress bar for tor,fr if time needs big than 10s.

    
- 2019-2-20
    - use try ... catch ... to connect host, for security sane
    

- 2019-2-19 
    - add server's assertion of version, to avoid future's *version fragmentization*, and ensure only the latest version is applied.
    - `ls` add new pw version of tor-fr for darwin.
    - add logic for check internet connection first, if no internet, will exit. this will enhance security of server.
    
    
- 2019-2-18 
    - add version argument "-v"


- 2019-2-17
    - support password for tor / fr now ! usage `tor txt.txt -pw <your_password>`
    

- 2019-2-15
    - add macOS "darwin" support, from now on, we support 4 platform, includes pi, windows, Linux and Darwin. Great thanks to my friend "ls" !
    

- 2019-2-13
    - fix a bug when fr restore folder-filename and has many dots in it.
    
  
- 2019-2-1     
    - add support for tor folder , fr to a folder; merge the two codes to one code, pretty easier for maintaining;
    
    
- 2019-1-25
    - first release a logo for tor-fr
    

- 2018-12-16
    - fix bug when use `fr jd_xx` and file exist,  and `tor abs_path` has assert(-f $fn) issue

    
- 2018-12-10
    - can use abs path for tor.


- 2018-12-09
    - add crc32 checksum for file content.
    
    
- 2018-11-29
    - auto save and restore file **AND** filename
    

- 2018-11-23
    - fix bug of tor, fr, turn the input and output matter to `binmode` 
    - transfer max size from 20M to 50M.
    
    
- 2018-11-20
    - wrap around to jd_0 if hit max_jd_incr number
    - if file content > 2k, then gzip the bytes first
    - no need dependency on redis-cli anymore


- 2018-11-19
    - add support up to 10M files 
    - faster x 2



<br>
<br>

---
<div syle="font-size:41px" align=right >
    Written by Jidor Tang tlqtangok@126.com. Copyright 2018-2019
</div>
