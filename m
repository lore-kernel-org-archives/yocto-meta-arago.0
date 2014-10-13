Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 81706529C2
	for <meta-arago@arago-project.org>;
	Mon, 13 Oct 2014 15:15:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9DFFe8w010310
	for <meta-arago@arago-project.org>; Mon, 13 Oct 2014 10:15:40 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9DFFeQE003215
	for <meta-arago@arago-project.org>; Mon, 13 Oct 2014 10:15:40 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 13 Oct 2014 10:15:40 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s9DFFbdR008178;	Mon, 13 Oct 2014 10:15:39 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Oct 2014 20:40:50 +0530
Message-ID: <1413213050-7200-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1413213050-7200-1-git-send-email-a0393906@ti.com>
References: <1413213050-7200-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [master PATCH v2 1/1] ipumm-fw: Updated ipumm firmware for latest IPC version
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
X-List-Received-Date: Mon, 13 Oct 2014 15:15:41 -0000
Content-Type: text/plain

* This includes the error handling support.
* Minor bug fixes

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...umm-fw_3.00.04.02.bb => ipumm-fw_3.00.06.00.bb} |   25 ++++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)
 rename recipes-bsp/ipumm-fw/{ipumm-fw_3.00.04.02.bb => ipumm-fw_3.00.06.00.bb} (53%)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
similarity index 53%
rename from recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
rename to recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
index 7f67c39..5049945 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
@@ -6,26 +6,22 @@ python __anonymous() {
         raise bb.parse.SkipPackage('ipumm-fw does not apply to systems without the "mmip" flag in MACHINE_FEATURES')
 }
 
-DESCRIPTION = "Firmware for IPU "
-
+DESCRIPTION = "Firmware for IPU for supporting Accelerated MM decode and encode"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM_dra7xx = "file://MMIP-${PV}-Manifest.doc;md5=64ca6f9d7e5243b8a4084eb918a543bc"
+
+LIC_FILES_CHKSUM_dra7xx-evm = "file://MMIP-${PV}-Manifest.doc;md5=8206ccaf28c2932afb5afd9c9575287c"
 LIC_FILES_CHKSUM_omap5-evm = "file://MMIP-${PV}-Manifest.doc;md5=39a593dd8fc2a9654c74f679ed329c45"
 
-COMPATIBLE_MACHINE = "omap-a15"
+COMPATIBLE_MACHINE = "dra7xx-evm|omap5-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# Need to set the PLATFORM variable since now multiple MACHINEs are sharing
-# a common named tarball
-PLATFORM = "UNKNOWN"
-PLATFORM_dra7xx = "dra7xx-evm"
-PLATFORM_omap5-evm = "omap5-evm"
+SRC_URI_dra7xx-evm = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_06_00/exports/ipumm-${MACHINE}-3.00.06.00.tar.gz;protocol=ftp;name=${MACHINE}"
 
-SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${PLATFORM}-3.00.04.02.tar.gz;protocol=http;name=${PLATFORM}"
+SRC_URI_omap5-evm  = "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_04_02/exports/ipumm-${MACHINE}-3.00.04.02.tar.gz;protocol=http;name=${MACHINE}"
 
 # DRA7xx checksums
-SRC_URI[dra7xx-evm.md5sum] = "da04c03b0fd57901e8283afa80f81379"
-SRC_URI[dra7xx-evm.sha256sum] = "0b26fd13f9c318b52c18b9bff56862ef1f58a768b19285b87c035e65bc828ddc"
+SRC_URI[dra7xx-evm.md5sum] = "8e1ae40eb10d631318d001463fa11d79"
+SRC_URI[dra7xx-evm.sha256sum] = "30c275146c34d11dbc2dfd568f0bbc3098a13cd981eee8a7a9766cb07d2f1ca5"
 
 # OMAP5 checksums
 SRC_URI[omap5-evm.md5sum] = "1572073ebd4f6d127c4e8cf47d270b6a"
@@ -33,7 +29,7 @@ SRC_URI[omap5-evm.sha256sum] = "2fdb469f19e3c9984854f5bc82444fca4d7da869f5e645da
 
 S = "${WORKDIR}/ipumm-${MACHINE}-${PV}"
 
-TARGET_dra7xx = "dra7-ipu2-fw.xem4"
+TARGET_dra7xx-evm = "dra7-ipu2-fw.xem4"
 TARGET_omap5-evm = "ducati-m3-core0.xem3"
 
 do_install() {
@@ -42,3 +38,6 @@ do_install() {
 }
 
 FILES_${PN} += "${base_libdir}/firmware/${TARGET}"
+
+PR = "r1"
+
-- 
1.7.9.5


