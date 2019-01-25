Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id DFAE85297E
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2019 15:56:44 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0PFuVmm013127
	for <meta-arago@arago-project.org>; Fri, 25 Jan 2019 09:56:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1548431791;
	bh=4t+WcKzz5rqQS59k7O56RPDl8UFoK5MhpveVKapv7rU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=gu657qgpY42llpWrcc+UDdJHyDMDWV35MMLMAUpmDPSAJSKo6pHsSYSJ2SZyMWxCK
	X+SxO4IF9BMguM4tyQYWhXcOeGBuX3+ARDjKPFLNEzXivN2O5mpChcXO+CZa0KgFxj
	7otZxGps/GAJUTmvlEsJDBIcVM5cmwI4XbYea1Is=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0PFuVQg073907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 25 Jan 2019 09:56:31 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 25 Jan 2019 09:56:31 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1591.008; Fri, 25 Jan 2019 09:56:31 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Agrawal, Manisha" <manisha.agrawal@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago][matrix-gui-v2-apps][PATCH v2] hmi_apps : hmi_mmwave
	: Add matrix icon for mmwave Gesture controlled HMI
Thread-Index: AQHUtCAhF5z14rrZNky6i40sCzj9bKXAJICg
Date: Fri, 25 Jan 2019 15:56:31 +0000
Message-ID: <f84211553e2d4c39ad5dd55e72f5562f@ti.com>
References: <20190124200515.17424-1-manisha.agrawal@ti.com>
In-Reply-To: <20190124200515.17424-1-manisha.agrawal@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.79]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [matrix-gui-v2-apps][PATCH v2] hmi_apps : hmi_mmwave : Add matrix icon for mmwave Gesture controlled HMI
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
X-List-Received-Date: Fri, 25 Jan 2019 15:56:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed. Thank you!

