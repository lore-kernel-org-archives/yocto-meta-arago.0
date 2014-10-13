Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1F0FC529D9
	for <meta-arago@arago-project.org>;
	Mon, 13 Oct 2014 15:25:56 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9DFPsmD011649
	for <meta-arago@arago-project.org>; Mon, 13 Oct 2014 10:25:54 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9DFPpb5024562
	for <meta-arago@arago-project.org>; Mon, 13 Oct 2014 20:55:53 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0174.001; Mon, 13 Oct 2014 20:55:50 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [master PATCH v2 1/1] ipumm-fw: Updated ipumm firmware for
	latest IPC version
Thread-Index: AQHP5viOA8DhH1KvbUuOVhwkqFWXv5wuJdgA
Date: Mon, 13 Oct 2014 15:25:49 +0000
Message-ID: <24B88602B5904F49971CAF899152529B8239D1@DBDE04.ent.ti.com>
References: <1413213050-7200-1-git-send-email-a0393906@ti.com>
	<1413213050-7200-2-git-send-email-a0393906@ti.com>
In-Reply-To: <1413213050-7200-2-git-send-email-a0393906@ti.com>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: [master PATCH v2 1/1] ipumm-fw: Updated ipumm firmware for latest IPC version
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
X-List-Received-Date: Mon, 13 Oct 2014 15:25:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore this patch here, sent it by mistake to meta-arago.
Posted it on meta-ti.

-----Original Message-----
From: R, Karthik=20
Sent: Monday, October 13, 2014 8:41 PM
To: meta-arago@arago-project.org
Cc: R, Karthik
Subject: [master PATCH v2 1/1] ipumm-fw: Updated ipumm firmware for latest =
IPC version

* This includes the error handling support.
* Minor bug fixes

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...umm-fw_3.00.04.02.bb =3D> ipumm-fw_3.00.06.00.bb} |   25 ++++++++++----=
------
 1 file changed, 12 insertions(+), 13 deletions(-)  rename recipes-bsp/ipum=
m-fw/{ipumm-fw_3.00.04.02.bb =3D> ipumm-fw_3.00.06.00.bb} (53%)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb b/recipes-bsp/ipum=
m-fw/ipumm-fw_3.00.06.00.bb
similarity index 53%
rename from recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
rename to recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
index 7f67c39..5049945 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_3.00.04.02.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb
@@ -6,26 +6,22 @@ python __anonymous() {
         raise bb.parse.SkipPackage('ipumm-fw does not apply to systems wit=
hout the "mmip" flag in MACHINE_FEATURES')  }
=20
-DESCRIPTION =3D "Firmware for IPU "
-
+DESCRIPTION =3D "Firmware for IPU for supporting Accelerated MM decode and=
 encode"
 LICENSE =3D "TI-TSPA"
-LIC_FILES_CHKSUM_dra7xx =3D "file://MMIP-${PV}-Manifest.doc;md5=3D64ca6f9d=
7e5243b8a4084eb918a543bc"
+
+LIC_FILES_CHKSUM_dra7xx-evm =3D "file://MMIP-${PV}-Manifest.doc;md5=3D8206=
ccaf28c2932afb5afd9c9575287c"
 LIC_FILES_CHKSUM_omap5-evm =3D "file://MMIP-${PV}-Manifest.doc;md5=3D39a59=
3dd8fc2a9654c74f679ed329c45"
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "dra7xx-evm|omap5-evm"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-# Need to set the PLATFORM variable since now multiple MACHINEs are sharin=
g -# a common named tarball -PLATFORM =3D "UNKNOWN"
-PLATFORM_dra7xx =3D "dra7xx-evm"
-PLATFORM_omap5-evm =3D "omap5-evm"
+SRC_URI_dra7xx-evm =3D "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/=
ipumm/3_00_06_00/exports/ipumm-${MACHINE}-3.00.06.00.tar.gz;protocol=3Dftp;=
name=3D${MACHINE}"
=20
-SRC_URI =3D "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/ipumm/3_00_=
04_02/exports/ipumm-${PLATFORM}-3.00.04.02.tar.gz;protocol=3Dhttp;name=3D${=
PLATFORM}"
+SRC_URI_omap5-evm  =3D "http://downloads.ti.com/dsps/dsps_public_sw/glsdk/=
ipumm/3_00_04_02/exports/ipumm-${MACHINE}-3.00.04.02.tar.gz;protocol=3Dhttp=
;name=3D${MACHINE}"
=20
 # DRA7xx checksums
-SRC_URI[dra7xx-evm.md5sum] =3D "da04c03b0fd57901e8283afa80f81379"
-SRC_URI[dra7xx-evm.sha256sum] =3D "0b26fd13f9c318b52c18b9bff56862ef1f58a76=
8b19285b87c035e65bc828ddc"
+SRC_URI[dra7xx-evm.md5sum] =3D "8e1ae40eb10d631318d001463fa11d79"
+SRC_URI[dra7xx-evm.sha256sum] =3D "30c275146c34d11dbc2dfd568f0bbc3098a13cd=
981eee8a7a9766cb07d2f1ca5"
=20
 # OMAP5 checksums
 SRC_URI[omap5-evm.md5sum] =3D "1572073ebd4f6d127c4e8cf47d270b6a"
@@ -33,7 +29,7 @@ SRC_URI[omap5-evm.sha256sum] =3D "2fdb469f19e3c9984854f5b=
c82444fca4d7da869f5e645da
=20
 S =3D "${WORKDIR}/ipumm-${MACHINE}-${PV}"
=20
-TARGET_dra7xx =3D "dra7-ipu2-fw.xem4"
+TARGET_dra7xx-evm =3D "dra7-ipu2-fw.xem4"
 TARGET_omap5-evm =3D "ducati-m3-core0.xem3"
=20
 do_install() {
@@ -42,3 +38,6 @@ do_install() {
 }
=20
 FILES_${PN} +=3D "${base_libdir}/firmware/${TARGET}"
+
+PR =3D "r1"
+
--
1.7.9.5


