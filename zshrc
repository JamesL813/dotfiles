#!/bin/zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

source /home/james/.config/lf/lfcd

# Use manjaro zsh prompt
#if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
#fi

# Use $XINITRC variable if file exists.
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"

#lf

# sudo not required for some system commands
#for command in mount umount sv pacman updatedb su shutdown poweroff reboot ; do
#	alias $command="sudo $command"
#done; unset command


#Add some flags to some basic commands that probably should be default
#The aliases below with '-i' refer to asking for confirmation before
#doing things with files; rm needs to have three or more files or have
#the '-r' flag involved before asking for confirmation to delete.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	dust="dust -ir" \
	bc="bc -ql" \
	exa="exa -xG --icons --group-directories-first" \
	lsd="lsd --group-dirs first" \
	mkdir="mkdir -pv" \
	mkd="mkdir" \
	yt="youtube-dl --add-metadata -i" \
	yta="yt -x -f bestaudio/best" \
	ffmpeg="ffmpeg -hide_banner" \
	ln="ln -i" \
	df='df -h'  \
	free="free -m" \
	fd="fd -H"

# Colorize commands when possible.

export GREP_OPTIONS='--color=auto'

alias \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi"
	#ls="ls -hN --color=auto --group-directories-first" \

# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	g="git" \
	trem="transmission-remote" \
	YT="youtube-viewer" \
	sdn="shutdown -h now" \
	e="$EDITOR" \
	v="$EDITOR" \
	p="pacman" \
	xi="sudo xbps-install" \
	xr="sudo xbps-remove -R" \
	xq="xbps-query" \
	z="zathura" \
	yay="paru"

# Git related
alias  \
	gi='git init' \
	gs='git status' \
	gc='git commit' \
	ga='git add' \
	gd='git diff' \
	gb='git branch' \
	gl='git log' \
	gsb='git show-branch' \
	gco='git checkout' \
	gg='git grep' \
	gk='gitk --all' \
	gr='git rebase' \
	gri='git rebase --interactive' \
	gcp='git cherry-pick' \
	grm='git rm' 


# Find out what is taking so much space on your drives
alias diskspace="du -S | sort -n -r | less"

# Easy way to extract archives
extract () {
   if [ -f "$1" ] ; then
       case "$1" in
           *.tar.bz2)   tar xvjf "$1"    ;;
           *.tar.gz)    tar xvzf "$1"    ;;
           *.bz2)       bunzip2 "$1"     ;;
           *.rar)       unrar x "$1"     ;;
           *.gz)        gunzip "$1"      ;;
           *.tar)       tar xvf "$1"     ;;
           *.tbz2)      tar xvjf "$1"    ;;
           *.tgz)       tar xvzf "$1"    ;;
           *.zip)       unzip "$1"       ;;
           *.Z)         uncompress "$1"  ;;
           *.7z)        7z x "$1"        ;;
           *)           echo "I don't know how to extract $1..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

#Create a .7z compressed file
#Use as: 7zip "/path/to/folder_or_file" "/path/to/output.7z"
function 7zip() { 7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on -mhe=on "$2" "$1"; }

# Move 'up' so many directories instead of using several cd ../../, etc.
up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; }

#Another variation of the one above
alias \
	..="cd .." \
	...="cd ../.." \
	....="cd ../../.." \
	.....="cd ../../../.."


# Common variations of 'ls' command
alias \
	ls="exa" \
	ll="ls -l" \
	la="ls -a" \
	lla="ls -la" \
	sl="ls" \
	l="ls" \
	s="ls"
	

#List people in a Twitch channel chat
function twitch_list() { curl -s "https://tmi.twitch.tv/group/user/$1/chatters" | less; }

#Nano for writing and spell-checking
function spellcheck() { aspell -c "$1"; }
function spell() { echo "$1" | aspell -a; }
alias nano="nano -m -u -c -W --tabsize=4 --autoindent"
alias writer="nano -m -u -c -W -l --tabsize=4 --fill=85 --autoindent --smooth"

# Print a word from a certain column of the output when piping.
# Example: cat /path/to/file.txt | fawk 2 --> Print every 2nd word in each line.
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

