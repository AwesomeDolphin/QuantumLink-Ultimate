

;.\9901h1.prg ==1301==
    0 rem
   50 print"{clr}":print"{wht}";chr$(14)
  100 rem
  110 gosub1100:rem
  115 gosub1000:rem
  120 gosub2000:rem
  125 gosub1500:rem
  130 gosub3000:rem
  140 sc=c(nx)
  150 onscgoto20000,170,170,170,170,180,190
  160 rem
  170 gosub4000:goto130:rem
  180 gosub5000:goto130:rem
  190 gosub11000:goto130:rem
 1000 rem
 1010 readnm:fori=1tonm
 1015 reada$(i),d(i,1),d(i,2),d(i,3),p(i,1),p(i,2),p(i,3),in(i)
 1017 next
 1020 fori=1to6:reada$(nm+i):next
 1030 fori=1to2:reada$(nm+6+i),c(i):next
 1040 mo$(1)="Change modem speed"
 1041 mo$(2)="Change phone type (tone, pulse)"
 1042 mo$(3)="Change dial type (manual, automatic)"
 1050 d$="---------------------------------------"
 1051 bp$="{up}{up}{up}{up}{up}{yel}{rvon} {$69}nvalid phone number, please re-enter.{rvof}{wht}"
 1052 dn$="{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
 1054 bo$="{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}"
 1056 pb$="{pur}{SHIFT--}"
 1057 qq$="   {SHIFT--}                                {SHIFT--}"
 1058 co$="{red}{cyn}{grn}{yel}{orng}{lgrn}{lred}{lblu}{red}{cyn}{grn}{yel}{orng}{lgrn}{lred}{lblu}{red}{cyn}{grn}{yel}{orng}{lgrn}{lred}{lblu}{red}{cyn}{grn}{yel}{orng}{lgrn}{lred}{lblu}"
 1060 return
 1100 rem
 1102 poke56,159:poke52,159:a=40952:fori=atoa+7:readx:pokei,x:next
 1104 v=53248
 1106 pokev+39,14:pokev+40,3:pokev+41,13:pokev+42,7
 1108 pokev+43,8:pokev+44,10:pokev+45,4:pokev+16,0
 1110 t=31:fori=2040to2046:t=t+1:pokei,t:next
 1112 pokev+23,0:pokev+29,0:pokev+28,0
 1114 poke53286,0:poke53285,1:poke53269,0:sr=0
 1116 fori=0to13:readte:pokev+i,te:next
 1118 rem
 1120 sys24579
 1130 dima$(35):rem
 1132 dimmo$(3):rem
 1134 dimp(20,3):rem
 1136 dimd(20,3):rem
 1138 dimin(20):rem
 1140 poke53265,27
 1150 dimwb$(4):dimwd(4,10)
 1199 return
 1500 rem
 1501 ifpeek(4608)<>0then30000:rem
 1502 j=2:poke53280,0:poke53281,0
 1505 print"{clr}{wht}";spc(15);"{down}{down}Welcome to";mid$(dn$,1,17)
 1509 gosub10040
 1510 print"{home}";mid$(dn$,1,10);"  WHAT WOULD YOU LIKE TO DO?{down}{down}{down}{down}{yel}"
 1511 printspc(12);"{wht}^":printspc(12);"{CBM-Z}{SHIFT-*} Preview is stored on":printspc(15);"this disk.  No modem":printspc(15);"is required to see it!{up}{up}{up}{up}{up}{up}{up}{yel}"
 1515 ca$(1)="Connect to Q-Link":ca$(2)="See preview of Q-Link"
 1516 poke53269,127:sr=0
 1520 gosub1900
 1530 ifj=1thensr=1:poke53269,0:goto1700
 1600 rem
 1610 poke53265,11:poke53280,4
 1620 poke821,68:poke822,77:poke823,79:goto22030
 1700 print"{clr}{down}{down}   {wht}{CBM-A}";mid$(bo$,1,32);"{CBM-S}":printqq$
 1705 print"   {SHIFT--}   {pur}{$74}he next screen will show    {wht}{SHIFT--}":printqq$
 1710 print"   {SHIFT--}  {pur}you the current settings in   {wht}{SHIFT--}":printqq$
 1715 print"   {SHIFT--}   {pur}your access profile.  {$79}ou    {wht}{SHIFT--}":printqq$
 1720 print"   {SHIFT--}   {pur}must at least change your    {wht}{SHIFT--}":printqq$
 1725 print"   {SHIFT--} {pur}local access telephone number. {wht}{SHIFT--}":printqq$
 1730 print"   {SHIFT--} {pur}{$77}hen the settings are correct, {wht}{SHIFT--}":printqq$
 1735 print"   {SHIFT--}   {pur}select '{$73}ign on to {$71}-{$6c}ink'   {wht}{SHIFT--}":printqq$
 1740 print"   {SHIFT--}   {pur}to connect to {yel}{$71}uantum{$6c}ink{pur}.   {wht}{SHIFT--}":printqq$
 1745 print"   {CBM-Z}";mid$(bo$,1,32);"{CBM-X}"
 1750 print"{down}{down}      <{$70}ress any key to continue>"
 1760 gosub9000:
 1799 return
 1900 rem
 1905 fori=1to2
 1910 ifi<>jthenprint"    ";ca$(i);" "
 1912 ifi=jthenprint" {rvon} {SHIFT-@} ";ca$(i);" {rvof}"
 1915 next
 1920 print"{up}{up}";
 1925 gosub9000
 1930 ifk<>17andk<>145andk<>13then1925
 1935 ifk<>13thenj=3-j:goto1900
 1940 return
 1950 rem
 2000 rem
 2010 s(1)=2
 2020 s(2)=peek(4614):s(3)=peek(4609)+1:s(4)=peek(4611)+1:s(5)=peek(4613)+1:s(6)=0
 2030 s(7)=peek(4610)
 2040 i=0:ph$=""
 2050 n=peek(4638+i):ifn=128ori=20then2074
 2060 ifn<11thenn=n+48
 2062 ifn>58thenph$="None":goto2074
 2064 ifn=58thenn=36
 2070 ph$=ph$+chr$(n):i=i+1:goto2050
 2074 i=0:ur$=""
 2075 n=peek(4829+i):ifn=128orn=0ori=30then2080
 2076 ur$=ur$+chr$(n):i=i+1:goto2075
 2080 if i=0 then ur$="None":goto 2090
 2082 hp=peek(4828)*256+peek(4827)
 2083 hp$=str$(hp)
 2085 ur$=ur$+":"+right$(hp$,len(hp$)-1)
 2090 ifs(7)=0thenph$="-"+ph$:ur$="-"+ur$
 2091 ifs(7)=1thenph$="@"+ph$:ur$="@"+ur$
 2092 ifs(7)=2thenph$="+"+ph$:ur$="+"+ur$
 2093 ifs(7)=3thenph$="/"+ph$:ur$="/"+ur$
 2094 ifs(7)=4thenph$="!"+ph$:ur$="!"+ur$
 2095 iflen(ph$)>20thenph$=left$(ph$,20)
 2096 ifpeek(4608)=0thens(2)=2:s(3)=1:s(4)=1:s(5)=2:s(7)=1:ph$="None":ur$="None"
 2099 return
 3000 rem
 3010 sc=1
 3020 a1=nm+7:a2=a1+1:nx=s(1)
 3030 fori=1to3
 3040 ifp(s(2),i)=1thena2=a2+1:c(a2-a1+1)=2+i:a$(a2)=mo$(i)
 3050 nexti
 3052 ifin(s(2))=8 then goto 3057
 3055 a2=a2+1:c(a2-a1+1)=6:a$(a2)="Change access number":goto3058
 3057 a2=a2+1:c(a2-a1+1)=6:a$(a2)="Change internet addr"
 3058 a2=a2+1:c(a2-a1+1)=7:a$(a2)="Copy account information"
 3060 gosub7000:gosub6000:gosub10000
 3070 return
 4000 rem
 4010 gosub6000
 4020 ifsc=2thena1=1:a2=nm
 4025 ifsc>2thena1=1+nm+2*(sc-3):a2=a1+1
 4030 nx=s(sc):nc=nx:gosub10000
 4035 ifsc=2andnc<>nxthenfori=1to3:s(2+i)=d(s(2),i):next
 4040 return
 5000 rem
 5001 if (in(s(2))=8) then 8500
 5004 print"{clr}{down}{down}{down}{down}{down}{pur}        Current access number:"
 5005 print"       {CBM-A}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{CBM-S}"
 5006 print"       {SHIFT--}{wht} ";ph$;spc(21-len(ph$));"{pur}{SHIFT--}"
 5007 print"       {CBM-Z}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{CBM-X}"
 5012 print"{down}{down}{down}    {wht}Enter your local access number"
 5013 print"    (including the prefix character)"
 5014 print"    and press {lred}F1{wht}:{down}"
 5015 print"         {yel}--------------------":print"{down}         --------------------"
 5016 printspc(10);"{wht}(Use '{lred}${wht}' for pause)"
 5017 print"{down}    {wht}To use current access number,":print"    press {lred}F5{wht}."
 5018 print"{up}{up}{up}{up}{up}{up}         ";
 5019 tn$=""
 5020 ifkn<20thenprint"{wht}{rvon} {rvof}{left}{cyn}";:ifk=0thentn$=""
 5022 gosub9000
 5030 ifk=135thenreturn
 5035 if(kn=0)and(k=43ork=45ork=47ork=33ork=64)then5050:rem
 5036 if(kn>0)and((k>47andk<58)ork=42ork=36ork=35)then5050:rem
 5037 ifk=20andkn>0thenkn=kn-1:tn$=left$(tn$,len(tn$)-1):printk$;:goto5020:rem
 5038 ifk=13andkn>0thenph$=tn$
 5039 ifk=13thenkn=0:return
 5045 goto5020
 5050 rem
 5054 ifkn=20thenkn=kn-1:print"{left} {left}";:tn$=left$(tn$,len(tn$)-1)
 5056 kn=kn+1:tn$=tn$+k$:printk$;:goto5020
 6000 rem
 6005 sr=1:poke53269,0
 6010 ifsc>1thenprint"{clr}            ";
 6020 onscgoto6030,6040,6050,6060,6070
 6030 print:print"             CHANGE{$a0}ACCESS":goto6100
 6040 print"   MODEM{$a0}TYPES":goto6100
 6050 print"   MODEM{$a0}SPEED":goto6100
 6060 print"    PHONE{$a0}TYPE":goto6100
 6070 print"    DIAL{$a0}TYPE":goto6100
 6100 return
 7000 rem
 7005 sr=1:poke53269,0
 7010 print"{clr}{down}{pur}{CBM-A}";bo$;"{CBM-S}"
 7020 print"{SHIFT--} Current settings are:               {SHIFT--}"
 7030 print"{SHIFT--}";tab(38);"{SHIFT--}"
 7040 print"{SHIFT--} Modem:  {wht}";a$(s(2));tab(38);pb$
 7045 if (in(s(2)) = 8) then goto 8000
 7050 print"{SHIFT--} Speed:  {wht}";a$(s(3)+nm);tab(38);pb$
 7060 print"{SHIFT--} Dial:   {wht}";a$(s(5)+nm+4);tab(38);pb$
 7070 print"{SHIFT--} Phone:  {wht}";a$(s(4)+nm+2);tab(38);pb$
 7072 print"{SHIFT--}";tab(38);"{SHIFT--}"
 7075 print"{SHIFT--} Access Number: {wht}";ph$;tab(38);pb$
 7080 print"{CBM-Z}";bo$;"{CBM-X}{wht}":print:print
 7090 return
 8000 rem
 8010 print"{SHIFT--}";tab(38);"{SHIFT--}"
 8020 print"{SHIFT--}";tab(38);"{SHIFT--}"
 8030 print"{SHIFT--}";tab(38);"{SHIFT--}"
 8040 print"{SHIFT--} Internet Addr: ";tab(38);pb$
 8050 print"{SHIFT--}{wht} ";ur$;tab(38);pb$
 8060 goto 7080
 8500 rem
 8502 kn=0:tn$=""
 8504 print"{clr}{down}{down}{down}{down}{down}{pur}        Current internet addr:"
 8505 print"  {CBM-A}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{CBM-S}"
 8506 print"  {SHIFT--}{wht} ";ur$;spc(31-len(ur$));"{pur}{SHIFT--}"
 8507 print"  {CBM-Z}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{CBM-X}"
 8512 print"{down}{down}{down}    {wht}Enter your internet addr:port"
 8513 print"    (including the prefix character)"
 8514 print"    and press {lred}F1{wht}:{down}"
 8515 print"    {yel}------------------------------"
 8516 print"{down}    ------------------------------"
 8519 print"{down}    {wht}To use current internet addr,":print"    press {lred}F5{wht}."
 8520 print"{up}{up}{up}{up}{up}    ";
 8521 tn$=""
 8522 ifkn<30thenprint"{wht}{rvon} {rvof}{left}{cyn}";:ifk=0thentn$=""
 8525 gosub9000
 8530 ifk=135thenkn=0:zp=0:return
 8535 if(kn=0)and(k=43ork=45ork=47ork=33ork=64)then8550:rem
 8536 if(kn>0)and((k>44andk<59)or(k>64andk<91))then9500:rem
 8537 ifk=20andkn>0then9600:rem
 8538 ifk=13andkn>0thenur$=tn$
 8539 ifk=13thenkn=0:zp=0:return
 8545 goto8522
 8550 rem
 8554 ifkn=30thenkn=kn-1:print"{left} {left}";:tn$=left$(tn$,len(tn$)-1)
 8556 kn=kn+1:tn$=tn$+k$:printk$;:goto8522
 8999 return
 9000 rem
 9010 gosub12000:getk$:iflen(k$)=0then9010
 9020 k=asc(k$):k=k-120*abs(k=133):return
 9500 if k=58 then zp=1:goto 8550
 9530 if zp=0 then goto 8550
 9550 if (k>47andk<58) then 8550
 9560 goto 8522
 9600 if (mid$(tn$,len(tn$),1)=":")thenzp=0
 9650 kn=kn-1:tn$=left$(tn$,len(tn$)-1):printk$;:goto8522:rem
