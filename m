Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6E3B8529CA
	for <meta-arago@arago-project.org>;
	Fri, 12 Jul 2013 06:43:30 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6C6hSMc012224
	for <meta-arago@arago-project.org>; Fri, 12 Jul 2013 01:43:29 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6C6hPoE021910
	for <meta-arago@arago-project.org>; Fri, 12 Jul 2013 01:43:27 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Fri, 12 Jul 2013 14:43:25 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCHv2] abefw: Firmware for OMAP5 ABE
Thread-Index: AQHOfssbS/NvvnlEzECD5/NtnhO/wA==
Date: Fri, 12 Jul 2013 06:43:25 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D543FB18@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: [PATCHv2] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Fri, 12 Jul 2013 06:43:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


* The OMAP5 Audio Backend requires a 'firmware' to enable
  sound. This recipe installs a prebuilt firmware. This
  part is a hack, as in the current form, the firmware
  cannot be cross-compiled. There is a plan to fix this
  and hopefully, this recipe is short-lived. Once the code
  is fixed, we should have new recipes that build the firmware
  and clean up this recipe.

v2:
* Merged contents from abefw.inc and removed abefw.inc based
  on review.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes-bsp/abefw/abefw_1.0.14.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)  create mode 100644 reci=
pes-bsp/abefw/abefw_1.0.14.bb

diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.=
0.14.bb
new file mode 100644
index 0000000..8db71e4
--- /dev/null
+++ b/recipes-bsp/abefw/abefw_1.0.14.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "Firmware for OMAP5 ABE"
+HOMEPAGE =3D "http://git.ti.com"
+LICENSE =3D "BSD/GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D923db086ed9463ab3215b24d87e05ec=
5"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE =3D "omap5-evm"
+
+SRC_URI =3D "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=3Dgit"
+
+S =3D "${WORKDIR}/git"
+
+SRCREV =3D "ceccc0332264e39bdc51e54f80ea7256a3886c58"
+
+do_install() {
+        mkdir -p ${D}/lib/firmware
+        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/ }
+
+FILES_${PN} +=3D "/lib/firmware/omap4_abe_new"
--
1.7.0.4


