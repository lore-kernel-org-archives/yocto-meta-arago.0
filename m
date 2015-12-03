Return-Path: <eyalr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 70CF35298C
	for <meta-arago@arago-project.org>;
	Thu,  3 Dec 2015 12:39:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB3CdiEc014928
	for <meta-arago@arago-project.org>; Thu, 3 Dec 2015 06:39:45 -0600
Received: from DFRE70.ent.ti.com (dfre70.ent.ti.com [10.167.188.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB3CdiFX007405
	for <meta-arago@arago-project.org>; Thu, 3 Dec 2015 06:39:44 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE70.ent.ti.com ([fe80::645e:109b:13d3:dfa7%25]) with mapi id
	14.03.0224.002; Thu, 3 Dec 2015 13:39:43 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] bt-firmware: use new bluetooth init
	scripts git
Thread-Index: AdEtx6N8mu1EEURLTL6QMqmM4CBxaQ==
Date: Thu, 3 Dec 2015 12:39:43 +0000
Message-ID: <8665E2433BC68541A24DFFCA87B70F5B2374CA22@DFRE01.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.188.42]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: [PATCH] bt-firmware: use new bluetooth init scripts git
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
X-List-Received-Date: Thu, 03 Dec 2015 12:39:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

* bluetooth service packs are now being released using a new git.
  update the recipe for using it.
* Init scripts are not platform dependent so remove unneeded logic
  that installed them based on the selected platform

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 ...001-Makefile-allow-building-within-the-OE.patch |   54 ----------------=
----
 ...-Remove-platform-check-and-install-defaul.patch |   41 ---------------
 .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |   18 +++----
 3 files changed, 6 insertions(+), 107 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0=
001-Makefile-allow-building-within-the-OE.patch
 delete mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0=
001-bt-firmware-Remove-platform-check-and-install-defaul.patch

diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Mak=
efile-allow-building-within-the-OE.patch b/meta-arago-extras/recipes-bsp/bt=
-firmware/bt-firmware/0001-Makefile-allow-building-within-the-OE.patch
deleted file mode 100644
index a8642a9..0000000
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-Makefile-a=
llow-building-within-the-OE.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 465ffd990e3366732eb5e2271313539b55c4ccb7 Mon Sep 17 00:00:00 2001
-From: Eyal Reizer <eyalr@ti.com>
-Date: Tue, 11 Feb 2014 15:17:53 +0200
-Subject: [PATCH] Makefile: allow building with OE
-
-* Use defaults and source values that allow building this
-  component with OE.
-
-Upstread-Status: Pending
-    * Will be accepted into next release
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
-    < adapated for am437x>
-Signed-off-by: Eyal Reizer <eyalr@ti.com>
----
- Makefile |   23 +++++++++++++++++++++++
- 1 files changed, 23 insertions(+), 0 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 9035e40..23bc5b6 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,5 +1,28 @@
- # Installs the the Bluetooth firmware files into the root file system
-=20
-+-include ../../../Rules.make
-+
-+# If KERNEL_DIR is not set then use the default in Rules.make
-+DEST_DIR ?=3D ${DESTDIR}
-+
-+PLATFORM ?=3D "unknown"
-+MACHINE_NAME ?=3D "unknown"
-+
-+ifeq ($(PLATFORM), am335x-evm)
-+    MACHINE_NAME :=3D am335x
-+endif
-+ifeq ($(PLATFORM), am180x-evm)
-+    MACHINE_NAME :=3D am1808
-+endif
-+ifeq ($(PLATFORM), da850-omapl138-evm)
-+    MACHINE_NAME :=3D am1808
-+endif
-+ifeq ($(PLATFORM), am37x-evm)
-+    MACHINE_NAME :=3D omap3evm
-+endif
-+ifeq ($(PLATFORM), am437x-evm)
-+    MACHINE_NAME :=3D am43xx
-+endif
- install:
- 	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
- 	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
---=20
-1.7.0.4
-
diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-=
firmware-Remove-platform-check-and-install-defaul.patch b/meta-arago-extras=
/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmware-Remove-platform-check=
-and-install-defaul.patch
deleted file mode 100644
index 4ad457e..0000000
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-bt-firmwar=
e-Remove-platform-check-and-install-defaul.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 40bb43c136ec8001d35f6077e5de5f8ac72f4da0 Mon Sep 17 00:00:00 2001
-From: Roger Monk <r-monk@ti.com>
-Date: Thu, 3 Oct 2013 02:59:54 +0100
-Subject: [PATCH] bt-firmware:  Remove platform check and install default
- firmware
-
-   * For undefined plaforms, install default firmware
-   * Remove configuration of 'unknown' so that install picks
-     firmware from root directory (default)
-
-Signed-off-by: Roger Monk <r-monk@ti.com>
----
- Makefile |    6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index bd94881..ca8280a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -5,8 +5,8 @@
- # If KERNEL_DIR is not set then use the default in Rules.make
- DEST_DIR ?=3D ${DESTDIR}
-=20
--PLATFORM ?=3D "unknown"
--MACHINE_NAME ?=3D "unknown"
-+#PLATFORM ?=3D "unknown"
-+#MACHINE_NAME ?=3D "unknown"
-=20
- ifeq ($(PLATFORM), am335x-evm)
-     MACHINE_NAME :=3D am335x
-@@ -23,6 +23,6 @@ endif
-=20
- install:
- 	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
--	cp -f ./${MACHINE_NAME}/* $(DEST_DIR)${BASE_LIB_DIR}/firmware
-+	cp -f ./${MACHINE_NAME}/*.bts $(DEST_DIR)${BASE_LIB_DIR}/firmware
-=20
-=20
---=20
-1.7.9.5
-
diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb b=
/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
index 52d6774..f82c2a0 100644
--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Firmware files for Bluetooth"
 LICENSE =3D "TI-TSPA"
-LIC_FILES_CHKSUM =3D "file://am335x/LICENCE;md5=3D1c9961176d6529283e0d0c98=
3be41b45"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df39eac9f4573be5b012e8313831e72a=
9"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
@@ -11,21 +11,15 @@ RCONFLICTS_${PN} =3D "linux-firmware-wl12xx"
 RREPLACES_${PN}  =3D "linux-firmware-wl12xx"
=20
 PV =3D "R8.5+git${SRCPV}"
-PR =3D "r9"
+PR =3D "r10"
=20
 COMPATIBLE_MACHINE =3D "ti33x|ti43x|dra7xx"
=20
 CLEANBROKEN =3D "1"
=20
-SRCREV =3D "46f6a1d0087bd9aac6e6cbae58ed9ee236e5f1b1"
+SRCREV =3D "0c0eae241ea8a6e0b33d59f504741c8d5a2587ce"
 BRANCH =3D "master"
-SRC_URI =3D "git://git.ti.com/wilink8-bt/ti-bt-firmware.git;branch=3D${BRA=
NCH} \
-           file://0001-Makefile-allow-building-within-the-OE.patch \
-           file://0001-bt-firmware-Remove-platform-check-and-install-defau=
l.patch"
-
-PLATFORM =3D "unknown"
-PLATFORM_ti33x =3D "am335x-evm"
-PLATFORM_ti43x =3D "am437x-evm"
+SRC_URI =3D "git://git.ti.com/ti-bt/service-packs.git;branch=3D${BRANCH}"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -35,7 +29,7 @@ do_compile() {
=20
 do_install() {
     install -d ${D}${base_libdir}/firmware/ti-connectivity
-    oe_runmake 'DEST_DIR=3D${D}' 'BASE_LIB_DIR=3D${base_libdir}' 'PLATFORM=
=3D${PLATFORM}' install
+    oe_runmake 'DEST_DIR=3D${D}' 'BASE_LIB_DIR=3D${base_libdir}' install
 }
=20
-FILES_${PN} +=3D "${base_libdir}/firmware"
+FILES_${PN} +=3D "${base_libdir}/firmware/ti-connectivity/*"
--=20
1.7.9.5


