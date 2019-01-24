Return-Path: <manishalocal@uda0393239>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 314EA52968
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2019 20:05:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0OK5I5x070526
	for <meta-arago@arago-project.org>; Thu, 24 Jan 2019 14:05:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1548360318;
	bh=BHSEXvqsx548Yi/4OEK0iPUU/hB81YyEW7DXc8UnKcU=;
	h=From:To:CC:Subject:Date;
	b=QwCDUKot6LoU4zaqCOTUBfMslyVou/+plch+695HzgdHxqabZji0O68UassdhHotq
	iigeLeFQOQUBLhrZkGbXMG+z5oF5NNDwIAV/MkYtnQOStDncbQkQrUYE1qGyCDhBOY
	+AvbEEFfuwR6nE9BONxqq+h6meCXcwNfQuLSGKR0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0OK5Iix042716
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 24 Jan 2019 14:05:18 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 24 Jan 2019 14:05:18 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 24 Jan 2019 14:05:18 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0OK5IQF002412;
	Thu, 24 Jan 2019 14:05:18 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gmlFW-0004Xg-3H; Thu, 24 Jan 2019 14:05:18 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 24 Jan 2019 14:05:15 -0600
Message-ID: <20190124200515.17424-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH v2] hmi_apps : hmi_mmwave : Add matrix icon for mmwave Gesture controlled HMI
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
X-List-Received-Date: Thu, 24 Jan 2019 20:05:33 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 hmi_apps/hmi_mmwave/desc_hmi_mmwave.html |   8 ++++++++
 hmi_apps/hmi_mmwave/hmi_mmwave.desktop   |  12 ++++++++++++
 hmi_apps/hmi_mmwave/runHmiMmWave.sh      |   9 +++++++++
 images/mmwavegesture-hmi-icon.png        | Bin 0 -> 17756 bytes
 4 files changed, 29 insertions(+)
 create mode 100644 hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
 create mode 100644 hmi_apps/hmi_mmwave/hmi_mmwave.desktop
 create mode 100755 hmi_apps/hmi_mmwave/runHmiMmWave.sh
 create mode 100755 images/mmwavegesture-hmi-icon.png

