Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F11C47258
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 06:44:16 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.17568.1706856253705195977
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 22:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=crFVGGhr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4126iDl1130306
	for <meta-arago@lists.yoctoproject.org>; Fri, 2 Feb 2024 00:44:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706856253;
	bh=swXXF2FkCUSbPERhFc0jpVAhlpJbEBKxb54jyoQ1ECY=;
	h=From:To:CC:Subject:Date;
	b=crFVGGhrdYK5PxqLsdAw2HQOBJcDxDZ4ssTGJizQrXlHMdZajUoM0MS0Fx/MVovcW
	 KWrfwKP3ztWukZlojoafxNyRQszz0zns1zFgaoNYSrvZ5X7xLQk8pxK7zlTawBOi9M
	 CaOoZEy4XxhcyqcyjpLv8Bx4p26H5CChA+dktVuU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4126iDuv015717
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 2 Feb 2024 00:44:13 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Feb 2024 00:44:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Feb 2024 00:44:12 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4126iANh032211;
	Fri, 2 Feb 2024 00:44:11 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>,
        Bhavya Kapoor
	<b-kapoor@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH] systemd: add network device conf files for persistent names of the mcan devices
Date: Fri, 2 Feb 2024 12:14:06 +0530
Message-ID: <20240202064406.866079-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Feb 2024 06:44:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15104

