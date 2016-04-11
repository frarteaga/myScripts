alias wot='cd /media/frank/DATOS/__TESIS/LATEX'

alias ll='ls -l'
alias la='ls -la'
alias lh='ls -lhS'
alias lll='ls -l | less'
alias llh='ls -lhS | less'
alias namei='namei -x -m'
alias h='history'
alias hg='history | grep'
alias hl='history | less'
alias l='wc -l'
alias j='jobs -l'

alias cd='pushd . >/dev/null ; cd'
alias cd-='pushd > /dev/null ; d'
alias nl='nl -ba -nln'
alias f='find . -iname '

alias mkdir='mkdir -p'

alias gz='gzip -9'
alias gzv='gzip -v9'
alias rmq='/bin/rm'

function rm()
{
	if test "$1" = "."; then
		shift;
	fi
	if test "$1" = ".."; then
		shift;
	fi
	if test "$#" -eq "0"; then
		/bin/rm;
		return $?;
	fi;
	local nf=0;
	local nd=0;
	for v in "$@"; do
		if test -f "$v"; then
			nf=$(($nf+1));
		fi;
		if test -d "$v"; then
			nd=$(($nd+1));
		fi;
	done;
	echo -e $nf"\tfiles\n"$nd"\tdirs";
	du -sch "$@" | tail -1;
	/bin/rm -R "$@"
}

# word frequency counter,
# thanks to ´Putting the tools together´ (coreutils info)
function fr()
{
	if test "$#" -eq "0"; then
		tr '[:upper:]' '[:lower:]' | tr -c '[:alnum:]_ \nóáíéúñ' '[ *]' |  tr -s ' ' '\n' | sort | uniq -c | sort -n -r ;
		return $?;
	fi;
	cat "$1" | tr '[:upper:]' '[:lower:]' | tr -c '[:alnum:]_ \nóáíéúñ' '[ *]' |  tr -s ' ' '\n' | sort | uniq -c | sort -n -r ;
}

alias i='sudo apt-get install'
alias lif='dpkg-query -L'
alias cs='apt-cache search'
alias csh='apt-cache show'

alias mw='evince /media/frank/DATOS/DOC/LIBROS/libros__FR/libros_math_fr/ENCYofMATH.pdf.gz 2>/dev/null &' # MathWorld Encyclopedia
alias gg='g++ -g -Wall -std=c++0x -o '
alias gt='gdbtui'
alias cr='tcc -run' # C run, as script, thanks to Tiny C compiler
					# ex: cr a.c

alias mp='matho-primes'
alias tp='matho-pascal'
#alias f='factor'
alias ecm='pyecm'   # to factor numbers using the Elliptic Curve Method.
					# see python source code in /usr/bin/pyecm

alias ascii='showkey -a' # man ascii, Linux Programmer's Manual

alias cal='cal -3'

#alias pl='swipl -q -s'

function whereis()
{
	/usr/bin/whereis "$@" | cut -d: -f2
}

alias fm='free -m'
alias df='df -Thm'

alias ds='du -schm'
alias dk='du -schk'
alias km='tailf /var/log/messages'
alias grep='grep --colour'

alias volume='amixer set PCM -q'

alias ealias='vim ~/.bash_aliases && source ~/.bash_aliases'

alias v='eog' # (Eyes of GNOME) viewer of images
#alias v='gpicview'

alias updb='updatedb -l 0 -o /media/frank/DATOS/._Frank_dir_db -U /media/frank/DATOS/'
alias loc='locate -d /media/frank/DATOS/._Frank_dir_db'
#alias uloc='updatedb -l 0 -o /media/DATOS/._Frank_dir_db -U /media/DATOS/Frank/ ; locate -d /media/DATOS/._Frank_dir_db'

#alias oka='wine /media/DATOS/Okawix/okawix.exe &'

# Functions

# return the binomial number n,k
C()
{
	local n k;
	n=$(($1 + 1));
	k=$(($2 + 1));
	matho-pascal "$n" | tail -1 | cut --delimiter=\  -f"$k"
}

factorial()
{
	if test $# -eq "0"; then
		while read num; do
			echo `seq -s\* $num` | bc;
		done;
	else
		for num in $@; do
		    calc `seq -s\* $num`
		done;
	fi
}

calc()
{
    echo "$1" | bc
    # calc 2\^13
    # calc 23\*42
}

prime()
{
	mp $1 $1
	# Another form is
	# factor $1
}

range()
{ 
    local lower upper output;
    lower=$1 upper=$2;

    if [ $lower -ge $upper ]; then return; fi
    while [ $lower -lt $upper ];
    do
	echo "$lower "
        lower=$(($lower + 1))
    done
    echo "$lower"
}

# $ killc factor
kc()
{
	kill -CONT `pidof $@`
}

# $ kk vim
kk() #kill -kill 
{
	kill -9 `pidof $@`
}

# $ kk 4599
kp() #kill -kill PID
{
	kill -9 $@
}

ks()
{
	kill -STOP `pidof $@`
}

cleanc()
{
	df -hm 
	find . -name '*.*~' -type f -print0 | xargs -0 /bin/rm -f
	find . -name '*.swp' -type f -print0 | xargs -0 /bin/rm -f
	find . -name 'a.out' -type f -print0 | xargs -0 /bin/rm -f
	find . -name '*humbs.db' -type f -print0 | xargs -0 /bin/rm -f
	df -hm 
}

############################################################

# "repeat" command.  Like:
#
#	repeat 10 echo foo
repeat()
{ 
    local count="$1" i;
    shift;
    for i in $(_seq 1 "$count");
    do
        eval "$@";
    done
}

# Subfunction needed by `repeat'.
_seq ()
{ 
    local lower upper output;
    lower=$1 upper=$2;

    if [ $lower -ge $upper ]; then return; fi
    while [ $lower -lt $upper ];
    do
	echo -n "$lower "
        lower=$(($lower + 1))
    done
    echo "$lower"
}


alias isdbdir='cd /media/frank/DATOS/DOC/DATOS/Frank/Documentacion/math/Secuencias\ de\ Enteros/OEIS\ \(all\)/base\ 2-11-2007' # integer sequences database

#alias info='info --vi-keys'
alias d='dirs -p -l -v'

function compphthos()
{
	ds
	mogrify -resize "$1" *.{jpg,JPG}
	ds
}

function strip_exiv2()
{
	dk
	exiv2 rename *.[jJ][pP]*[gG]
	exiv2 delete *.[jJ][pP]*[gG]
	dk
}

alias se=strip_exiv2
alias mpg123=mp3-decoder
alias cojdir='cd /media/DATOS/Frank/Documentacion/PROGRAMAS_DE_FR/; ls'