diff --git a/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html b/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
new file mode 100644
index 0000000..6f29bef
--- /dev/null
+++ b/hmi_apps/hmi_mmwave/desc_hmi_mmwave.html
@@ -0,0 +1,8 @@
+<h1> mmWave Gesture Controlled HMI Example </h1>
+
+<p> This example demonstrates HMI control using gesture from mmWave IWR6843 sensor. </p>
+<p> mmWave IWR6843 sensor sense and process motion and gesture data and reports them to the Sitara device over the serial port. </p>
+<p> Sitara device parses the received data, activates the HMI when motion is detected and controls the HMI per the gesture recognized. </p>
+
+</p>
+
diff --git a/hmi_apps/hmi_mmwave/hmi_mmwave.desktop b/hmi_apps/hmi_mmwave/hmi_mmwave.desktop
new file mode 100644
index 0000000..f77f644
--- /dev/null
+++ b/hmi_apps/hmi_mmwave/hmi_mmwave.desktop
@@ -0,0 +1,12 @@
+#!/usr/bin/env xdg-open
+
+[Desktop Entry]
+Name=MmWave Gesture Controlled HMI
+GenericName=Demo App
+Icon=/usr/share/matrix-gui-2.0/apps/images/mmwavegesture-hmi-icon.png
+Exec=/usr/bin/runHmiMmWave.sh
+Type=Application
+ProgramType=gui
+Categories=hmi
+X-MATRIX-Lock=hmi_mmwave_lock
+X-MATRIX-Description=/usr/share/matrix-gui-2.0/apps/hmi_mmwave/desc_hmi_mmwave.html
diff --git a/hmi_apps/hmi_mmwave/runHmiMmWave.sh b/hmi_apps/hmi_mmwave/runHmiMmWave.sh
new file mode 100755
index 0000000..e961eb3
--- /dev/null
+++ b/hmi_apps/hmi_mmwave/runHmiMmWave.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+/etc/init.d/weston stop
+sleep 1
+
+mmwavegesture_hmi 1 -platform eglfs
+
+/etc/init.d/weston start
+sleep 1
diff --git a/images/mmwavegesture-hmi-icon.png b/images/mmwavegesture-hmi-icon.png
new file mode 100755
index 0000000000000000000000000000000000000000..e9e19b9b0e03690014dba299126b06b42536eb1e
GIT binary patch
literal 17756
zcmV*|KqtS6P)<h;3K|Lk000e1NJLTq003YB003YJ1^@s6;+S_h00004XF*Lt006O%
z3;baP00009a7bBm000*e000*e0m>%xKL7v#8FWQhbW?9;ba!ELWdKcSV{&hEZ)S8L
zPiAImV`YEsHE{p{MA=D1K~#8NrM-7_6=#;OeU2nRLI?yx0ud!45fn%w=bW>IBoHX)
zoO4EiByvt78ry)uWH7-*V`JmccDvJbPtUBG)pzF3o%!STH`8-(_ig{a-+rq~r_PbE
z=libLdR85z6RMuQYrp$_t8{Du>YX&MIBPt00lw_U$KB<zh5tR}_HX}iYuK;8zP0&_
zC)dtCxpn3HhaX)2ck%<lqbry2@QQ4^=5d!?>fmF=WgX++oq5v5&y1h{-*frDfc}}6
zZ9IJUB5t2O{l9LtpZMGR7f)XO<lec=?_Rw-`up#%bQgC3tTwlXYx$YRTLK`|JN?5y
zTz32B^Xub3dvK-Z`Sr^$Kl$Lwe}Db{d;js->GnUrI(XoRSG(Hq$<CdMS1qKq1)u7C
z*4B#GiZ*=C=V|Q17rQmykT3TLyA@xV_<FC#H=WpnpE>Yt7ksDK&Bq$@xC6ewJ-hH7
z_oV~w<9FOw1@~Y0wyg!<@|YAY!cKg<bBE$*Joc~KT7URr&z`@$+`IQrcUxQj?aGdZ
zudnQB+<WWv_PJM1wDi$s>z>~l03!%+zH;S?^V53=hCIA-y5PaN_Aj5EIs5OgjvV>n
zWo;cErljI_WF&5^T7{d-m*dv5Ww_0)aCgND+*`R4_xZbz$b;3Z@o>!=JR*<RuEob|
z*Wt-JvVJ|Dl4lz>;8{cjo|6}RPvIr`WaCD~EAnYnl;SfXIvTH|qlj#y@wv_y9Ykqc
zKKG3ozE1~ye+55N_>%je;Qk12xPNcBuL|z>8y>?O9?KU3k4?ej{G7-8Iged<EkEPy
zzT6y(ud}l7x~vShi;MsBSX%OL_GBjP+?Tm^Onv=ERuqxmDFDU~wE)PebN%eT@z)Nw
zwck5@_`g5jyAO{F3-RIl4Y;&m0WQs*tGGOG9<I!vj}Q2>tK{0kg}A<G5pIy1OP1gk
zxxI8L?vT6O$$Q-4`{X0;yzqcK{g6E3fjt&@pu!U#wD6QX6DUG>&fvY^L7I7~^NAyT
z?kmMw4ZcqY{0s#@Q}|TietgP(Qg9z%3Ebyb+;;_!<r87?Vtm5mQ}B3S^0;5p!3%*t
zUeL=Y{MlzK7?9X4c$S)m(@{}>tXwqzcG<e+%Ues6JXn=F<U0faR%U+pcMdd9JKa=s
z<3{Vw|9DhggKJUIxWG3*H*+Q~%$b9WeEcpy<bCeICGN;&?$j0X0eA2!clH|jkOy!>
z-~rtvw|IcJd7yX5T^_t}k23C)k0|JYKykt&W})zyd@L|Kg(o^s9Z+WxdG5dq1HOmw
z(tw|#;AeKg{dmcJ5?*j072M|++;`z6kL88HpuFJmJr{Vq&v@L==-{b9Cr{|+2^~F|
zGaJwNSOWZF(<Yo>x$@5ip`ou6ri5*bT{fk+IS48MGFV)>ve9{8RsQ(>`PnxvRaO4)
zTY33-hdXg{#tgL2oP{%d<FkzPIeyRu@(#JkAiT>De~&xzKDoplyG*WdN3U{+g=;*3
z56N}DmnvHV5A+tfP44jE?^1%neaaC&qO1od9_l=zR5Ootj6kVi@p+Cs<$Egl86EJm
z72FR6_w9+meSN}xR`3{}k|#W-Cp<RcW6J-S$NQMauAqm<^zn#(gol*>VD@Z0oHa`e
z63@o=88d%K8sPoKs=%SEBO|A|iF0!Rto14Dhcs@DX>ZTW`qQ<vbevwg1V^S%!*OQ*
z3Ccgk)2p4F<_DZ1XZeBW_`w&r1MiTF{Gf~6vG=%x!X@tTW$w6eg?zw+xyl2(#smD2
zTo-uIH^@y&5N=V*ZJj%mbyw$}K#76`#u3LLb->pNj|9GF2mCArKf43&kAnO7i2JJG
zek*t^4|z-q9^*qE>jQzu{eTWWq6-DRd_?*8>FFMw-D3dm(%&OK=VQKh@8~f<tn}#h
zc>0imlQ(X(I7<-JfA#h8t_ACs=C?#f{L8zENjSwP@1Hge2bujx_$Egg&0~DS<9y?j
z{E$<mot)-}p5dFH<&K;q=ebiCxP$NT^%u#z-0}B#0PmAa0uSmk5AX{4fCnpFCD$lG
z_>fYr>)fCy;U<y5+@eH50^^7gsE%Oi+~@1ee8l%v@UuGL=L`3_PYUj%g8QrBG2G{|
z2={nw_jrs79`8LK`&~Lv(8pcMze7jDZTh-RZ@1|07K0$cxjkz(D!qOFG{wc`M5w#_
z0IFBj$5IlrY;5Y}iC-OIcW{zBv6u3N{e0m8zQG~B(P46gZ+eU$A{^%%p5O<cB&WC|
z?cAZ$<P3N2EO+!AclbQHzyo-PT;##LEAZgnBk%KbE|JSTc;O0Vd_b-mP}DUdLHUsK
zuA49dW1s@m1?p_#>pS54-Z9{3cEJ6(&3(E<WGfxr9fA8Tjf8^7beqSf;BnsKG2h~`
zE9l}Do!q2&;RZe3ps(w6Cw$06zE1A)cjrPv5ZR;0e+zPV-$eB;s`hUP9a&c#9{#7J
z+?hRmLF?41*gbtZ_V7h}7=(TN*#W-cL2`(1a+n<92Oi}IAL9-j7q~+wxnrkDJ9o03
zJA8(m<<1M|crX`uQ0K`zJjjbgg7Gd7{yl!~`#LHh6m*HmRswT{@+2Sz=D?`n@Nrk%
z5cqm2bq2;bq_+I*8v^%3H4NN0)jV)tZwlP+>jIDC29HU><GaCQz0PA+(7}fSeO#lL
z56Lxp60XwQRr>pY9zUSZ5Bc~i-In(6|HBv;mzx0r1AHuNXNL@3(x><9hUwFP*uyv3
z!ORz0_@Y+Q#ux448|@~0_@?{#0sF}Ta*)qI#1B8r9XUdda>tHw2al5z+}V@l6nDOz
z2XR{9L7gFId64G>9`t!~ff5WZQp~$1-lMelO-Nvj;9RC)K?TVHIhz!G4=HmU@H0B#
zXDhfbs$mege?~WVmHV#Xaa`pwDR_+1dMkMB(u%8=oIb8F^DhhZbeX;`(cL9Fd|zMy
zE)faDz7ZoZ&&B1Rd_3INSV9JR#;xhu^Ix0!r0t|}$`ov40Gj#4?PTXf2Eu<@2W<h<
z(Mn{i7@-r$U<Gm;Gy}WLj3lENL`O!?LYrb{2d!iHZ_+wuCR!A;&=Rb}fA25|o{61g
zM=<wUr&$;?9ossXhNj@@XyjI7DjG=r=qWmrQAcVOlTb4%95tiEQ9WuRs&p!Y#w#j<
z#-UsY9E-BRFqD##5ke@6Nl`!u2}Ys+7!;6vvUhwqF4Cuh9^awUi{w2%J~ehMqI>rI
zlb5sgq{Yw0`Tb2^UjNz1UpA1s$&=B*)1;A4Y?2_1;@M!Cgq@af>>%4M6S2)QLD57S
zE#uKZ>Pekt9BN4oskV+qm1Qg{xvj8-p`4UjLQz7BNs%Q4g`|MwTY`~Gax7zzO)@Q`
zkwMZeqmW8cEF+Oj5=nw32=OG&5{RuNmTb0+z$Ox72|yItXz@oR*+AA?{IHI!u?)v*
zvdS_HD=b5?+%g2qEQ7JcG6;*wB8x8;koi_$%(D!{Tr%4-0JF$Uiw~xgX=JL!8&k+6
zOMirui54$RAmhkbOFx8>5KCVa1dPFX%0Ews=jinuot`BZ`0ulmCL!6&>o2}m>n|)L
zEtcQL4jlNGYG!^7spc<h_{3UL#}_t^oT{WZ>*AY~@NpDAP8U8FHI!V<ZIv|)l@zTB
z4@DW#q=!(t2oI)kjXa9ZC7Sfny7W=H^pU#sAW9F?rE9{sP;@NWOwpT2w36<xOZTI6
zKT01?>BDvD!`>p@SC>8z^T|Alo<lV0KDu;oU3h;?CYp3FC4D?ak0WC#JB*0*V2dZl
zkWrRC$O#yY)08c=(_=e*o}%9~+@5BVXAK_w!w{?WkCqUN<v%wK8uUXse^|jM$hMN(
zDn7AVf)K=#q>Gnq*Tj$2#FJ{ut|DgfX6ag{Ytr*|>4Hel(#4DPG?VxwlXN4~MZA{j
z0eYs}q(|uDMfzHk^p%vpLYKbOBz|Fsbjfsk=`$#NniAh1Q>>bJL;3^?7x7xA_eH1@
z@2SL(*2Rw`ftKFL^dE&2lz)QqPtfCWIz3LeC%HYzZN9%hhFYzEwFGlQ7BgfBikbN(
z{6z`3rQDWDFeC^;lk75HlP=}u?b&WG-JI>CJ7v3wx0RT;XS+y`rf?B2<;9RL*)G!8
zP`HR+`CrI(k*;OCj}kwli)<I^U1hr_-Ind6DO|({>EcHae~Smw7=WXce}oQ?(&Z64
z6^@c)bX*V^h+$4nkP?JQ2B0839EI`=Qp6_}lM=qLf&s8)yH?lVUSg!CYtoHu@4Ccj
z(vx)Qj^gd5+p^s;(~T12C|$CBu~o0@tm%%~u4Ve$ON`WXL%P&-#}d<(^Z-g1@qT2O
zr5BR?N8%vmAE3hnbSdno+k@O5;x^9+Kp+FKjseJF0P^^YTz#9*Cl-*BKz0VEjJFM@
zU6mLu+YRYml^Dr%DKT%$b{R|^>$-@S!PG3>C^5@P=MrPi_JJL>-4NeVVmidzN{p82
zolA^S+oi+=QMiZ?(6e2n`%(IEGL#Iq^hBIrAofzeu!kP^(CKcnm+YtGEViOUB>({o
zz?#8>kuh;1vg8-sW^<d(C+6^lg(D`~WxRATZ!0m<!5GrtmhEq=?dEJZml#{N8`2$1
z471&##JnxrHSyjZ(mQ8+XX!tc?IL}c)g419UBnL}11+wI9X<kW^e42^rGj4D$ZnF(
z01TD@_%Q%08GzIY6OcyvLORLdlQQ|DJO)5A-kj|}Ro87@j4j*Et)t_BDz)7{+wDt?
zV;8fui@NSu+l?-!>ulEsQ*##++J$suK<!ex%63D%8+<8U#1A0e)*guQ3&0M_-$94M
zcKX~-uRBN!NeKwRAPK-Q24EQjkTiZglKG2d1|o&qRFcLQWsjJk#M`pn=+|u}M#TSE
ziP6M64ybRh?T%fHh}TMtuU&~TGQFz-Rm7X6o3q^}{p}@2lWr?9oux~*JBYXRK!3{j
zvUJDB;r`f0@lB+W9vkVik#4tfD<m=iz7l{T48Wp6gAm66#PbP40!iePl1O^McqP57
z0oAc}G%~$&7xVTKW3KH+i7{uolFotDzOLK%>|IN@O_Iz5sz|qG`cFyM2GpUHEz(7}
zU<mior7Q77#P=hfWc@II)Kh*P<=4`qf?n$dx{hNTI#2>Ihyj?-0K|?Phb{btu$4~|
z;`yQ!|8b^FH)f|srgyIETgXpky8VD^i0|Aw+Gl#_!PF+*sO#p5lFUwR1FGXhNt3RX
zn69Pw>L@Qpri*m5c(e4ry7)epZt$?UVD&IRR8xL69ahn$P)WDdI<XAE011FE12BgH
zh#or@F${vRiBH(f7sQeT1|Xf{wSIk+L%-g+t~*LMvRzveaFj0DZgeq{?WQGx4)L~Z
z*Q6U=j3!+$F9~!WP&<n^>bgG>>Gmb2>+;eeT`w_)bWMCWU3@q6qI`F<V%Tt$Q+^p8
z3Z-;fO1I_QR&X2b=cff=00S_~*B6mtVTj@{HZl;hjph?$_`<FJVV$zQ^I&QdZ<gLU
z+wHrUj@HrW*>&;eY`2vdV;$!0B}TH{kUpAn16i;AC~Y_;`BA70q>}BOrE7IvlkQkz
zemvWI>ltr|@2POc(xJmpOn*WVT^7-)P)thbICA)KcuN5KGXT>Wfb|T(2L3{bkSFko
z!Y02^yD}r<yQ=G2iID}cpDr<47t{3un20w^cdYA1wmV86BiU{3g%M6}2y%8us4L%N
z$VjZ2G8bEyufw9y$?$jXt)y$>-Suqms>F1z>pv#lEZ&XuusC7S(4oku{CvvKr^h@x
z%_aGyKpYzZ@L~X_3>=8np`lpAAP8&ugmq*+Ul=t!#ICm6CQ6;N-PXm}q-)u3Ut+Y{
zu1OahYr9cmM7(`n*E$#>#M%d=ojowBTQ3Cn=!@_^L$M%`Ni%yf(xYQhmX(LPvP#rf
zRHLD)1_ddZnCv%_qPyEkx65{x7fpI+@tSaFCEeB81wCB4DcK@kwywJP?xdU53G*0$
zY|783!)&_D66iKZ5WfsSe+fWe24E5cup%S`EBVWn48$sKSMy10NCX35lo><(PjxX`
z>o}O%u1Pm~b`fu@?b>p$CfznkvQ3n1%L1yVJ9#3cTOWkD_Qix=91jKtVnx_A#4cWq
z+$~9{$SqXD>&h!pSyY1J>^$VBWg;gz6?y5I$W2Mdyz!GLyStrq$87JauDe^E;nS;+
zqPM#{W`s|{oM|)A$IV>{H;WfsELO}JJOmk(pFxM|0-dJQt!y*6T|I0V`bhx#FaQ$=
z48YRhU@T`4mXYOrf(iy%H$2!b+hvVi*4NE-UBq{)>qLYvl(m>nYwWfTW~wtMNj;eD
zZr+&WVw0|AyEd4HyYq};DO^8!9+Fl@pdcX?Rr$rJFRegrNjb_3icpxDgS^xX3Qy}G
zn`EW%ae4-F(=xDV@^mHq|4WH+rC8s-UdZ74Bqt<d=CtXkuB<{uSve+6m<T7z*2G(t
zcxPfIGZ}znidWEM5}gVuI?EY=z7l}m48S-BVBwfCSWNkg7zo)e<&%U}!^SA-S{I{T
z*jPn6FA3PB+jlWWUDvW*>iYC<oT>I6jQQRpu!=M7*qKX_xM&R)4-dsyt4xxNe!UOE
zy7$M{C2LTfUxeD?a#R(SqBN%f1?gGH70F4dHtEcAA)B&9yg_zaI`T3yv3&MC__(+!
z;r7y9DBY;#QdXpvJE_v*L`f4v!q8CPfb!BZY>tURQDGtS^YSr?eZH0cM7jh*#LK@e
zWEv;8@suA=`SJ7^C(vtx&Jva=PYHkrpB(DrgZT`=0?Id7D8b;1mJJ=vY&XOkt)ob{
zWxK7s*bk;!iLtehs>F2j#=6myk-Z@nrHSdN$)VVyGSn27B6h(_jPK#2#7o;al7nTq
zCr{;=I25L5E8*r0m$D*g;_aminZ`CX4S8AFShIK;2DtTNb~|@uxT@<;F7W8atao!m
zACKPX-_Hw!n3MrShGAr25JE?dMm7VOoRrLe2V&{s#aOm<89e*+QL+u`2J-JIZ0)yD
zek>iv(xrl4x9BV!G6a1j0PcM97zSX@=+T(VASn2Rd1O9cw0P(!UA$4(yUzBvNtZHX
zOq8U&OzAZcS?gob!17U+nTw*-EaWGrqnLu@S8Sm0!JHuVQvLb}ZbRG$AYtuBRbK3c
zOQv_uc0;^KHzNUvShWVey*<&p2Wx-dei%&2{wx(CBZ4qx+yu;@H3zGguf(RP7^Ea6
zA&0LiDK5b#X8ow3kr+a0BG`%L#@Wf)PP!pp&ICClCNlsrlpjNf(R8Vx+ZdgBMgV&9
zMWYyi8KXvFCW9c%;uB_*IegKAp(FLy(a82e4r}b4ON^@RcH(WV<HVlcNL;o7r5q#+
zD83*iLs6WOgXHy_FnORKCrIx4M9Bjqockbp$tvW@fch5U9nu8{@fj(pNGG|J8MQtF
zfkTI5%J_-uar~C8$dKUV<f6E+2&I%=T2g|dq9T@<JY;2MAtNIL)z#Gq857(|xFOvv
zUdDlLEMJotfJn-Zq{9e-K7~kuj%Tw(^_Bp*^2LGP6gF}srt=rm8HgDY2tHAmJ0!@y
zXLrc<&J(4#FAK<k8pf7!<BUZpV;#?@c!R=>Y^1T&O!FJX9=&JBL}>`y#nrRsYw}Yy
zM0f_fn@oy*n{)$_pGG8`H$_FOEKg-ADJv~SVL<_Mb8?Wy@{-PRB9+feNlr$xi6ov0
zrF`!E`SUx8cOr&#O}w?EE1Kv#2<s_+oj{MmT6$flGlK!}kO1`Hn*{WyG@fEpMvhWU
z6<GJCjUIzpg9AHtF^(n1u648;*=}2l3DpNxsq16dN-htZiW2tec{~I1k~7pcpMz><
zToPuF9;+ru#_ZIa9m&E;(@>m~hpN(Y)Ra}AvY7I6nW2=Ho}AK2yht|?`9gMP7UE*J
zV%_RBEHBAQxXA7xC8bLw2y#ZOSg}Hh7wPudu603%c<GvC@SZSm5LQ#Vu!_PJOzzb>
zQ+bB;k^pq)8~XL9G!8c541zF8U=SuV2-63RV7A+fH{YINh!^Qv&u+Ut!&nv=LyVQj
zAgA7#?H7WARINA9rF_}uu}ze=apCwW7-H3y1$@|{4Ds+p6l-@&Q!{qAv|`uJ7PRfy
ziI(Q=sH>`0wLMLQb|Kx2WO+hdJl3ySi^TW@WTZ0yT?ltX0+3&jkI0Bf6#%pN?i4T5
z&Elnlawp>$faR3GoZ^>JxPnz?xz1!?U(PSAuyo^_4)yAfaU%jTfk6-^G5`uWBYXoW
zeSn_rns}S^{(8@Dlo*@zU?pCp>*7fu39x!#f{#D4;(1{D1W665EG^QjFP||NL%R1;
znLo(Q1B++QMoE4l+9+P6@7&g`Xx+X8yBLt>#wO&mhD%m=CEh@UCnY9g-I_Is+Zu<=
z%*-x@J0bzd$<4vm*e!6;Cs|syYqMXG?xxyTt&Q!a<`CU5c7QLIQ2r8%UrgbPjjc{N
z&j1ww7Y1Okmlr|<Mj(vx!x)IM+>T=ago(cXo$C7AZqJbQm{A-&N0I<FkoHo8sWG4m
zviLRHa{!VyZbp7)w%wqbmyw0F3zuSOFHd-K_Bmxt7}64wP@G?&M2q<CP213HqLqP>
zZBBNMT@a+6r&6FGB2!aSmCUtk*CIAH_P-PW^;(v=ES9fSZr!`}pnQuiU0a4Q)`AT2
zGLe(HMHmCHfYKLGwlF^^2=m#(sx2AMGoYsgKx*0`1|Wn12%&u0hH@J!!64&({W=Cy
z^9)rk;f<!yQDh_uB4eCcYP$EsXjd;x8#WSS`wihhDl3w<l}A~J@%QM1sO4)=kezGS
zz2x#hH?CgCGtwIa`JBjAYuSIZG;t=|#EH-j2EZ)epoJx=k-yK7y3QaN(mM%d5Z0|*
zhZwe%(%p3R96<}5Es&Y~d>KQ$+<P<gttRQ5KTx>LoP|F6<WAO-LI(`OT#BDd*>eQS
z7v}1WH3wiICmy5y12Bg2$8a0WZLkD`gbf_7q-z7JmhG~>KDN6zrVR+d)B*lj5;__4
zMvldrsq+vyZz)zyorBzj6vQlBgP~4t9RsSYv-@)A2D$abirMp3=}-fwK7i)1PRB+@
z!;igraNtNJvu0=U;H9qD)zo5p7XjGDGeeLdRFqe!uB9ufLORP(L_`FlqN3De^Y4ta
zMKV2&$krg8`&Yo3@6i4}DgZ{d8`34?MZC<e<$8fEVTbzoVkX7Uq-@2A5tu<{>4Xd%
z2sa6Uv{OC|z(|TWGm1eN%>V=s7^bA#%8Vzo-5t{h2O*IYq{MYm$c|&y#cV<5)<op7
zrA*nh1x3tmsqG_rdZ`64W93n;#dLGUobi)Tz)nW8Tf|HD7x5sIw#H+WUjSxKnaTra
zaHKt?gsO^4?BE!nf}l&^*3^V1oo(9~kmhF9yGszH+&CgxAGI+GQIQ)}0OV)V0U4r=
z@+HEhOOnr)?9Y{XLO~G*d-iA9aq1{DhIGkzSyz(vC0XE;g}xAPUreL;X>>S^!lwo>
zS;;h=(F{Nj34o03{rmMppr1biDc;xy2@Jxh0Yf`oQSxUdPZ=7B^i6SUc|Zoz>_p09
z8z}>6%I2-eOiDpPRt~~g!uoQjz17Y-tHm!bYj*?>@k1)>dp@5d{d{UdqWbr$rOOfE
z%ZcBDg*^ClB}B@Ktiy=>ZOr<n#zsY>Y)wJfv113Ss;ZP+2}E{wHga=wk;h3@ettem
z*w3$J7qnpRJT+!We=jp#nS7O&l%h;WepXUcj1o@HiVF%+%I&H}OVP(gTO~D1*Ticp
zt0G=5=tu__+}{_IDSi?iPNMK|`V9B?$0VH~&ceGJ0qDm71Pu2>0OcFo5rPE4XNZz+
zzAt7t0}$G85Vov|REuF*3CYMz<f$5;q$WzK3`9DAE*U*5Y$8uto@L!w|NHu=g)dLy
z)x9Tzd>LH7K=}I(!Njp+5fiZy>)CRS8xw*xD^?+s8EXVUW~MtSxV5#_j<&WowQXr>
z>DY?&G@d<@-H8ba*t&HqVmEKb`nBuSl7ctS_&L*OU;~4(X8B62ShNI7<}JX2nR76A
z>I}>bpMt4lCtxz0fQci6G1e~#z8)S-q;8sUmKj61AZNBFUM}9tg`Qp*!vIXAKVbr0
zDuxSwm`FzWm;%tZZ(j`O5B>Qhe`8BjKzs%(>E`=lWTNEXgM;LfRmkTIR>T*w<iu@^
zVJDM~hHbmiv|~Rrs6=%#J)NAfXh|f}iyAR`@>~vJQb*Y@v(xEGq>uI=HXJdLQP><E
zgBg>jDmilcchqPKEiNur8D3FQf%5WlEra!?g96TK1$jJo&RqC#cJIykjTajXNw9uA
z#@@Yq!;PJcE8EFluG+#|pI*Jx8h;;-OMUn=&mOMu?A`;O%=W&{JZp)UwVOI~&6#eK
z?xw~zL%dwn_oJ^dUV|`>^2gEPSb<(;EB_uZj=g=<61ECJPky)$e=vB^U<?~NOa;S_
zPxR*-_%i@n7h~Kl;I29uU#lyl$+l|36oil9)H-wm0tXDl;<-z4_}Ceozwkcdlk(us
zgBi%Svu@{MoIC#>sv7q&xTD$5SydY+?VR+}y?VG|K)?RX&VCp^WGEumZ}`zpMNl=|
z{Fp(Kvu4r4g=)sCO_*%6RKd7(XiS*2PDYlawLw)%jAXh9@2?}Z-H<*|j$KK2Q;miA
z5HFf|?V7VB>}Uocl>USex(uPy5GL6e`W-pY7Xy0t;k-f(!dA7q=fW&?V+QnQR!HUy
z@*SiFgM*2!i?Lm_mQ3(=?g6iEtclLtX}Ltl%$hoB4vrpe$K`j<qix?Yeuyguu~Ry9
z{5;+{dj=;@oyF?NIEs<Xw<;+jNM@F@L$WVE{QUK77k?@Mjz||HgJ%o}S`P+Pf^5uA
zZ4)J1>)3fP72)=Ssg~(H1|?m~bWONTx>N>3yp(DgE9DFrL-AuMeI&a&$@sy2JmJ&R
z9sQV;?oLjeRa>MD)uz@m#g@lfFgUfQSofYi(a)`y`f&60(~hf298CMEjL}*#H@<$t
zxT!dI_5%LLw=eLAZ$CwR#Cl8)9fxD>7x4FQp5gC5e~fM0+t8z@r}{j}P~$S5AV2f;
z^u(%Ft2(ucU17A3<_;z)J^@3#S!4NL_C33cE?wJaJL#&fYng5?F>lLsd+9Ry)Wx$|
zk)~yY2a}j%jdw2(Rnk0Eg7T~vDBhL(rUD@1Wk(HECaTj{);(CBm_4#XD&s}G!+kNm
z)TwRZ>$DZZ{v4c-9y^6U{roll_~r@z?#fYof20h*e10GQ@ypNgA74JgZ=c^oUB(s+
z^YK*cD+cm<*}A#8VbP*RNJ~rWQo110lM|DW#O^7X-IH7{6tvlJ3g<N=)ceVC$m~`2
zQC5EC;N=>KGzM}pO0EccF(78?Mz%Xj*Tiemr6Dn-%Q}}KUfOk8k{Q4=U&b2wTn(#|
zE=elLzokrCB<qY{8fc|KL+WHl#_Q5;7pz_2&l#U|4AaJkWAfN>n8g0RuBi=g9^Ayg
zyncdTw(r3&DkJclYv=H<Zyw=aUfjmtKe~axe}4~N>`p`K>X{hi-Om;TW{7O3PMxZW
zmTtx*y<>*TzP&KNK+O;2`m9hcuwBi`%tUxd7)G({n92Q_9yS5fL&sx!h%gS*gUOh&
zm@#G?rUr(<uV-J%=LAt@y9}n9c$;+l662Wdvi7Bk@2e)PvNk3OE5TQbb`FSF`MC;!
zJdlX=bijy|bSp--OPLY*Qa|OCmg}Z-X3XR)F;Df)MeLX5ab<M_&Rx8W+jl?0(b{rc
zPFaN4`|I!zFCXHcU*5!T?qA2}ZAJL?-YopLOZE8lR1F$4A~7dCSgpG+S-K3fX3k{$
z7^ljRxx@&P<+8fDyKNWt?AqPIUb27p9yB*JA~qrlCG6pAE2~h$Ak|cA$iIa;MKv00
z>yW-BUbT(V-E~!By2^H$lp4}yX+{&@Pc7NVn%MvbQ>u%BQDP0`XX=dCvRp)K$YV2d
z{Zzzj8E?DwPLRQKY;cHL-j&)bSt)XoNLBq#v>rZ-sWa!owR<<LoHic!&$Z*XFQ4Me
zcaP(XZSi>17>94$vhe#ewfLtG+wi-~JMqzpooK8q#fs(25y`eRMbCD}0La=*%k~{=
zRxE7S*};igD`(7U@rfPR3)FH)vPPy(mX6HUE7>kD3Y!8y7frq)-55~ic6G;WH%pf_
zGDEy9T*`{EbW3VX{Si6>AmV%Lcyz*v*o&8OLAncxqTjG#*s?iRTQbl~g|vhcglx_>
zSFc{BN{S5bgM58CTaL%sqBy*&T!YVR*5k|O1bn$Y8DH<p#P_GF@pm_l;8%A}<IIjy
zw3O$dv7#8cne2ur%P2pxR+GukYvIgTgd3=(YFV;wYR1;}8`W$)i-}>ZwhFTPD$>=p
z2qG8vD+-FRcKQMYac<+7?Om4`vve=DQY<%-iFjGImrJw0Je%ZOX$0+ViO#69D`iH+
zd+PLYpf>}cNw<kNT1SbZ7biFo8#Z(rFeM1-{MnW*Tj1>M+)>*l>is<2ki2LL9+pSr
z^V$f!s)@wQ+D-VRDG6VlsKwvjX~#d_JV18i4<Db!7gvv=rM67F;G$==Y^BtguMrs6
z30k*p$L7`Rk+wA+IcXVPinj|uelcPetUz$jeiYA1lrG+}#K<zdNSD=N$#xMh(&eh4
z+*~H&<-(O*u9aDFSJDl%;4lDE??t>9>1V?Dw*<hLEXhR()w6SS7vv0Z?cN<rmn^jt
zZ%mMk0W?7Fg&#N&{W&X@S+}&eJ$rP={IEdm-ZTeS(&ykw#cI5)i^Yq^c)Z@5k1zJ+
z;>&|M`0cg5__r4q@vGY>v8%3Bm!GDtf;H6Cs;gs4KC@n~nzc1+0f=3*0m(62P>_+;
zrFiXfs77Ue5fWEMVyuTZ#rNruu4TGSx-HZDE9r7`nMjxG;v!w{<d$pZa!b7o<VO8>
zEIoo22nL`RGt-Os5O4m_z(?Ooa5^SSCh_V`_!<un4=i1}R85)$ITOsCiv(j+wA|*A
ztgb|Dj@g7+(`TrwOHNKKOJ1HxSuzQCDx>jLODaBN0G^g_z~hPyc;2`PU!SbNudg4$
zKR!5(Z?7G~-iC5j+f&(s%HX<tXG@2Cb=h)93%1ubVC$L)Bt>pQQC3c8@ur&r<d&F<
zyh3C}Zowo^U$x|J45sEx7x9L4xhyNvCEG>1TrW4o%gqaN6N4WE;5hIaboi41c!+r7
zO9pm9U!pF>nZ?TsiQF|N?V>Dx)z{afrlv-%)s&T$sWqCMoE&6lWvk11B0io0NTIkj
zD^{wR>WIMuP!O>g54LCGOJ@D&t@#`aa`1IqDn6~>jAvC5EK6JQ^{G01|G^>r&5c9&
z_QpXR-&xJFl7g~=V(i)3ik*!dcqv~pf8UN)R27sUaeb7!pQt1|SFPCQ>GBQnaw|-s
zz@L?6=c8atGG=%Ur}%!I>bfRgtL<H7yWAgTh?m=U<i@oCwz1~cQ@Twv5(wq7w=Q}J
z8QcZ^i0zcI$yfE9zneB~np)~@-p*RQbEjGo7Iv~UG}JLDRn@3ue=cW%+!hiYxe@bb
z&4zEkeyG~I4*z(*5x;0j$FuTS+%H&<$Hi;#x+zu#;dN6So|J7+W$EkF+wkqB{rK&j
zBlykTBRIFaRt=uJwzr~{0cdM%R`Ofwn$%5P>CsyezcNDIf7F%uB1I;OlQU4Bk&CkA
zEG+O2QW<ZPZeL;qbGD0kx$#*3Qd91o67h0JxZKDV$ZqOwb1OlDpj>+DqW#ElGR(wK
z(w}I9hDp4RJPrvCR;8w{u1>Ah3$ku6$ORO+a3YVTZ4~7GoLHU>!JH%=$W6o_&Ntyz
z)n?o;jKJlD*?4#JSX@h<z<<xf^ZFRF6;JE7avo8DpTEBwzq)x8e|!HZetYjQt{!Q|
z;kGvHZf?b)U3+n$bvLTmQWm6TAum1!am&}EG&5I~8JqY_O}tJ?awf{sa!{R_j}?PM
zG2LpDZVagMJrW(#t=iwL$xUinwhvbK$jU97B3^FclpB|2Fn63&nUS+XO~fR_Mf3;~
zK>Qt$vB4}}UL>W+IE7Rj8XJo|mLa*jOlG2T_pn?-Y+{#ETg^#UU4xn@$iSH);{(gk
z#8DyGvS==Ter7vf*KWbp<b^n~VG@o<jKjtF33w+i1Q(LR@nUBxzB*iiFAo*sXYCa%
zMQ!-yt%LZRdx!A5`$zEdgX3u5w+FQa<tR(fL4INyic_<Yxp51kW-dl)MouU3BE5v$
z(v&Qe38~qr&n?D=5tA{?$yQ<{+qFz*ZP&$%bjfzP1>eYaxkFr}%il-HE&FooelP>@
zwz-ucXMqZUWVmGiND@Q>9gy<mC|;{$+L++ox1YMiCwC6WN~HAZB3st-<&vXZVwB5`
zB3|7@#X(v+nVI2}F>z!d?(V9=cWv3Yk+cwpSBIl!K`096jzY!a5FFV&37_rBz^_l&
z;TOj%@w21(`08W<zJ8|)KYPC(zqqmuzrWLlrzfirH)j^64hzJ>G2^g$+;l7s2*Zkz
zlTe<XixLJzWjw`~n#7lzXeua0Y}g#kb<r}uLpn>0{Bem^Vr<zi(&dlGMZEl7vmst?
z<CnjC4rKt|KDW}&0<{<?87|pBhK$x3WkSl6HhQxIl5U8Dv2jm~bVqWl#*9f*usJG5
zEsV(p_Uz0|<WPDZCt{l;HX<%&v%0u0cRol5Bim*37h+0~A1+m8;CDyM@v<xmml=fo
zS)mx;-wUHSM&vA-h)=i2<2MH~@w468_*}+?18I1DGy|U<O~vO&)9}s7O#Hk(4eyt)
z$Cl|~80#)~YxKfct0$HY4O6wfoM(ne7YyMQq*AAXfoU!*L(0^pSlC?~P;JufGhHh&
z+8?H9(zQR&lE0ylKVXqRWRbrl8qaw|UwSj<SLQjEJeIRS1z-RLOZJD6P!eJyn8;Wl
zEvO*kWlo^2vD;?FUhW?7A2JkUM~%j;iIcHn!6HPhU5}Kw1Z-Ltf#|gxcot-L+=3z#
zqtes_oX**RFL!0(w+z7dhfDG8fdbsGO~CfeOOdc(5-K;$$LBj!@cZNW_{Gsed~+lZ
z-<;rCa6E@WV9R<q311veVTnq{ug+%T<-rWJ#;wFExvz-==KBVrBrXkAnRyIECdx?#
z&wxsuDn%Bm`19=yK+gQNSn6t&7|C=^ydhowK0*_({jthMUAp|OoFQKRhAz$$#1__5
z&7~aYR}vK2%2^<bbrxwqCF{qNaVEy<_?t3b#2d>IvNU1bo+0Z+vTE9!cscigF9YJ|
z?W3*+$pwiOa~Gf>Cs&D=^%$9*Ufb7ze}1PPzdTsNAQa%6!)5r@nFjpsOf`PpUWGTu
zDwyG%16*jp-+j=6-(PFR-&}6O_ZKSg&8b|xIhu~o55#k9NWzy4z*mP7@vGCB_|-c_
zxYd}1+}TsGz-Ktpmqub+aRqC95o$TmR`YDAVo4I|)$D+(xvfdcKy!WxN>*&bDtGzg
zlcCIZZ7{WEyY@$j=4_9laQX8s`PME&y!<hve6!bNo`F(b)cndse~Op+m7EDG08(Nk
z+r!C32PTj}2B523@4C7tMwY8J<jw)PfGy9lV0P$46fywnE;#AQ(=%~pS2cdejQ+eK
z5zlMm@p3zR|2_G5&GF#Pz9N<ujtyrU@a@@pe0Qz^zhEG~J5$As&%>v?lla_ZKF%ST
zc-FiTA62i!^KFs%o+at`ml(VwIcSYuhRq>Uk+CEK6`R?qCFh_qs}Ri`aCa1xVMl%`
zn)8a$lvRM%;&RkPCSkotfXaBI#Aun`m2@N91J&P48{*|pdgbq_r&;^j&8GyZHiA5s
z=0~ofSfm4zjGs!T=u9>-iUBY(Uc?)h@oeI?i!^f0!14AB!G~wX#K9v_$Qh~n%NCiD
zvQMwc$wW)+a<s0VigSs}aIZ2J&zqC+RNBsM$#}jy7oV{8e7+|S&vs?wlfAikb)X1O
z*cCnCB<+(UmH7Pp4!l0Q4UhI@;ab^BJgD1%*L#!j-H9Ch?qV^1e!39nvNs}WY&cf>
zjzr|}@rWNi3u)ntkvDfe%2&mrHYNqlNx9gSSB7H#EW%a$Q(LomDKUn0`D;-TuYDzh
zh}ZsxTExpY!^j`C%Qp(lWB??&2fYPpe&j-pMS6e9_L*b`neIR^1JL#LQ|%&+{hb1~
z3)b58Q^5_R-1{RZDHUb;g(%3#*8Z3-F%@g3&cb+4Ps|%M1Z7KR<5BfyT+dpBmbEj`
zuzD^IC9K2;Wt;G@IRPJUPsD@fBwVl9fLl!ocy_88PmkB*>9IPzY~O}YPF6E$Nq8w|
z2l?_q3VwMy2fw^fg!|i)P(Eh{ma)DsaT<hG-C0_C1|ZUNBw~C*5I;B^$$rzZxlb@Q
zI%(g^Wv=V;2kDO4Zb+AGmv0e}uW%6YS?c>V#$c|sU&ma^Kqk9_JeJa=0wBG<Wcpm4
z*$#wRo$X3YXX*Br@kF{@O|rX`=iCbmf+woG=yDSn2u}UW^9m8YU?tBmS^DjbIsJzq
zV`3OK1r5iHKHiw>;f=XogRtH|5M>K^mSnHSjjDCHT(Ssvc4y%6iF!QX{NTZ%a(sNa
z5})x*cy%ZrA2&tg+4ilRKWxRPZE+kMQt<tm9DI5(4f~^(BAT;ZX(!jR&TH-CaAv!$
zeH7{Tb=|(i*k`*YUA{*{zE4BM%eOzumzykL0K~1d_y&^f#$zc(a*5O;E$B3|Kxe**
zd1L|uU=we<J;PqQ?J}O+EudXd(!K=4xM)49n<v70dt-{XKbDLRNA#SfSQR==UwQ0{
z@lO3Pp?g0}bk^3{jfF7z;=Gw|K3Fr*59#ALM_`+JAU6T08q099z62k)@4#p0n(*RO
zBVL`V!$-9dxL>sv59^~?k~ZRTeFR>$Y{u7z6Y=GdB)pfq0a=0LvCe6j5^vOY#}Z>3
zP`k=@t;`tG<y&M7@$xmC^3`pNtX^s!C4LQLqH8>s=0^oUCSOv1mgp=tv4~7!06J&8
zcB5_QI|Xdg<!=FOSCq6{*9CQP!-dja`(b={?QaVV;l`4$wicuP1&%BWsHFibXQ<r<
zV3uoNq|RQBdJde@$+WVp-9Nq)UtQXZ&(62vVQV_Bmn^}}(&f0xap6`u$A+4<c+nh%
zFZOO_8=H(r+hWl$a~5J;MZUi&+l{(zKcGssr|HtQY&WEjQPSmmlnn9mov8AyVoMnS
znMX;BZy>IX$5M*iBmmNaO6gfiR*>ZmOk)6S_r+*;Iy*`??i4Uzuy(w5YQBtTySUMh
z0XCL<wFNL)>ebd_v~?KyvncZd*j&D5bI>$2W*4A_lPqZ?>(g@Z;M8t>ckKY49xB7N
z@>RG>`5!U}*U9b5)p%IDo?TKDUhm$5uZ|?(_5MU0ja-4GexsTF0d{p=zK+MJ>muAJ
zF(O^QDNGX{tiC-=zRXI#O-!WAH;c)4>d9BUtzrOV9%W!mbY&~Z_#k&^Smc)r$y&08
ztaf0Q)kW3y&UXsfE?C=Vy5nU$`)j9;YwX%(Je&AVYwT9-Z;)lFSNrqWfmrP}0(J2j
zXrTCplx)-{WMWTYDZajW65m|hfjc!3xKX(tx2x9U4#$l<RU2@>CK8Y8H?q@;!iya-
z_-r@J(#d3eP!NUu!4nW~9ihaV>$-e7Rp(3>@rLveC0)Kt&k!%)Dk)!bxQ2-(lUoCs
z<QhoZFXMm;fc!v8PlV2T2j*G3sk&}typ$M2`j1^ZwOvuNl^Bt3D>3G5w~5y>U6U?L
z0>-MNZCPL#9}hszRJO3}<r|Z-uq`DA^@*8yuWdVieg7C<>`unRhRwKN7sHu#6z)|=
z;x4&gvk{LtE_~d;v7sRnuUa?b=V#OKv^5zGVY86z5=i-@I_kQS?Se?}ob91Xx_q0Y
zAzr@TQ@&qy0|OxQD8W3*H6F`2AonL(WVS1%Ct7Et1B(~{;}(ssZqJav1rzb+Yp1rl
z-rtn%nslk_<||6(G9x9%c45P|79-07=CznL(!q4|!?w-o90N+xl$4F8#4PN}F2T!p
z_v7pHMR>U@5s#a;;G?=t6t4y09=8wbNX-U3Bu|@SSd!xK%X8`Y*_m7%S+)Y1t`dMz
zD${=|+m(2$O}u<>wtT^@e3y2l)tlv2#!wAoqAOcL#sj%I%pwtz(i5w*nQSt#lmY1K
z);n{Fam;qJ^sY*bV{Ml;cH7FMO}eqhZY&F!7r@r@Ia@r&VCU8>>@TgxzM@L(%PK?D
zqSg51XfeKM=R|H-5}q&!4{Bo=fQ`6Y#UOBdzbZln;c)}Y(au=B-jjfzw`btjmkV$s
zKNgkV6OrdMsw2}oNjGJ?NSBN^#LHJa%U3-|GXT<E3g$_!feg?p01}N2Bwi<uY&CFl
z;^5rFuC|+{o3q`JZZ0vl%Xr!!b&L4UwcRK)gH(TRTY1#Jjl~czOTG59(-GVbLu|Jo
zl!dQE!;($N88!p4Zo_eC&03BH<#=^C120;WI5*gek7}ZEr!oR}$~WLHxA%EQJYcK(
z@wQEPse%xPuaBlM2r>gt!`|@uDDDxW%8Vi1Cf+Q4occ~}L%e*+`F2Y<lUX`9t-~}=
za%C&X*ekb1T4WL?r6z?WlO)+vyumsKz{qyvg0;D>8{#`lH(yaQx|q(=wUtNPlCMaY
z3mcu+VvO0T*0am(RO{IT*hVrCB%Y5G`LnG4A-GzQh;Po9;^n?HJlmPbAZ(%ZXxwH1
zZgVz$w`wELjA)(((Ri{g1}|H-;Im!vcyoYf!?{#^doBwXH?Bc-?{TPf3hOf4JBy#F
zzT#iL>OYPFm`8uoVG5lmxUwL}0LbYPLo!IZz!#Z`WB_a>rk|a3qr^zh{?@u~wOzE9
zub_O}I=kZ)B@r*ujpg3XYcZXd1&sDF%_#`gBc|c;j%>U+Rmed(6;F30;88;?%TJUo
z2s{%$s%3Z77=x$Hu{;wvd)}=D;b$jO@XL3z@t|}QcKOXfUH34G?^?QKydl2TG6`)Y
z(K-N&=x-reK#Ym4v6aEtQvx8T#TJswC*_#P)`_vYnz|S-3b(&K!zeLYrrTdTwMqZ+
z%XqRRph=gRsad*Yx0da)Bp}#kr$PEe$=tJ#QvJG`p>`jQ-BTCglLLA9{8$d2wWZ+W
z<~Tg$pnSJ7k`uJ`xWypc;h6BCK86E!EYFm9ylmwhVQ&(Hkiyw>Dt>-G4WDu>IWu<&
zn)`$+`66C~8`4`8la%~jmdV&nQW=0{^tY5O(UFO*F~OD6uL2<TDS^K%B84QM6zIs~
zEl#d_wrk?et)rIdT8YuFoodqMTM!-Z6tG>!vq{%VjJ6J=iI=q)TZu8&ViJf*7v3ga
z_3T!oXV)m|6^iyX>+r?#LVR{83r|>z9yPKQaXe5#sEEK#ZtroBe$*I?Ck)WD9SlNS
z5<c6Tj5qsJ@a7-`!P)cIJR`1e-GDv5GqA&XqLOZ8`!19Cy*e2Tz$*G%Nml4A7wCH#
zk<#B!0wDD$g}*2xrKDKjmN@e<Nnil9Y`4Gl&Q{ko@kU)Yw~n?h#=f@Oml(&|ZY+SA
zvt5&}EeXg(Nt>Z+v(wQX(j8~0vaRu%gsZ7r@a9ATUhYZbpc|)_vn2?(DgVRr2;8oY
zQthe)N6wNbI}`ANS^p{L6R-Cq@r;Pa7l#r#aZACY;>|b_x&XV}CaVC5^gTKvexGFu
z_LFR<fmlnA!Wx~`I;-ehx+D3*M9WP6Kmt&uQ(-{)LW+}HM{T#e8L6XnG~b?~O_bg)
z-IncU=~8BF*>1l8X4G}FbYq69Ngvb2vOtJx9TnCPv;@w=N0q7g;zT~4vlKm&u86{K
zvHV=)cyOz7Bj*S)DliW?SU+suiYGi1p0_5lO-;Zjt#Np@D}iT40=_<;hF9B@@cyEe
zIN&v%;wMr3ln(I+$U)0gwy^^dL4Of+xq+-Vv5xYk^s4}{7X6=i{;-zR>)RT>uvRD2
zxu;!iH%m8XduQqPcM6!ZU2415#b~wNob8TlF(Te9-JI=?(v8`vF+-LA=Yde&eJqa6
zSkB2A$AhD}c-oST2RsvQv-Et(v*1QWB*%hi27!~dy3P2AXTn1U;_)^Hg4<`?<Fr7u
zNf46o)v+{=5ox#+8;O&{=3t+*CSSx0he!bf5KVtV6rFC=k;jol&H$F6A7nN3-}sBa
ziu`S)kuT`L#ThvafZU?-Qzb_0*SqRsY}szUxS>hcYP$@mT8S~%Vt%^Bh;+d=QF4&3
z`gPm?>!yhV=%uJ=4#<Ug#qr={jt6(x6@AF^^C4T(TkMYRRL9_M?Izr-XSdYAv4UGU
zE2K0%VZfeCY2qOL>Fz|lIVAThrQ>n#W}FLMh=biV@rM=DSjv47ONYW{dflWWk0l74
z9sj^V_|I}%$~PR9|16o`!Y6MxpnRdg+1;Ua{PDW}ww~Q6F-Ep)T}+Uk?Kbg_+5TfC
z#(ph^(ycb>juWK@{%p_CS-6{@gfC7O;KklF+^5u=EJZgs9^Bv=aHA@kWhn-?S&r`1
zZsr-nj){-&^YH@)<1tIu6P^{%S)M*=NmS#54ARfax8S`=OL3&fG!=j&3_uwJ5KoUn
z9Fa+_5T^$qgaP18_<vg5tk!emtkyqC2eg|{+(lYR8|4cn&K{I5B}VQPkWBxv+cUH;
zcr^x7O}g#csc}Wgd>PMH*Np`*`}K8Ay0Ijn{V!BB>H5r6N!R}WWtw#D|7)i8>)QYC
z%;?#h*}a??zXVU})A5?E>C@H}+-uy5TQVL{_I1j?&LG_6*>Fn*Lx0Te9SH=V_mCy(
zW1bOD8I0!~D?Vw7;~<@g=apOV{uBnmb-D^dB?FK`f5~*2L=x#YNk;}|f0lkXi{<y0
zZr!>i47FPSDVjeN`3J~ezHkrO+sy@)41i?1*0Y<XOQvi6y7@Amt&4HIjAvZfkW7F3
zg$=WGZ7n8Di8rJR#&W>hq#NRmWdWmKR}&@INw_d?6>EA1ULDB9<LwE!!!mP&@`dY_
zEJ@{&xK3_xaK2Hokw4S6Ql{=Q829<S2OKXRGH8z&lxN#wIai3o(~4NUKUE7tHOGJq
zI!vQaA(hC)R#q2ehCI+}{a-E?%SRS(Z|^|Xq9@awtUpxoNk_;bzVIM9!~oPX0On-@
z^X(b7i`K^Mw6k>cWjsUrk7c`U0nEsDO}e%Yqy1m{%+j?5Fh}X;iPEHwNm3iz#5VqH
zug6qeTCol<cBFBZoWjnBX8~p2;8-B?KPcUR4@%bKT3Li@Q{`tG5h@Tj`S>=sx4FH`
z0sKD4k;k0Oy=>)JQN9`PhA%~3k3q<x!)*G@(vgX+i~({9pdZIx7bmA$OK@;-_nuBp
z)qYmX|0A_&51)9FFFYnN0Q+2epx&hq@k9e@?ABM&)U6-3br-zQOt$yvui@GsJ6yfF
z^~O$DA4Q9sJ*{p7I%rc2#IBwiyL<Zn2!lG<WA}J4w}aKT^W!0kJ%Ss5Ms~Rk!U11@
zoS7Deb92JbJ|h?>rj5qYDI;-Y(nuU42g8FjCfT<8!vhujCUQ&mO&FmuQRBemARL-L
z3T=LVsOaH=0y@m6&pc8<GU->ACggHtPmAUAUcFprTI4@3FSp5kEY{Cty*igqJkA%M
zCG8A=qI);A_s}@)+8yn#J-F?GGj6Up-BZWiO>w4IPsM2ucbp+=+gszbL7!e|ci^<A
zhoYUFGI3Jp1UasAOy{VHBRYpn93%%E*vHS>tFwpf7PwElNE>P8{<e^vWCxF9J89-|
z2~9lCM$*9Jt|xVLP)i@xq>64T>8XO0(OD@ep~GS#liETOLHTky($i}FV>hd{B_JT6
zj|#wm0R!B-J2@2%wp#vqu9Fo3gamv06@1Yda*=Oxo}A;Gp5q4y=lNmh`N0bA#0Boq
zd2)d}sNfDOcmM|Hd0+<TWXpp#bIyQ*&YC#m!2jPM8NoTs&p4!WkQ^ZUxj*}K_L4o^
z-`!-Fz~g8oEj+HBWCxFPJ89-|ZzD}~&`2K*q>gTC>8XZP(OIQHhf>yMLMxq+tp5zK
zTL0>5wLa;qWxrF$|5JXbckdDI&d%+_7@fs@ay4IkmTz*2yvH}aNZ#Rxyvq;M=z({+
z6T*AkDFt^@c$Yi<o&gU;cvs*7+R;borMRf`j)@DDCY*P`9H<`+5Z~h@IYEx=9Md_<
z&p$#AlS4WOxsM0PezK4IF6`m)>?XSe9%Czyw}tHB@e9p#v5j7uNFyE9(^oC2r@sbL
zO_$OIO=n_D>2bGMe%;N<Db>r%%R^<q9so;txTRa)zOJ)+IXT@7aI*gALcXYoZ*Yol
z_5t7cD!IZBxlAtcLoe~eFALlm1$R!t9lb<kdzlAdaES*cT-LXjc)(`f*LhE%Ai)TZ
zIY35`F6eZ1CY>c`bX2+Hd!90JlAIvNxgW=Lj*=tfF!%KkIVkWL_LF@)uDt?}b2r&V
z+IZ}(^stlcpp)(N(@eJ0mqO%|E%Z2r@`sV$7VAHDcX6tx{6SQ%ysH2hLGbmp^z7ZU
z$I{+TPIrboS^s?+UmVXj*~K@Mv*1H=gCBOCA9_R412@SH?vQYkJ9$IrCU@N61`o#I
zrfhkj2G?~yG@zJk4qP?yfzB13%cQFyn$NV0eBXC;&XaRGXGzDHMcM`K?@68G?yfk-
zV>v4D_znv^-b3UdkAFYeM<0919=h30+I0Cc0I#LLaTGt8ldj$t%Rfln_wL<$1XVj5
z&N~92|G+w6fW^H}ANK{lT%6x!ulldS&Q3op;G3oKja&HvG7iX@AVIiEZgFRB6Sd_I
zD!9XT@IY?yfP~w!?IrZ=Kn2AN#Yj-P43Gm?bv`h0g>;;0e82ZeM@b|X$vfl%_v1YG
zM>t2$k~7>_X)4;uDS^jxf*f~cFnEkd$q^p+VRDEb4v>BHvWqm)Q32UV@shkjl<#A;
z{>9Z|`JOFjjgL>CfVp!mE+*gh0Wf|T7#P^Y$HynEhqH5oht>M^5ND@92D>=_Wx9*=
zUsv-361uw}pC4Gk53eRQ+!^Tvq$8;14hl80brW3e;Xyf4;|N7m6Jsk>nI0Se7Akcr
zOqA=C8Sp(zNr_IeP7x^-xL*Y%Unh_Ioy+~t(a9!RJhn`M$D2XYdHg~O*+M7ln56T`
z1SV{tv(x_>=w$uhboYmDR?AJNZcbY)?iL@abuxQa|C!~R;jf&A4eQg_v%lx6?%iEZ
zyE!}k%G<^He-3wX{`1IgE`JT>hmIxV84QC7+%Yo~dvxy%59YrFCA^IZKf!ndzK<j0
zx?n8#%OK1|D33u15qNyTI%9a;qjg47`Uv9Z;{3xPXQ#h-IXnG{uKwBC$@;>@#if=L
n-SI<)3~{4RN5A~fV)=goDXCy(JGH<a00000NkvXXu0mjfP<jm*

literal 0
HcmV?d00001

-- 
2.13.0


