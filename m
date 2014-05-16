Return-Path: <aravindbr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DD1D752997
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 18:51:14 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GIpDuF015727
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:51:13 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GIpAjM024266
	for <meta-arago@arago-project.org>; Sat, 17 May 2014 00:21:11 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0174.001; Sat, 17 May 2014 00:21:09 +0530
From: Aravind Batni <aravindbr@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ti-pa: provides ti pa recipe for KeyStone
	devices
Thread-Index: AQHPcTaap+vGaCj5pEKVvT2ys8d5XptDjQsw
Date: Fri, 16 May 2014 18:51:09 +0000
Message-ID: <941289A393E94C478C153EF5E432FDBB3EAADBB2@DBDE04.ent.ti.com>
References: <1400265558-8643-1-git-send-email-aravindbr@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D022940@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D022940@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
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
X-List-Received-Date: Fri, 16 May 2014 18:51:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry ! wrong order. We are sending the dependent patches also.

-Best Regards,
Aravind

> -----Original Message-----
> From: Maupin, Chase
> Sent: Friday, May 16, 2014 2:43 PM
> To: Aravind Batni; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] ti-pa: provides ti pa recipe for KeySto=
ne
> devices
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Aravind Batni
> >Sent: Friday, May 16, 2014 1:39 PM
> >To: meta-arago@arago-project.org
> >Cc: Aravind Batni
> >Subject: [meta-arago] [PATCH] ti-pa: provides ti pa recipe for KeyStone
> >devices
> >
> >- TI PA Low Level Driver
> >
> >Signed-off-by: Aravind Batni <aravindbr@ti.com>
> >---
> > .../recipes-bsp/ti-pa/ti-pa-bin_git.bb             |   33
> >++++++++++++++++++++
> > .../recipes-bsp/ti-pa/ti-pa-lib_git.bb             |   20
> >++++++++++++
> > meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc      |   10 ++++++
> > 3 files changed, 63 insertions(+)
> > create mode 100644 meta-arago-extras/recipes-bsp/ti-pa/ti-pa-
> >bin_git.bb
> > create mode 100644 meta-arago-extras/recipes-bsp/ti-pa/ti-pa-
> >lib_git.bb
> > create mode 100644 meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc
> >
> >diff --git a/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-bin_git.bb
> >b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-bin_git.bb
> >new file mode 100644
> >index 0000000..ecfffc2
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-bin_git.bb
> >@@ -0,0 +1,33 @@
> >+DESCRIPTION =3D "TI PA LLD unit test and example binaries"
> >+COMPATIBLE_MACHINE =3D "keystone"
> >+DEPENDS=3D"ti-csl ti-pa-lib ti-cppi-lib ti-qmss-lib"
>=20
> Dependencies are missing
>=20
> >+
> >+include ti-pa.inc
> >+
> >+PR =3D "r0"
> >+
> >+DEVICELIST =3D "k2h k2k"
> >+
> >+CHOICELIST =3D "yes no"
> >+
> >+BASEDIR =3D "${WORKDIR}/git"
> >+S =3D "${BASEDIR}/ti/drv/pa"
> >+
> >+do_compile () {
> >+# Now build the lld unit test examples
> >+    for device in ${DEVICELIST}
> >+    do
> >+      make -f makefile_armv7 clean
> >PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"$device"
> >PA_SRC_DIR=3D${S}
> >+      for choice in ${CHOICELIST}
> >+      do
> >+        make -f makefile_armv7 tests examples
> >PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"$device"
> >PA_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D"$choice"
> >+      done
> >+    done
> >+}
> >+
> >+do_install () {
> >+    for device in ${DEVICELIST}
> >+    do
> >+      make -f makefile_armv7 installbin
> >PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"$device"
> >PA_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}${bindir}
> >+    done
> >+}
> >diff --git a/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-lib_git.bb
> >b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-lib_git.bb
> >new file mode 100644
> >index 0000000..a549a99
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa-lib_git.bb
> >@@ -0,0 +1,20 @@
> >+DESCRIPTION =3D "TI PA LLD library"
> >+COMPATIBLE_MACHINE =3D "keystone"
> >+
> >+DEPENDS=3D"ti-csl ti-rm"
> >+
> >+include ti-pa.inc
> >+
> >+PR =3D "r0"
> >+
> >+BASEDIR =3D "${WORKDIR}/git"
> >+S =3D "${BASEDIR}/ti/drv/pa"
> >+
> >+do_compile () {
> >+#   Now build the lld in the updated directory
> >+    make -f makefile_armv7 clean lib
> >PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> >+}
> >+
> >+do_install () {
> >+    make -f makefile_armv7 install
> >PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> >INSTALL_INC_BASE_DIR=3D${D}${includedir}
> >INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> >+}
> >diff --git a/meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc b/meta-
> >arago-extras/recipes-bsp/ti-pa/ti-pa.inc
> >new file mode 100644
> >index 0000000..134f1f2
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-bsp/ti-pa/ti-pa.inc
> >@@ -0,0 +1,10 @@
> >+LICENSE =3D "TI BSD"
> >+LIC_FILES_CHKSUM =3D
> >"file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=3De8f6789acdcda76d0
> >2ed9203fc2e603d"
> >+
> >+BRANCH=3D"master"
> >+SRC_URI =3D "git://git.ti.com/keystone-rtos/pa-
> >lld.git;destsuffix=3Dgit/ti/drv/pa;protocol=3Dgit;branch=3D${BRANCH}"
> >+
> >+# Below Commit ID corresponds to "DEV.PA_LLD.02.00.01.05"
> >+SRCREV =3D "a8f42102a60528c36720c211ea457eecf20f8481"
> >+PV =3D "02.00.01.05"
> >+SRCREV =3D "DEV.PA_LLD.02.00.01.05"
> >--
> >1.7.9.5
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

