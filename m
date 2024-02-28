Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E3EC5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 19:22:07 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5825.1709148121534888224
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 11:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jPskkZIg;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41SJM0J4055725;
	Wed, 28 Feb 2024 13:22:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709148120;
	bh=6Wj7h0vWRRQKtbaGC7BoIHCpYxOrL4HG1MMeVs82IUI=;
	h=From:To:Subject:Date;
	b=jPskkZIgN9h9+D+bT7HBV/dhhEB/655fMnU246GPkQh9/Dmkp23D/+DWPuOnHD7im
	 uzLraG2byQb9qzEJ+rySmD2DsHYN0Uc5xprud5Q2X1613PjJGj0pIol1Rit2D9F003
	 8ymCoBzs8+Cvpmh5t662OCAgZh8/dQd8XOuhLuyA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41SJM0l0031835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 28 Feb 2024 13:22:00 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Feb 2024 13:21:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Feb 2024 13:21:59 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41SJLxGu037209;
	Wed, 28 Feb 2024 13:21:59 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rfPV9-0005VQ-GE; Wed, 28 Feb 2024 13:21:59 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] Drop SRCPV
Date: Wed, 28 Feb 2024 13:21:59 -0600
Message-ID: <20240228192159.21125-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 28 Feb 2024 19:22:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15213

From: Denys Dmytriyenko <denys@konsulko.com>

A change in master from last year [1] dropped setting SRCPV.  Since it is now empty,
we do not need to use when setting PV.

[1] https://git.openembedded.org/openembedded-core/commit/?id=a8e7b0f932b9ea69b3a218fca18041676c65aba0

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-extended/irqbalance/irqbalance_git.bbappend         | 2 +-
 .../recipes-connectivity/hostap/hostap-daemon-wl18xx.bb         | 2 +-
 .../wpa-supplicant/wpa-supplicant-wl18xx.bb                     | 2 +-
 meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb | 2 +-
 meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb   | 2 +-
 meta-arago-extras/recipes-devtools/statcol/statcol.bb           | 2 +-
 .../recipes-sysrepo/libnetconf2/libnetconf2_git.bb              | 2 +-
 .../recipes-sysrepo/libredblack/libredblack_git.bb              | 2 +-
 meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb        | 2 +-
 .../recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb    | 2 +-
 .../sysrepo-plugins-common/sysrepo-plugins-common_git.bb        | 2 +-
 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb        | 2 +-
 .../recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb      | 2 +-
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb    | 2 +-
 meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb       | 2 +-
 meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb   | 2 +-
 meta-arago-test/recipes-support/mstpctl/mstpd_git.bb            | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
index 7c289fc1..55f4b54b 100644
--- a/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
+++ b/meta-arago-distro/recipes-extended/irqbalance/irqbalance_git.bbappend
@@ -1,4 +1,4 @@
 SRCREV = "c24ed221e9e82faf1ad22de133c3c97a0117c5d7"
-PV = "1.9.2+git${SRCPV}"
+PV = "1.9.2+git"
 
 PR:append = ".arago3"
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
index 65a72c77..50a00785 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
@@ -12,7 +12,7 @@ FILESEXTRAPATHS:append := ":${THISDIR}/hostap-daemon"
 
 # Add TI to the end to make it clear that this is a TI customized version
 # of hostap
-PV = "R8.7_SP3-devel-ti+git${SRCPV}"
+PV = "R8.7_SP3-devel-ti+git"
 
 # Tag: R8.7_SP3
 SRCREV = "ee8fbdb840d95e048f58fb62bf3b5472041b5417"
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
index 9552e2e5..516465b8 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant-wl18xx.bb
@@ -16,7 +16,7 @@ BRANCH = "upstream_25_rebase"
 PR:append = "b"
 
 # Add ti to the PV to indicate that this is a TI modify version of wpa-supplicant.
-PV = "R8.7_SP3-devel-ti+git${SRCPV}"
+PV = "R8.7_SP3-devel-ti+git"
 
 PROVIDES += "wpa-supplicant"
 RPROVIDES:${PN}  += "wpa-supplicant"
diff --git a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
index b783a22b..297e2152 100644
--- a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
+++ b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
@@ -2,7 +2,7 @@ UMMARY = "Extra modules and scripts for CMake"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING-CMAKE-SCRIPTS;md5=54c7042be62e169199200bc6477f04d1"
 
-PV = "1.5.0+gitr${SRCPV}"
+PV = "1.5.0+git"
 SRCREV = "8dc36cfa882f07a60b3ebdf16d9aac57871bd382"
 
 SRC_URI = " \
diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
index 6fc9f5df..ddd5d5c2 100644
--- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://eventdump.c;beginline=1;endline=34;md5=23b59be24a88ddc407b553035f3fd3e9"
 
 PR = "r4"
-PV = "1.0+git${SRCPV}"
+PV = "1.0+git"
 
 SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
 
diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
index f729b91b..223989ef 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -3,7 +3,7 @@ SUMMARY = "Statistics collector application"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
 