> -----Original Message-----
> From: Agrawal, Manisha
> Sent: Thursday, January 24, 2019 3:05 PM
> To: meta-arago@arago-project.org
> Cc: Dmytriyenko, Denys; Gou, Hongmei; Agrawal, Manisha
> Subject: [meta-arago][matrix-gui-v2-apps][PATCH v2] hmi_apps :
> hmi_mmwave : Add matrix icon for mmwave Gesture controlled HMI
>=20
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  hmi_apps/hmi_mmwave/desc_hmi_mmwave.html |   8 ++++++++
>  hmi_apps/hmi_mmwave/hmi_mmwave.desktop   |  12 ++++++++++++
>  hmi_apps/hmi_mmwave/runHmiMmWave.sh      |   9 +++++++++
>  images/mmwavegesture-hmi-icon.png        | Bin 0 -> 17756 bytes
>  4 files changed, 29 insertions(+)
>  create mode 100644 hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
>  create mode 100644 hmi_apps/hmi_mmwave/hmi_mmwave.desktop
>  create mode 100755 hmi_apps/hmi_mmwave/runHmiMmWave.sh
>  create mode 100755 images/mmwavegesture-hmi-icon.png
>=20
> diff --git a/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
> b/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
> new file mode 100644
> index 0000000..6f29bef
> --- /dev/null
> +++ b/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
> @@ -0,0 +1,8 @@
> +<h1> mmWave Gesture Controlled HMI Example </h1>
> +
> +<p> This example demonstrates HMI control using gesture from mmWave
> IWR6843 sensor. </p>
> +<p> mmWave IWR6843 sensor sense and process motion and gesture data
> and reports them to the Sitara device over the serial port. </p>
> +<p> Sitara device parses the received data, activates the HMI when motio=
n
> is detected and controls the HMI per the gesture recognized. </p>
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
> index 0000000..e961eb3
> --- /dev/null
> +++ b/hmi_apps/hmi_mmwave/runHmiMmWave.sh
> @@ -0,0 +1,9 @@
> +#!/bin/bash
> +
> +/etc/init.d/weston stop
> +sleep 1
> +
> +mmwavegesture_hmi 1 -platform eglfs
> +
> +/etc/init.d/weston start
> +sleep 1
> diff --git a/images/mmwavegesture-hmi-icon.png
> b/images/mmwavegesture-hmi-icon.png
> new file mode 100755
> index
> 0000000000000000000000000000000000000000..e9e19b9b0e03690014dba2991
> 26b06b42536eb1e
> GIT binary patch
> literal 17756
> zcmV*|KqtS6P)<h;3K|Lk000e1NJLTq003YB003YJ1^@s6;+S_h00004XF*Lt006O
> %
> z3;baP00009a7bBm000*e000*e0m>%xKL7v#8FWQhbW?9;ba!ELWdKcSV{&hE
> Z)S8L
> zPiAImV`YEsHE{p{MA=3DD1K~#8NrM-
> 7_6=3D#;OeU2nRLI?yx0ud!45fn%w=3DbW>IBoHX)
> zoO4EiByvt78ry)uWH7-*V`JmccDvJbPtUBG)pzF3o%!STH`8-(_ig{a-+rq~r_PbE
> z=3DlibLdR85z6RMuQYrp$_t8{Du>YX&MIBPt00lw_U$KB<zh5tR}_HX}iYuK;8zP0&
> _
> zC)dtCxpn3HhaX)2ck%<lqbry2@QQ4^=3D5d!?>fmF=3DWgX++oq5v5&y1h{-
> *frDfc}}6
> zZ9IJUB5t2O{l9LtpZMGR7f)XO<lec=3D?_Rw-
> `up#%bQgC3tTwlXYx$YRTLK`|JN?5y
> zTz32B^Xub3dvK-Z`Sr^$Kl$Lwe}Db{d;js-
> >GnUrI(XoRSG(Hq$<CdMS1qKq1)u7C
> z*4B#GiZ*=3DC=3DV|Q17rQmykT3TLyA@xV_<FC#H=3DWpnpE>Yt7ksDK&Bq$@xC6
> ewJ-hH7
> z_oV~w<9FOw1@~Y0wyg!<@|YAY!cKg<bBE$*Joc~KT7URr&z`@$+`IQrcUxQj
> ?aGdZ
> zudnQB+<WWv_PJM1wDi$s>z>~l03!%+zH;S?^V53=3DhCIA-
> y5PaN_Aj5EIs5OgjvV>n
> zWo;cErljI_WF&5^T7{d-
> m*dv5Ww_0)aCgND+*`R4_xZbz$b;3Z@o>!=3DJR*<RuEob|
> z*Wt-JvVJ|Dl4lz>;8{cjo|6}RPvIr`WaCD~EAnYnl;SfXIvTH|qlj#y@wv_y9Ykqc
> zKKG3ozE1~ye+55N_>%je;Qk12xPNcBuL|z>8y>?O9?KU3k4?ej{G7-
> 8Iged<EkEPy
> zzT6y(ud}l7x~vShi;MsBSX%OL_GBjP+?Tm^Onv=3DERuqxmDFDU~wE)PebN%e
> T@z)Nw
> zwck5@_`g5jyAO{F3-
> RIl4Y;&m0WQs*tGGOG9<I!vj}Q2>tK{0kg}A<G5pIy1OP1gk
> zxxI8L?vT6O$$Q-
> 4`{X0;yzqcK{g6E3fjt&@pu!U#wD6QX6DUG>&fvY^L7I7~^NAyT
> z?kmMw4ZcqY{0s#@Q}|TietgP(Qg9z%3Ebyb+;;_!<r87?Vtm5mQ}B3S^0;5p!3
> %*t
> zUeL=3DY{MlzK7?9X4c$S)m(@{}>tXwqzcG<e+%Ues6JXn=3DF<U0faR%U+pcMdd9
> JKa=3Ds
> z<3{Vw|9DhggKJUIxWG3*H*+Q~%$b9WeEcpy<bCeICGN;&?$j0X0eA2!clH|j
> kOy!>
> z-
> ~rtvw|IcJd7yX5T^_t}k23C)k0|JYKykt&W})zyd@L|Kg(o^s9Z+WxdG5dq1HOm
> w
> z(tw|#;AeKg{dmcJ5?*j072M|++;`z6kL88HpuFJmJr{Vq&v@L=3D=3D-
> {b9Cr{|+2^~F|
> zGaJwNSOWZF(<Yo>x$@5ip`ou6ri5*bT{fk+IS48MGFV)>ve9{8RsQ(>`PnxvRa
> O4)
> zTY33-
> hdXg{#tgL2oP{%d<FkzPIeyRu@(#JkAiT>De~&xzKDoplyG*WdN3U{+g=3D;*3
> z56N}DmnvHV5A+tfP44jE?^1%neaaC&qO1od9_l=3DzR5Ootj6kVi@p+Cs<$Egl86
> EJm
> z72FR6_w9+meSN}xR`3{}k|#W-Cp<RcW6J-
> S$NQMauAqm<^zn#(gol*>VD@Z0oHa`e
> z63@o=3D88d%K8sPoKs=3D%SEBO|A|iF0!Rto14Dhcs@DX>ZTW`qQ<vbevwg1V^S
> %!*OQ*
> z3Ccgk)2p4F<_DZ1XZeBW_`w&r1MiTF{Gf~6vG=3D%x!X@tTW$w6eg?zw+xyl2(
> #smD2
> zTo-uIH^@y&5N=3DV*ZJj%mbyw$}K#76`#u3LLb-
> >pNj|9GF2mCArKf43&kAnO7i2JJG
> zek*t^4|z-q9^*qE>jQzu{eTWWq6-DRd_?*8>FFMw-
> D3dm(%&OK=3DVQKh@8~f<tn}#h
> zc>0imlQ(X(I7<-JfA#h8t_ACs=3DC?#f{L8zENjSwP@1Hge2bujx_$Egg&0~DS<9y?j
> z{E$<mot)-}p5dFH<&K;q=3DebiCxP$NT^%u#z-
> 0}B#0PmAa0uSmk5AX{4fCnpFCD$lG
> z_>fYr>)fCy;U<y5+@eH50^^7gsE%Oi+~@1ee8l%v@UuGL=3DL`3_PYUj%g8QrB
> G2G{|
> z2=3D{nw_jrs79`8LK`&~Lv(8pcMze7jDZTh-
> RZ@1|07K0$cxjkz(D!qOFG{wc`M5w#_
> z0IFBj$5IlrY;5Y}iC-
> OIcW{zBv6u3N{e0m8zQG~B(P46gZ+eU$A{^%%p5O<cB&WC|
> z?cAZ$<P3N2EO+!AclbQHzyo-PT;##LEAZgnBk%KbE|JSTc;O0Vd_b-
> mP}DUdLHUsK
> zuA49dW1s@m1?p_#>pS54-
> Z9{3cEJ6(&3(E<WGfxr9fA8Tjf8^7beqSf;BnsKG2h~`
> zE9l}Do!q2&;RZe3ps(w6Cw$06zE1A)cjrPv5ZR;0e+zPV-$eB;s`hUP9a&c#9{#7J
> z+?hRmLF?41*gbtZ_V7h}7=3D(TN*#W-cL2`(1a+n<92Oi}IAL9-
> j7q~+wxnrkDJ9o03
> zJA8(m<<1M|crX`uQ0K`zJjjbgg7Gd7{yl!~`#LHh6m*HmRswT{@+2Sz=3DD?`n@N
> rk%
> z5cqm2bq2;bq_+I*8v^%3H4NN0)jV)tZwlP+>jIDC29HU><GaCQz0PA+(7}fSeO
> #lL
> z56Lxp60XwQRr>pY9zUSZ5Bc~i-
> In(6|HBv;mzx0r1AHuNXNL@3(x><9hUwFP*uyv3
> z!ORz0_@Y+Q#ux448|@~0_@?{#0sF}Ta*)qI#1B8r9XUdda>tHw2al5z+}V@l6
> nDOz
> z2XR{9L7gFId64G>9`t!~ff5WZQp~$1-lMelO-
> Nvj;9RC)K?TVHIhz!G4=3DHmU@H0B#
> zXDhfbs$mege?~WVmHV#Xaa`pwDR_+1dMkMB(u%8=3DoIb8F^DhhZbeX;`(cL9
> Fd|zMy
> zE)faDz7ZoZ&&B1Rd_3INSV9JR#;xhu^Ix0!r0t|}$`ov40Gj#4?PTXf2Eu<@2W<h
> <
> z(Mn{i7@-
> r$U<Gm;Gy}WLj3lENL`O!?LYrb{2d!iHZ_+wuCR!A;&=3DRb}fA25|o{61g
> zM=3D<wUr&$;?9ossXhNj@@XyjI7DjG=3Dr=3DqWmrQAcVOlTb4%95tiEQ9WuRs&p!
> Y#w#j<
> z#-UsY9E-
> BRFqD##5ke@6Nl`!u2}Ys+7!;6vvUhwqF4Cuh9^awUi{w2%J~ehMqI>rI
> zlb5sgq{Yw0`Tb2^UjNz1UpA1s$&=3DB*)1;A4Y?2_1;@M!Cgq@af>>%4M6S2)QL
> D57S
> zE#uKZ>Pekt9BN4oskV+qm1Qg{xvj8-
> p`4UjLQz7BNs%Q4g`|MwTY`~Gax7zzO)@Q`
> zkwMZeqmW8cEF+Oj5=3Dnw32=3DOG&5{RuNmTb0+z$Ox72|yItXz@oR*+AA?{IH
> I!u?)v*
> zvdS_HD=3Db5?+%g2qEQ7JcG6;*wB8x8;koi_$%(D!{Tr%4-
> 0JF$Uiw~xgX=3DJL!8&k+6
> zOMirui54$RAmhkbOFx8>5KCVa1dPFX%0Ews=3Djinuot`BZ`0ulmCL!6&>o2}m>n
> |)L
> zEtcQL4jlNGYG!^7spc<h_{3UL#}_t^oT{WZ>*AY~@NpDAP8U8FHI!V<ZIv|)l@
> zTB
> z4@DW#q=3D!(t2oI)kjXa9ZC7Sfny7W=3DH^pU#sAW9F?rE9{sP;@NWOwpT2w36<
> xOZTI6
> zKT01?>BDvD!`>p@SC>8z^T|Alo<lV0KDu;oU3h;?CYp3FC4D?ak0WC#JB*0*V2
> dZl
> zkWrRC$O#yY)08c=3D(_=3De*o}%9~+@5BVXAK_w!w{?WkCqUN<v%wK8uUXse^
> |jM$hMN(
> zDn7AVf)K=3D#q>Gnq*Tj$2#FJ{ut|DgfX6ag{Ytr*|>4Hel(#4DPG?VxwlXN4~MZA
> {j
> z0eYs}q(|uDMfzHk^p%vpLYKbOBz|Fsbjfsk=3D`$#NniAh1Q>>bJL;3^?7x7xA_eH
> 1@
> z@2SL(*2Rw`ftKFL^dE&2lz)QqPtfCWIz3LeC%HYzZN9%hhFYzEwFGlQ7BgfBikb
> N(
> z{6z`3rQDWDFeC^;lk75HlP=3D}u?b&WG-JI>CJ7v3wx0RT;XS+y`rf?B2<;9RL*)G!8
> zP`HR+`CrI(k*;OCj}kwli)<I^U1hr_-Ind6DO|({>EcHae~Smw7=3DWXce}oQ?(&Z64
> z6^@c)bX*V^h+$4nkP?JQ2B0839EI`=3DQp6_}lM=3DqLf&s8)yH?lVUSg!CYtoHu@4
> Ccj
> z(vx)Qj^gd5+p^s;(~T12C|$CBu~o0@tm%%~u4Ve$ON`WXL%P&-#}d<(^Z-
> g1@qT2O
> zr5BR?N8%vmAE3hnbSdno+k@O5;x^9+Kp+FKjseJF0P^^YTz#9*Cl-
> *BKz0VEjJFM@
> zU6mLu+YRYml^Dr%DKT%$b{R|^>$-@S!PG3>C^5@P=3DMrPi_JJL>-
> 4NeVVmidzN{p82
> zolA^S+oi+=3DQMiZ?(6e2n`%(IEGL#Iq^hBIrAofzeu!kP^(CKcnm+YtGEViOUB>({
> o
> zz?#8>kuh;1vg8-
> sW^<d(C+6^lg(D`~WxRATZ!0m<!5GrtmhEq=3D?dEJZml#{N8`2$1
> z471&##JnxrHSyjZ(mQ8+XX!tc?IL}c)g419UBnL}11+wI9X<kW^e42^rGj4D$ZnF
> (
> z01TD@_%Q%08GzIY6OcyvLORLdlQQ|DJO)5A-
> kj|}Ro87@j4j*Et)t_BDz)7{+wDt?
> zV;8fui@NSu+l?-!>ulEsQ*##++J$suK<!ex%63D%8+<8U#1A0e)*guQ3&0M_-
> $94M
> zcKX~-uRBN!NeKwRAPK-
> Q24EQjkTiZglKG2d1|o&qRFcLQWsjJk#M`pn=3D+|u}M#TSE
> ziP6M64ybRh?T%fHh}TMtuU&~TGQFz-
> Rm7X6o3q^}{p}@2lWr?9oux~*JBYXRK!3{j
> zvUJDB;r`f0@lB+W9vkVik#4tfD<m=3Diz7l{T48Wp6gAm66#PbP40!iePl1O^McqP
> 57
> z0oAc}G%~$&7xVTKW3KH+i7{uolFotDzOLK%>|IN@O_Iz5sz|qG`cFyM2GpUH
> Ez(7}
> zU<mior7Q77#P=3DhfWc@II)Kh*P<=3D4`qf?n$dx{hNTI#2>Ihyj?-
> 0K|?Phb{btu$4~|
> z;`yQ!|8b^FH)f|srgyIETgXpky8VD^i0|Aw+Gl#_!PF+*sO#p5lFUwR1FGXhNt3R
> X
> zn69Pw>L@Qpri*m5c(e4ry7)epZt$?UVD&IRR8xL69ahn$P)WDdI<XAE011FE12
> BgH
> zh#or@F${vRiBH(f7sQeT1|Xf{wSIk+L%-
> g+t~*LMvRzveaFj0DZgeq{?WQGx4)L~Z
> z*Q6U=3Dj3!+$F9~!WP&<n^>bgG>>Gmb2>+;eeT`w_)bWMCWU3@q6qI`F<V%
> Tt$Q+^p8
> z3Z-
> ;fO1I_QR&X2b=3Dcff=3D00S_~*B6mtVTj@{HZl;hjph?$_`<FJVV$zQ^I&QdZ<gLU
> z+wHrUj@HrW*>&;eY`2vdV;$!0B}TH{kUpAn16i;AC~Y_;`BA70q>}BOrE7IvlkQk
> z
> zemvWI>ltr|@2POc(xJmpOn*WVT^7-
> )P)thbICA)KcuN5KGXT>Wfb|T(2L3{bkSFko
> z!Y02^yD}r<yQ=3DG2iID}cpDr<47t{3un20w^cdYA1wmV86BiU{3g%M6}2y%8us4
> L%N
> z$VjZ2G8bEyufw9y$?$jXt)y$>-
> Suqms>F1z>pv#lEZ&XuusC7S(4oku{CvvKr^h@x
> z%_aGyKpYzZ@L~X_3>=3D8np`lpAAP8&ugmq*+Ul=3Dt!#ICm6CQ6;N-PXm}q-
> )u3Ut+Y{
> zu1OahYr9cmM7(`n*E$#>#M%d=3DojowBTQ3Cn=3D!@_^L$M%`Ni%yf(xYQhmX(
> LPvP#rf
> zRHLD)1_ddZnCv%_qPyEkx65{x7fpI+@tSaFCEeB81wCB4DcK@kwywJP?xdU5
> 3G*0$
> zY|783!)&_D66iKZ5WfsSe+fWe24E5cup%S`EBVWn48$sKSMy10NCX35lo><(Pj
> xX`
> z>o}O%u1Pm~b`fu@?b>p$CfznkvQ3n1%L1yVJ9#3cTOWkD_Qix=3D91jKtVnx_A
> #4cWq
> z+$~9{$SqXD>&h!pSyY1J>^$VBWg;gz6?y5I$W2Mdyz!GLyStrq$87JauDe^E;nS
> ;+
> zqPM#{W`s|{oM|)A$IV>{H;WfsELO}JJOmk(pFxM|0-
> dJQt!y*6T|I0V`bhx#FaQ$=3D
> z48YRhU@T`4mXYOrf(iy%H$2!b+hvVi*4NE-
> UBq{)>qLYvl(m>nYwWfTW~wtMNj;eD
> zZr+&WVw0|AyEd4HyYq};DO^8!9+Fl@pdcX?Rr$rJFRegrNjb_3icpxDgS^xX3Q
> y}G
> zn`EW%ae4-F(=3DxDV@^mHq|4WH+rC8s-
> UdZ74Bqt<d=3DCtXkuB<{uSve+6m<T7z*2G(t
> zcxPfIGZ}znidWEM5}gVuI?EY=3Dz7l}m48S-BVBwfCSWNkg7zo)e<&%U}!^SA-
> S{I{T
> z*jPn6FA3PB+jlWWUDvW*>iYC<oT>I6jQQRpu!=3DM7*qKX_xM&R)4-
> dsyt4xxNe!UOE
> zy7$M{C2LTfUxeD?a#R(SqBN%f1?gGH70F4dHtEcAA)B&9yg_zaI`T3yv3&MC_
> _(+!
> z;r7y9DBY;#QdXpvJE_v*L`f4v!q8CPfb!BZY>tURQDGtS^YSr?eZH0cM7jh*#LK
> @e
> zWEv;8@suA=3D`SJ7^C(vtx&Jva=3DPYHkrpB(DrgZT`=3D0?Id7D8b;1mJJ=3DvY&XOkt)ob=
{
> zWxK7s*bk;!iLtehs>F2j#=3D6myk-
> Z@nrHSdN$)VVyGSn27B6h(_jPK#2#7o;al7nTq
> zCr{;=3DI25L5E8*r0m$D*g;_aminZ`CX4S8AFShIK;2DtTNb~|@uxT@<;F7W8atao!
> m
> zACKPX-_Hw!n3MrShGAr25JE?dMm7VOoRrLe2V&{s#aOm<89e*+QL+u`2J-
> JIZ0)yD
> zek>iv(xrl4x9BV!G6a1j0PcM97zSX@=3D+T(VASn2Rd1O9cw0P(!UA$4(yUzBvNtZ
> HX
> zOq8U&OzAZcS?gob!17U+nTw*-
> EaWGrqnLu@S8Sm0!JHuVQvLb}ZbRG$AYtuBRbK3c
> zOQv_uc0;^KHzNUvShWVey*<&p2Wx-
> dei%&2{wx(CBZ4qx+yu;@H3zGguf(RP7^Ea6
> zA&0LiDK5b#X8ow3kr+a0BG`%L#@Wf)PP!pp&ICClCNlsrlpjNf(R8Vx+ZdgBMg
> V&9
> zMWYyi8KXvFCW9c%;uB_*IegKAp(FLy(a82e4r}b4ON^@RcH(WV<HVlcNL;o7r
> 5q#+
> zD83*iLs6WOgXHy_FnORKCrIx4M9Bjqockbp$tvW@fch5U9nu8{@fj(pNGG|J8
> MQtF
> zfkTI5%J_-
> uar~C8$dKUV<f6E+2&I%=3DT2g|dq9T@<JY;2MAtNIL)z#Gq857(|xFOvv
> zUdDlLEMJotfJn-Zq{9e-
> K7~kuj%Tw(^_Bp*^2LGP6gF}srt=3Drm8HgDY2tHAmJ0!@y
> zXLrc<&J(4#FAK<k8pf7!<BUZpV;#?@c!R=3D>Y^1T&O!FJX9=3D&JBL}>`y#nrRsYw}Y
> y
> zM0f_fn@oy*n{)$_pGG8`H$_FOEKg-ADJv~SVL<_Mb8?Wy@{-
> PRB9+feNlr$xi6ov0
> zrF`!E`SUx8cOr&#O}w?EE1Kv#2<s_+oj{MmT6$flGlK!}kO1`Hn*{WyG@fEpMv
> hWU
> z6<GJCjUIzpg9AHtF^(n1u648;*=3D}2l3DpNxsq16dN-htZiW2tec{~I1k~7pcpMz><
> zToPuF9;+ru#_ZIa9m&E;(@>m~hpN(Y)Ra}AvY7I6nW2=3DHo}AK2yht|?`9gMP7
> UE*J
> zV%_RBEHBAQxXA7xC8bLw2y#ZOSg}Hh7wPudu603%c<GvC@SZSm5LQ#Vu!
> _PJOzzb>
> zQ+bB;k^pq)8~XL9G!8c541zF8U=3DSuV2-
> 63RV7A+fH{YINh!^Qv&u+Ut!&nv=3DLyVQj
> zAgA7#?H7WARINA9rF_}uu}ze=3DapCwW7-H3y1$@|{4Ds+p6l-
> @&Q!{qAv|`uJ7PRfy
> ziI(Q=3DsH>`0wLMLQb|Kx2WO+hdJl3ySi^TW@WTZ0yT?ltX0+3&jkI0Bf6#%pN?i
> 4T5
> z&Elnlawp>$faR3GoZ^>JxPnz?xz1!?U(PSAuyo^_4)yAfaU%jTfk6-
> ^G5`uWBYXoW
> zeSn_rns}S^{(8@Dlo*@zU?pCp>*7fu39x!#f{#D4;(1{D1W665EG^QjFP||NL%
> R1;
> znLo(Q1B++QMoE4l+9+P6@7&g`Xx+X8yBLt>#wO&mhD%m=3DCEh@UCnY9g-
> I_Is+Zu<=3D
> z%*-
> x@J0bzd$<4vm*e!6;Cs|syYqMXG?xxyTt&Q!a<`CU5c7QLIQ2r8%UrgbPjjc{N
> z&j1ww7Y1Okmlr|<Mj(vx!x)IM+>T=3Dago(cXo$C7AZqJbQm{A-
> &N0I<FkoHo8sWG4m
> zviLRHa{!VyZbp7)w%wqbmyw0F3zuSOFHd-
> K_Bmxt7}64wP@G?&M2q<CP213HqLqP>
> zZBBNMT@a+6r&6FGB2!aSmCUtk*CIAH_P-
> PW^;(v=3DES9fSZr!`}pnQuiU0a4Q)`AT2
> zGLe(HMHmCHfYKLGwlF^^2=3Dm#(sx2AMGoYsgKx*0`1|Wn12%&u0hH@J!!64
> &({W=3DCy
> z^9)rk;f<!yQDh_uB4eCcYP$EsXjd;x8#WSS`wihhDl3w<l}A~J@%QM1sO4)=3Dkez
> GS
> zz2x#hH?CgCGtwIa`JBjAYuSIZG;t=3D|#EH-j2EZ)epoJx=3Dk-
> yK7y3QaN(mM%d5Z0|*
> zhZwe%(%p3R96<}5Es&Y~d>KQ$+<P<gttRQ5KTx>LoP|F6<WAO-
> LI(`OT#BDd*>eQS
> z7v}1WH3wiICmy5y12Bg2$8a0WZLkD`gbf_7q-
> z7JmhG~>KDN6zrVR+d)B*lj5;__4
> zMvldrsq+vyZz)zyorBzj6vQlBgP~4t9RsSYv-@)A2D$abirMp3=3D}-fwK7i)1PRB+@
> z!;igraNtNJvu0=3DU;H9qD)zo5p7XjGDGeeLdRFqe!uB9ufLORP(L_`FlqN3De^Y4ta
> zMKV2&$krg8`&Yo3@6i4}DgZ{d8`34?MZC<e<$8fEVTbzoVkX7Uq-
> @2A5tu<{>4Xd%
> z2sa6Uv{OC|z(|TWGm1eN%>V=3Ds7^bA#%8Vzo-
> 5t{h2O*IYq{MYm$c|&y#cV<5)<op7
> zrA*nh1x3tmsqG_rdZ`64W93n;#dLGUobi)Tz)nW8Tf|HD7x5sIw#H+WUjSxKn
> aTra
> zaHKt?gsO^4?BE!nf}l&^*3^V1oo(9~kmhF9yGszH+&CgxAGI+GQIQ)}0OV)V0
> U4r=3D
> z@+HEhOOnr)?9Y{XLO~G*d-
> iA9aq1{DhIGkzSyz(vC0XE;g}xAPUreL;X>>S^!lwo>
> zS;;h=3D(F{Nj34o03{rmMppr1biDc;xy2@Jxh0Yf`oQSxUdPZ=3D7B^i6SUc|Zoz>_p09
> z8z}>6%I2-eOiDpPRt~~g!uoQjz17Y-
> tHm!bYj*?>@k1)>dp@5d{d{UdqWbr$rOOfE
> z%ZcBDg*^ClB}B@Ktiy=3D>ZOr<n#zsY>Y)wJfv113Ss;ZP+2}E{wHga=3Dwk;h3@ette
> m
> z*w3$J7qnpRJT+!We=3Djp#nS7O&l%h;WepXUcj1o@HiVF%+%I&H}OVP(gTO~D
> 1*Ticp
> zt0G=3D5=3Dtu__+}{_IDSi?iPNMK|`V9B?$0VH~&ceGJ0qDm71Pu2>0OcFo5rPE4XN
> Zz+
> zzAt7t0}$G85Vov|REuF*3CYMz<f$5;q$WzK3`9DAE*U*5Y$8uto@L!w|NHu=3Dg
> )dLy
> z)x9Tzd>LH7K=3D}I(!Njp+5fiZy>)CRS8xw*xD^?+s8EXVUW~MtSxV5#_j<&Wow
> QXr>
> z>DY?&G@d<@-
> H8ba*t&HqVmEKb`nBuSl7ctS_&L*OU;~4(X8B62ShNI7<}JX2nR76A
> z>I}>bpMt4lCtxz0fQci6G1e~#z8)S-
> q;8sUmKj61AZNBFUM}9tg`Qp*!vIXAKVbr0
> zDuxSwm`FzWm;%tZZ(j`O5B>Qhe`8BjKzs%(>E`=3DlWTNEXgM;LfRmkTIR>T*w<i
> u@^
> zVJDM~hHbmiv|~Rrs6=3D%#J)NAfXh|f}iyAR`@>~vJQb*Y@v(xEGq>uI=3DHXJdLQ
> P><E
> zgBg>jDmilcchqPKEiNur8D3FQf%5WlEra!?g96TK1$jJo&RqC#cJIykjTajXNw9uA
> z#@@Yq!;PJcE8EFluG+#|pI*Jx8h;;-
> OMUn=3D&mOMu?A`;O%=3DW&{JZp)UwVOI~&6#eK
> z?xw~zL%dwn_oJ^dUV|`>^2gEPSb<(;EB_uZj=3Dg=3D<61ECJPky)$e=3DvB^U<?~NO
> a;S_
> zPxR*-_%i@n7h~Kl;I29uU#lyl$+l|36oil9)H-wm0tXDl;<-z4_}Ceozwkcdlk(us
> zgBi%Svu@{MoIC#>sv7q&xTD$5SydY+?VR+}y?VG|K)?RX&VCp^WGEumZ}`z
> pMNl=3D|
> z{Fp(Kvu4r4g=3D)sCO_*%6RKd7(XiS*2PDYlawLw)%jAXh9@2?}Z-
> H<*|j$KK2Q;miA
> z5HFf|?V7VB>}Uocl>USex(uPy5GL6e`W-pY7Xy0t;k-
> f(!dA7q=3DfW&?V+QnQR!HUy
> z@*SiFgM*2!i?Lm_mQ3(=3D?g6iEtclLtX}Ltl%$hoB4vrpe$K`j<qix?Yeuyguu~Ry9
> z{5;+{dj=3D;@oyF?NIEs<Xw<;+jNM@F@L$WVE{QUK77k?@Mjz||HgJ%o}S`P+P
> f^5uA
> zZ4)J1>)3fP72)=3DSsg~(H1|?m~bWONTx>N>3yp(DgE9DFrL-
> AuMeI&a&$@sy2JmJ&R
> z9sQV;?oLjeRa>MD)uz@m#g@lfFgUfQSofYi(a)`y`f&60(~hf298CMEjL}*#H@<
> $t
> zxT!dI_5%LLw=3DeLAZ$CwR#Cl8)9fxD>7x4FQp5gC5e~fM0+t8z@r}{j}P~$S5AV2
> f;
> z^u(%Ft2(ucU17A3<_;z)J^@3#S!4NL_C33cE?wJaJL#&fYng5?F>lLsd+9Ry)Wx$
> |
> zk)~yY2a}j%jdw2(Rnk0Eg7T~vDBhL(rUD@1Wk(HECaTj{);(CBm_4#XD&s}G!+k
> Nm
> z)TwRZ>$DZZ{v4c-
> 9y^6U{roll_~r@z?#fYof20h*e10GQ@ypNgA74JgZ=3Dc^oUB(s+
> z^YK*cD+cm<*}A#8VbP*RNJ~rWQo110lM|DW#O^7X-
> IH7{6tvlJ3g<N=3D)ceVC$m~`2
> zQC5EC;N=3D>KGzM}pO0EccF(78?Mz%Xj*Tiemr6Dn-
> %Q}}KUfOk8k{Q4=3DU&b2wTn(#|
> zE=3DelLzokrCB<qY{8fc|KL+WHl#_Q5;7pz_2&l#U|4AaJkWAfN>n8g0RuBi=3Dg9^A
> yg
> zyncdTw(r3&DkJclYv=3DH<Zyw=3DaUfjmtKe~axe}4~N>`p`K>X{hi-
> Om;TW{7O3PMxZW
> zmTtx*y<>*TzP&KNK+O;2`m9hcuwBi`%tUxd7)G({n92Q_9yS5fL&sx!h%gS*g
> UOh&
> zm@#G?rUr(<uV-
> J%=3DLAt@y9}n9c$;+l662Wdvi7Bk@2e)PvNk3OE5TQbb`FSF`MC;!
> zJdlX=3Dbijy|bSp--OPLY*Qa|OCmg}Z-
> X3XR)F;Df)MeLX5ab<M_&Rx8W+jl?0(b{rc
> zPFaN4`|I!zFCXHcU*5!T?qA2}ZAJL?-YopLOZE8lR1F$4A~7dCSgpG+S-K3fX3k{$
> z7^ljRxx@&P<+8fDyKNWt?AqPIUb27p9yB*JA~qrlCG6pAE2~h$Ak|cA$iIa;MK
> v00
> z>yW-BUbT(V-
> E~!By2^H$lp4}yX+{&@Pc7NVn%MvbQ>u%BQDP0`XX=3DdCvRp)K$YV2d
> z{Zzzj8E?DwPLRQKY;cHL-j&)bSt)XoNLBq#v>rZ-
> sWa!owR<<LoHic!&$Z*XFQ4Me
> zcaP(XZSi>17>94$vhe#ewfLtG+wi-
> ~JMqzpooK8q#fs(25y`eRMbCD}0La=3D*%k~{=3D
> zRxE7S*};igD`(7U@rfPR3)FH)vPPy(mX6HUE7>kD3Y!8y7frq)-55~ic6G;WH%pf_
> zGDEy9T*`{EbW3VX{Si6>AmV%Lcyz*v*o&8OLAncxqTjG#*s?iRTQbl~g|vhcglx
> _>
> zSFc{BN{S5bgM58CTaL%sqBy*&T!YVR*5k|O1bn$Y8DH<p#P_GF@pm_l;8%A}
> <IIjy
> zw3O$dv7#8cne2ur%P2pxR+GukYvIgTgd3=3D(YFV;wYR1;}8`W$)i-
> }>ZwhFTPD$>=3Dp
> z2qG8vD+-FRcKQMYac<+7?Om4`vve=3DDQY<%-
> iFjGImrJw0Je%ZOX$0+ViO#69D`iH+
> zd+PLYpf>}cNw<kNT1SbZ7biFo8#Z(rFeM1-
> {MnW*Tj1>M+)>*l>is<2ki2LL9+pSr
> z^V$f!s)@wQ+D-
> VRDG6VlsKwvjX~#d_JV18i4<Db!7gvv=3DrM67F;G$=3D=3DY^BtguMrs6
> z30k*p$L7`Rk+wA+IcXVPinj|uelcPetUz$jeiYA1lrG+}#K<zdNSD=3DN$#xMh(&eh
> 4
> z+*~H&<-
> (O*u9aDFSJDl%;4lDE??t>9>1V?Dw*<hLEXhR()w6SS7vv0Z?cN<rmn^jt
> zZ%mMk0W?7Fg&#N&{W&X@S+}&eJ$rP=3D{IEdm-
> ZTeS(&ykw#cI5)i^Yq^c)Z@5k1zJ+
> z;>&|M`0cg5__r4q@vGY>v8%3Bm!GDtf;H6Cs;gs4KC@n~nzc1+0f=3D3*0m(62P
> >_+;
> zrFiXfs77Ue5fWEMVyuTZ#rNruu4TGSx-
> HZDE9r7`nMjxG;v!w{<d$pZa!b7o<VO8>
> zEIoo22nL`RGt-Os5O4m_z(?Ooa5^SSCh_V`_!<un4=3Di1}R85)$ITOsCiv(j+wA|*A
> ztgb|Dj@g7+(`TrwOHNKKOJ1HxSuzQCDx>jLODaBN0G^g_z~hPyc;2`PU!SbNu
> dg4$
> zKR!5(Z?7G~-
> iC5j+f&(s%HX<tXG@2Cb=3Dh)93%1ubVC$L)Bt>pQQC3c8@ur&r<d&F<
> zyh3C}Zowo^U$x|J45sEx7x9L4xhyNvCEG>1TrW4o%gqaN6N4WE;5hIaboi41c!
> +r7
> zO9pm9U!pF>nZ?TsiQF|N?V>Dx)z{afrlv-
> %)s&T$sWqCMoE&6lWvk11B0io0NTIkj
> zD^{wR>WIMuP!O>g54LCGOJ@D&t@#`aa`1IqDn6~>jAvC5EK6JQ^{G01|G^>r
> &5c9&
> z_QpXR-
> &xJFl7g~=3DV(i)3ik*!dcqv~pf8UN)R27sUaeb7!pQt1|SFPCQ>GBQnaw|-s
> zz@L?6=3Dc8atGG=3D%Ur}%!I>bfRgtL<H7yWAgTh?m=3DU<i@oCwz1~cQ@Twv5(w
> q7w=3DQ}J
> z8QcZ^i0zcI$yfE9zneB~np)~@-
> p*RQbEjGo7Iv~UG}JLDRn@3ue=3DcW%+!hiYxe@bb
> z&4zEkeyG~I4*z(*5x;0j$FuTS+%H&<$Hi;#x+zu#;dN6So|J7+W$EkF+wkqB{rK
> &j
> zBlykTBRIFaRt=3DuJwzr~{0cdM%R`Ofwn$%5P>CsyezcNDIf7F%uB1I;OlQU4Bk&
> CkA
> zEG+O2QW<ZPZeL;qbGD0kx$#*3Qd91o67h0JxZKDV$ZqOwb1OlDpj>+DqW#
> ElGR(wK
> z(w}I9hDp4RJPrvCR;8w{u1>Ah3$ku6$ORO+a3YVTZ4~7GoLHU>!JH%=3D$W6o_
> &Ntyz
> z)n?o;jKJlD*?4#JSX@h<z<<xf^ZFRF6;JE7avo8DpTEBwzq)x8e|!HZetYjQt{!Q|
> z;kGvHZf?b)U3+n$bvLTmQWm6TAum1!am&}EG&5I~8JqY_O}tJ?awf{sa!{R_j}
> ?PM
> zG2LpDZVagMJrW(#t=3DiwL$xUinwhvbK$jU97B3^FclpB|2Fn63&nUS+XO~fR_
> Mf3;~
> zK>Qt$vB4}}UL>W+IE7Rj8XJo|mLa*jOlG2T_pn?-
> Y+{#ETg^#UU4xn@$iSH);{(gk
> z#8DyGvS=3D=3DTer7vf*KWbp<b^n~VG@o<jKjtF33w+i1Q(LR@nUBxzB*iiFAo*sX
> YCa%
> zMQ!-yt%LZRdx!A5`$zEdgX3u5w+FQa<tR(fL4INyic_<Yxp51kW-
> dl)MouU3BE5v$
> z(v&Qe38~qr&n?D=3D5tA{?$yQ<{+qFz*ZP&$%bjfzP1>eYaxkFr}%il-
> HE&FooelP>@
> zwz-ucXMqZUWVmGiND@Q>9gy<mC|;{$+L++ox1YMiCwC6WN~HAZB3st-
> <&vXZVwB5`
> zB3|7@#X(v+nVI2}F>z!d?(V9=3DcWv3Yk+cwpSBIl!K`096jzY!a5FFV&37_rBz^_l&
> z;TOj%@w21(`08W<zJ8|)KYPC(zqqmuzrWLlrzfirH)j^64hzJ>G2^g$+;l7s2*Zkz
> zlTe<XixLJzWjw`~n#7lzXeua0Y}g#kb<r}uLpn>0{Bem^Vr<zi(&dlGMZEl7vmst?
> z<CnjC4rKt|KDW}&0<{<?87|pBhK$x3WkSl6HhQxIl5U8Dv2jm~bVqWl#*9f*us
> JG5
> zEsV(p_Uz0|<WPDZCt{l;HX<%&v%0u0cRol5Bim*37h+0~A1+m8;CDyM@v<x
> mml=3Dfo
> zS)mx;-wUHSM&vA-
> h)=3Di2<2MH~@w468_*}+?18I1DGy|U<O~vO&)9}s7O#Hk(4eyt)
> z$Cl|~80#)~YxKfct0$HY4O6wfoM(ne7YyMQq*AAXfoU!*L(0^pSlC?~P;JufGhH
> h&
> z+8?H9(zQR&lE0ylKVXqRWRbrl8qaw|UwSj<SLQjEJeIRS1z-
> RLOZJD6P!eJyn8;Wl
> zEvO*kWlo^2vD;?FUhW?7A2JkUM~%j;iIcHn!6HPhU5}Kw1Z-Ltf#|gxcot-
> L+=3D3z#
> zqtes_oX**RFL!0(w+z7dhfDG8fdbsGO~CfeOOdc(5-
> K;$$LBj!@cZNW_{Gsed~+lZ
> z-<;rCa6E@WV9R<q311veVTnq{ug+%T<-rWJ#;wFExvz-
> =3D=3DKBVrBrXkAnRyIECdx?#
> z&wxsuDn%Bm`19=3DyK+gQNSn6t&7|C=3D^ydhowK0*_({jthMUAp|OoFQKRhAz
> $$#1__5
> z&7~aYR}vK2%2^<bbrxwqCF{qNaVEy<_?t3b#2d>IvNU1bo+0Z+vTE9!cscigF9Y
> J|
> z?W3*+$pwiOa~Gf>Cs&D=3D^%$9*Ufb7ze}1PPzdTsNAQa%6!)5r@nFjpsOf`Pp
> UWGTu
> zDwyG%16*jp-+j=3D6-(PFR-
> &}6O_ZKSg&8b|xIhu~o55#k9NWzy4z*mP7@vGCB_|-c_
> zxYd}1+}TsGz-
> Ktpmqub+aRqC95o$TmR`YDAVo4I|)$D+(xvfdcKy!WxN>*&bDtGzg
> zlcCIZZ7{WEyY@$j=3D4_9laQX8s`PME&y!<hve6!bNo`F(b)cndse~Op+m7EDG08(
> Nk
> z+r!C32PTj}2B523@4C7tMwY8J<jw)PfGy9lV0P$46fywnE;#AQ(=3D%~pS2cdejQ+
> eK
> z5zlMm@p3zR|2_G5&GF#Pz9N<ujtyrU@a@@pe0Qz^zhEG~J5$As&%>v?lla
> _ZKF%ST
> zc-FiTA62i!^KFs%o+at`ml(VwIcSYuhRq>Uk+CEK6`R?qCFh_qs}Ri`aCa1xVMl%`
> zn)8a$lvRM%;&RkPCSkotfXaBI#Aun`m2@N91J&P48{*|pdgbq_r&;^j&8GyZHi
> A5s
> z=3D0~ofSfm4zjGs!T=3Du9>-
> iUBY(Uc?)h@oeI?i!^f0!14AB!G~wX#K9v_$Qh~n%NCiD
> zvQMwc$wW)+a<s0VigSs}aIZ2J&zqC+RNBsM$#}jy7oV{8e7+|S&vs?wlfAikb)X
> 1O
> z*cCnCB<+(UmH7Pp4!l0Q4UhI@;ab^BJgD1%*L#!j-
> H9Ch?qV^1e!39nvNs}WY&cf>
> zjzr|}@rWNi3u)ntkvDfe%2&mrHYNqlNx9gSSB7H#EW%a$Q(LomDKUn0`D;-
> TuYDzh
> zh}ZsxTExpY!^j`C%Qp(lWB??&2fYPpe&j-
> pMS6e9_L*b`neIR^1JL#LQ|%&+{hb1~
> z3)b58Q^5_R-1{RZDHUb;g(%3#*8Z3-
> F%@g3&cb+4Ps|%M1Z7KR<5BfyT+dpBmbEj`
> zuzD^IC9K2;Wt;G@IRPJUPsD@fBwVl9fLl!ocy_88PmkB*>9IPzY~O}YPF6E$Nq8
> w|
> z2l?_q3VwMy2fw^fg!|i)P(Eh{ma)DsaT<hG-
> C0_C1|ZUNBw~C*5I;B^$$rzZxlb@Q
> zI%(g^Wv=3DV;2kDO4Zb+AGmv0e}uW%6YS?c>V#$c|sU&ma^Kqk9_JeJa=3D0wB
> G<Wcpm4
> z*$#wRo$X3YXX*Br@kF{@O|rX`=3DiCbmf+woG=3DyDSn2u}UW^9m8YU?tBmS^
> DjbIsJzq
> zV`3OK1r5iHKHiw>;f=3DXogRtH|5M>K^mSnHSjjDCHT(Ssvc4y%6iF!QX{NTZ%a(s
> Na
> z5})x*cy%ZrA2&tg+4ilRKWxRPZE+kMQt<tm9DI5(4f~^(BAT;ZX(!jR&TH-
> CaAv!$
> zeH7{Tb=3D|(i*k`*YUA{*{zE4BM%eOzumzykL0K~1d_y&^f#$zc(a*5O;E$B3|Kxe
> **
> zd1L|uU=3Dwe<J;PqQ?J}O+EudXd(!K=3D4xM)49n<v70dt-
> {XKbDLRNA#SfSQR=3D=3DUwQ0{
> z@lO3Pp?g0}bk^3{jfF7z;=3DGw|K3Fr*59#ALM_`+JAU6T08q099z62k)@4#p0n(*
> RO
> zBVL`V!$-9dxL>sv59^~?k~ZRTeFR>$Y{u7z6Y=3DGdB)pfq0a=3D0LvCe6j5^vOY#}Z>3
> zP`k=3D@t;`tG<y&M7@$xmC^3`pNtX^s!C4LQLqH8>s=3D0^oUCSOv1mgp=3Dtv4~7!
> 06J&8
> zcB5_QI|Xdg<!=3DFOSCq6{*9CQP!-
> dja`(b=3D{?QaVV;l`4$wicuP1&%BWsHFibXQ<r<
> zV3uoNq|RQBdJde@$+WVp-
> 9Nq)UtQXZ&(62vVQV_Bmn^}}(&f0xap6`u$A+4<c+nh%
> zFZOO_8=3DH(r+hWl$a~5J;MZUi&+l{(zKcGssr|HtQY&WEjQPSmmlnn9mov8AyV
> oMnS
> znMX;BZy>IX$5M*iBmmNaO6gfiR*>ZmOk)6S_r+*;Iy*`??i4Uzuy(w5YQBtTyS
> UMh
> z0XCL<wFNL)>ebd_v~?KyvncZd*j&D5bI>$2W*4A_lPqZ?>(g@Z;M8t>ckKY49
> xB7N
> z@>RG>`5!U}*U9b5)p%IDo?TKDUhm$5uZ|?(_5MU0ja-
> 4GexsTF0d{p=3DzK+MJ>muAJ
> zF(O^QDNGX{tiC-=3DzRXI#O-
> !WAH;c)4>d9BUtzrOV9%W!mbY&~Z_#k&^Smc)r$y&08
> ztaf0Q)kW3y&UXsfE?C=3DVy5nU$`)j9;YwX%(Je&AVYwT9-
> Z;)lFSNrqWfmrP}0(J2j
> zXrTCplx)-
> {WMWTYDZajW65m|hfjc!3xKX(tx2x9U4#$l<RU2@>CK8Y8H?q@;!iya-
> z_-r@J(#d3eP!NUu!4nW~9ihaV>$-e7Rp(3>@rLveC0)Kt&k!%)Dk)!bxQ2-
> (lUoCs
> z<QhoZFXMm;fc!v8PlV2T2j*G3sk&}typ$M2`j1^ZwOvuNl^Bt3D>3G5w~5y>U
> 6U?L
> z0>-MNZCPL#9}hszRJO3}<r|Z-
> uq`DA^@*8yuWdVieg7C<>`unRhRwKN7sHu#6z)|=3D
> z;x4&gvk{LtE_~d;v7sRnuUa?b=3DV#OKv^5zGVY86z5=3Di-
> @I_kQS?Se?}ob91Xx_q0Y
> zAzr@TQ@&qy0|OxQD8W3*H6F`2AonL(WVS1%Ct7Et1B(~{;}(ssZqJav1rzb+Yp
> 1rl
> z-rtn%nslk_<||6(G9x9%c45P|79-07=3DCznL(!q4|!?w-o90N+xl$4F8#4PN}F2T!p
> z_v7pHMR>U@5s#a;;G?=3Dt6t4y09=3D8wbNX-
> U3Bu|@SSd!xK%X8`Y*_m7%S+)Y1t`dMz
> zD${=3D|+m(2$O}u<>wtT^@e3y2l)tlv2#!wAoqAOcL#sj%I%pwtz(i5w*nQSt#lm
> Y1K
> z);n{Fam;qJ^sY*bV{Ml;cH7FMO}eqhZY&F!7r@r@Ia@r&VCU8>>@TgxzM@L(
> %PK?D
> zqSg51XfeKM=3DR|H-5}q&!4{Bo=3DfQ`6Y#UOBdzbZln;c)}Y(au=3DB-jjfzw`btjmkV$s
> zKNgkV6OrdMsw2}oNjGJ?NSBN^#LHJa%U3-
> |GXT<E3g$_!feg?p01}N2Bwi<uY&CFl
> z;^5rFuC|+{o3q`JZZ0vl%Xr!!b&L4UwcRK)gH(TRTY1#Jjl~czOTG59(-GVbLu|Jo
> zl!dQE!;($N88!p4Zo_eC&03BH<#=3D^C120;WI5*gek7}ZEr!oR}$~WLHxA%EQJYc
> K(
> z@wQEPse%xPuaBlM2r>gt!`|@uDDDxW%8Vi1Cf+Q4occ~}L%e*+`F2Y<lUX`9t
> -~}=3D
> za%C&X*ekb1T4WL?r6z?WlO)+vyumsKz{qyvg0;D>8{#`lH(yaQx|q(=3DwUtNPlC
> MaY
> z3mcu+VvO0T*0am(RO{IT*hVrCB%Y5G`LnG4A-
> GzQh;Po9;^n?HJlmPbAZ(%ZXxwH1
> zZgVz$w`wELjA)(((Ri{g1}|H-;Im!vcyoYf!?{#^doBwXH?Bc-?{TPf3hOf4JBy#F
> zzT#iL>OYPFm`8uoVG5lmxUwL}0LbYPLo!IZz!#Z`WB_a>rk|a3qr^zh{?@u~wO
> zE9
> zub_O}I=3DkZ)B@r*ujpg3XYcZXd1&sDF%_#`gBc|c;j%>U+Rmed(6;F30;88;?%TJ
> Uo
> z2s{%$s%3Z77=3Dx$Hu{;wvd)}=3DD;b$jO@XL3z@t|}QcKOXfUH34G?^?QKydl2TG6
> `)Y
> z(K-N&=3Dx-reK#Ym4v6aEtQvx8T#TJswC*_#P)`_vYnz|S-
> 3b(&K!zeLYrrTdTwMqZ+
> z%XqRRph=3DgRsad*Yx0da)Bp}#kr$PEe$=3DtJ#QvJG`p>`jQ-
> BTCglLLA9{8$d2wWZ+W
> z<~Tg$pnSJ7k`uJ`xWypc;h6BCK86E!EYFm9ylmwhVQ&(Hkiyw>Dt>-
> G4WDu>IWu<&
> zn)`$+`66C~8`4`8la%~jmdV&nQW=3D0{^tY5O(UFO*F~OD6uL2<TDS^K%B84QM
> 6zIs~
> zEl#d_wrk?et)rIdT8YuFoodqMTM!-Z6tG>!vq{%VjJ6J=3DiI=3Dq)TZu8&ViJf*7v3ga
> z_3T!oXV)m|6^iyX>+r?#LVR{83r|>z9yPKQaXe5#sEEK#ZtroBe$*I?Ck)WD9SlN
> S
> z5<c6Tj5qsJ@a7-`!P)cIJR`1e-
> GDv5GqA&XqLOZ8`!19Cy*e2Tz$*G%Nml4A7wCH#
> zk<#B!0wDD$g}*2xrKDKjmN@e<Nnil9Y`4Gl&Q{ko@kU)Yw~n?h#=3Df@Oml(&
> |ZY+SA
> zvt5&}EeXg(Nt>Z+v(wQX(j8~0vaRu%gsZ7r@a9ATUhYZbpc|)_vn2?(DgVRr2;8
> oY
> zQthe)N6wNbI}`ANS^p{L6R-
> Cq@r;Pa7l#r#aZACY;>|b_x&XV}CaVC5^gTKvexGFu
> z_LFR<fmlnA!Wx~`I;-ehx+D3*M9WP6Kmt&uQ(-
> {)LW+}HM{T#e8L6XnG~b?~O_bg)
> z-
> IncU=3D~8BF*>1l8X4G}FbYq69Ngvb2vOtJx9TnCPv;@w=3DN0q7g;zT~4vlKm&u86{
> K
> zvHV=3D)cyOz7Bj*S)DliW?SU+suiYGi1p0_5lO-
> ;Zjt#Np@D}iT40=3D_<;hF9B@@cyEe
> zIN&v%;wMr3ln(I+$U)0gwy^^dL4Of+xq+-Vv5xYk^s4}{7X6=3Di{;-zR>)RT>uvRD2
> zxu;!iH%m8XduQqPcM6!ZU2415#b~wNob8TlF(Te9-JI=3D?(v8`vF+-
> LA=3DYde&eJqa6
> zSkB2A$AhD}c-oST2RsvQv-
> Et(v*1QWB*%hi27!~dy3P2AXTn1U;_)^Hg4<`?<Fr7u
> zNf46o)v+{=3D5ox#+8;O&{=3D3t+*CSSx0he!bf5KVtV6rFC=3Dk;jol&H$F6A7nN3-}sBa
> ziu`S)kuT`L#ThvafZU?-
> Qzb_0*SqRsY}szUxS>hcYP$@mT8S~%Vt%^Bh;+d=3DQF4&3
> z`gPm?>!yhV=3D%uJ=3D4#<Ug#qr=3D{jt6(x6@AF^^C4T(TkMYRRL9_M?Izr-
> XSdYAv4UGU
> zE2K0%VZfeCY2qOL>Fz|lIVAThrQ>n#W}FLMh=3DbiV@rM=3DDSjv47ONYW{dflW
> Wk0l74
> z9sj^V_|I}%$~PR9|16o`!Y6MxpnRdg+1;Ua{PDW}ww~Q6F-
> Ep)T}+Uk?Kbg_+5TfC
> z#(ph^(ycb>juWK@{%p_CS-6{@gfC7O;KklF+^5u=3DEJZgs9^Bv=3DaHA@kWhn-
> ?S&r`1
> zZsr-nj){-
> &^YH@)<1tIu6P^{%S)M*=3DNmS#54ARfax8S`=3DOL3&fG!=3Dj&3_uwJ5KoUn
> z9Fa+_5T^$qgaP18_<vg5tk!emtkyqC2eg|{+(lYR8|4cn&K{I5B}VQPkWBxv+cU
> H;
> zcr^x7O}g#csc}Wgd>PMH*Np`*`}K8Ay0Ijn{V!BB>H5r6N!R}WWtw#D|7)i8>)Q
> YC
> z%;?#h*}a??zXVU})A5?E>C@H}+-
> uy5TQVL{_I1j?&LG_6*>Fn*Lx0Te9SH=3DV_mCy(
> zW1bOD8I0!~D?Vw7;~<@g=3DapOV{uBnmb-
> D^dB?FK`f5~*2L=3Dx#YNk;}|f0lkXi{<y0
> zZr!>i47FPSDVjeN`3J~ezHkrO+sy@)41i?1*0Y<XOQvi6y7@Amt&4HIjAvZfkW7
> F3
> zg$=3DWGZ7n8Di8rJR#&W>hq#NRmWdWmKR}&@INw_d?6>EA1ULDB9<LwE!!
> !mP&@`dY_
> zEJ@{&xK3_xaK2Hokw4S6Ql{=3DQ829<S2OKXRGH8z&lxN#wIai3o(~4NUKUE7tH
> OGJq
> zI!vQaA(hC)R#q2ehCI+}{a-
> E?%SRS(Z|^|Xq9@awtUpxoNk_;bzVIM9!~oPX0On-@
> z^X(b7i`K^Mw6k>cWjsUrk7c`U0nEsDO}e%Yqy1m{%+j?5Fh}X;iPEHwNm3iz#5
> VqH
> zug6qeTCol<cBFBZoWjnBX8~p2;8-
> B?KPcUR4@%bKT3Li@Q{`tG5h@Tj`S>=3Dsx4FH`
> z0sKD4k;k0Oy=3D>)JQN9`PhA%~3k3q<x!)*G@(vgX+i~({9pdZIx7bmA$OK@;-
> _nuBp
> z)qYmX|0A_&51)9FFFYnN0Q+2epx&hq@k9e@?ABM&)U6-3br-
> zQOt$yvui@GsJ6yfF
> z^~O$DA4Q9sJ*{p7I%rc2#IBwiyL<Zn2!lG<WA}J4w}aKT^W!0kJ%Ss5Ms~Rk!U
> 11@
> zoS7Deb92JbJ|h?>rj5qYDI;-
> Y(nuU42g8FjCfT<8!vhujCUQ&mO&FmuQRBemARL-L
> z3T=3DLVsOaH=3D0y@m6&pc8<GU-
> >ACggHtPmAUAUcFprTI4@3FSp5kEY{Cty*igqJkA%M
> zCG8A=3DqI);A_s}@)+8yn#J-F?GGj6Up-
> BZWiO>w4IPsM2ucbp+=3D+gszbL7!e|ci^<A
> zhoYUFGI3Jp1UasAOy{VHBRYpn93%%E*vHS>tFwpf7PwElNE>P8{<e^vWCxF9
> J89-|
> z2~9lCM$*9Jt|xVLP)i@xq>64T>8XO0(OD@ep~GS#liETOLHTky($i}FV>hd{B_J
> T6
> zj|#wm0R!B-
> J2@2%wp#vqu9Fo3gamv06@1Yda*=3DOxo}A;Gp5q4y=3DlNmh`N0bA#0Boq
> zd2)d}sNfDOcmM|Hd0+<TWXpp#bIyQ*&YC#m!2jPM8NoTs&p4!WkQ^ZUxj*
> }K_L4o^
> z-`!-Fz~g8oEj+HBWCxFPJ89-
> |ZzD}~&`2K*q>gTC>8XZP(OIQHhf>yMLMxq+tp5zK
> zTL0>5wLa;qWxrF$|5JXbckdDI&d%+_7@fs@ay4IkmTz*2yvH}aNZ#Rxyvq;M=3D
> z({+
> z6T*AkDFt^@c$Yi<o&gU;cvs*7+R;borMRf`j)@DDCY*P`9H<`+5Z~h@IYEx=3D9M
> d_<
> z&p$#AlS4WOxsM0PezK4IF6`m)>?XSe9%Czyw}tHB@e9p#v5j7uNFyE9(^oC2r
> @sbL
> zO_$OIO=3Dn_D>2bGMe%;N<Db>r%%R^<q9so;txTRa)zOJ)+IXT@7aI*gALcXYo
> Z*Yol
> z_5t7cD!IZBxlAtcLoe~eFALlm1$R!t9lb<kdzlAdaES*cT-LXjc)(`f*LhE%Ai)TZ
> zIY35`F6eZ1CY>c`bX2+Hd!90JlAIvNxgW=3DLj*=3DtfF!%KkIVkWL_LF@)uDt?}b2r&V
> z+IZ}(^stlcpp)(N(@eJ0mqO%|E%Z2r@`sV$7VAHDcX6tx{6SQ%ysH2hLGbmp^
> z7ZU
> z$I{+TPIrboS^s?+UmVXj*~K@Mv*1H=3DgCBOCA9_R412@SH?vQYkJ9$IrCU@N
> 61`o#I
> zrfhkj2G?~yG@zJk4qP?yfzB13%cQFyn$NV0eBXC;&XaRGXGzDHMcM`K?@68
> G?yfk-
> zV>v4D_znv^-
> b3UdkAFYeM<0919=3Dh30+I0Cc0I#LLaTGt8ldj$t%Rfln_wL<$1XVj5
> z&N~92|G+w6fW^H}ANK{lT%6x!ulldS&Q3op;G3oKja&HvG7iX@AVIiEZgFRB6
> Sd_I
> zD!9XT@IY?yfP~w!?IrZ=3DKn2AN#Yj-
> P43Gm?bv`h0g>;;0e82ZeM@b|X$vfl%_v1YG
> zM>t2$k~7>_X)4;uDS^jxf*f~cFnEkd$q^p+VRDEb4v>BHvWqm)Q32UV@shkjl
> <#A;
> z{>9Z|`JOFjjgL>CfVp!mE+*gh0Wf|T7#P^Y$HynEhqH5oht>M^5ND@92D>=3D_
> Wx9*=3D
> zUsv-
> 361uw}pC4Gk53eRQ+!^Tvq$8;14hl80brW3e;Xyf4;|N7m6Jsk>nI0Se7Akcr
> zOqA=3DC8Sp(zNr_IeP7x^-
> xL*Y%Unh_Ioy+~t(a9!RJhn`M$D2XYdHg~O*+M7ln56T`
> z1SV{tv(x_>=3Dw$uhboYmDR?AJNZcbY)?iL@abuxQa|C!~R;jf&A4eQg_v%lx6?%
> iEZ
> zyE!}k%G<^He-
> 3wX{`1IgE`JT>hmIxV84QC7+%Yo~dvxy%59YrFCA^IZKf!ndzK<j0
> zx?n8#%OK1|D33u15qNyTI%9a;qjg47`Uv9Z;{3xPXQ#h-
> IXnG{uKwBC$@;>@#if=3DL
> n-SI<)3~{4RN5A~fV)=3DgoDXCy(JGH<a00000NkvXXu0mjfP<jm*
>=20
> literal 0
> HcmV?d00001
>=20
> --
> 2.13.0