#Tail all logs in /var/log
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Colors for All grep commands such as grep, egrep and zgrep


# 'cd' to the most recently modified directory in $PWD
cl()
{
        last_dir="$(ls -Frt | grep '/$' | tail -n1)"
        if [ -d "$last_dir" ]; then
                cd "$last_dir"
        fi
}

# Directory bookmarking (one at a time)
rd(){
    pwd > "$HOME/.lastdir_$1"
}

crd(){
        lastdir="$(cat "$HOME/.lastdir_$1")">/dev/null 2>&1
        if [ -d "$lastdir" ]; then
                cd "$lastdir"
        else
                echo "no existing directory stored in buffer $1">&2
        fi
}

# 'cd' into a directory and then list contents
cdls() { cd "$1"; ls;}

#For when you've spent too much time in DOS
alias  \
	cls="clear" \
	cd..="cd .." \
	del="rm"
	
diskcopy(){ dd if="$1" of="$2" ; }
alias tracert="traceroute"

#Generate a random, "strong" (hopefully) password
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

#List by file size in current directory
sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 

#Show active ports
alias port='netstat -tulanp'

#Uses 'nmap' to scan all of the connected devices on your router
#You may need to change the '192.168.0.*' part to better match how your 
#router gives addresses. This will not give you hostnames, only MAC 
#addresses.
alias lanscan='sudo nmap -sn 192.168.0.*'

#Kill any lingering SSH processes
function sshkill() { ps aux | grep ssh | grep -v grep | grep -v sshd | awk {'print $2'} | xargs -r kill -9; }

#Print last value returned from previous command
lastvalue='RET=$?; if [[ $RET -eq 0 ]]; then echo -ne "\033[0;32m$RET\033[0m ;)"; else echo -ne "\033[0;31m$RET\033[0m ;("; fi; echo -n " "'

#Converting audio and video files using ffmpeg and eyeD3 
#(sudo pip install eyeD3). Album art is removed in the '2ogg' function 
#because if you are using ogg, you probably either do not need it or 
#want to save as much space as possible. The '2voc' is very useful when 
#dealing with DOOM WADS or certain DOS software. The '2mpgNTSC' and 
#'2mpgPAL' is for helping to cut down time since most DVD authoring 
#programs convert to MPEG anyway.
function 2ogg() { eyeD3 --remove-all-images "$1"; fname="${1%.*}"; sox "$1" "$fname.ogg"; rm "$1"; }
function 2wav() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" "$fname.wav" && rm "$1"; }
function 2doswav() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" -ar 11025 -acodec pcm_u8 -ac 1 "$fname'_converted'.wav" && rm "$1"; }
function 2doswav8() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" -ar 8000 -acodec pcm_u8 -ac 1 "$fname'_converted'.wav" && rm "$1"; }
function 2doswav11() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" -ar 11025 -acodec pcm_u8 -ac 1 "$fname'_converted'.wav" && rm "$1"; }
function 2voc() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" -ar 11025 -acodec pcm_u8 -ac 1 "$fname.voc" && rm "$1"; }
function 2voc8() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" -ar 8000 -acodec pcm_u8 -ac 1 "$fname.voc" && rm "$1"; }
function 2aif() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" "$fname.aif" && rm "$1"; }
function 2mp3() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" "$fname.mp3" && rm "$1"; }
function 2mov() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" "$fname.mov" && rm "$1"; }
function 2mp4() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" "$fname.mp4" && rm "$1"; }
function 2avi() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" "$fname.avi" && rm "$1"; }
function 2webm() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" -c:v libvpx "$fname.webm" && rm "$1"; }
function 2h265() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" -c:v libx265 "$fname'_converted'.mp4" && rm "$1"; }
function 2flv() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" "$fname.flv" && rm "$1"; }
function 2mpg() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" "$fname.mpg" && rm "$1"; }
function 2mpgNTSC() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" -i "$1" -map 1:0 -map 0:1 -y -target ntsc-dvd -sn -g 12 -bf 2 -strict 1 -ac 2 -aspect 1.7777777777777777 -trellis 0 -mbd 0 -b:a 224k -b:v 5000k -passlogfile "$fname.mpg" -pass 1 "$fname.mpg" && rm "$1" ; }
function 2mpgPAL() { fname="${1%.*}"; ffmpeg -hide_banner -threads 0 -i "$1" -i "$1" -map 1:0 -map 0:1 -y -target pal-dvd -sn -g 12 -bf 2 -strict 1 -ac 2 -aspect 1.7777777777777777 -trellis 0 -mbd 0 -b:a 224k -b:v 5000k -passlogfile "$fname.mpg" -pass 1 "$fname.mpg" && rm "$1" ; }

