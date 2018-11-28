Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8A7A25299E
	for <meta-arago@arago-project.org>;
	Wed, 28 Nov 2018 23:05:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wASN5KZ8070846
	for <meta-arago@arago-project.org>; Wed, 28 Nov 2018 17:05:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543446320;
	bh=a8Li06Wkm83DfrA6bzdbswpP4JyMc7wLBWLP/HGd90Y=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=YqxqyIJmfJCBux76mChyHTnEmwZaC+Vm8kzGyBx49Ql/9Ir8w0JG+i9Ej8qKzySJt
	qYu7vM7ABEqcAPIl33I2twezd3dunws5Acno8FRqYuBWS2IwEZ6WChLm2ySqhzBF+S
	S+7hEZX9E1oOiXwV6MfRHwhOUKsjdmXHDaVxr+uY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wASN5KEp117037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 28 Nov 2018 17:05:20 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 28 Nov 2018 17:05:20 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1591.008; Wed, 28 Nov 2018 17:05:20 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Agrawal, Manisha" <manisha.agrawal@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago][matrix-gui-v2-apps][PATCH v1] hmi_apps : hmi_mmwave
	: Add matrix icon for mmwave Gesture controlled HMI
Thread-Index: AQHUh21SzQxy+0z6WkCtPQFHyikPJaVlziHQ
Date: Wed, 28 Nov 2018 23:05:20 +0000
Message-ID: <979171e59d984e61a5c3f67ba71550b4@ti.com>
References: <20181128225427.15222-1-manisha.agrawal@ti.com>
In-Reply-To: <20181128225427.15222-1-manisha.agrawal@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.79]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [matrix-gui-v2-apps][PATCH v1] hmi_apps : hmi_mmwave : Add matrix icon for mmwave Gesture controlled HMI
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2018 23:05:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Agrawal, Manisha
> Sent: Wednesday, November 28, 2018 5:54 PM
> To: meta-arago@arago-project.org
> Cc: Gou, Hongmei; Agrawal, Manisha
> Subject: [meta-arago][matrix-gui-v2-apps][PATCH v1] hmi_apps :
> hmi_mmwave : Add matrix icon for mmwave Gesture controlled HMI
>=20
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  hmi_apps/hmi_mmwave/desc_hmi_mmwave.html |   8 ++++++++
>  hmi_apps/hmi_mmwave/hmi_mmwave.desktop   |  12 ++++++++++++
>  hmi_apps/hmi_mmwave/runHmiMmWave.sh      |   9 +++++++++
>  images/mmwavegesture-hmi-icon.png        | Bin 0 -> 14546 bytes
>  4 files changed, 29 insertions(+)
>  create mode 100644 hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
>  create mode 100644 hmi_apps/hmi_mmwave/hmi_mmwave.desktop
>  create mode 100755 hmi_apps/hmi_mmwave/runHmiMmWave.sh
>  create mode 100755 images/mmwavegesture-hmi-icon.png
>=20
> diff --git a/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
> b/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
> new file mode 100644
> index 0000000..b8608e2
> --- /dev/null
> +++ b/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
> @@ -0,0 +1,8 @@
> +<h1> mmWave Gesture Controlled HMI Example </h1>
> +
> +<p> This example demonstrates HMI control using gesture from mmWave
> IWRxxxx sensor. </p>
> +<p> mmWave sensor IWRxxxx reads and processes motion and gesture
> data and reports the gesture to the Sitara device over the Serial port. <=
/p>
> +<p> Sitara device parses the gesture and  control the HMI. </p>
> +
> +</p>
> +
> diff --git a/hmi_apps/hmi_mmwave/hmi_mmwave.desktop
> b/hmi_apps/hmi_mmwave/hmi_mmwave.desktop
> new file mode 100644
> index 0000000..f77f644
> --- /dev/null
> +++ b/hmi_apps/hmi_mmwave/hmi_mmwave.desktop
> @@ -0,0 +1,12 @@
> +#!/usr/bin/env xdg-open
> +
> +[Desktop Entry]
> +Name=3DMmWave Gesture Controlled HMI
> +GenericName=3DDemo App
> +Icon=3D/usr/share/matrix-gui-2.0/apps/images/mmwavegesture-hmi-
> icon.png
> +Exec=3D/usr/bin/runHmiMmWave.sh
> +Type=3DApplication
> +ProgramType=3Dgui
> +Categories=3Dhmi
> +X-MATRIX-Lock=3Dhmi_mmwave_lock
> +X-MATRIX-Description=3D/usr/share/matrix-gui-
> 2.0/apps/hmi_mmwave/desc_hmi_mmwave.html
> diff --git a/hmi_apps/hmi_mmwave/runHmiMmWave.sh
> b/hmi_apps/hmi_mmwave/runHmiMmWave.sh
> new file mode 100755
> index 0000000..a37fc74
> --- /dev/null
> +++ b/hmi_apps/hmi_mmwave/runHmiMmWave.sh
> @@ -0,0 +1,9 @@
> +#!/bin/bash
> +
> +/etc/init.d/weston stop
> +sleep 1
> +
> +mmwavegesture -platform eglfs

Can you please confirm that the binary "mmwavegesture" has been included in=
 the filesystem?
We cannot commit this patch until "mmwavegesture" is installed on the files=
ystem.