-PV = "1.0.4+git${SRCPV}"
+PV = "1.0.4+git"
 PROTOCOL = "https"
 BRANCH = "master"
 SRCREV = "279bf455bc3dec69f374d46a8225687935f4323a"
diff --git a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
index aaf134ea..196b36fe 100644
--- a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=08a5578c9bab06fb2ae84284630b973f"
 
 SRC_URI = "git://github.com/CESNET/libnetconf2.git;protocol=https;branch=devel"
 
-PV = "2.1.34+git${SRCPV}"
+PV = "2.1.34+git"
 SRCREV = "91cd6d75722c65de5c005d908f6d645b48cee89b"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
index f073aa06..412d08d8 100644
--- a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de174fb5a92cdbe038c88dc4c4316f99"
 
 SRC_URI = "git://github.com/sysrepo/libredblack.git;protocol=https;branch=master"
 
-PV = "1.0+git${SRCPV}"
+PV = "1.0+git"
 SRCREV = "a399310d99b61eec4d3c0677573ab5dddcf9395d"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb b/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
index cd5a2afd..ef5fed40 100644
--- a/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;protocol=https;branch=devel"
 
-PV = "2.1.77+git${SRCPV}"
+PV = "2.1.77+git"
 SRCREV = "a804113c9bbac3e36c53221be469c1ca5af5b435"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
index 8902cf3b..edd4d60d 100644
--- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/CESNET/Netopeer2.git;protocol=https;branch=devel \
 	        'file://netopeer2-serverd.service', '', d)} \
           "
 
-PV = "2.1.59+git${SRCPV}"
+PV = "2.1.59+git"
 SRCREV = "b81788d9a81770313a0eb7f88d4224726b3d6e15"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
index 48f6bc35..23d42fcc 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo-plugins-common/sysrepo-plugins-common_git.bb
@@ -7,7 +7,7 @@ SRC_URI = "gitsm://github.com/telekom/sysrepo-plugins-common.git;protocol=https;
 SRC_URI += " file://0001-so-version.patch "
 FILESEXTRAPATHS:prepend := "${THISDIR}:"
 
-PV = "dev+git${SRCPV}"
+PV = "dev+git"
 SRCREV = "20885de0d3bb95a05610fdb3a0f83d8f7c370fad"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
index a57b6bce..4400df70 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/sysrepo/sysrepo.git;protocol=https;branch=devel \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
                 'file://sysrepod.service','', d)}"
 
-PV = "2.2.71+git${SRCPV}"
+PV = "2.2.71+git"
 SRCREV = "b828f0ab4693c613cc66efd053a146e05854d5c8"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb b/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb
index d46176ce..c8406062 100644
--- a/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/tsn-yang-models/tsn-yang-models_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://README.md;md5=a89040f014c0c9c9360e29ddf88bf4a7"
 
 SRC_URI = "git://github.com/YangModels/yang.git;protocol=https;branch=main"
 
-PV = "1.0+git${SRCPV}"
+PV = "1.0+git"
 SRCREV = "d3f6ca02ec9ce7c96b55066d209d08adbe851897"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index cd4b1164..02052fba 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -12,7 +12,7 @@ DEPENDS += "alsa-lib"
 
 PE = "1"
 PR = "r7"
-PV:append = "+git${SRCPV}"
+PV:append = "+git"
 
 SRCREV = "a4d1659d5ab5be50c9d3ed32578a77fd879d88dc"
 BRANCH ?= "master"
diff --git a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
index 3d3af349..175c6771 100644
--- a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/omapconf/omapconf"
 LICENSE = "GPL-2.0-only | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=205c83c4e2242a765acb923fc766e914"
 
-PV = "1.75+git${SRCPV}"
+PV = "1.75+git"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap4"
 
diff --git a/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb b/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
index 643a1768..8c51a9e9 100644
--- a/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
+++ b/meta-arago-test/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://uvc-gadget.c;beginline=1;endline=18;md5=414860c3c534d
 
 SRC_URI = "git://git.ideasonboard.org/uvc-gadget.git;branch=master"
 
-PV = "1.1+git${SRCPV}"
+PV = "1.1+git"
 SRCREV = "aa82df887ab995473cd83c89777cdf4bc4685dd0"
 
 S = "${WORKDIR}/git"
diff --git a/meta-arago-test/recipes-support/mstpctl/mstpd_git.bb b/meta-arago-test/recipes-support/mstpctl/mstpd_git.bb
index 6b07889f..ed9c5f2c 100644
--- a/meta-arago-test/recipes-support/mstpctl/mstpd_git.bb
+++ b/meta-arago-test/recipes-support/mstpctl/mstpd_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4 \
 SRC_URI = "git://github.com/mstpd/mstpd.git;protocol=https;branch=master \
            file://0001-gcc8-strncpy-werror-workaround.patch"
 
-PV = "0.0.7+git${SRCPV}"
+PV = "0.0.7+git"
 SRCREV = "e4f0ba5a48649a3253f8b353c87c965e12aafc50"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