#Converting documents and images using soffice 
#(installed along with LibreOffice)
function 2txt() { soffice --headless --convert-to txt "$1"; }
function 2pdf() {
    if [ ${1: -4} == ".html" ]
    then
        fname="${1%.*}"
        soffice --headless --convert-to odt "$1"
        soffice --headless pdf "$fname.html"
    else
        soffice --headless --convert-to pdf "$1"
    fi
}
function 2doc() { soffice --headless --convert-to doc "$1"; }
function 2odt() { soffice --headless --convert-to odt "$1"; }

#Convert images using ImageMagick
function 2pcx() { fname="${1%.*}"; convert "$1" -colors 256 "$fname.pcx" && rm "$1"; }
function 2jpeg() { fname="${1%.*}"; convert "$1" "$fname.jpg" && rm "$1"; }
function 2jpg() { fname="${1%.*}"; convert "$1" "$fname.jpg" && rm "$1"; }
function 2png() { fname="${1%.*}"; convert "$1" "$fname.png" && rm "$1"; }
function 2bmp() { fname="${1%.*}"; convert "$1" "$fname.bmp" && rm "$1"; }
function 2dosbmp() { fname="${1%.*}"; convert "$1" -colors 16 -depth 4 BMP3:"$fname'_converted'.bmp" && rm "$1"; }
function 2dosgif() { fname="${1%.*}"; convert "$1" -colors 256 -dither none -resize 320x200\! GIF87:"$fname'_converted'.gif" && rm "$1"; }
function 2tiff() { fname="${1%.*}"; convert "$1" "$fname.tiff" && rm "$1"; }

#If input is a video, convert use '2gif' to created an animated 
#(89a) GIF; otherwise, use ImageMagick to create a still (87a) GIF.
function 2gif() {
    fname="${1%.*}"
    if [ ! -d "/tmp/gif" ]; then mkdir "/tmp/gif"; fi
    if [ ${1: -4} == ".mp4" ] || [ ${1: -4} == ".mov" ] || [ ${1: -4} == ".avi" ] || [ ${1: -4} == ".flv" ] || [ ${1: -4} == ".mpg" ] || [ ${1: -4} == ".webm" ]
    then
        ffmpeg -hide_banner -threads 0 -i "$1" -r 10 -vf 'scale=trunc(oh*a/2)*2:480' /tmp/gif/out%04d.png
        convert -delay 1x10 "/tmp/gif/*.png" -fuzz 2% +dither -coalesce -layers OptimizeTransparency +map "$fname.gif"
    else
        convert "$1" GIF87:"$fname.gif"
        rm "$1"
    fi
    rm -r "/tmp/gif"
}
function 2ico() { fname="${1%.*}"; convert -background transparent "$1" -define icon:auto-resize=16,32,48,64,128 "$fname.ico" && rm "$1"; }

