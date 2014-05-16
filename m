Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B0B6C52986
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 18:42:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GIgWT3028638
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:42:32 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GIgVVY008766
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:42:32 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 16 May 2014 13:42:31 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Aravind Batni <aravindbr@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ti-pa: provides ti pa recipe for KeyStone
	devices
Thread-Index: AQHPcTYsZW/Wp8MNPESp5qTL6AMDOJtDiguw
Date: Fri, 16 May 2014 18:42:31 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D022940@DLEE11.ent.ti.com>
References: <1400265558-8643-1-git-send-email-aravindbr@ti.com>
In-Reply-To: <1400265558-8643-1-git-send-email-aravindbr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ti-pa: provides ti pa recipe for KeyStone	devices
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
X-List-Received-Date: Fri, 16 May 2014 18:42:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Aravind Batni
>Sent: Friday, May 16, 2014 1:39 PM
>To: meta-arago@arago-project.org
>Cc: Aravind Batni
>Subject: [meta-arago] [PATCH] ti-pa: provides ti pa recipe for
>KeyStone devices
>
>- TI PA Low Level Driver
>
>Signed-off-by: Aravind Batni <aravindbr@ti.com>
>---
> .../recipes-bsp/ti-pa/ti-pa-bin_git.bb             |   33
>++++++++++++++++++++
> .../recipes-bsp/ti-pa/ti-pa-lib_git.bb             |   20
>++++++++++++
> meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc      |   10 ++++++
> 3 files changed, 63 insertions(+)
> create mode 100644 meta-arago-extras/recipes-bsp/ti-pa/ti-pa-
>bin_git.bb
> create mode 100644 meta-arago-extras/recipes-bsp/ti-pa/ti-pa-
>lib_git.bb
> create mode 100644 meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc
>
>diff --git a/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-bin_git.bb
>b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-bin_git.bb
>new file mode 100644
>index 0000000..ecfffc2
>--- /dev/null
>+++ b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-bin_git.bb
>@@ -0,0 +1,33 @@
>+DESCRIPTION =3D "TI PA LLD unit test and example binaries"
>+COMPATIBLE_MACHINE =3D "keystone"
>+DEPENDS=3D"ti-csl ti-pa-lib ti-cppi-lib ti-qmss-lib"

Dependencies are missing

>+
>+include ti-pa.inc
>+
>+PR =3D "r0"
>+
>+DEVICELIST =3D "k2h k2k"
>+
>+CHOICELIST =3D "yes no"
>+
>+BASEDIR =3D "${WORKDIR}/git"
>+S =3D "${BASEDIR}/ti/drv/pa"
>+
>+do_compile () {
>+# Now build the lld unit test examples
>+    for device in ${DEVICELIST}
>+    do
>+      make -f makefile_armv7 clean
>PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"$device"
>PA_SRC_DIR=3D${S}
>+      for choice in ${CHOICELIST}
>+      do
>+        make -f makefile_armv7 tests examples
>PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"$device"
>PA_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D"$choice"
>+      done
>+    done
>+}
>+
>+do_install () {
>+    for device in ${DEVICELIST}
>+    do
>+      make -f makefile_armv7 installbin
>PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"$device"
>PA_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}${bindir}
>+    done
>+}
>diff --git a/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-lib_git.bb
>b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-lib_git.bb
>new file mode 100644
>index 0000000..a549a99
>--- /dev/null
>+++ b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-lib_git.bb
>@@ -0,0 +1,20 @@
>+DESCRIPTION =3D "TI PA LLD library"
>+COMPATIBLE_MACHINE =3D "keystone"
>+
>+DEPENDS=3D"ti-csl ti-rm"
>+
>+include ti-pa.inc
>+
>+PR =3D "r0"
>+
>+BASEDIR =3D "${WORKDIR}/git"
>+S =3D "${BASEDIR}/ti/drv/pa"
>+
>+do_compile () {
>+#   Now build the lld in the updated directory
>+    make -f makefile_armv7 clean lib
>PDK_INSTALL_PATH=3D${STAGING_INCDIR}
>+}
>+
>+do_install () {
>+    make -f makefile_armv7 install
>PDK_INSTALL_PATH=3D${STAGING_INCDIR}
>INSTALL_INC_BASE_DIR=3D${D}${includedir}
>INSTALL_LIB_BASE_DIR=3D${D}${libdir}
>+}
>diff --git a/meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc b/meta-
>arago-extras/recipes-bsp/ti-pa/ti-pa.inc
>new file mode 100644
>index 0000000..134f1f2
>--- /dev/null
>+++ b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc
>@@ -0,0 +1,10 @@
>+LICENSE =3D "TI BSD"
>+LIC_FILES_CHKSUM =3D
>"file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=3De8f6789acdcda76d0
>2ed9203fc2e603d"
>+
>+BRANCH=3D"master"
>+SRC_URI =3D "git://git.ti.com/keystone-rtos/pa-
>lld.git;destsuffix=3Dgit/ti/drv/pa;protocol=3Dgit;branch=3D${BRANCH}"
>+
>+# Below Commit ID corresponds to "DEV.PA_LLD.02.00.01.05"
>+SRCREV =3D "a8f42102a60528c36720c211ea457eecf20f8481"
>+PV =3D "02.00.01.05"
>+SRCREV =3D "DEV.PA_LLD.02.00.01.05"
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