10000 rem
10005 n=a2-a1+1
10010 printd$
10020 fori=a1toa2:print"   ";a$(i):next
10030 gosub10040:goto10100
10040 printd$:print"{lred}  Cursor keys {wht}to move -- {lred}F1 {wht}to select":return
10100 gosub15000
10110 gosub16000
10200 gosub9000
10210 ifk<>17andk<>145andk<>13then10200
10220 ifk=13thens(sc)=nx:return:rem
10230 dx=1-2*abs(k=145)
10300 gosub15000
10310 gosub17000
10400 nx=nx+dx
10410 ifnx>nthennx=1
10420 ifnx=0thennx=n
10500 gosub15000
10510 gosub16000
10520 goto10200
11000 rem
11010 dv$="":kn=0
11020 print"{clr}{down}{down}{down}{down}{down}{pur}        Copy account information:"
11030 print"{down}{down}{down}      {wht}Insert current disk or image,"
11040 print"  with old data, enter device number,"
11050 print"            and press {lred}F1{wht}:{down}"
11060 print"                   {yel}--":print"{down}                   --
11080 print"{up}{up}                   ";
11090 ifkn<2thenprint"{wht}{rvon} {rvof}{left}{cyn}";:ifk=0thendv$=""
11100 gosub 9000
11110 if k=13 then 11300
11120 ifk=135thenreturn
11130 if(k>47andk<58)then11200:rem
11140 ifk=20andkn>0thenkn=kn-1:dv$=left$(dv$,len(dv$)-1):printk$;:goto11090:rem
11150 goto 11090
11200 ifkn=2thenkn=kn-1:print"{left} {left}";:dv$=left$(dv$,len(dv$)-1)
11210 kn=kn+1:dv$=dv$+k$:printk$;:goto11090
11300 print"{clr}{down}{down}{down}{down}{down}{pur}        Old account information:"
11310 dv=val(dv$):if(dv<8ordv>30)thenreturn
11315 wz=49152:poke780,dv:ws=peek(186):sys24582
11316 ifpeek(49152)=0thenreturn
11320 wa$="":fori=9to12:wa$=wa$+chr$(peek(wz+i)):nexti
11330 wc=peek(wz+50)
11340 fori=1towc:wy=51+(15*(i-1))
11350 wb$(i)="":forn=0to4
11360 wb=peek(wz+wy+n):wb$(i)=wb$(i)+chr$(int(wb/16)+48)
11365 wb$(i)=wb$(i)+chr$((wband15)+48)
11370 next n
11380 wy=wy+5:wd$(i)="":forn=0to9:wd(i,n)=peek(wz+wy+n)
11410 nextn
11420 nexti
11500 print"{down}{down}{down}    {wht}Activation code: ";
11503 fori=1to4:wk$=mid$(wa$,i,1):wk=asc(wk$)
11505 if((wk>32andwk<128)or(wk>159))thenprintwk$;:goto 11508
11507 print"[";wk;"]";
11508 nexti
11509 print
11510 for i=1 to wc
11520 print"    Account number:  ";wb$(i)
11530 print"    Screen name: "
11535 forn=0to9:poke1485+n+((i-1)*120),wd(i,n):poke55757+n+((i-1)*120),1:nextn
11540 next i
11699 poke 186,ws
11700 ca$(1)="Copy account info"
11710 ca$(2)="Cancel"
11720 print"{down}{down}{down}{yel}":j=2:gosub1900
11730 if j=2 then return
11800 fori=9to12:poke4608+i,peek(wz+i):nexti
11810 fori=50to150:poke4608+i,peek(wz+i):nexti
11850 return
12000 rem
12010 ifsr=1thenreturn
12020 v=53248:t=peek(v+45)
12030 pokev+45,peek(v+44):pokev+44,peek(v+43)
12040 pokev+43,peek(v+42):pokev+42,peek(v+41)
12050 pokev+41,peek(v+40):pokev+40,peek(v+39)
12060 pokev+39,t
12999 return
15000 rem
15010 print"{home}";mid$(dn$,1,nx+1);
15015 ifsc=1thenprintmid$(dn$,1,14);
15020 return
16000 print"{rvon}";mid$(co$,a1+nx,1);" {SHIFT-@} ";a$(a1+nx-1);" {wht}":return
16001 stop
17000 print"   ";a$(a1+nx-1);"{$a0}":return
20000 rem
20006 poke53265,11:poke53280,4:
20008 s(7)=1:rem
20010 ifleft$(ph$,1)="-"thens7=0:ph$=mid$(ph$,2):rem
20011 ifleft$(ph$,1)="@"thens7=1:ph$=mid$(ph$,2):rem
20012 ifleft$(ph$,1)="+"thens7=2:ph$=mid$(ph$,2):rem
20013 ifleft$(ph$,1)="/"thens7=3:ph$=mid$(ph$,2):rem
20014 ifleft$(ph$,1)="!"thens7=4:ph$=mid$(ph$,2):rem
20015 if in(s(2))<8 then s(7)=s7
20020 ifleft$(ur$,1)="-"thens7=0:ur$=mid$(ur$,2):rem
20021 ifleft$(ur$,1)="@"thens7=1:ur$=mid$(ur$,2):rem
20022 ifleft$(ur$,1)="+"thens7=2:ur$=mid$(ur$,2):rem
20023 ifleft$(ur$,1)="/"thens7=3:ur$=mid$(ur$,2):rem
20024 ifleft$(ur$,1)="!"thens7=4:ur$=mid$(ur$,2):rem
20025 if in(s(2))=8 then s(7)=s7
20030 fori=len(ph$)to20:ph$=ph$+chr$(128):next
20040 tn$=ph$:ph$="":fori=1to20
20042 t=asc(mid$(tn$,i,1))
20044 ift>47andt<58thent=t-48
20046 ift=36thent=10
20050 ph$=ph$+chr$(t):next
20055 ifs(7)=0thenid$="                 "
20060 ifs(7)=1thenid$="{$71}{$6c}{$69}{$6e}{$6b};{$69}{$64}={$70}{$6c}{$61}{$79}/   "
20070 ifs(7)=2thenid$="70339.87/        "
20080 ifs(7)=3thenid$="{$6c}{$69}{$6e}{$6b} {$75}{$70}{$69}{$64}={$70}{$6c}{$61}{$79}/  "
20090 ifs(7)=4thenid$="131107030003987/ "
20100 for i=1 to len(ur$):hz$=mid$(ur$,i,1)
20105 if hz$<>":" then next i
20110 yp$=right$(ur$,len(ur$)-i):ur$=left$(ur$,i-1):yp=val(yp$)
20120 yh=int(yp/256)
20130 yl=yp-(yh*256)
20150 fori=len(ur$)to30:ur$=ur$+chr$(128):next
21000 rem
21010 poke4608,in(s(2)):rem
21020 poke4609,s(3)-1:rem
21030 poke4610,s(7):rem
21040 poke4611,s(4)-1:rem
21050 poke4613,s(5)-1:rem
21060 poke4614,s(2):rem
21080 fori=1to17:poke4620+i,asc(mid$(id$,i,1)):next:rem
21090 fori=1to20:poke4637+i,asc(mid$(ph$,i,1)):next:rem
21100 fori=1to30:poke4828+i,asc(mid$(ur$,i,1)):next:rem
21110 poke 4827,yl:poke 4828,yh
22000 rem
22010 sys24576
22020 fori=821to823:pokei,77:next
22030 sys40952:stop:rem
30000 j=1:poke53280,1:poke53281,0
30005 print"{clr}{wht}";mid$(dn$,1,15)
30010 rem
30015 rem
30020 rem
30025 gosub10040
30030 print"{home}";mid$(dn$,1,10);"  WHAT WOULD YOU LIKE TO DO?{down}{yel}"
30035 ca$(1)="Change access information":
30040 ca$(2)="Revalidate Quantum disk"
30045 poke53269,127:sr=0
30050 gosub1900
30055 poke53269,0:sr=1
30060 ifj=1thenreturn
30100 rem
30105 print"{clr}{down}{down}";spc(12);"{wht}Revalidate Disk{down}{yel}"
30110 printd$:print"Call Customer Service before proceeding":printd$
30115 print"{wht}{down}  Attempting to revalidate your disk"
30120 print"  without instructions from Customer"
30125 print"  Service WILL cause severe damage"
30130 print"  and may result in a charge for disk"
30135 print"  replacement."
30140 print"{down}Do you want to go on?{down}{down}{down}{down}":gosub10040:
30145 print"{home}{yel}";mid$(dn$,1,15)
30150 ca$(1)="No":ca$(2)="Yes":j=1:gosub1900
30155 ifj=1thenj=2:goto30005
30200 rem
30205 fori=1to6:st$(i)="{$a0}":next
30210 print"{clr}";mid$(dn$,1,7);"   Enter the 6 character code given"
30215 print"   to you by Customer Service, then"
30220 print"   press {lred}F1{yel}:{down}"
30225 printspc(15);"{cyn}{CBM-A}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{CBM-S}":printspc(15);"{SHIFT--}      {SHIFT--}":printspc(15);"{CBM-Z}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{CBM-X}{down}{yel}"
30230 print"   To cancel revalidation, press {lred}F5{yel}":j=1
30235 print"{home}";mid$(dn$,1,12);spc(16);
30240 fori=1to6:printmid$("{rvon}",1,abs(i=j));st$(i);mid$("{rvof}",1,abs(i=j));
30245 next
30250 gosub9000
30255 ifk=135then30100
30260 ifk=13then30300
30265 ifk=20andj>1thenfori=6toj+1step-1:st$(i-1)=st$(i):next:j=j-1
30270 if(k>30andk<34)or(k>34andk<91)or(k>192andk<219)then30290
30275 if(k=157)thenj=j-1+6*abs(j=1):goto30235
30280 if(k=29)then30295
30285 goto30250
30290 st$(j)=k$
30295 j=j+1-6*abs(j=6):goto30235
30299 return
30300 rem
30310 a(1)=asc(st$(6)):a(2)=asc(st$(1)):a(3)=asc(st$(4)):a(4)=asc(st$(3))
30320 m$=st$(2)+st$(5)
30330 sum=a(1)+a(2)+a(3)+a(4):sum=(sum*a(2))/a(4):s%=sum:s$=right$(str$(s%),2)
30340 ifs$=m$then30360
30350 print:print"{down}{down}{down}{down}  {rvon}{yel} Invalid string, please re-enter. {yel}"
30355 fori=1to2000:next:goto30210
30360 fori=1to4
30370 ifa(i)>95thena(i)=a(i)and63
30375 ifa(i)>63thena(i)=a(i)and31
30380 poke4616+i,a(i)
30385 nexti:rem
30390 goto20000
40000 rem
40020 data  120,169,52,133,1,169,23,133
40022 data  114,83,138,85,156,85,174,85
40024 data  192,85,210,85,228,85
40030 data  18
40040 data  "Commodore 1670 - modem/1200",        2 , 1 , 2 ,   0 , 1 , 0,   5
40050 data  "Commodore 1660 - modem/300" ,        1 , 1 , 2 ,   0 , 1 , 0,   2
40060 data  "Commodore 1650 - Automodem",      1 , 2 , 2 ,   0 , 0 , 1,   6
40070 data  "Commodore 1600 - Vicmodem",       1 , 2 , 1 ,   0 , 0 , 0,   1
40080 data  "Taihaho TH-002 (Protecto)", 1 , 2 , 2 ,   0 , 0 , 1,   6
40090 data  "Hesmodem II",                  1 , 2 , 2 ,   0 , 0 , 1,   4
40100 data  "Master Modem",                    1 , 2 , 2 ,   0 , 0 , 1,   6
40110 data  "Mitey Mo",                        1 , 2 , 2 ,   0 , 0 , 1,   3
40120 data  "Westridge",                          1 , 2 , 2 ,   0 , 0 , 1,   4
40130 data  "Tele-Learning",                   1 , 2 , 2 ,   0 , 0 , 1,   4
40140 data  "Microbits MPP-1064",        1 , 2 , 2 ,   0 , 0 , 1,   6
40150 data  "Volksmodem 6420",                    1 , 2 , 2 ,   0 , 0 , 0,   2
40160 data  "HES 1",                        1 , 2 , 1 ,   0 , 0 , 0,   1
40170 data  "HES 2A",                    1 , 2 , 2 ,   0 , 0 , 1,   3
40180 data  "Other manual dial modems",           1 , 2 , 1 ,   1 , 1 , 0,   1
40190 data  "Hayes or Hayes-compatible",       2 , 1 , 2 ,   1 , 1 , 0,   5
40200 data  "Other command driven modems",        2 , 1 , 2 ,   1 , 1 , 0,   7
40205 data "Ultimate Ethernet", 1,1,1,0,0,0,8
40210 rem
40220 data  "300 Baud"
40230 data  "1200 Baud"
40240 data  "Tone"
40250 data  "Pulse"
40260 data  "Manual"
40270 data  "Automatic"
40280 data  "SIGN ON TO Q-LINK",1
40290 data  "Change modem type",2