> +
> +/etc/init.d/weston start
> +sleep 1
> diff --git a/images/mmwavegesture-hmi-icon.png
> b/images/mmwavegesture-hmi-icon.png
> new file mode 100755
> index
> 0000000000000000000000000000000000000000..db145af552f7038181d46b0e2
> 4a22a3b62085b66
> GIT binary patch
> literal 14546
> zcmV;@I4#GCP)<h;3K|Lk000e1NJLTq003kF003kN1^@s6aN?Cz00001b5ch_0z
> klh
> z#Q*>R32;bRa{vGr5&!@f5&>tQ(oz5b02y>eSaefwW^{L9a%BKbX=3D8G4b8lvJA
> Wvpy
> zX=3D7!7?KN=3D#060=3DfL_t(|+P$53cob)r?z>w#fQSMK6c7S|$Vg;F&LBXbgmP%*oH
> I%Y
> zNhATr#u$fjwlQFWZIZ#p#u(c;dp!1xz3XRo=3Dg!P?XYS6<&b>3w1i$y3uc}(r)zvM
> @
> z<J~`AN};<|b$<1p^PTVex-
> kG}OtPFLU2z7!cA=3DvyAKTm84Xkg!J>~w(udhUYdhcTW
> zt!w9Ay>$M}zn**P%>O-
> q_6*LQd6D#je3W!vPcP~H`~{T;`u&e3N3Z?jfa<?q(u@6i
> z>4oR;?2}La<;llR|LVD)Jp9J17a#AucjwHCZ|~n2ro<6|Ns6(Ew;X#I6&dUUfk^^!
> zX2kn<&g^>a@(a&iI(P2dSI(dR!?|al{qr-YANkwqV@JP#=3D-
> >f7*xMuY(1Bi|lPvnV
> z(4m8PSk|dShj8lfAv|*Uu%siBPAlp=3DVx>pbI(h_;{S)HnKia3S(|xLQI3k~$IL|}U
> zIg4|b^e|l$>*Rq0()ITCTCQKjpttw?Q-=3D@#{gI<b|8lag?>`Ui@A|jCp0-QRJa!=3DK
> z{+&~P9Q1xLj)9mIAPUVpZ#=3Dc~%rlRld;aNXe)rN-
> PyhYVzN6@<tVCII3UYSrK*p9W
> zNZ+&xX{3zJn~_P%qMv1N-
> AdX9^EOg+G;+3Y7s{pQ<dO1s?nFUMj8NgOT`1bUTT*N+
> zid8C!i|bc>JW6Gi#V4RFVF1x%N>$I{=3DUZMYmKAGJG5u{;5uFR4PoaEn1$3VIe9
> m<4
> ztX#g9ZPIl~*SJ+&FJE^C#UNdd17C9y{hd0q8C|ut=3DxJ{LzOJ<VKZ>$bZtri(->uy2
> z5(FC{$`2(V(gVMCd+PL|($fzf|N7}iAN&4+{oSZYO+)gA4TxL00<lq1h$F?XT!{oy
> z;;L2HvwAg>)~pdqS-
> Tb~>((K4{d%Oa=3Dy~ZIHwy8IXOgn$#IsozfLkSiq#Q+bVY!Mp
> zAaY>xwo70gYI}bmEmB@<8*7`8_&fZ!`5gFMNPKQtn^<(Nbk3{{z6SYvQu*3Q
> e4WXB
> z&2;U1C<ckLI41EcR)}LVJuWY17wYr!QInsK_^n%iwPkJ8{-
> 54B=3DGza&4iM=3D9H@x?^
> zHFO_8bl`W7^c_P(egXE-
> i|$;y1TjmOB9{J8JpWNTi9|Y?J#<n@^n3opDSWbY;uZk%
> z9V6Vs7s_{(I`DkQse;W85-
> y@UQ&GMmx?}T|J6EMbS=3Dz5{#I97o9y`?nPx|}9$to9^
> z<r_tTq&Pvifv%6QldqSro3B5a0dYJiE(sK)IEq#5^5sH%)~rP#IkSvz>}@Mo{V6;o
> z=3D;>oUbwR4yq6T8gYpyk=3D`Q7`PoBwpUtpkOLiP%99q8BZ~E_%^8b_9V?OAks4
> pD3TO
> z%EoFa;v(7hvT{^uEk^}L3&#qQ29Wk^A^EXZ&sSbsxd{{)^37qklajPBQgvV?k@i
> qL
> z5;-<})5>BnyC{xv6hpq=3Dyxp-
> _I%DSFd_3Hr?WxNhuZCh!V6X~vlS?ZL3Vz>NTZbI7
> zS@fcX5)4XD><r-!wj=3D!!txH$}2#Zft10`JrB~x}vmI@5#U9$#^7LGkY1Ig+&1_B|&
> z$Z`O~#u+3v3`HVVBnHAMo}qA-
> ;dms|>xBA_`>ThC+cA87#nl2tfzjHO8<iZh^XK)2
> z#mLzegKY~JV*BF7h*`D_F+`T3?B*9%0Z~Iql<yF6g0f50P!tI;e4(loCZqu~SU>}b
> z2OrwkP#`!2@lU`|J3|rI-Q5(&odkr%v58)|2%}tGfA8(-
> o~>{Y|J=3DB7%6m;@<jdKV
> z<MQL;v17>+Y+bNGda?{eff6f2QNUQzmy)`a^reBK2E$O&6}PCtP*BtoL872#D}
> X4N
> zYUK<;YRKwz$x`1KRv=3DWPCj~~zU|`5aT?=3DCu$CAW1I)BdtfXJXAn2d%`0s_WPu
> >eVp
> zS+jH5jM@LkOlc~XUTkaR0`a8n1ZIZ@%5GKqvIk|43W{B~$WYX^B~v3CKr$S)t
> Uzhp
> zHCPB15Tpz}5OU2(8Kg5TX-
> Wmd0)*qqai#cjvELFAfpPBce{*(qZWTbT9NXj^I)2Ox
> zn-?zpN8-
> Bmh^7Z_rF0cdPf~#N8Y0nSh(I@KKdFnf&oE!8(=3DZPmhPh}bwUJs4bI?L+
> z7MhJFQiISe)XAzb%tSS*$}j_!qzY2GAsl6-
> Qp0qVkcvo!hG{4u<&km?VaOq68>S+Q
> zlxdiP3{pBN%@B%IQnFz(l1O_DAxI#_8zv!+6ieD=3D2u2KPham{tNztTjhCpm3Z81
> #5
> zCc^}5H27mZX`R6jYe=3DgN<FSgglC;7w4pF3K245^CEisJ6BGN+A0>c<Yk|GSFF`q
> Qo
> zFbZ=3D>vq>`zBW+-?wo`2u-
> &4G2kN1PgVEEL}Z{!5SqNxG%#<;kA#{k#~3}YKTn88HL
> zE*T7jy%rF&(I|@{)C&kRQR@H#11K?0N3jY*z5pRXF#nSfcG^G)z-
> ASM4FZBc)*2at
> zp92WKSS*7W2*M0fIBB|JgaD$3p*V!0Fpw2tVHj>Q{lVSYIn&_n?%o_UY}kKol
> L2gw
> zjFcRr0-``*^+T9z1)<3(L!e{5>;#6Obwj@sBoM{I4b~8HWeC{<!c+kvLj@tl0%0-|
> zWe^I4-2`BlfY9#-1;Q2?#6|+KLAb#WYi-;hL0B$>P(xT~fiOlum`73|%u<112-8Sm
> z1|Li%sbMG}qB+JS{(jTkx$yV&{C`G+;jF>gV7M`T%$Pqj1lA_XY0B3M5WSS7c0+
> @e
> z8wO5E3WOh;k`f1%k^*(zproX=3DIw@(n$_<OvDaqLHhIz6Zv=3DG7xfC7RcOd*9Dh
> GR0x
> z5fE-
> GxQ<L2J^F8yw!SfV8Vvt7bKJPUZy{%Fp^=3Dpuhyq2MlA3H%lC>LbA%xr1g&&@
> h
> ztlgkaN!zXJg5m~$Yd07r5bBh)T$7UY>w?-
> 1wh$CIC=3DfzOlMKTUOi~weHIS_obLBW|
> z!i4Y19RFqTG8q0c+s{v=3DDh8q)6(C$s7(|oG4Fjd5av4IYPD;wxNlE=3D6l$0ca*rVeH
> z`zfg(LcbgQbPDu1D>rCU(gM3FX{41KBnZ}SkRS{f5LiJ5Zv>L`U~J<UQ>>Nayx`#P
> zT@8l6GZ4(4FhMwjVJJs6l*U1%q%xb7q(4fsbwlW&3iNKfqoe@UC~1O7N$V{s
> $+kc*
> zA7GR;PgS4?o02A}+@L@RFnD2t!4v)l54$idqL|MQ34yE82n&#n^XCf~3J^6EJv
> UT1
> zDA0vE1=3D?OpN*QEI+F>(PRotMAl5E|uLRFxb4p5-yTGfXBQIg_@X>v+p5R)}-
> 2qGyE
> zCK7}R1c5>L8Qd|BWDf?{4&@l30HGR!S^oYOAj(k<#o7)15K46*C@D$5Kud052
> =3D-D^
> ztelec3iK8`1zM>KdMRnCPD;`%(6fi&25m~3sB!~C7%zkHC5<(@S;0_%Fa))%flv+
> E
> zFmIlKp&Zpv?72Z*plwsqREKUz9JCvxl(bn+N!sD+DhCC6pp>MBU|k!O0_|f{pl#
> hC
> zfv|#La1$WLkVYF^b)CW5OmSvyAw^7@)St3u5|H&Y7G@ZV)KKiDByEAtQuPd
> u3beLo
> zh>;=3DK7U&7W4I5Midho;5emBhj0kuIdB?an0(1I9akRXgAjU<g=3DAUe)q5Su8@n
> @L+p
> z^Miw}fvlS|M}Sa+QJ@sral?<<Gi<df(5jxnD5WKP5SBPhNuzZ-
> X#2xe>y$KX;FP2T
> zK?30dAJTA=3DJs8{&GLX%5oM#1O{CEL`VJK2V(eI$GA*AVyk`jhcpf{;H=3DyeV|=3Dz*
> s(
> z^oFYpK>-nFDbT|Qos#_YQj(1u`XLN6IK!LdMbd>K15soF!Zl<D0a-
> hHwt%7rqd>_~
> zr6k(|ZR>_OP0yemuIly-
> <bZWX{gf0nfEyg8r0F6R4WppDQ=3Dnbw=3DxwPDLoU#EQc^zz
> zYY?77PP)!uZKPN$nimwL0WxbA))5p1j2g;7!_}b`=3Dm1O4U@6cdC5_kZpqC9{W
> _6bA
> zgfI#$0|=3D&IO{M_P_9n<v<|1av8iad|qr2Zz<A#1G=3DoV-
> J!A+Br`ayWBASfU_2n5UB
> zV6qf%EsPBmYjGsaRe*5H3LiHPYi7<AFxC(lEtG+VtJafxgD=3Dq9;i|n!y#+dMP$0~
> Z
> z0ZgXgF$C@x7K{qQhM5bHvS|m(GIP*URf~?M7W8!PLvCU!1>H?Ruue%HLw1
> 9^!3bxH
> zAG<(tg9O0|ZUn-W<YF}0q$mZ3qV=3DS?fq~XQRud40p=3DhnjE%plZZrv&F{+?lr-
> AO(B
> zQ{0O!!&Uv1G?M~8jqdtT3fdG3;!Ky(Smrkc+ascoy(1pgc}3V;TQ30Yt#3qqc@--
> 1
> zi%??D6RIn(#8huz3cQO=3DO7fK<j8VB^gr+vQQoNjHjrI1y%qd|40s~MWxEdu8E
> N6nI
> z3xhL~N^{geru+J0)r=3DVeiW-
> ap#ePcCn@>`D27l|6WT%5xQqlrSH}fckL{iWf*mTgN
> z$qB;=3Dgg54U((44zMBK7<D2Pu%eNh?O>l)GC*o@|yI@FYuqb#=3Do#o4(i&dL?X
> B2u9_
> z7X_sH%4*CU7f1m&2@pdm&~6mm)ytxgnwSLNQKONQnT>-74r1-fRWMK-
> )eu-tBohPC
> zz*tYQWv%6`Bx_DUfHjbn;o$;?0!9r*>jrgQaM(fXOzJ6aSS)J5a0<3J1%D(~`b@%
> (
> zu!UIc?nmipq}3GnGy=3D7BYzWHI%xEgBLVJA^+DMHRHK-~mL8&=3Dk0-
> zSTp~x(OP*jke
> zgNB+~L{6SYfi?`7lGL@qg&sd~%s8|(x1g=3DH4e7}#sIII+9lc(5W|jb=3DhF}yjh@Wrb
> z!mXqy*%1t34aHhH&Yn22AIP+^W3h7jbOD8Bfg*#kKU}qT!#W2Yv^pg%BpAy
> *CSd3E
> zMaW*i12yTnXe+NpPg@64*KDJj;Azz}gizp8Hf$FzsGyWonw>{?e~!fgN;+Z{Q{c
> 5A
> z6y=3D)<NNp{a&xrsJX7md**8!tQO-^z^6^-
> ^Dj+UlobWttZuy!5NQd7~>(}P6|7m44i
> zA*iL)2`vn@Y=3DEqoHch}-
> A%kHk3Ych1^A?~}p#81Z8MHlvwu4?kFd~ejP?3~{{Y|ZC
> ztExvsaXBh;3sIF{jN+sW8mjuplBT$W2uR|Zts)%>0NHsO2zhoP6y)@afz(ykV8g
> PN
> zlzt540+Tp$Jut~f9u<vr_d<a0c+3i$julImA!gflWTj_d#j@pCx@a-tVq@X%;tDSh
> zPXq-
> 9*#J;vlp!&UbviIsb5<g)A@KyS1xVPKF^D1{3`3C`%2o>me+z_lMlFN^I%s*-
> zZ62kdNGD%ZX5<M7<rLg97NwmE`o4m`p5^LG1$&sKgPuTl?v{w<RFJDIj*uYa=3D
> |a$g
> zP+;U`n^99yiI^?hM6gD=3Dc_J)m5*E&(26)XnB*w-gj~-
> W5UV*0i2JEHu#3`zwp#e2D
> zHR#;858)IidjR@DNNLMSt|b-_G7JU8DvI-J7JWTS3uJj%n1G@Nqd?g-
> $Vol>YtTvu
> zE%gjDDag6I_Mp13M1UwKmC33pEJXwjTZ1TVDIK&wrIh8Nv&0BVDbRy~pny
> =3DsK*~$Y
> z5Vvy|r5_)Z6_;Rdixl*x#wJk@DhNh#Q8DuK@{mK%$<EFe%FN0_b#*m%?b>
> D64GIJW
> zgo`}t(z=3D2{2vMw8llbeI{{9*uQ>O|jS}+X7)(zu^JgKK%gXZCC(%P-4<q?q#g6l#F
> z1-
> rJi0?UHKMXwMfchG(WWVUZ0DvC;wn~{Y)8r`sRshH+dknI7mfFR|{;$SDn#$gq
> u
> zqNavM@v|Iy4VF18+X6t5*=3D!c#uglBJk(88VlaefM;8B(`^p(Xui9Hx<S%7eHn>w
> 0`
> z?35`2#xfa<8p=3DRZ+>0EnLF>(|PNHB(Q{PZW!7ou2Wll$RWtCVzXE6;)oh|c8<0)l
> L
> zFnOV>xD*{Nt)ju(-_eN{3TR0|Aq_vX970g5AU_`&scG1-W-
> Tf!Dg=3DZaIp~hWKuStV
> zkd>8Xfnjli285do!b3ESPF5*O4Pzz6S<wtXKWiY%2nfSaq=3DphTgf-~7cGjSk0?iY9
> zK{Wnf5i(0E(q`*XQcY<&cC1`a!%?GU8pDUqac$&coaj4-V~3C6P*1N=3D-
> @!vdO?CAG
> zN-o{yc@AK(^2kMeTotu~fK*z!U?3ocg@r<{PR?QwU=3DM-
> <!b=3D`D+XJzJ;;cvjVdr_t
> zK$a4ar3w`J$S@epU{>Aixgktv)h&PmJ$G~vDhrA&1zH)dmQz|v+D<uMZrp~^`
> 7NI{
> zA1##Q*%jTgJG$CCg!ucT1gULrt8}*$6nij4TB6_<6&7Ln(xoUXD;pA!JaQMOEgv
> s$
> z0YuLY%6yj6!*D-
> i1w;*k;v6L_eEfJ7kWr(sWb$Mz2@MrmriMdWIN&BR>z#Vi3@cA-
> zdl7(PHdEX@j}+=3DQ3Ps#Y<mOuy=3D92tEWGAP=3Dm%8T>bb*1xMxmMtE!T%uf^
> uMgw*-W=3D
> zk3~>ANr%ZPJSyTQ%?5-funb};0pYuSFfbJ5<>sP>3j6p`V?>XlK=3D4#eEJ_fZMNh-
> M
> z4fi+#hLWE6MrR1}aXH1CHQfeCNQi*3n8C<EmeP}0_6qb25&Yrgg5hFfk7rhc>B
> uQ5
> z)Hob-Mg(B8X@n@uL8>Wkp3w87I+7WmBx-;%t-
> (Prq|r@bP97$B_=3DpqSwq`wQtE!Pr
> zeL!Pv9S(H&NFX#)pw!S~vobQp2+7`^UO}}ZDk@5RpOcg05CX##V6!E-
> ^^_hbPY4t}
> zi!}tPyB{tfxQK?6X8?F6U?taL2B5&;o1G=3DYSWYo_41|tLRZ#Tzt&YG96aCC{9A<ls
> z$EI0}uwdLIq;1=3Dcn5eagTf13I@NHkV#;QOoQ{1DdM#OH8MmY^Vtwu>XQrZd`
> GakcD
> zE&@(rUcR{Vt0?F95)cl)9*}*MzIv&)<PlVRsYn5`di83gQm36yX-E%3j-8a(Nd3ti
> zY8V-
> a+6^OgK=3D7J6&y_`SJ(hup!4t=3Do;w;3mrsK46<NAS2As~wx2>n7iD(Q=3D%^sl<9
> zM@sI9i`syiqEck+h(l{b6Y}<?p}M$COmF0;W}>pB6j=3D$$!VNsLs-9it+OT2i3RF<~
> z;QoLmjgY8$tE|GbfJvC-
> >n}z^%8;~_;4zSW?W%OuA*qADZf|c#Pj4@pnwpT2k)aEN
> zM@gKrHgDRD#DoNqwgfzj%$8xWp7yrv#k{Z?B6vP}5ah{92H`7Ts~QHoVwns<
> Eo&en
> zM`H1$Ndm?q`6!^sV6<z{T%ZH!5AIq)>4ciK!qhC3<m3wo1?gF$NSpVhP(3I>0r
> d-k
> zZa#E^F7g_KbkYoDc5o<~8ynF;sfZ{2Y6(PXVKEAF^DxT88;j>fSb(sKsJ?V}?H6uf
> zbr67d9r64UyM%+EZO*o&rd+B4x%Bh8`g&|!zX9uM=3D*#emi;6_U$W37tokLA
> ^4eI!u
> z=3Dy8oSv~H%yaD8I%WpsXHJ-
> o;jP6C7kK?b3MFkak%QZ`UrVFiL?Oj;^yny;@l5C)-^
> z8j9W;G<VOdrp-r9Sq1Wv(?t)FPcZV*GEqbU%}m&Xe7dW-
> NKf;fNOzNw?j{pmh*4;y
> zD0<F_44;L?bLL~l<WS5C4a2sLn-RTf3&#44#D>*tP)32WG;jRA?|u8w-
> A#pk|9)}g
> z;P;X%SO*Rq5IT137&<#UQCnM!dI~B7;IFG|YEV^GB}PgCe*PHd=3D>;=3D2n%uE-
> sx(vW
> zNl#8ia(p7<V<`1*jmEZh8?kZ4YOGzd94jLhVWRg)F$XqUUN^CY;4UCc5DQ>lB2
> {Z$
> zA<6^ASgkNMkWd1$FgRF%P>u=3D|mflW1?xg3A3q}o3XJnaCnp=3DQ!x_fd{(&<jG
> MtyTP
> z1)vG_G%A@jF@#1W21Koj#?Is-
> j2|&h%(im=3Dbym%)vMZ{oPVkKC(#VC_xON>%ii_o(
> zZWecZMP-
> Emv5&xXbVzBcwY3#3EiK}1X8?`lI<6C8Q^OEK*AX~zBK#>Oj2$%^qlWpw
> z)7e%0U7k`GlZ;MoVzk67fNo+qYb`f1>1Yt=3D%p<?CcHF=3D_7P(IHC^AqU$Z)*0u23
> K>
> zrdTf_@iA=3DdSZg2)f`SAL<){V|tg|D-pH5<;lPA(+6A-&;8#XS9LPGRT%nY1_f`SS>
> z_1pzK@{=3D>zvS|mroLmq{@VZYtjb~qa1=3D*!7@N{ye3p8n#K24Z4EgUl_kiMhG
> U^{;z
> z0;Lmm9S~_qp4Q;6Gcz-
> VxMnEg@3}S%^YFBqZ*r1nba|mk=3D^3P9tBJmL5=3DDAA$!=3D}X
> zKp1avg9Ji?;BAT5B>6_RafJ+F5g#euEC%AH0GT{ugcXnlG7tqyknX-
> !4|&PcMaV~_
> zBI$y6>`cLP&pd~pJn<A_lk!C{7A{<aC!Rio(<dLo!#{Zu^CDM@=3D?Co^v^sz>J9pX
> u
> z8B`NTsj`|<)7+V}#Oqi$Z;pC~eh8!F+8{x&2GO6AJVji11Dyh5lGx!QrFKs7oa(i%
> z5HKjti{!5v$kZ`oB!_tON|>7)W>U94m)iFTvNyjoQ~;74GSR`l)zPX8;EUlGjg8B|
> zg|lbz_1&vDf955)IJqNi)>1tF)bsf8=3D4HHd<25AZR!PgAycncegXTFR{@v!yn^8<D
> zYp@`c;VRdgN-
> EGirEXAdLeO^5{lisP3y6LvI7&%gRw*f1hQJCHAf%c*O&$!10h3A$
> zVqst)7Levon1I<-KLWhHMG7_WXlE?RpA_KijLDv!m`*8dHs#!T^k4?#r-
> 7i|k>Mj-
> zo$ofDQdquXGv0suHt^j?_|xa_;Brqj9&Red?HgBtZ$HHMKYJV3FJ3?hy?%c>k!
> DRz
> zs#UiYD^{Siv~*wyI>S>QA}8#Q6&ER`CnvEQILsz3xzIJZh-*<&lCM#ll04;<<Yj4c
> zZQUS22$L7qM4u+N3yb9&dm+V=3DZ+O1(XHcs#g&+jEx?+OKMCTyYD*?n;2I5B
> =3DFMmCe
> z9>fn0r6&!vEyl-0-
> #fdDqnpu4g)|&5ym%IWynhqFy?q70c&G)xe6SL~dH*K<_{p32
> z-R%qb?R#(F%O^Wgx@$SSJ>7NJ7-
> r6#DMm!vCQseCaqxM<P^&^3a%ZHZioDDqe5{%`
> zH3%u?jwVPW>1NQ@1+5#@5JKgY6ehbNTm^!Ax7l(-J&yp)q#6-
> 6oCZejTzj41Z!}tB
> zJ%N{p^?+!l02-|Vq23lF>~C~N!me1+JD91P&ZePbCJld&oH&hJuUx=3DS-
> @1v9k2T}V
> zhF$pV`N#3=3DcV5Bo-
> non~uUx{XM{4lfr|a<k!&RtA*@{5_u~N?W^v0}NvoM}q$|=3Djz
> zOK3W1?%sK$!Jz{Oaez8>ZW>t!>1&>1$xcnjlG*dAcPK(Jb^Jv+(h6gdqU;<opT;
> Vs
> zK5Bi$5{iYhRe{!m2(@y<2pc!dk|78X@=3D`<q-
> P{boPmZY~|Dgg=3DpxExnP<CT*p)?^m
> zA(4isB`Bb~lJCqs3S4<rJsx@LEKWXk4qH~OfH`V9F7L0$Z$G??|Ml)we0=3D#F?zLs
> %
> zep?3q<&j$a{&F9Fe(o?Ht4l#uUOKAln=3Do(gd?Y1OKSQwfW^WltD|OBcWB<M`
> bj#`?
> z@icv1MHO<=3DGsIk2c}WQ>N=3Dk()OUi_*N?GNoE-
> ObZ4Yxa}`HP%5MGWa3r6i>`^h4-(
> z!(15xPr^nT$B0Q;JqZ3k6o|h(MWAep@zU&D<(k38lYuBRt5VO9iIS=3DYG_-
> bM3JqiV
> z&i5TP90!`4@X_nH@Y$&j+;85B_u7;3VP_6LKU|8R|D*-
> ~c4j|*_1bB?^7s*CB=3D12~
> z)GBgFK2lOMY^K&32(S9_3@}f{?^o2(i9@{y&_F;^V&hRtBeeovoXWOVp)9d1o
> M{&O
> zx^^yIOM!E?q@*bt2zqXqE4zW0BO>MHiG}iV1@9~HA0WO%24W4Oe-
> Xxw#DR{aJGr#P
> zw)kdcW>7y+fR!s(TGfW>Q$kS|y#jZd;_zYPcD&b_LSQm+uQd%H94^LBUpRu
> _zWF?U
> ze)$w$IaY`3PoKci_C|WWY$0V4ic@4A-Tj9sJ$1<-
> czuL*_~1d*6qjMw`pv=3Dx0)RZl
> z&*`eztl7CjP#P<1khDIU>V~T&B~8<TFk6$7BITutg))f60)({3fEV_DbccA#^Zt7K
> zRyn|v0)y=3DK3*4aXq<%uLXwR4wh^u?E@UxEHxYxK9clIXXR>K~=3D)02;%z5EFN<
> >Ev5
> z_K9lz{>>-
> w=3Dlkby_oWAgGqN(ICEHx;H>xPz@amx&Mt8?P9O*rXCJOMjs5N3eg`J><
> zU=3Dgq9XXT>4tP(jfiIk>1WH*eoDbW2XsoxFCGWKG5X`4Yr$@>m?>04Vn^lFI}k
> a034
> zdvcdSxT-
> )XJ%bqMyL(VGmSveyRRiG(y_A#`%%Uc3`m|}76cmh!<NYjMw2!9;^42fF
> zvDn#ott1NXcc$Z3T`X?5rQw}!Gbt0FKHh}yu0M(YeCuhv^V~5hU1ekoC}l;(I7kjr
> zK=3DhEh+dI)mKw4_*v1Q3hv2jAXp-w;`mC9R?_*h$9j?&~Tu~U-
> QdK3`qloVk}Nn>OP
> zV=3DWMtTOf=3DR`w)0j2=3DCAt5|H6Ckckd}SV17Ew@aF61Q8GrU~z*oy`fBJFrc)wH
> 00*w
> zpsBG@%%V0oHDlx2^;Wz5HZF_6?SlpQ<X{Qz_vYb^nrK`p-
> H2O_<eo!0`0C{o`0C;*
> z{O0w?@Yb^jQIwaD%(N_&<Q3pRSGNGsqXKf2fHag>A$rMbR2P-
> @15qGk_isH?R9#Sl
> z8gn7$7)KL`k-
> BbBr=3D+DageV;dyj^O&ypQci2cqtvO`7eJUS3`T1kbMWq#qyK+S<fq
> zA5Ze}?>L>sY~O*co3~(R^mZiCsBF{Pb>el#4D-gxnk@Y0**1KBsF2cC1wKApfv-
> ;1
> z;=3D_aaxK*<qZ#Bf=3D9>MzZ+(~@)LLa_+?F8OGcN|s4MaWFeLN6~&b#_TW+V`P
> vKMi~7
> zSXESlm}Towky9XnFy~nTC|9Y1RFzkR#-
> eg8_V6c1jMOdAdMRm@fG}P_SSN$v?X|q0
> zjknwW=3Ds*-
> V=3D+yxyYH|`15=3D8L3y1K*+EYHO9^f(VkdGi4eNqMC$BP|_i$tg%pO2#4@
> z2=3DMct?I_1z&-LJbQxe{6%)-UIEx1;)0dLjrz?Tn{;Nycuc)cnHuUGHH`^T#A*-H<R
> zj^f{6e;A)#I)R3=3D613E};1IclA+R1i)Q7r~a<Nzzzj7l=3D(y~#WTWAA;RcS6jl}c^p
> zHCR0=3Dl$<fbl9Kuhw6DG!jDBJh;RYE3Z#?HMx4i$Ex8VNhKpgE`6?0CTHi=3Dz*y*)i
> *
> zeWHh)!V5{fDOoHewY8(Uu}KVDxmPKp5gCt?c<6lLa2x*p@x6GbJ{~vflJT;66&{
> V5
> zjI)`uaV9Gq@AhQiUY8lyYvb@{M+QEAsuMqZ^-
> =3Dun;&FU;?KnQWa1<xH*%{q9w67Z{
> z`;MWjX)g*Wo$*Gzw2eDakdP|&4XfRt1yP+%M^YyZ)wfKXP0ko0rz9OW82ce;
> -LO@D
> zM?kdvHVxjSK3;CH|671)_pS2JmMvZ)`jBGkh<V++p{`yuY`o0MV0x%eU@$yP
> &6Bru
> za&Iu!-
> 3RGgHsRM7PT<|fM7)r`91rf8hvU(63C28}%bkZKTSns5<^+84_&(u~4<9JT
> z7teLzt1G8Tr|_@WPU71er*Za)(>U656h}JuqouMIt+fpzh3$#jgzRmxsN<z&3cL
> kG
> zwgjP?zUI17ORAyo_ti8aE^INm!^a8&yMZBSQ<ByV+vRr&#K`X`<M-1jK-
> BuDfGBQI
> zASnA*UF7NV8DZ1J5-2xnyyJt#UrWob1xVYIELP?E*UfWKL64smGzF7}kH!}-
> J&aGf
> zbMZ>fS{&ONiG$lB(Y|Fi`Vto4c-
> &lEZ`p<KUh2bFkGA5ck2c_=3DQziJ|u?l?hVmm%R
> z+lzmBl~dR;G$ceL&^R1ReM7NnY9w~eUx7Jpqmj8`r+8mU6&3Po83YHPK`1clS
> oE{5
> z+D2qVtfe$H!jh6C2vSO75SxV?0<7GyLv{m$*e!#I7YeaVLD>T{Bp?&DTPBVDJN
> 4WI
> z6r*_G1n(NGs;m@i;5^gHJ4N#3eYd>ZJUcDJYIjLxc{x@_EEYgtI<ObNI8lQ)O19y
> t
> z_{GSbA7Xj$Uh;yuxPLGi-
> <~WdXgRolpaAb4%ErA1^Kth?7T!6YhWF_B#Uo~X{zM+C
> zH!njVHFm)U7wRQEX$b3%)a9G7x1xqX<l90Z)sq^?DfRUGuIhRetlB}TYJ>o>!73
> #M
> zh<5_0Q<B;ZyXCj~F^B~D&9MAdK(!m}K^Y~lU|IpOCk2ANoqD|VIoiV;;gdqeC
> g%8^
> zG04j@3m0(uN>5BeI=3DO@)iM?0cDHjwWX?qOXVwd7G8rJ^ubOXLVS&z^Aig2
> qn6(wsI
> zVd1#(nB*}W=3Dc-
> fin+G!S*^vU=3D>owzEUoP&SEW&#a<`EQv^FTJ<e;^B=3Dp3K58&)49&
> zrZlYa3q~jbnPu=3Do!rT>TudEZ!sMSEQD4Ug!eHFE++`5O{G0G+-
> ZBwNrcEc{&4a(cV
> z6$pFeH^=3DguWckgqdUfNU0wO^$+3Z_YZxZtokCE1&dF^?Ovj;-
> Q`Xg#iBqFDVV^7R(
> z%ceM11{K{akMshUd-2U9dufPUiqB59;+q!_<F{w_<3G-
> K;hU%1@X_gdeDzo(es#7R
> zzr1h||N3$-
> e(_QVzId`4AD$}2`zLep!9zLtkoBM$KYb(*zq#Cmug|ogVe4vghzB<K
> zhGTzi6Y6p}E#;H)gd124qKQR-
> _}E!mg~s?Sa>h8jZctKEoSc#p1O&+q3?Ws1*K)f2
> zcJd(u;U5M#0HWP8sjRvUx3lUtT8P&iOk!D=3D0qxqbMQn;wfS5BVfX^MlzduxlyI
> sY&
> z*^-
> Srote0Iyapc}EXK#jtMK{bZTRZBZhZNC559ci0KPtZ2w%Oh51&3(gZmE_kt=3Dd=3D
> z?{F&KJDei)&H)-
> ackaghBdPfAg&O?+Y6qUJ*n`DRqhVeXgF{ViI6y<>p1LONBgeFt
> zRAO&_DOw0rGr?fB7nGqhvseZZXj7oIDM@jI76QMwKTH0=3D1xG_(8z4S|0AjuL
> X}xb%
> ze<Ogj@}_Ky;XlS}4OJy&mfh}o8M!#pREe97F}PW=3D9k*+D<DGq(c%!=3DzxAvyvd
> aD_?
> z4p!jpz6#tvQjR-E%JBYC(upeE=3D_|p_wiLYHwg>N>-
> i!NB?Z;b3i}7Mf6wZ{cqTz7@
> zrLRK#{HaQU(nhb7kL_bauy#15knkuJt=3DNv*m^8F!7NMu428U~#(bupShwGbh
> w51*0
> z<}z|bfcQ`xts4>ta6_gHfj@$TKZ=3DAul4LM_$dG_|JJ<*?T85zBk>O{x2JIoXk}eII
> zf!eYP%e!P5N@;!xR))?(l<yd1MTX;{%<bfkJiOVk1J@ek@N!cMZuaC7kV3pp$7
> `Kg
> z6x?E5KTw2=3D^)a~hKt0}l`Uvhk)`dGy9>A@W&A8IO2XFSK<L=3D>X+&^ZfVqb_~U
> uwjc
> z&(xu6=3D@RO?y=3DXY=3DL!+j#Vzji=3DJrqgf<|1d>N>nb}fxSC3U=3DChFFeVN<B`I!T2s=
tu
> @
> zeEGwA_(OY!)EEv1h@Kn9I@qblAOhq~V#-
> HXOmQEL;tVsIYU;$Ba(KHbzds~8Vg)_N
> zg`V$*d0rERJ06Ihj+o$ySmrYxyFx-
> yw{9_>Dc*@Ux>9kyJrQSXw&D5eEx2*29oLRG
> z;OenD+&Es351u)U52<myeJB&R4`$<bcPidJkcN*bwSDtkC4TkVUObi`i%rfG#V
> }U-
> zpo0L?1QLHgo>G(_rKbR$0&PDfndJ}WQ9v++BKhO2_(R@)bReTNJ2J)&xFf@
> MTTC$h
> zEZk!()=3D!T>%Es*|qZ-
> oQ(2Ud#JH%Vuc%6aQ9hP|dVy<zNScjM+)*yVu4*La8V~`&?
> z52wr<@l@$*Jm0hv*B|M?rK7dD{%|v1f2e_=3DRN>txy72nGWL$412hs6XS2Esc
> kH?*!
> zWPJ3H8Q+~P!_|H1Nb?J)!tG~M8`LQ&`3Jb6SpH=3D0Quzbl_=3DDg4e{3LQbhpL0Te
> (3E
> zLA^<=3Df7MO;RG!J=3DZ42(0VH$~5{?o8*R0zQsA*Q%_W|e1I`KX@aULwya@q`~
> wXKWfV
> zfoeen4%OCBQ7**Ey^Xm0>|wn3Ob_0n)b-
> Xw^|(~E5wF&5#cNG5xZJQ4R~oic!H>s1
> zD*RtPnTrok=3Dc8rGavDiZ5FaaOU7#fp{24E{Zs@NK1r|3<v$#P4Q6YaMB7ZcZdO
> 7?@
> z0pe>1LV(S-
> nBfC#iy2{AgO=3DXpGmMTtVvQlf;i_Bzq~1#L*19oR>l8?%qGB|1qnDbC
> z&Z08B`Q#CN{K63d<>KC0oUh)9^Hu9{p=3DL8K)NaC+#%SDbkHfp<md{RQ;_K%
> Ma5{B6
> z;*9K$AlV6_mQTgggP^#f$c`Hn5Y_UBhVqAp>g`kbK|lgz4R({*6wS7n>2|ioC~n
> YO
> zXISiTirddJ#l4muSGzk69Yy8XYc4`VdLBAy$a??WgZT99aa`G-g_ml!;#^%c&ev?g
> z1v*|Pmt1d&!R?NC-0e-qdq<M-^)q>RwIvO?qi0gx2(og6UP|h(4Ym-
> fWDpF2KkuGD
> zR+m3s*WTulApr?cX`%&!IwcLWyHjs4YtTbobz7&I;$BD3&7Qd$J=3D9OMW)-
> 5HpfslB
> z;qlIPeEa6JxcfjEF4pbDrKVWC+PoXDHtoVIq$@3PxIylDqazNt_a&0z@WoHE@!
> m;l
> z4rec;+7To^uuU%|Y2BcPAh}_d1wtdKN&XaYM>~231tdVDfp+RS+7>f!P^)g%Z
> qQq2
> z*eHLThcd;@UG#S6AatY`qN}h19oa>sVzi{@<MxY>;)}CgxV=3D9W*IJWsrF9QpYl
> )|N
> zvKy~8#}SlxT;Cgq*IOCRZoJjC2cJJ`rslI8$2V`KbTyfPOc``as#Ak7N)Y%X*<0j~
> zX!jpro0TpQJrIi21$wH3Z85V4xh=3D+CO46I+-Ym~2ZPiS1?-
> U<`<A=3D<Eh3Knl#QuVE
> zbY>NyJ);nhv~=3DR*GhKM^Q~}=3DV&A^TJ6kKiDgDdQoMuO6kK;OsX8WnujEgD
> MSJCsg!
> zB^$qZxe8~Cl2PJ5gHlzfgOsFp!)yVfS%8or@aN^X$^VJLK-+-qI>ep^+Nr1B2;e9s
> z*<FK{KWlNl(cj_*?WA7+6nC&?QjdqLG4%Mtu$Aa5tH<%W7ChYAg_^}N=3D-
> U#FFE6&@
> zofG+Z`#>gcGL+^7yhaV@s|~xw@e0AY*1QWh+TzJgDR`Hle0<W3Z(gpzJ4XxA
> Ic+(m
> ztSJIStqekepny=3Djq16h6^xu2zBMoU^mI5Tu0gxYBpqJR$7PDGegO=3DT}L9^hag)q
> >h
> zUK~9qYxr!`FN{X@%nj7UO`_rJBwXz*!Y9ww;O)K~ywxK?xzZGm%k{f)xi$u`((
> wwV
> zuxpgQZg%d$?XD!edoUIEk7wa$&lTZ|=3DS%T;^fq$HbV^U*;y)r#{<9i&N>aOl|7
> #Bk
> zg!G@^@PC9eWFUTafCL(iLiSS9`~kMbMClZ0^+o`_HRx?Rt8RKz+)0`#?o|3+61
> _$W
> zJ)cKP{C)L=3DNPP5EBi=3Dt<hT8|s<brg(-j*WVafyIjs^3L!iKUTO0{uK5H#-vXRyR52
> zU>ZI+nvPE%$--
> AJmEhHiJ!tWsM^L8grlfWmLZ=3DGCe)+$M;{PgYBE@jRKLbPop{Tz=3D
> zkCIc8^(HZUZdj!muBr?4W(RA~dT!90)JwNBsV5Crr_t|%(YJC7etK>%jk*d6N;cl;
> zqMEWd39mKCQ0f@UE=3Dp&yRBQH7cb|l}ds1=3DtU^?DEmVu8RB)2?Yh`UF!aCG
> _#N?G9o
> zhUA8M7B_U+fQS_Tch><D0})V+#-
> Rhz!eH5}4NG)~tK+R|gYBx@MAbS&po4XWNmi43
> z1I;Jp$n#10s^KcjOwWJ8oQf}Atizond3d8c8?Sey;aW=3D~ULhC^<YFDAuSRl8Ya;z
> F
> z8MnLBapyn=3D?j6a*2gkDU(F10D_CyXoeIg&vMn{uFW)qM(0)W;Hy($m~4GVC
> Hqy{oU
> z2aG-t9T18lH7QBmLED3{&eAjZJ6LtIF3?I!O3<vjr5XpG;<h)RR6^gEI)~$CcL_dy
> zx(aU{%Eirn>0&ti8r73m>SJ+<iu^@7UL{C32*|B{X?Syg8s6^B#Jh*H@qV8f_aE
> Rz
> zuq=3DG>Y#y#vB%x>6B67$a0ij0&K>=3D}?bi}aG0>mB^8zB7Ng&;dHf=3Douc!_`$55Za
> Wa
> z=3DLW|qNn0EACiSw1FsY}WPb#J7v`tuo51**R2M?E!OESe!_}bn*Vn@qma>u#a
> UE*s7
> zb)zGNihL?PE(32J%obDm_YP-
> KXP<%hj%MQXCv$Q4Ko%aFvXWBP94j|S5F`+NvI0y-
> zhfoFugh42Bn39YV1Z{!dW@lT>ZU?Jw{V6HbZc56NAr#2d7$x$gUYVtNo1xo5m
> (y#V
> zjM|FNUu>iyZ9Z;NExFd3EL_1r&eX)vk(<UuTx(0l^^R0rC#T%nPf)1#+#$ET)0>9
> 7
> zhcZa%_~=3Dv)K6$hN&#l=3D?>1rMUiLiojRMs)WA^}7VWr9{#K=3D_?K0|3!>(CTe5n;i
> BG
> z1J{O>AHfYu^HwFxwu7E6rZTGOxfhDE@!1RYc$-
> q!4T5r&MqRH^>N;Du8y9HA#b3Wh
> zP_9yUf0bNxU3SYY(wkkB#^n0)?%_;)cruq#SP8D?B%;r45jiA608n(C^neP8T_{$
> &
> z-
> ;Kt<j@JND!w7aVSq)eFQ_@6B2fa<xLHDmg2kUN&8E6eUN3IR|n)xKH8`K?ijqC
> <T
> z(-=3D+k`*!b0ynCV=3DA3j!r+Xr)Sy)y%^kW<c)JI--`(io3dn-VE~CE`je^)1{`vSUcE
> zlWX1}*Kkks_Q6bY3KxAdzIdh>cRRE2@c0#!vLXZo)(N4-
> 2&5Qlp(rqvujM7&?+u<t
> z<L|~AjsFOgp=3De>S9PL}xE6{q|Vzk563>`N(n&K|gaf99YB!lgIk}_0nrstoWzZsvs
> z*o=3DD*mf%)THUUY&c>?e<x#Q)=3D1Y9ItZr+1eT1YfRX0dCyzFa3jw`frCMpruZH5
> ufV
> zEb3db@yY2td~iG$PlT?alof#o34|gBqK2Y&iE<nv0r`u;!)W|uB)KHe4va~p%{m2
> I
> zyEn<+wwNEX>Q>|+B@GpVUI)FG9)B(^g`m_?7oShHA_JH9CgU;{`HKYNJOL4
> 4ni6n{
> zMX>mIne-
> |_x=3DMgvC&%0($Gpjo;WS42;6xVgKbVUr!`4y#h_DMp?Giq64W~@?4+8SP
> z4X#e6r@W2E|Hr=3D!)&t_~WOv`Hy`6dk_Y8WgZvAV}dMT+|CnYt=3DDXB>Vq16V
> $JgW|R
> zKYhR7c|LCL&BsSSDW`@p2iMxuaH&NCa<Pe^G!PVO9xv9%3&&h&h{pv=3DXO
> ~E?a5^Jh
> zqsQMMkT=3D_SnK&75(vbOHAA>RD$*F4zN~8c1L@~7I5*C*X%2a<f84RBr+?`E
> kcS>8n
> z_8dYlwquALv>HU#5PAli0&Sd$YU5zt&<{cF2BmpZ8aJhR<B`$P(aUl7SSjv3R49h
> R
> zuTd>IFFWI93jEpH-
> 8ff6#l9{M7wY2(QXF2UeucljOpklDfhQ{^U7^QcCrCFbt=3D&CL
> zT|Pm1B4iB}_XPt28ABole<mO=3D8pe8ihdCJx9}G824-
> D482q6s?LWYBsR50k2WPgfV
> z4}xAwax{&h?iYIKIS&V~!Mn$caHlU9uT%Qry74lNw$2lbvo*W$V%1I|{`wsK?0l
> Wn
> zv+(cF)6Xu@@d6E*FV@nqnY#Yh=3D(#tV<8kLu3f?`Mh10$(b%6-
> U>560TN~SOv3}uG6
> zxH#fr=3Dp{mb8)pYdh>J5OyGjambFpZOn=3D7Wey9tGPNSfy9E;QZCqhH>h2q(>84
> YStF
> z;a+w%%g1}rnmK@G(CgV3o!_v2O=3Do%cYZ_exD~zs7(NwzDDWp)k_Q@0nRt
> Uvp62*uW
> z%%a$_908#L6{wEG$!NUi?CczA;Q!^`-
> Q9gTQTb*VTZuHu0g%aV&H{uYhcM&|3Lhkh
> zp#b=3DyU>w1*0x|#;1~OF!qCjCF3Y1`%eg&zZC@=3Dy|QvXNw8!lAC$rN29M~?Io
> Kq4X{
> zJPjsOuba{Mmy!HndSZwJAfXD3K>!K=3D9|rQHLKy^*DMJLp3X*Sp8r_P|hLPQ|o
> LLAU
> zEc(GrXQSb!J3Vj=3DKZ!K?pL9t05P|$pK^X|fe+Q628Ay=3DqkTE7HRXH1tzcQIjWg#I
> U
> zUIGXJBY(k1`o&Iqz)wBtiDNl!(TjwVCew?C$Qnuw30LG0jN>};Lm>^meprJTQV
> nsJ
> zfefOC1j#o!J7YA-(<D;WA1GBFqmmJ<7(;+ipit`aFgcrY=3Dz-rbl+iL-1~OUg61ljm
> zU803DT~@dqFnVx?Qt$_(fdX#@!P`~}2z$;@1JQK{#cq-
> ;hT%`*lHfsdH5va%!`vq+
> zHO*CESOHO>kadPTn@oAmCgbNGPNu*6(2M!;3(5|eEL_5A%SD!|mZ+diCxt
> 6eNHgf7
> ztfY*(bTo6Aq!~YgtOD;nfRt1#YnsXtVV-Ul7*iD(bls9WBp4yGJ0`jGD_E`@<4D6u
> z?vgWpPcR-g7@QZWGn5Sw<%jD+LcA$`#kv{|SKUmeKY9_6k)-
> kT2Lk0kB)LT66qQ@1
> zu{<PASEK?Y<fU<tjXbU8Jp{?mnQoDXW69?>O{Fjo6$G^_+$2}1VOUa?><-
> Q>6G`Jp
> zJ_Ld@j+@E&S1JiVqcqh`HG7U4hFu`aFOD56b)nq0&}1^~cXe|5z{A<;4+Q2f!(E
> *J
> zKFY=3DUA7fpdzaLL0;79VO6H+vRPLef|MJFGimPfw=3D)uM~nQ_zo~zyYK_C$;$8Sr
> gQv
> zYx1|q1%52LevZR97fHUP(b5h4Jvrj<1mdr5PNqM(n2g^znM`NsM$e?-?L;L-
> sbg*z
> z2+5>8VBNZqF(XHMZg+8UKIZ1+bjQQR>6e}^PXFoc;`~?A_aqE+l|_yjPA93B51
> qV~
> z=3D)y(}Ruq_#KZ5vm2KzUC+!RUYJ6zT<x)w#=3Dbe-O=3DlDu5{<w+n&-
> ;@64P7qw3Ouu$D
> wnLcrGGM#aDHdT!s>m8AsyUtw;Lk;Br1Hbl(_;r9)p#T5?07*qoM6N<$g4Q1y%
> K!iX
>=20
> literal 0
> HcmV?d00001
>=20
> --
> 2.13.0