When multiple CAN's are present, then names that are getting assigned
change after every boot even after providing alias in the device
tree.
So add per-platform link files to specify the interface name to use for
each mcan device, to make it persistent across reboots.

Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../systemd/j7200-evm/mcan-links.tar.gz       | Bin 0 -> 687 bytes
 .../systemd/j721e-evm/mcan-links.tar.gz       | Bin 0 -> 687 bytes
 .../systemd/j721s2-evm/mcan-links.tar.gz      | Bin 0 -> 687 bytes
 .../systemd/j722s-evm/mcan-links.tar.gz       | Bin 0 -> 293 bytes
 .../systemd/j784s4-evm/mcan-links.tar.gz      | Bin 0 -> 687 bytes
 .../recipes-core/systemd/systemd_%.bbappend   |  50 +++++++++++++++++-
 6 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j7200-evm/mcan-links.tar.gz
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j721e-evm/mcan-links.tar.gz
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j721s2-evm/mcan-links.tar.gz
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j722s-evm/mcan-links.tar.gz
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/j784s4-evm/mcan-links.tar.gz

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j7200-evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j7200-evm/mcan-links.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73a72072dc0bf573d
GIT binary patch
literal 687
zcmb2|=3oE==C`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%yW0PL
zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
ztvW52Zq2CrF~L=J$;C|?s}=swGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+jjf@
zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=Ugy`p8^6NqblQ)f
zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=jqC6659|KtRa?X|NF8H!
zxaAh`mpg``=)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46t
zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
zz5e-?{QLjzj^E=q|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
ZTT}i={D&k)RFdVR_{aB)1sEzA7yy@wl!E{O

literal 0
HcmV?d00001

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j721e-evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j721e-evm/mcan-links.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73a72072dc0bf573d
GIT binary patch
literal 687
zcmb2|=3oE==C`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%yW0PL
zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
ztvW52Zq2CrF~L=J$;C|?s}=swGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+jjf@
zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=Ugy`p8^6NqblQ)f
zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=jqC6659|KtRa?X|NF8H!
zxaAh`mpg``=)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46t
zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
zz5e-?{QLjzj^E=q|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
ZTT}i={D&k)RFdVR_{aB)1sEzA7yy@wl!E{O

literal 0
HcmV?d00001

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j721s2-evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j721s2-evm/mcan-links.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73a72072dc0bf573d
GIT binary patch
literal 687
zcmb2|=3oE==C`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%yW0PL
zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
ztvW52Zq2CrF~L=J$;C|?s}=swGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+jjf@
zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=Ugy`p8^6NqblQ)f
zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=jqC6659|KtRa?X|NF8H!
zxaAh`mpg``=)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46t
zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
zz5e-?{QLjzj^E=q|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
ZTT}i={D&k)RFdVR_{aB)1sEzA7yy@wl!E{O

literal 0
HcmV?d00001

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j722s-evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j722s-evm/mcan-links.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..7bfe5ab908ad970a8af821304884717cc24ab1b1
GIT binary patch
literal 293
zcmV+=0owi_iwFP!000001MSvNOT#c6#_^u}DgvHY^UJ^Lp$9=kL1hPTV~kKLmbKle
z*}->jR&a<Tn9JIU&*zdu)6$TBOR`IKJ!?zb@vN!4b#e;aGe+%4$~FH!4oFf$N^4_e
z&V@-h38Qqv_(|U8huyogJ!6UO>UHJ9^M1SjM_sT-zwPX<ZYuV==~-LuR>S9zE}pC_
z-<IjT-)yVieH0J3tNG2#eX(t<^HbZIs`!=PzRXWg7yHL7(`VaO#c==B3xg=xSO0Wo
z{TuW@hEV?$)jtLMr>PePQ4al!Df^d4{cA%1V>s&H)?M@gK=7PX=no*KUK&I=^e@k>
re}VqT5bQtZ0O0$lVE=OJr2zl{00000000000Q^gz5BrB?04M+e5bBlJ

literal 0
HcmV?d00001

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/j784s4-evm/mcan-links.tar.gz b/meta-arago-distro/recipes-core/systemd/systemd/j784s4-evm/mcan-links.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..61fbf1019f11ebc107207ca73a72072dc0bf573d
GIT binary patch
literal 687
zcmb2|=3oE==C`-bXWurEI953SbGSrVUfRiDiSk7fJr@r~Roz%S<x#36x9_D%yW0PL
zFJ|8Cc3OI`gi7Rxngw4j1gPCwZ+-myr^Q+N-(J59&@I1x*jdoY)WB_Tomg1-|9U&Y
ztvW52Zq2CrF~L=J$;C|?s}=swGLM`0`(4B|*YX>7IaR+(_pMKV<@_`E$HwXL+jjf@
zeEl)v-F5x%%j4URz74&;zW%;$USGfe?BxIHU%!6-dv^Kz>8qE=Ugy`p8^6NqblQ)f
zy6xBX^WyiPzx!y{?fkIi`4fJn9N75h`hJdb#t+})_rJY=jqC6659|KtRa?X|NF8H!
zxaAh`mpg``=)o`X&#&Sa|Cc!NFFNeM?%n+!wI&G#e^0mkUH$!U^cQ*NoBJQ!Vf46t
zQJi7subc<Zf2~iyx_{M$dY+R1O;`W(@A_}`_2z-|U)Mjoy5Hfy;f256VgIvt)lUU0
zz5e-?{QLjzj^E=q|N8IweSPqJ-aj$_)8hVKe__wItN!TA`*SK85`w^@WpRHW|BM$Y
z`9JIG|C#IzW?)nApIKdR^S`_4-Te)}>_7jjpA0rO|M}JZjv%{$4o<)KKObVO@$LVQ
z{@HV7{Xbp#Yq?hLiNE^K>?0+9^PB&ldCmUa|HTUb|9yUDFZ%Pj{OkETJ%8J0|Mz(<
z|NVd9h5x`X)j#oX<G+)KZq)Did49{k!vFHDH|_KPDW60Z-T1%1>CJre|0|J1m;B@X
z_CIjK-_6hL!zTVs{yVvK<Nt!s^E3Y@gN?}kmuz~|{u;s^FvZs<AS-_SvtA_S|C*ou
ZTT}i={D&k)RFdVR_{aB)1sEzA7yy@wl!E{O

literal 0
HcmV?d00001

diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index f38606f2..bd885e06 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,6 +1,6 @@
-PR:append = ".arago7"
+PR:append = ".arago8"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${MACHINE}:${THISDIR}/${PN}:"
 
 SRC_URI:append = " \
     file://local.rules \
@@ -14,6 +14,26 @@ SRC_URI:append = " \
     file://timesyncd.conf \
 "
 
+SRC_URI:append:j7200-evm = " \
+    file://mcan-links.tar.gz \
+"
+
+SRC_URI:append:j721e-evm = " \
+    file://mcan-links.tar.gz \
+"
+
+SRC_URI:append:j721s2-evm = " \
+    file://mcan-links.tar.gz \
+"
+
+SRC_URI:append:j784s4-evm = " \
+    file://mcan-links.tar.gz \
+"
+
+SRC_URI:append:j722s-evm = " \
+    file://mcan-links.tar.gz \
+"
+
 do_install:append() {
     install -d ${D}${sysconfdir}/udev/rules.d/
     install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
@@ -43,3 +63,29 @@ do_install:append() {
     install -d ${D}${sysconfdir}/systemd/
     install -m 0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/
 }
+
+do_install:append:j7200-evm() {
+    install -d ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/network/
+}
+
+do_install:append:j721e-evm() {
+    install -d ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/network/
+}
+
+do_install:append:j721s2-evm() {
+    install -d ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/network/
+}
+
+do_install:append:j784s4-evm() {
+    install -d ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/network/
+}
+
+do_install:append:j722s-evm() {
+    install -d ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/49-mcan*.link ${D}${sysconfdir}/systemd/network/
+}
+
-- 
2.34.1


