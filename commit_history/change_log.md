# change log 
---

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