#Tonvid is a YouTube frontend and this helps for when copy/paste text isn't possible.
function tonvid() { mpv --vo=opengl,x11,drm,tct,caca --ao=pulse,alsa --ytdl-format="[ext=mp4][height<=?720]" http://tonvid.com/info.php?video_id=$1; }

# dictionary
alias \
	dict="dict -d gcide" \
	def="dict"

#Grab a pretty ascii forecast picture for anywhere; without arguments, 
#uses ISP location to print your weather. Example: weather New York, NY
function weather() { curl -s http://wttr.in/$1; }

#Convert hex data file to a binary
function hex2bin() { s=${@^^}; for i in $(seq 0 1 $((${#s}-1))); do printf "%04s" `printf "ibase=16; obase=2; ${s:$i:1};\n" | bc` ; done; printf "\n"; }

#Create a randomized playlist for audio and video recursively
alias playlist="find -D tree . | sort -R --random-source=/dev/urandom > playlist.m3u"

#Play Twitch streams with MPV in GUI or TTY
#Use as: twitch username
function twitch() { streamlink -p "mpv --vo=opengl,x11,drm,tct,caca --ao=pulse,alsa,jack --user-agent='Mozilla'" https://twitch.tv/$1 720p,720p_alt,480p,360p,160p,audio_only ; }

#Or, if you have a live stream's full URL (use with Twitch, YouTube, etc.)...
function stream() { streamlink -p "mpv --vo=opengl,x11,drm,tct,caca --ao=pulse,alsa,jack --user-agent='Mozilla'" $1 720p,720p_alt,480p,360p,160p,audio_only ; }

#Play just about anything web related that youtube-dl supports
function webplay() { ffplay -vf scale=720x480 "$(youtube-dl -g $1)"; }
function webplayer() { ffplay -vf scale=720x480 "$(youtube-dl -g $1)"; }

#Optimize mpv for playing just about anything in any environment
alias mpv="mpv --vo=opengl,x11,drm,tct,caca --ao=pulse,alsa,jack --user-agent='Mozilla' --ytdl-format='best[ext=mp4][height<=?720]'"

#Play last viewed, or attempted to view video from Kodi using mpv; may not work due to CDN.
function mpvkodi() { URL="$(grep 'mp4' ~/.kodi/temp/kodi.log | awk '{print $6}' | cut -d '|' -f1 | tail -n 1)"; mpv "$URL"; }

#If playback on Kodi is slow, download last viewed, or attempted to view video using axel; may not work do to CDN.
function axelkodi() { URL="$(grep 'mp4' ~/.kodi/temp/kodi.log | awk '{print $6}' | cut -d '|' -f1 | tail -n 1)"; axel -n 10 "$URL"; }

#Do a fuzzy search for an installed program in the 
#"/usr/share/applications/" directory and run it.
function run() { xdg-open $(find /usr/share/applications/ -type f | fzy); }

#Quickly use QEMU, if installed, to boot a 64-bit, i686/i586, or i486 
#operating system from an ISO. Add -hda "/path/to/created.img" if 
#planning to install the system booted from the ISO.
function bootiso() { qemu-system-x86_64 -cdrom "$1" -boot d -m "$2"; }
function boot32() { qemu-system-i386 -cdrom "$1" -boot d -m "$2" ; }
function boot486() { qemu-system-i386 -cpu 486 -cdrom "$1" -boot d -m "$2" ; }

#Use curl and "https://cht.sh/" to quickly search how to do things
#Examples: 'howin html do I view an image'
#          'howin python do I add numbers'
howin() {
    where="$1"; shift
    IFS=+ curl "https://cht.sh/$where/$*"
}

#Create lists from multi-line output
function list() { awk 'BEGIN { ORS="" } { print p"'"'"'"$0"'"'"'"; p=", " } END { print "\n" }' ; }

#Potentially lower an image's file size using ImageMagick
function optimg() { convert "$1" -dither FloydSteinberg -colors 256 -morphology Thicken:0.5 '3x1+0+0:1,0,0' -remap netscape: -ordered-dither o8x8,6 +contrast "$1_converted" ; }

#Potentially lower a PDF's file size using Ghostscript
function optpdf() { gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -sOutputFile="$1_Small" "$1" ; }

#Use 'pdftoppm' and 'img2pdf' to lower DPI of PDFs to 72, 96, or 300
function optpdf72() { dir="$(dirname $1)" && fname="$(echo $1 | cut -f1 -d '.')" && mkdir -p "$dir/temppdf" && cd "$dir/temppdf" && pdftoppm -jpeg -r 72 "$1" pg && img2pdf *.jpg --output "$fname"_small.pdf && rm -rf "$dir/temppdf" && cd .. ; }
function optpdf96() { dir="$(dirname $1)" && fname="$(echo $1 | cut -f1 -d '.')" && mkdir -p "$dir/temppdf" && cd "$dir/temppdf" && pdftoppm -jpeg -r 96 "$1" pg && img2pdf *.jpg --output "$fname"_small.pdf && rm -rf "$dir/temppdf" && cd .. ; }
function optpdf300() { dir="$(dirname $1)" && fname="$(echo $1 | cut -f1 -d '.')" && mkdir -p "$dir/temppdf" && cd "$dir/temppdf" && pdftoppm -jpeg -r 300 "$1" pg && img2pdf *.jpg --output "$fname"_small.pdf && rm -rf "$dir/temppdf" && cd .. ; }

#Append line numbers to the beginning of each line
function apline() { awk '{printf("%01d %s\n", NR, $0)}' "$1" ; }

#If you are encrypting/decrypting files using OpenSSL...
function encrypt() { openssl smime -encrypt -binary -aes-256-cbc -in "$1" -out "$2" -outform DEM "$3" ; } #"$3" is path to public key
function decrypt() { openssl smime -decrypt -in "$1" -binary -inform DEM -inkey "$2" ; } #"$2" is path to private key

#Sorts out unique lines in text file in alphabetical order
function unique() { sort "$1" | uniq -u ; }

#Internet speed test using cURL and Python
function int-speed() { curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - ; }

#Grab a copy of an entire website or starting from whichever URL you use
#in place of "$1". It doesn't always work 100% of the time and do not 
#get made at me if a server bands you for using it.
function grabindex() { wget  -e robots=off -r -k -nv -nH -l inf -R --reject-regex '(.*)\?(.*)'  --no-parent "$1" ; }

#Use axel download accelorator with youtube-dl to grab YouTube videos
function axelyt() { youtube-dl -c -i --user-agent 'Mozilla' --external-downloader-args '-n 10' --external-downloader /usr/bin/axel $1 ; }

#Look for files within current directory and all sub directories that 
#were modified between two dates; $1 and $2 are as follows: yyyy-mm-dd
function findbetween() { find . -type f -newermt $1 ! -newermt $2 ; }

#Zip all files in current directory independently from each other
function indezip(){ for file in *; do zip "${file%.*}.zip" "$file"; done ; }

#Zip all files in current directory independently from each other AND 
#delete the originals.
function indeziprm(){ for file in *; do zip "${file%.*}.zip" "$file" && rm "$file"; done ; }

#Get the mime information (file-type) of a file
#For example, a plain text file would have 'text/plain' as the mime
function mime(){ file --mime-type "$1" ; }

#Move up by a number of specified directories
function up(){
    local d=""
    local limit="$1"
    if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
        limit=1
    fi
    for ((i=1;i<=limit;i++)); do
        d="../$d"
    done
    if ! cd "$d"; then
        echo "Could not go up $limit directories.";
    fi
}

#Find and replace
function far(){
	rg -il $1 | xargs sd -f i $1 $2
}

#Grab from YouTube
alias \
	yta-best="youtube-dl --extract-audio --audio-format best " \
	yta-flac="youtube-dl --extract-audio --audio-format flac " \
	yta-mp3="youtube-dl --extract-audio --audio-format mp3 " \
	yta-wav="youtube-dl --extract-audio --audio-format wav " \
	ytv-best="youtube-dl -f bestvideo+bestaudio " \
	yt-best="ytv-best"

# Some 'ps' command aliases...
alias \
	psa="ps auxf" \
	psgrep="ps aux | grep --v grep | grep -i -e VSZ -e" \
	psmem='ps auxf | sort -nr -k 4' \
	pscpu='ps auxf | sort -nr -k 3'

#rust alternatives
alias \
	pipes="pipes-rs" \
	find="fd"
	#grep="rg" \
	#cat="bat" \
	#ps="procs" \
	#sed="sd" \
	#grex
	#du="dust" \

alias \
	lf="lfcd"

	
	
eval "$(starship init zsh)"

