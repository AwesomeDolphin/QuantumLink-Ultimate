

;.\0006h1.prg ==1301==
    0 rem
    1 poke61705,234:poke61706,234:poke61782,234:poke61783,234:rem
    2 sys3331:rem
    3 data 114,131,138,133,156,133,174,133,192,133,210,133,228,133,172,076:rem
    4 data 103,84,11:data 172,76,1:data 241,84,7:data 255,137,6:data 241,178,6:data 174,185,2:data 103,178,9:data 87,129,13:rem
    5 close2:prof=4608:poke56577,32:ifpeek(prof+1)=0thenopen2,2,0,chr$(6):goto7
    6 ifpeek(prof+1)=1thenopen2,2,0,chr$(8)+chr$(0)
    7 poke52,64:poke56,64:rem
    8 prof=4608:printchr$(14):get#2,a$:
    9 poke53280,13:poke53281,0:rem
   10 li$="":fori=1to38:li$=li$+chr$(192):next
   11 ty=peek(prof):sp=peek(prof+1):pn=peek(prof+2):pd=peek(prof+3):au=peek(prof+5):
   12 if(ty=6)or(ty=4andau=1)thenpoke56579,peek(56579)or32:rem
   13 gosub40000:rem
  500 ifpn=1thengosub9900:rem
  501 ifpn=2thengosub9800:rem
  502 ifpn=3thengosub9700:rem
  503 ifpn=4thengosub9600:rem
  504 print"{clr}"
  505 rem
  510 poke51812,0:rem
  520 poke53269,0:rem
  530 rem
  570 rem
  600 poke62600,0:poke62601,150:poke62602,0:poke62603,8:rem
  610 sys50489:rem
  630 gosub16000:gosub60000
  640 tk=117:gosub5000
  650 sys39616:gosub15000:p=peek(782):ifp<>0andp<10then650:rem
  655 ifp>=10thentk=152:goto665
  660 tk=119
  665 gosub5000
  670 gosub2000:gosub15000:ifa<>246then670:rem
  680 sys50486:gosub3000:rem
  685 sys50486:get#2,a$
  690 gosub5000
  700 gosub2000:gosub15000:ifa<>23then700
  710 poke820,1
  801 print"{clr}";:si=0:poke51146,22:poke51183,0:poke51129,0:restore
  817 poke53269,0:forii=0to15:readte:pokev+ii,te:next:print"{wht}";
  820 forii=1to8:readx(ii),y(ii),co(ii):next
  835 tn=39:ff=45:u=1
  840 poke53280,0:poke53265,peek(53265)and239
  900 print"{rvon}{lred}             {rvof} {rvon}{pur}            {rvof} {rvon}{lblu}             ";
  902 print"{rvon}{lred}             {rvof} {rvon}{pur} + People + {rvof} {rvon}{lblu}             ";
  904 print"{rvon}{lred}  Commodore  {rvof} {rvon}{pur} Connection {rvof} {rvon}{lblu}  Commodore  ";
  906 print"{rvon}{lred}  Software   {rvof} {rvon}{pur}            {rvof} {rvon}{lblu} Information ";
  908 print"{rvon}{lred}  Showcase   {rvof} {rvon}{pur}       {pur}     {rvof} {rvon}{lblu}   Network   ";
  910 print"{rvon}{lred}             {rvof} {rvon}{pur}       {pur}     {rvof} {rvon}{lblu}             ";
  912 print"{rvon}{lred}             {rvof}              {rvon}{lblu}             ";
  914 print"{rvon}{blk}              {gry1}            "
  916 print"{rvon}{orng}           {rvof} {rvon}{gry1}   {rvof}          {rvon}   {rvof} {cyn}{rvon}           ";
  918 print"{rvon}{orng}           {rvof}  {rght}{rght}              {rvon}{cyn}           ";
  920 print"{rvon}{orng}   Just    {rvof}  {rght}               {rvon}{cyn}  Learning ";
  922 print"{rvon}{orng}    For    {rvof} {rght}{rght}               {rvon}{cyn}   Center  ";
  924 print"{rvon}{orng}     Fun   {rvof} {rght}{rght}               {rvon}{cyn}           ";
  926 print"{rvon}{orng}           {rvof}     {rght}{rght}           {rvon}{cyn}           ";
  928 print"{rvon}{orng}           {rvof} {rvon}{gry1}   {rvof}          {rvon}   {rvof} {rvon}{cyn}           ";
  930 print"{rvon}{blk}              {gry1}            {rvof}{blk}              ";
  932 print"{rvon}{yel}             {rvof}              {rvon}{grn}             ";
  934 print"{rvon}{yel}             {rvof} {rvon}{lgrn}     {lgrn}       {rvof} {rvon}{grn}             ";
  936 print"{rvon}{yel}  Customer   {rvof} {rvon}{lgrn}       {lgrn}     {rvof} {rvon}{grn}    News &   ";
  938 print"{rvon}{yel}   Service   {rvof} {rvon}{lgrn}            {rvof} {rvon}{grn} Information ";
  940 print"{rvon}{yel}    Center   {rvof} {rvon}{lgrn}  The Mall  {rvof} {rvon}{grn}             ";
  960 print"{yel}{rvon}      {CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{blk}{CBM-O}{lgrn}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{blk}{CBM-O}{grn}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}{CBM-O}     ";
  965 print"{rvon}{yel}      {rvof} {wht}Use up & down arrow keys to {rvon}{grn}     ";
  970 print"{rvof}{wht}       make selection and press F1 {home}";
  972 print
  978 xy=2:poke53265,27:pokev+21,255
  980 gosub2000
  985 ifa$=""then1014
  990 ifa$<>chr$(13)then1000
  992 rem
  994 onxygoto1450,1250,1480,1280,1260,1500,1550,1270
  996 goto1085
  998 rem
 1000 rem
 1005 ifa$=chr$(17)thenxy=xy+1-8*abs(xy=8):goto1075:rem
 1010 ifa$=chr$(145)thenxy=xy-1+8*abs(xy=1):goto1075:rem
 1012 rem
 1014 gosub15000:rem
 1017 si=si+1-6*abs(si=5):poke2047,39+si:goto980
 1075 gosub17000
 1077 goto980
 1250 tl$="tlk":ta$="t":tk=132:goto1600
 1260 tl$="inf":ta$="a":tk=131:goto1600
 1270 tl$="fun":ta$="f":tk=131:goto1600
 1280 tl$="lrn":ta$="l":tk=131:goto1600
 1450 tl$="lib":ta$="o":tk=127:goto1600
 1480 tl$="c64":ta$="c":tk=131:goto1600
 1500 tl$="stp":ta$="p":tk=131:goto1600
 1550 tl$="acc":ta$="a":tk=128
 1600 poke51820,asc(ta$):fori=821to823:pokei,asc(mid$(tl$,i-820,1)):next
 1610 poke53269,0:poke53280,2:print"{clr}":gosub5000
 1620 goto1620
 2000 a=0:a$="":poke782,0:sys50480:a=peek(782):ifa=0thenreturn:rem
 2010 ifa=100thenpoke782,0:sys50480:a=peek(782):a$=chr$(a):return:rem
 2020 ifa=13thena$=chr$(13):return
 2999 return
 3000 rem
 3010 poke53269,0
 3020 sys24576:rem
 3030 ifpeek(780)<>0thentk=164:goto3050
 3040 tk=163
 3050 poke53269,127:return
 5000 poke52957,tk
 5010 ifpeek(52957)<>0then5010
 5020 return
 6000 rem
 6010 poke214,y:poke211,x:sys58732:return:rem
 7000 rem
 7010 ifpd=1then7800:rem
 7020 gosub7200:rem
 7030 jj=prof+30:rem
 7040 x=peek(jj):ifx=128then7070
 7045 ifx<10orx=35orx=42thengosub7400:goto7060:rem
 7050 forkk=1to1200:nextkk:rem
 7060 jj=jj+1:goto7040
 7070 print:print" When Q-Link answers, you will hear a"
 7080 print" high-pitched tone.  When you no longer"
 7090 print" hear the tone, press RETURN."
 7100 geta$:iflen(a$)=0thengoto7100
 7110 ifasc(a$)<>13then7100
 7199 return
 7200 rem
 7210 sid=54272
 7220 pokesid+24,15:pokesid+4,16
 7230 pokesid+11,16:pokesid+5,0:pokesid+12,0
 7240 pokesid+6,240:pokesid+13,240:pokesid+23,0
 7250 poke56579,(peek(56579)or32):poke56577,(peek(56577)and223)
 7260 forkk=1to1500:next
 7270 return
 7400 rem
 7410 rem
 7420 ifx=1orx=4orx=7orx=42thenpokesid,117:pokesid+1,77:goto7500
 7430 ifx=3orx=6orx=9orx=35thenpokesid,161:pokesid+1,94:goto7500
 7440 pokesid,152:pokesid+1,85
 7500 ifx=0orx=35orx=42thenpokesid+7,74:pokesid+8,60:goto7600
 7510 ifx<4thenpokesid+7,168:pokesid+8,44:goto7600
 7520 ifx<7thenpokesid+7,85:pokesid+8,49:goto7600
 7530 pokesid+7,150:pokesid+8,54
 7600 pokesid+4,17:pokesid+11,17:fori=1to50:next
 7610 pokesid+4,16:pokesid+11,16:fori=1to50:next
 7620 return
 7800 rem
 7805 oh=56577:hi=32:lo=255-32
 7810 poke(oh+2),(peek(oh+2)orhi):pokeoh,(peek(oh)andlo)
 7815 fori=1to2500:next:rem
 7816 if(ty=6orty=4)thenpokeoh,(peek(oh)orhi):fori=1to2000:next:rem
 7820 jj=prof+30:rem
 7825 x=peek(jj):rem
 7830 ifx=128then7850:rem
 7835 ifx<10thengosub7900
 7840 ifx>=10thenfori=1to1200:next:rem
 7845 jj=jj+1:goto7825
 7850 if(au=0or(ty<>6andty<>3andty<>4))then7070:rem
 7855 print:print:print
 7860 x=peek(56577):if(xand16)<>0then7860
 7870 return:rem
 7900 rem
 7910 xx=x:ifxx=0thenxx=10
 7915 forj=1toxx
 7920 if(ty<>6andty<>4)thenpokeoh,(peek(oh)orhi):fori=1to50:nexti:pokeoh,(peek(oh)andlo):fori=1to30:nexti
 7925 if(ty=6orty=4)thenpokeoh,(peek(oh)andlo):fori=1to50:nexti:pokeoh,(peek(oh)orhi):fori=1to30:nexti
 7930 nextj
 7935 fori=1to800:next
 7940 return
 8000 rem
 8010 jj=prof+30:rem
 8020 x=peek(jj):ifx=128thenreturn
 8030 ifx<10thenn$=n$+chr$(48+x):goto8050:rem
 8040 n$=n$+",":rem
 8050 jj=jj+1:goto8020
 9000 rem
 9010 ll=len(a$)
 9020 forvv=1toll:print#2,mid$(a$,vv,1);:forj=1to10:next:next
 9030 return
 9500 rem
 9510 ad$=""
 9520 jj=prof+13
 9530 a$=chr$(peek(jj))
 9540 ifa$<>"/"andjj<prof+30thenad$=ad$+a$:jj=jj+1:goto9530
 9550 return
 9600 rem
 9605 gosub9910
 9610 forj=1to500:next:p=1
 9615 a$=mid$("..",1,1+abs(sp=1))+chr$(13):gosub9000
 9620 r$="datapac:":tm=100:gosub10000:iftm=0then9615
 9625 j=1:gosub9699
 9630 print#2,"set ? 9:0,123:0,126:0":j=2:gosub9699
 9635 gosub9500:print#2,ad$
 9640 tm=300:r$="datapac: {$63}{$61}{$6c}{$6c} "
 9642 gosub10000:iftm=0then9690
 9645 tm=100:r$="{$63}{$6f}{$6e}{$6e}{$65}{$63}{$74}{$65}{$64}":gosub10000:iftm=0then9690
 9650 j=2:gosub9699
 9689 return
 9690 print"{clr}{down}{down}{down}{down}{down}{down}{down}{yel}         Call not connected - "
 9691 print"{down}        press RETURN{$a0}to retry."
 9692 geta$:iflen(a$)=0then9692
 9693 run
 9698 return
 9699 r$=chr$(13):fori=1toj:gosub10000:next:return
 9700 rem
 9702 gosub9910:p=1
 9710 r$="identifier":tm=150:gosub10000
 9715 a$="a":gosub9000
 9720 r$="{SHIFT-@}":tm=100:gosub10000:iftm=0then9720
 9725 gosub9500:print#2,"quantumlink"
 9730 r$="{SHIFT-@}":tm=100:gosub10000:iftm=0then9730
 9735 print#2,mid$(ad$,1,7)
 9736 r$="+":tm=100:gosub10000
 9738 print#2,mid$(ad$,8,7)
 9740 fori=1to1000:next:
 9799 return
 9800 rem
 9802 gosub9910:p=1
 9804 print#2:fori=1to500:next:print#2:i=0
 9806 gosub41400:ifi=100theni=0:print#2
 9808 i=i+1:ifb=135then5
 9810 ifr$<>"terminal="then9806
 9812 gosub41400:r$=""
 9814 print#2,"d1"
 9816 gosub41400
 9818 ifb=135then5
 9820 ifr$<>"@"then9816
 9822 gosub41400:r$=""
 9824 print#2,"set? 10:0,15:0,0:33,57:1,63:0"
 9826 gosub41400
 9828 ifb=135then5
 9830 ifr$<>"@"then9826
 9832 gosub41400:r$=" "
 9834 gosub9500:print#2,"connect "+ad$
 9836 gosub41400:ifr$<>""then9836
 9838 r$=" "
 9840 gosub41400:ifr$<>""then9840
 9842 r$=" "
 9844 gosub41400
 9846 ifb=135then5
 9848 ifr$<>""thenm$=r$:goto9844
 9850 ifright$(m$,9)="connected"thenfori=0to750:next:return
 9855 print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}         Failed Connection!":print#2,"+++";
 9860 print"{down}      Press RETURN to try again":print"{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";m$;
 9865 gosub41400:ifb=13thenrun
 9870 goto9865
 9880 rem
 9900 rem
 9905 gosub9910:goto9915rem
 9910 print"{up}{up}{up}                                       ":print"   Please wait for network connection. ":print"                                       ":print"   Connecting - ";:return
 9915 p=1:r$=chr$(63):tm=50:gosub10000
 9920 forj=1to500:next:
 9925 a$=chr$(13)+chr$(46)+chr$(13):gosub9000
 9930 r$=" : ":tm=100:gosub10000:iftm=0then9925
 9940 print#2,"{$70}{$72}{$6f}{$66}1":
 9945 forzz=1to750:next
 9950 gosub9500:print#2,ad$:
 9955 forzz=1to1250:nextzz:p=0
 9980 return
