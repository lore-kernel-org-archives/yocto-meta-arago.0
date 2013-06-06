Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 093D1529A8
	for <meta-arago@arago-project.org>;
	Thu,  6 Jun 2013 21:41:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r56LfLGR011458
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2013 16:41:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r56LfLmY027250
	for <meta-arago@arago-project.org>; Thu, 6 Jun 2013 16:41:21 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Jun 2013 16:41:20 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r56LfCIb004073;
	Thu, 6 Jun 2013 16:41:19 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Jun 2013 16:47:48 -0500
Message-ID: <1370555268-22244-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1370555268-22244-1-git-send-email-fcooper@ti.com>
References: <1370555268-22244-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/3] wl12xx-firmware: Update to Wilink 6 version of wl1271-nvs.bin
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
X-List-Received-Date: Thu, 06 Jun 2013 21:41:22 -0000
Content-Type: text/plain

* The version of the wl1271-nvs.bin included in the current repository was meant
  for Wilink 7 not Wilink 6.
* This caused firmware errors which caused Wilink 6 not to work on any boards
  that don't rerun a calibration script.
* Use the Wilink 6 version of the nvs file to use a version supported by Wilink
  6 so by default wireless will work.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wl1271-nvs.bin-wilink6                         |  Bin 0 -> 912 bytes
 .../wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb   |    7 ++++++-
 2 files changed, 6 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/wl1271-nvs.bin-wilink6

diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/wl1271-nvs.bin-wilink6 b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware-r5.sp4.01/wl1271-nvs.bin-wilink6
new file mode 100644
index 0000000000000000000000000000000000000000..bb6ff93e585cbc92e1270a3a01779d0614616441
GIT binary patch
literal 912
zcmZR~4PgKR#zHU!VnP7pOvbNJCKJPte=uQe^tV53Y#dx%Jp6*9;?i;|3|b5Z4CV}W
z3@!|Q4517$4Dk$!46zIm*tCv{0Yl)=-+%xA1ET;4n3$M|2ofe?Y>HMf1I=IpnZ(2j
zl4oRO;AD{y;9&Uv{`q~70KYvdp8-uCq=w<mHwGSwAAcA)1U~#=;1U6gQAU(AHZaJ_
qE2*h#O35p!s;Z00$|<O*2H*jpU|?bp6%`c}73GuDrOf&vrW*iCk}^R6

literal 0
HcmV?d00001

diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
index 2232e1c..96b15e0 100644
--- a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
+++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_r5.sp4.01.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
 
 PACKAGE_ARCH = "all"
 
-PR = "r3+gitr${SRCPV}"
+PR = "r4+gitr${SRCPV}"
 
 # This recipe provides the latest firmware files for wl12xx.
 # Therefore, use the contents of this recipe instead of the contents
@@ -16,6 +16,7 @@ RPROVIDES_${PN}  = "linux-firmware-wl12xx"
 SRCREV = "c8d6b8e6ddf81091e1b1c99ebfb6751cc62b2c63"
 SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git \
            file://Makefile \
+           file://wl1271-nvs.bin-wilink6 \
           "
 
 S = "${WORKDIR}/git/hw/firmware"
@@ -26,6 +27,10 @@ do_compile() {
 
 do_install() {
     cp ${WORKDIR}/Makefile ${S}
+    # Remove Wilink 7 version
+    rm ${S}/wl1271-nvs.bin
+    # Copy and use Wilink 6 version
+    cp ${WORKDIR}/wl1271-nvs.bin-wilink6 ${S}/wl1271-nvs.bin
     oe_runmake 'DEST_DIR=${D}' install
 }
 
-- 
1.7.0.4