10000 rem
10010 rc=1:rl=len(r$)
10015 ifp=0thenprint"- ";
10020 get#2,a$:iflen(a$)<>0then10030
10022 tm=tm-1:iftm=0thenprint"{left}{left}+ ";:return
10024 geta$:ifa$=""then10020
10026 ifa$=chr$(135)thenrun
10028 goto10020
10030 ifp=0then10040
10032 a=asc(a$):if(a>31anda<123)thenprint"{pur}";a$;
10035 if(a<32ora>122)thenp$=chr$(28)+mid$(str$(a),2)+chr$(144):printp$;
10040 ifa$=mid$(r$,rc,1)thenrc=rc+1
10050 ifrc>rlthenreturn
10060 goto10020
15000 rem
15010 t=peek(v+45):pokev+45,peek(v+44):pokev+44,peek(v+43)
15020 pokev+43,peek(v+42):pokev+42,peek(v+41):
15030 pokev+41,peek(v+40):pokev+40,peek(v+39):pokev+39,t:
15040 return
16000 v=53248:ms$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}"
16010 pokev+39,14:pokev+40,3:pokev+41,13:pokev+42,7
16020 pokev+43,8:pokev+44,10:pokev+45,4:pokev+46,1
16060 pokev+16,0
16070 t=31:fori=2040to2047:t=t+1:pokei,t:next:
16080 pokev+23,0:pokev+29,0:pokev+28,0
16090 poke53286,0:poke53285,1
16100 poke53280,0:return
17000 rem
17010 poke53269,127
17020 poke53262,x(xy):poke53263,y(xy):poke53294,co(xy)
17030 si=si+1-6*abs(si=5):poke2047,39+si:poke53269,255
17040 return
30000 rem
30002 gosub42000:rem
30005 print"  Type commands to the modem, then":print:print"   press F1 when connection is made."
30007 print:print" "+li$+"{down}"
30010 gosub41500:poke56577,134
30030 ou$=""
30040 gosub31000
30050 ifb=133thenreturn
30070 printchr$(30);b$;
30080 ifb=20andlen(ou$)>0thenou$=left$(ou$,len(ou$)-1):goto30040
30090 ifb=13thena$=ou$+chr$(13):gosub9000:ou$="":goto30040
30100 ou$=ou$+b$:goto30040
31000 rem
31010 b=0:getb$:ifb$<>""thenb=asc(b$)
31015 poke212,0:rem
31020 get#2,a$:ifa$=""thenreturn
31030 a$=chr$(asc(a$)and127):printchr$(28);a$;
31050 goto31020
40000 rem
40001 rem
40002 rem
40010 dl=0:dd=6:dp=255:do=255
40015 rem
40020 ontygoto40100,40200,40300,40400,40500,40100,40600,50000
40100 rem
40110 goto41000
40200 rem
40210 dl=5000:dd=38:dp=223:do=223:goto41000
40300 rem
40310 dl=4000:dd=38:dp=4:do=2:goto41000
40400 rem
40410 dl=5000:goto41000
40500 rem
40510 dl=500:dd=38:dp=134:do=128:goto41000
40600 rem
40610 dl=500:dd=38:goto41000
41000 rem
41010 poke646,7:print"{clr}";:x=1:y=6:gosub6000:
41015 if(ty=7)thengosub30000:gosub41300:return
41020 if(ty=2)or(ty=5)or((ty=3orty=4orty=6)andau=1)then41060
41025 gosub43000
41030 p=int((19-len(pn$))/2)
41040 printspc(p);"{down}Dial Q-Link at "+pn$+", then":print:goto41200
41060 print"       Connecting to Q-Link ...":print:print" "+li$
41070 ifty=3thengosub41500:rem
41080 if(ty<>5)thengosub7000:return:rem
41100 rem
41110 a$="+++":gosub9000:fori=1to1000:next:gosub42000:
41115 print"{down}{down}":b=0:gosub41500:rem
41120 a$="at"+chr$(13):gosub9000:fori=1to1000:next:gosub8000:poke56577,dp
41125 a$="atd"+mid$("tp",pd+1,1)+" "+n$+chr$(13):gosub9000:poke56577,dp
41130 gosub41300:bf=0:print"
{up}{up}{up}{up}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}";
41140 gosub41400:ifb=135thenrun
41145 rem
41150 if(r$="connect")or((peek(56577)and16)=0)thenfori=0to500:next:print:print:print:return
41160 ifr$="no carrier"thenprintr$:fori=0to2000:next:run
41170 goto41140
41200 rem
41210 print"  press RETURN when carrier is present":print:print" "+li$+"{down}{down}"
41220 geta$:ifa$=""then41220
41230 ifasc(a$)<>13then41220
41240 gosub41300
41250 goto41500
41300 rem
41310 print"{up}  {yel}Connecting -":
41320 print:print"                                       ":return
41400 rem
41410 getb$:ifb$<>""thenb=asc(b$)
41420 get#2,a$:ifa$=""thenreturn
41430 a$=chr$(asc(a$)and127):ifa$=chr$(13)thenr$="":return
41440 ifasc(a$)=10thenreturn
41442 bx=4*abs(pn=1)+12*abs(pn=2):rem
41445 bf=bf+1-bx*abs(bf=bx-1):ifbf=0thenprint" -";
41450 r$=r$+a$:iflen(r$)>250thenr$="  "
41460 return
41500 rem
41510 ifty=1orty=4then41540
41520 poke56579,dd:poke56577,dp:poke56577,do:if(do=dp)then41540
41530 if(peek(56577)and16)=0then41530
41540 fori=0todl:next
41550 return
42000 rem
42010 get#2,a$:iflen(a$)>0then42010
42020 getb$:iflen(b$)>0then42020
42030 return
43000 rem
43010 i=0:pn$=""
43020 n$=chr$(peek(prof+30+i)):ifn$=chr$(128)then43080
43030 ifi=20then43080
43040 ifasc(n$)<11thenn$=chr$(asc(n$)+48)
43050 ifasc(n$)>58thenpn$="INVALID NUMBER":goto43200
43060 ifasc(n$)=58thenn$="$"
43070 pn$=pn$+n$:i=i+1:goto43020
43080 iflen(pn$)<7then43200
43090 p=4:gosub43300
43100 iflen(pn$)<9then43200
43110 p=8:gosub43300
43120 iflen(pn$)<13then43200
43130 p=12:gosub43300
43200 return
43300 rem
43310 pn$=left$(pn$,len(pn$)-p)+"-"+right$(pn$,p):return
50000 jj=prof+221:n$=""
50010 x=peek(jj):ifx=128then50050
50020 n$=n$+chr$(x)
50030 jj=jj+1
50040 goto 50010
50050 bn$="Connecting to the Internet...":poke 646,7
50060 p=int((40-len(bn$))/2)
50070 printspc(p);bn$
50080 p=int((40-len(n$))/2)
50090 printspc(p);n$:print:print" "+li$
50100 sys 3781
50110 s1=peek(4037):s2=peek(4038):sc=peek(3)
50120 print"{down}{down}"
50125 print"sc=";sc;" s=";chr$(s1);chr$(s2)
50130 return
60000 rem
60005 print"{clr}";:
60010 rem
60020 printtab(7);"{rvon}{blu}                          "
60030 printtab(7);"{rvon}{blu} {lblu}                        {blu} "
60040 printtab(7);"{rvon}{blu} {lblu} {cyn}                      {lblu} {blu} "
60050 forii=1to4
60060 printtab(7);"{rvon}{blu} {lblu} {cyn} {blk}                    {cyn} {lblu} {blu} "
60070 nextii
60080 printtab(7);"{rvon}{blu} {lblu} {cyn}                      {lblu} {blu} "
60090 printtab(7);"{rvon}{blu} {lblu}                        {blu} "
60100 printtab(7);"{rvon}{blu}                          "
60110 restore:vv=v
60120 forii=0to6:readtx,ty:pokevv,tx:pokevv+1,ty-53:vv=vv+2:next:pokev+21,127
60130 forii=1to1:print"{blk}{rvon}                                        ";:next
60170 return
62000 rem
62010 ifpeek(prof)>0andpeek(prof)<8then62030
62020 print"*** warning - modem type must now be in range 1-7 - check profile ***"
62030 return

