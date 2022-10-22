Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F319FC433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 04:58:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.3647.1666414686026523449
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 21:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 70F6740DEF;
	Sat, 22 Oct 2022 04:58:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUQwXWpEleXL; Sat, 22 Oct 2022 04:58:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 367FE40DE8;
	Sat, 22 Oct 2022 04:58:04 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 35C92174A39;
	Sat, 22 Oct 2022 00:58:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] meta-arago-distro: drop support for top-level Makefile builds in SDK
Date: Sat, 22 Oct 2022 04:58:02 +0000
Message-Id: <20221022045802.3385989-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Oct 2022 04:58:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14086

From: Denys Dmytriyenko <denys@konsulko.com>

Historically, top-level TI-SDK Makefile was an extra layer on top of the
standard OE SDK to drive the cross-compilation of select components outsi=
de
of the normal OpenEmbedded/Yocto flow - back in the day when Yocto Projec=
t
was young and unfamiliar to embedded developers. Times have changed and t=
he
OpenEmbedded/Yocto Project became the standard, while maintaining two bui=
ld
frameworks in the same product requires a lot of effort, so let's drop th=
e
top-level Makefile support going forward.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...packagegroup-arago-tisdk-amsdk-sdk-host.bb |   1 -
 .../ti-tisdk-makefile/Makefile                |   7 -
 .../ti-tisdk-makefile/Makefile_am-sysinfo     |  24 --
 .../ti-tisdk-makefile/Makefile_arm-benchmarks |  24 --
 .../ti-tisdk-makefile/Makefile_av-examples    |  24 --
 .../ti-tisdk-makefile/Makefile_barcode-roi    |  19 --
 .../ti-tisdk-makefile/Makefile_boot-monitor   |  30 --
 .../ti-tisdk-makefile/Makefile_cmem-mod       |  33 --
 .../ti-tisdk-makefile/Makefile_cryptodev      |  28 --
 .../Makefile_debugss-module-drv               |  29 --
 .../Makefile_dual-camera-demo                 |  24 --
 .../Makefile_gdbserverproxy-module-drv        |  29 --
 .../ti-tisdk-makefile/Makefile_hplib-mod      |  28 --
 .../ti-tisdk-makefile/Makefile_image-gallery  |  24 --
 .../Makefile_linalg-examples                  |  39 ---
 .../ti-tisdk-makefile/Makefile_linux          |  29 --
 .../ti-tisdk-makefile/Makefile_linux-dtbs     |  30 --
 .../ti-tisdk-makefile/Makefile_matrix-gui     |  18 -
 .../Makefile_matrix-gui-browser               |  24 --
 .../Makefile_mmwavegesture-hmi                |  24 --
 .../ti-tisdk-makefile/Makefile_omapconf       |  19 --
 .../Makefile_opencl-examples                  |  32 --
 .../Makefile_openmpacc-examples               |  32 --
 .../Makefile_oprofile-example                 |  18 -
 .../Makefile_pdm-anomaly-detection            |  24 --
 .../ti-tisdk-makefile/Makefile_pru            |  18 -
 .../ti-tisdk-makefile/Makefile_pru-icss       | 117 -------
 ...file_qt-opencv-opencl-opengl-multithreaded |  24 --
 .../ti-tisdk-makefile/Makefile_qt-tstat       |  24 --
 .../Makefile_quick-playground                 |  24 --
 .../ti-tisdk-makefile/Makefile_refresh-screen |  24 --
 .../ti-tisdk-makefile/Makefile_sysfw-image    |  49 ---
 .../Makefile_ti-crypto-examples               |  24 --
 .../Makefile_ti-gc320-driver                  |  25 --
 .../Makefile_ti-img-rogue-driver              |  26 --
 .../ti-tisdk-makefile/Makefile_ti-ipc         | 137 --------
 .../Makefile_ti-ocf-crypto-module             |  18 -
 .../ti-tisdk-makefile/Makefile_ti-sgx-ddk-km  |  25 --
 .../ti-tisdk-makefile/Makefile_tiovx-app-host |  34 --
 .../ti-tisdk-makefile/Makefile_u-boot-legacy  |  16 -
 .../ti-tisdk-makefile/Makefile_u-boot-spl     |  23 --
 .../ti-tisdk-makefile/Makefile_uio-module-drv |  28 --
 .../ti-tisdk-makefile/Rules.make              |  45 ---
 .../ti-tisdk-makefile/k3/Makefile_u-boot-spl  |  59 ----
 .../ti-tisdk-makefile_1.0.bb                  | 317 ------------------
 45 files changed, 1670 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_am-sysinfo
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_arm-benchmarks
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_av-examples
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_barcode-roi
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_boot-monitor
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_cmem-mod
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_cryptodev
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_debugss-module-drv
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_dual-camera-demo
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_gdbserverproxy-module-drv
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_hplib-mod
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_image-gallery
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_linalg-examples
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_linux
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_linux-dtbs
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_matrix-gui
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_matrix-gui-browser
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_mmwavegesture-hmi
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_omapconf
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_opencl-examples
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_openmpacc-examples
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_oprofile-example
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_pdm-anomaly-detection
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_pru
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_pru-icss
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_qt-opencv-opencl-opengl-multithreaded
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_qt-tstat
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_quick-playground
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_refresh-screen
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_sysfw-image
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_ti-crypto-examples
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_ti-gc320-driver
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_ti-img-rogue-driver
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_ti-ipc
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_ti-ocf-crypto-module
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_ti-sgx-ddk-km
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_tiovx-app-host
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_u-boot-legacy
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_u-boot-spl
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Makefile_uio-module-drv
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/Rules.make
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile/k3/Makefile_u-boot-spl
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-=
tisdk-makefile_1.0.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroup=
s/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index bd27f0f1..2870d7ed 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-amsdk-sdk-host.bb
@@ -23,7 +23,6 @@ EXTRA_FILES:k3 =3D "tisdk-readme tisdk-uenv"
 RDEPENDS:${PN} =3D "\
     ti-tisdk-setup \
     ${EXTRA_FILES} \
-    ti-tisdk-makefile \
     ${UBOOT_SRC} \
     ${KERNEL_SRC} \
     ${@oe.utils.conditional('KERNEL_SHADOW_CLONE_ENABLED','true','unshal=
low-repositories','',d)} \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-t=
isdk-makefile/Makefile
deleted file mode 100644
index 66449d4e..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile
+++ /dev/null
@@ -1,7 +0,0 @@
--include Rules.make
-
-MAKE_JOBS ?=3D 1
-
-all: __ALL_TARGETS__
-clean: __CLEAN_TARGETS__
-install: __INSTALL_TARGETS__
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_am-sysinfo b/meta-arago-distro/recipes-tisdk/ti-tisdk-ma=
kefile/ti-tisdk-makefile/Makefile_am-sysinfo
deleted file mode 100644
index 20f7af3e..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_am-sysinfo
+++ /dev/null
@@ -1,24 +0,0 @@
-# am-sysinfo build targets
-am-sysinfo:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building AM Sysinfo
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*am-sys=
info*"`; make CC=3D"$(CC)"
-
-am-sysinfo_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning AM Sysinfo
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*am-sys=
info*"`; make clean
-
-am-sysinfo_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing AM Sysinfo - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*am-sys=
info*"`; make install
-
-am-sysinfo_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing AM Sysinfo - Debug version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*am-sys=
info*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_arm-benchmarks b/meta-arago-distro/recipes-tisdk/ti-tisd=
k-makefile/ti-tisdk-makefile/Makefile_arm-benchmarks
deleted file mode 100644
index fa8455ca..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_arm-benchmarks
+++ /dev/null
@@ -1,24 +0,0 @@
-# arm-benchmarks build targets
-arm-benchmarks:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building ARM Benchmarks
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*arm-be=
nchmarks*"`; make CC=3D"$(CC)"
-
-arm-benchmarks_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning ARM Benchmarks
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*arm-be=
nchmarks*"`; make clean
-
-arm-benchmarks_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo   Installing ARM Benchmarks - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*arm-be=
nchmarks*"`; make install
-
-arm-benchmarks_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo   Installing ARM Benchmarks - Debug Version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*arm-be=
nchmarks*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_av-examples b/meta-arago-distro/recipes-tisdk/ti-tisdk-m=
akefile/ti-tisdk-makefile/Makefile_av-examples
deleted file mode 100644
index 1be53416..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_av-examples
+++ /dev/null
@@ -1,24 +0,0 @@
-# av-examples make targets
-av-examples:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building AV Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*av-exa=
mples*"`; make
-
-av-examples_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning AV Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*av-exa=
mples*"`; make clean
-
-av-examples_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Installing AV Examples - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*av-exa=
mples*"`; make install
-
-av-examples_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Installing AV Examples - Debug version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*av-exa=
mples*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_barcode-roi b/meta-arago-distro/recipes-tisdk/ti-tisdk-m=
akefile/ti-tisdk-makefile/Makefile_barcode-roi
deleted file mode 100644
index da97c408..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_barcode-roi
+++ /dev/null
@@ -1,19 +0,0 @@
-# barcode-roi build targets
-
-barcode-roi:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building Barcode ROI
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*barcod=
e-roi*"`; make -f Makefile.build release
-
-barcode-roi_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning Barcode ROI
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*barcod=
e-roi*"`; make -f Makefile.build clean
-
-barcode-roi_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@echo   Installing Barcode ROI - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*barcod=
e-roi*"`; make -f Makefile.build install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_boot-monitor b/meta-arago-distro/recipes-tisdk/ti-tisdk-=
makefile/ti-tisdk-makefile/Makefile_boot-monitor
deleted file mode 100644
index fa1d8517..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_boot-monitor
+++ /dev/null
@@ -1,30 +0,0 @@
-boot-monitor:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Building boot-monitor
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support; \
-	cd `find . -maxdepth 1 -type d -name "boot-monitor*"`; \
-	make image___BOOT_MONITOR_MAKE_TARGET__
-
-boot-monitor_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Cleaning boot-monitor
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support; \
-	cd `find . -maxdepth 1 -type d -name "boot-monitor*"`; \
-	make clean
-
-boot-monitor_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Installing boot-monitor
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd board-support; \
-	cd `find . -maxdepth 1 -type d -name "boot-monitor*"`; \
-	install -d $(DESTDIR)/boot; \
-	install -m 0644 ./skern-__BOOT_MONITOR_MAKE_TARGET__.bin $(DESTDIR)/boo=
t
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_cmem-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-make=
file/ti-tisdk-makefile/Makefile_cmem-mod
deleted file mode 100644
index cbb86aa5..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_cmem-mod
+++ /dev/null
@@ -1,33 +0,0 @@
-# CMEM module
-cmem-mod: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Building CMEM Module
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "cmem-mod*"`; \
-	. $(ENV_SETUP); \
-	make -f lu.mak ARCH=3D__KERNEL_ARCH__ KERNEL_INSTALL_DIR=3D$(LINUXKERNE=
L_INSTALL_DIR) module
-
-cmem-mod_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Cleaning CMEM Module
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "cmem-mod*"`; \
-	. $(ENV_SETUP); \
-	make -f lu.mak ARCH=3D__KERNEL_ARCH__ KERNEL_INSTALL_DIR=3D$(LINUXKERNE=
L_INSTALL_DIR) modules_clean
-
-cmem-mod_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing CMEM Module
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-	echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "cmem-mod*"`; \
-	. $(ENV_SETUP); \
-	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=3D`pwd`/src/cmem/module INST=
ALL_MOD_PATH=3D$(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=3D=
$(INSTALL_MOD_STRIP) modules_install
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_cryptodev b/meta-arago-distro/recipes-tisdk/ti-tisdk-mak=
efile/ti-tisdk-makefile/Makefile_cryptodev
deleted file mode 100644
index d42652e3..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_cryptodev
+++ /dev/null
@@ -1,28 +0,0 @@
-cryptodev: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Building cryptodev-linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "cryptodev*"`; \
-	make ARCH=3D__KERNEL_ARCH__ KERNEL_DIR=3D$(LINUXKERNEL_INSTALL_DIR)
-
-cryptodev_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Cleaning cryptodev-linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "cryptodev*"`; \
-	make ARCH=3D__KERNEL_ARCH__ KERNEL_DIR=3D$(LINUXKERNEL_INSTALL_DIR) cle=
an
-
-cryptodev_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Installing cryptodev-linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "cryptodev*"`; \
-	make ARCH=3D__KERNEL_ARCH__  KERNEL_DIR=3D$(LINUXKERNEL_INSTALL_DIR)  I=
NSTALL_MOD_PATH=3D$(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET) INSTALL_MOD_STRI=
P=3D$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_debugss-module-drv b/meta-arago-distro/recipes-tisdk/ti-=
tisdk-makefile/ti-tisdk-makefile/Makefile_debugss-module-drv
deleted file mode 100644
index 6af82313..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_debugss-module-drv
+++ /dev/null
@@ -1,29 +0,0 @@
-debugss-module-drv: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Building debugss-module-drv
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "debugss*"`; \
-	make ARCH=3D__KERNEL_ARCH__ KERNEL_SRC=3D$(LINUXKERNEL_INSTALL_DIR) PLA=
TFORM=3D__PLATFORM_DEBUGSS__
-
-debugss-module-drv_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Cleaning debugss-module-drv
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "debugss*"`; \
-	make ARCH=3D__KERNEL_ARCH__ KERNEL_SRC=3D$(LINUXKERNEL_INSTALL_DIR) PLA=
TFORM=3D__PLATFORM_DEBUGSS__ clean
-
-debugss-module-drv_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Installing debugss-module-drv
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "debugss*"`; \
-	make ARCH=3D__KERNEL_ARCH__  KERNEL_SRC=3D$(LINUXKERNEL_INSTALL_DIR)  I=
NSTALL_MOD_PATH=3D$(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET) INSTALL_MOD_STRI=
P=3D$(INSTALL_MOD_STRIP) PLATFORM=3D__PLATFORM_DEBUGSS__ modules_install
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_dual-camera-demo b/meta-arago-distro/recipes-tisdk/ti-ti=
sdk-makefile/ti-tisdk-makefile/Makefile_dual-camera-demo
deleted file mode 100644
index 219fcdd4..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_dual-camera-demo
+++ /dev/null
@@ -1,24 +0,0 @@
-# QT Dual Camera build targets
-dual-camera-demo:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building Dual Camera Demo
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*dual-c=
amera-demo*"`; make -f Makefile.build
-
-dual-camera-demo_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building Dual Camera Demo
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*dual-c=
amera-demo*"`; make -f Makefile.build clean
-
-dual-camera-demo_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@echo   Installing Dual Camera Demo - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*dual-c=
amera-demo*"`; make -f Makefile.build install
-
-dual-camera-demo_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@echo   Installing Dual Camera Demo - Debug version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*dual-c=
amera-demo*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_gdbserverproxy-module-drv b/meta-arago-distro/recipes-ti=
sdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_gdbserverproxy-module-dr=
v
deleted file mode 100644
index 5ac4aeef..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_gdbserverproxy-module-drv
+++ /dev/null
@@ -1,29 +0,0 @@
-gdbserverproxy-module-drv: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Building gdbserverproxy-module-drv
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "gdbserverproxy*"`; \
-	make ARCH=3D__KERNEL_ARCH__ KERNEL_SRC=3D$(LINUXKERNEL_INSTALL_DIR) PLA=
TFORM=3D__PLATFORM_GDBSERVERPROXY__
-
-gdbserverproxy-module-drv_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Cleaning gdbserverproxy-module-drv
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "gdbserverproxy*"`; \
-	make ARCH=3D__KERNEL_ARCH__ KERNEL_SRC=3D$(LINUXKERNEL_INSTALL_DIR) PLA=
TFORM=3D__PLATFORM_GDBSERVERPROXY__ clean
-
-gdbserverproxy-module-drv_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Installing gdbserverproxy-module-drv
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "gdbserverproxy*"`; \
-	make ARCH=3D__KERNEL_ARCH__  KERNEL_SRC=3D$(LINUXKERNEL_INSTALL_DIR)  I=
NSTALL_MOD_PATH=3D$(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET) INSTALL_MOD_STRI=
P=3D$(INSTALL_MOD_STRIP) PLATFORM=3D__PLATFORM_GDBSERVERPROXY__ modules_i=
nstall
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_hplib-mod b/meta-arago-distro/recipes-tisdk/ti-tisdk-mak=
efile/ti-tisdk-makefile/Makefile_hplib-mod
deleted file mode 100644
index 2b26fdfc..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_hplib-mod
+++ /dev/null
@@ -1,28 +0,0 @@
-hplib-mod: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Building hplib-mod
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "hplib-mod*"`; \
-	make -C module ARCH=3D__KERNEL_ARCH__ KDIR=3D$(LINUXKERNEL_INSTALL_DIR)
-
-hplib-mod_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Cleaning hplib-mod
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "hplib-mod*"`; \
-	make -C module ARCH=3D__KERNEL_ARCH__ KDIR=3D$(LINUXKERNEL_INSTALL_DIR)=
 clean
-
-hplib-mod_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Installing hplib-mod
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "hplib-mod*"`; \
-	make -C module ARCH=3D__KERNEL_ARCH__  KDIR=3D$(LINUXKERNEL_INSTALL_DIR=
)  INSTALL_MOD_PATH=3D$(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET) INSTALL_MOD_=
STRIP=3D$(INSTALL_MOD_STRIP) install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_image-gallery b/meta-arago-distro/recipes-tisdk/ti-tisdk=
-makefile/ti-tisdk-makefile/Makefile_image-gallery
deleted file mode 100644
index abd16907..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_image-gallery
+++ /dev/null
@@ -1,24 +0,0 @@
-# QT Image Gallery build targets
-image-gallery:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building Image Gallery
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*image-=
gallery*"`; make -f Makefile.build
-
-image-gallery_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building Image Gallery
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*image-=
gallery*"`; make -f Makefile.build clean
-
-image-gallery_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@echo   Installing Image Gallery - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*image-=
gallery*"`; make -f Makefile.build install
-
-image-gallery_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@echo   Installing Dual Camera Demo - Debug version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*image-=
galleryo*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_linalg-examples b/meta-arago-distro/recipes-tisdk/ti-tis=
dk-makefile/ti-tisdk-makefile/Makefile_linalg-examples
deleted file mode 100644
index f755db9a..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_linalg-examples
+++ /dev/null
@@ -1,39 +0,0 @@
-linalg-examples:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Building the Linalg Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; \
-	cd `find . -maxdepth 1 -type d -name "*linalg-examples*"`; \
-	. $(ENV_SETUP); \
-	make TARGET_ROOTDIR=3D$(SDK_PATH_TARGET) \
-		TI_OCL_CGT_INSTALL=3D$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x \
-		LINALG_DIR=3D$(SDK_PATH_TARGET)/usr/share/ti/ti-linalg-tree
-
-linalg-examples_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing the Linalg Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd example-applications; \
-	cd `find . -maxdepth 1 -type d -name "*linalg-examples*"`; \
-	for example in `find . -executable -not \( -type d -o -iname 'make*' \)=
`; do \
-		install -d $(DESTDIR)/usr/share/ti/examples/linalg/`dirname $${example=
}` ; \
-		install -m 755 $${example} $(DESTDIR)/usr/share/ti/examples/linalg/`di=
rname $${example}` ; \
-		if [ -f `dirname $${example}`/*.out ]; then \
-			install -m 755 `dirname $${example}`/*.out $(DESTDIR)/usr/share/ti/ex=
amples/linalg/`dirname $${example}` ; \
-		fi \
-	done
-
-linalg-examples_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Cleaning the Linalg Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; \
-	cd `find . -maxdepth 1 -type d -name "*linalg-examples*"`; \
-	. $(ENV_SETUP); \
-	make TARGET_ROOTDIR=3D$(SDK_PATH_TARGET) clean
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_linux b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefil=
e/ti-tisdk-makefile/Makefile_linux
deleted file mode 100644
index faa905af..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_linux
+++ /dev/null
@@ -1,29 +0,0 @@
-# Kernel build targets
-linux: __DTB_DEPEND__
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Building the Linux Kernel
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3D__KERNEL_ARCH__ CROSS_COMP=
ILE=3D$(CROSS_COMPILE) $(DEFCONFIG)
-	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3D__KERNEL_A=
RCH__ CROSS_COMPILE=3D$(CROSS_COMPILE) __KERNEL_BUILD_CMDS__
-	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3D__KERNEL_A=
RCH__ CROSS_COMPILE=3D$(CROSS_COMPILE) modules
-
-linux_install: __DTB_DEPEND_INSTALL__
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing the Linux Kernel
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	install -d $(DESTDIR)/boot
-	install $(LINUXKERNEL_INSTALL_DIR)/arch/__KERNEL_ARCH__/boot/__KERNEL_I=
MAGE_TYPE__ $(DESTDIR)/boot
-	install $(LINUXKERNEL_INSTALL_DIR)/vmlinux $(DESTDIR)/boot
-	install $(LINUXKERNEL_INSTALL_DIR)/System.map $(DESTDIR)/boot
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3D__KERNEL_ARCH__ CROSS_COMP=
ILE=3D$(CROSS_COMPILE) INSTALL_MOD_PATH=3D$(DESTDIR) INSTALL_MOD_STRIP=3D=
$(INSTALL_MOD_STRIP) modules_install
-
-linux_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Cleaning the Linux Kernel
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3D__KERNEL_ARCH__ CROSS_COMP=
ILE=3D$(CROSS_COMPILE) mrproper
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-tisdk/ti-tisdk-ma=
kefile/ti-tisdk-makefile/Makefile_linux-dtbs
deleted file mode 100644
index fa409d0a..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_linux-dtbs
+++ /dev/null
@@ -1,30 +0,0 @@
-# Kernel DTB build targets
-linux-dtbs:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Building the Linux Kernel DTBs
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3D__KERNEL_ARCH__ CROSS_COMP=
ILE=3D$(CROSS_COMPILE) $(DEFCONFIG)
-	@for DTB in __KERNEL_DEVICETREE__; do \
-		$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3D__KERNEL_=
ARCH__ CROSS_COMPILE=3D$(CROSS_COMPILE) $$DTB; \
-	done
-
-linux-dtbs_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing the Linux Kernel DTBs
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	install -d $(DESTDIR)/boot
-	@for DTB in __KERNEL_DEVICETREE__; do \
-		install -m 0644 $(LINUXKERNEL_INSTALL_DIR)/arch/__KERNEL_ARCH__/boot/d=
ts/$$DTB $(DESTDIR)/boot/; \
-	done
-
-linux-dtbs_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Cleaning the Linux Kernel DTBs
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo "Nothing to do"
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_matrix-gui b/meta-arago-distro/recipes-tisdk/ti-tisdk-ma=
kefile/ti-tisdk-makefile/Makefile_matrix-gui
deleted file mode 100644
index 1c88de24..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_matrix-gui
+++ /dev/null
@@ -1,18 +0,0 @@
-# Make Rules for matrix-gui project
-matrix-gui:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo      Building Matrix GUI
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    NOTHING TO DO.  COMPILATION NOT REQUIRED
-
-matrix-gui_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo      Cleaning Matrix GUI
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    NOTHING TO DO.
-
-matrix-gui_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing Matrix GUI
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*matrix=
-gui-2.0*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_matrix-gui-browser b/meta-arago-distro/recipes-tisdk/ti-=
tisdk-makefile/ti-tisdk-makefile/Makefile_matrix-gui-browser
deleted file mode 100644
index c5686920..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_matrix-gui-browser
+++ /dev/null
@@ -1,24 +0,0 @@
-# matrix-gui-browser build targets
-matrix-gui-browser:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building Matrix GUI Browser
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*matrix=
-gui-browser*"`; make -f Makefile.build release
-
-matrix-gui-browser_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning Matrix GUI Browser
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*matrix=
-gui-browser*"`; make -f Makefile.build clean
-
-matrix-gui-browser_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@echo   Installing Matrix GUI Browser - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*matrix=
-gui-browser*"`; make -f Makefile.build install
-
-matrix-gui-browser_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@echo   Installing Matrix GUI Browser - Debug Version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*matrix=
-gui-browser*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_mmwavegesture-hmi b/meta-arago-distro/recipes-tisdk/ti-t=
isdk-makefile/ti-tisdk-makefile/Makefile_mmwavegesture-hmi
deleted file mode 100644
index 51562110..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_mmwavegesture-hmi
+++ /dev/null
@@ -1,24 +0,0 @@
-# mmWave Gesture HMI build targets
-mmwavegesture-hmi:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building mmWave Gesture HMI Demo
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*mmwave=
gesture-hmi*"`; make -f Makefile.build
-
-mmwavegesture-hmi_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building mmWave Gesture HMI Demo
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*mmwave=
gesture-hmi*"`; make -f Makefile.build clean
-
-mmwavegesture-hmi_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@echo   Installing mmWave Gesture HMI Demo - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*mmwave=
gesture-hmi*"`; make -f Makefile.build install
-
-mmwavegesture-hmi_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@echo   Installing mmWave Gesture HMI Demo - Debug version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*mmwave=
gesture-hmi*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_omapconf b/meta-arago-distro/recipes-tisdk/ti-tisdk-make=
file/ti-tisdk-makefile/Makefile_omapconf
deleted file mode 100644
index d18e5155..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_omapconf
+++ /dev/null
@@ -1,19 +0,0 @@
-# omapconf build targets
-omapconf:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@echo    Building OmapConf
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*omapco=
nf*"`; make CROSS_COMPILE=3D${CROSS_COMPILE} omapconf
-
-omapconf_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@echo    Cleaning OmapConf
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*omapco=
nf*"`; make clean
-
-omapconf_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo   Installing OmapConf - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*omapco=
nf*"`; make DESTDIR=3D${DESTDIR}/usr/bin install
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_opencl-examples b/meta-arago-distro/recipes-tisdk/ti-tis=
dk-makefile/ti-tisdk-makefile/Makefile_opencl-examples
deleted file mode 100644
index 5e984463..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_opencl-examples
+++ /dev/null
@@ -1,32 +0,0 @@
-# OpenCL Examples build targets
-opencl-examples:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Building the OpenCL Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*opencl=
-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=3D$(SDK_PATH_TARGET) TI=
_OCL_CGT_INSTALL=3D$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x EXAMPLE_SET=3D=
EXCLUDE_PERSISTENT
-
-opencl-examples_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing the OpenCL Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd example-applications; \
-	cd `find . -maxdepth 1 -type d -name "*opencl-examples*"`; \
-	for example in `find . -executable -not \( -type d -o -iname 'make*' \)=
`; do \
-		install -d $(DESTDIR)/usr/share/ti/examples/opencl/`dirname $${example=
}` ; \
-		install -m 755 $${example} $(DESTDIR)/usr/share/ti/examples/opencl/`di=
rname $${example}` ; \
-		if [ -f `dirname $${example}`/*.out ]; then \
-			install -m 755 `dirname $${example}`/*.out $(DESTDIR)/usr/share/ti/ex=
amples/opencl/`dirname $${example}` ; \
-		fi \
-	done
-
-opencl-examples_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Cleaning the OpenCL Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*opencl=
-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=3D$(SDK_PATH_TARGET) cl=
ean
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_openmpacc-examples b/meta-arago-distro/recipes-tisdk/ti-=
tisdk-makefile/ti-tisdk-makefile/Makefile_openmpacc-examples
deleted file mode 100644
index 44ba30c9..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_openmpacc-examples
+++ /dev/null
@@ -1,32 +0,0 @@
-# OpenMP Accelerator Examples build targets
-openmpacc-examples:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@echo     Building the OpenMP Accelerator Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*openmp=
acc-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=3D$(SDK_PATH_TARGET)=
 TI_OCL_CGT_INSTALL=3D$(SDK_PATH_TARGET)/usr/share/ti/cgt-c6x
-
-openmpacc-examples_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-	@echo     Installing the OpenMP Accelerator Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd example-applications; \
-	cd `find . -maxdepth 1 -type d -name "*openmpacc-examples*"`; \
-	for example in `find . -executable -not \( -type d -o -iname 'make*' \)=
`; do \
-		install -d $(DESTDIR)/usr/share/ti/examples/openmpacc/`dirname $${exam=
ple}` ; \
-		install -m 755 $${example} $(DESTDIR)/usr/share/ti/examples/openmpacc/=
`dirname $${example}` ; \
-		if [ -f `dirname $${example}`/*.out ]; then \
-			install -m 755 `dirname $${example}`/*.out $(DESTDIR)/usr/share/ti/ex=
amples/openmpacc/`dirname $${example}` ; \
-		fi \
-	done
-
-openmpacc-examples_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-	@echo     Cleaning the OpenMP Accelerator Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*openmp=
acc-examples*"`; . $(ENV_SETUP); make TARGET_ROOTDIR=3D$(SDK_PATH_TARGET)=
 clean
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_oprofile-example b/meta-arago-distro/recipes-tisdk/ti-ti=
sdk-makefile/ti-tisdk-makefile/Makefile_oprofile-example
deleted file mode 100644
index 886ea628..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_oprofile-example
+++ /dev/null
@@ -1,18 +0,0 @@
-# oprofile-example build targets
-oprofile-example:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building OProfile Example
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*oprofi=
le-example*"`; make CC=3D"$(CC)"
-
-oprofile-example_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning OProfile Example
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*oprofi=
le-example*"`; make clean
-
-oprofile-example_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing OProfile Example - Debug version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*oprofi=
le-example*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_pdm-anomaly-detection b/meta-arago-distro/recipes-tisdk/=
ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pdm-anomaly-detection
deleted file mode 100644
index ad4a3c80..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_pdm-anomaly-detection
+++ /dev/null
@@ -1,24 +0,0 @@
-# PdM Anomaly Detection build targets
-pdm-anomaly-detection:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building PdM Anomaly Detection Demo
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pdm-an=
omaly-detection*"`; make -f Makefile.build
-
-pdm-anomaly-detection_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building PdM Anomaly Detection Demo
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pdm-an=
omaly-detection*"`; make -f Makefile.build clean
-
-pdm-anomaly-detection_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo   Installing PdM Anomaly Detection Demo - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pdm-an=
omaly-detection*"`; make -f Makefile.build install
-
-pdm-anomaly-detection_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo   Installing PdM Anomaly Detection Demo - Debug version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pdm-an=
omaly-detection*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_pru b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/=
ti-tisdk-makefile/Makefile_pru
deleted file mode 100644
index 9ca9fe27..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_pru
+++ /dev/null
@@ -1,18 +0,0 @@
-# pru build targets
-pru: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-	@echo    Building PRU Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru*"`=
; make
-
-pru_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-	@echo    Cleaning PRU Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru*"`=
; make clean
-
-pru_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing PRU Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru*"`=
; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_pru-icss b/meta-arago-distro/recipes-tisdk/ti-tisdk-make=
file/ti-tisdk-makefile/Makefile_pru-icss
deleted file mode 100644
index f1e6c433..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_pru-icss
+++ /dev/null
@@ -1,117 +0,0 @@
-
-# PRU-ICSS build targets
-pru-icss:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building PRU-ICSS
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-ic=
ss*"`; \
-	for dir in examples pru_cape/pru_fw lib/src labs; \
-	do \
-		make -C $$dir PRU_SSP=3D$$PWD PRU_CGT=3D$(LINUX_DEVKIT_PATH)/sysroots/=
__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru; \
-	done
-
-pru-icss_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning PRU-ICSS
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-ic=
ss*"`; \
-	for dir in examples pru_cape/pru_fw lib/src labs; \
-	do \
-		make -C $$dir clean PRU_SSP=3D$$PWD PRU_CGT=3D$(LINUX_DEVKIT_PATH)/sys=
roots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru; \
-	done
-
-pru-icss_install: __PRU_ICSS_INSTALL_TARGET__
-
-pru-icss_install_common:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@echo   Installing PRU-ICSS
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@install -d $(DESTDIR)/lib/firmware/pru
-
-pru-icss_install_none:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@echo   Nothing to install
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-
-pru-icss_install_am335x: pru-icss_install_common
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-ic=
ss*"`; \
-	install -m 0644 ./examples/am335x/PRU_Halt/gen/PRU_Halt.out \
-		$(DESTDIR)/lib/firmware/pru; \
-	for i in 0 1; \
-	do \
-		install -m 0644 ./examples/am335x/PRU_RPMsg_Echo_Interrupt$${i}/gen/PR=
U_RPMsg_Echo_Interrupt$${i}.out \
-			$(DESTDIR)/lib/firmware/pru; \
-	done
-
-pru-icss_install_am437x: pru-icss_install_common
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-ic=
ss*"`; \
-	install -m 0644 ./examples/am437x/PRU_Halt/gen/PRU_Halt.out \
-		$(DESTDIR)/lib/firmware/pru; \
-	for i in 0 1; \
-	do \
-		for j in 0 1; \
-		do \
-			install -m 0644 ./examples/am437x/PRU_RPMsg_Echo_Interrupt$${i}_$${j}=
/gen/PRU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
-				$(DESTDIR)/lib/firmware/pru; \
-		done; \
-	done
-
-pru-icss_install_am572x: pru-icss_install_common
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-ic=
ss*"`; \
-	install -m 0644 ./examples/am572x/PRU_Halt/gen/PRU_Halt.out \
-		$(DESTDIR)/lib/firmware/pru; \
-	for i in 1 2; \
-	do \
-		for j in 0 1; \
-		do \
-			install -m 0644 ./examples/am572x/PRU_RPMsg_Echo_Interrupt$${i}_$${j}=
/gen/PRU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
-				$(DESTDIR)/lib/firmware/pru; \
-		done; \
-	done
-
-pru-icss_install_am65x: pru-icss_install_common
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-ic=
ss*"`; \
-	for i in 0 1; \
-	do \
-		install -m 0644 ./examples/am65x/PRU_Halt/gen/PRU$${i}/PRU_Halt_$${i}.=
out \
-			$(DESTDIR)/lib/firmware/pru; \
-		install -m 644 ./examples/am65x/RTU_Halt/gen/RTU$${i}/RTU_Halt_$${i}.o=
ut \
-			$(DESTDIR)/lib/firmware/pru; \
-	done; \
-	for i in 0 1 2; \
-	do \
-		for j in 0 1; \
-		do \
-			install -m 0644 ./examples/am65x/PRU_RPMsg_Echo_Interrupt$${j}/gen/ic=
ssg$${i}/PRU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
-				$(DESTDIR)/lib/firmware/pru; \
-			install -m 0644 ./examples/am65x/RTU_RPMsg_Echo_Interrupt$${j}/gen/ic=
ssg$${i}/RTU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
-				$(DESTDIR)/lib/firmware/pru; \
-		done; \
-	done
-
-pru-icss_install_j721e: pru-icss_install_common
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-ic=
ss*"`; \
-	for i in 0 1; \
-	do \
-		install -m 0644 ./examples/j721e/PRU_Halt/gen/PRU$${i}/PRU_Halt_$${i}.=
out \
-			$(DESTDIR)/lib/firmware/pru; \
-		install -m 0644 ./examples/j721e/RTU_Halt/gen/RTU$${i}/RTU_Halt_$${i}.=
out \
-			$(DESTDIR)/lib/firmware/pru; \
-		install -m 0644 ./examples/j721e/TX_PRU_Halt/gen/TX_PRU$${i}/PRU_Halt_=
$${i}.out \
-			$(DESTDIR)/lib/firmware/pru; \
-	done; \
-	for i in 0 1; \
-	do \
-		for j in 0 1; \
-		do \
-			install -m 0644 ./examples/j721e/PRU_RPMsg_Echo_Interrupt$${j}/gen/ic=
ssg$${i}/PRU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
-				$(DESTDIR)/lib/firmware/pru; \
-			install -m 0644 ./examples/j721e/RTU_RPMsg_Echo_Interrupt$${j}/gen/ic=
ssg$${i}/RTU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
-				$(DESTDIR)/lib/firmware/pru; \
-		done; \
-	done
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_qt-opencv-opencl-opengl-multithreaded b/meta-arago-distr=
o/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_qt-opencv-op=
encl-opengl-multithreaded
deleted file mode 100644
index d1d9e7ff..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_qt-opencv-opencl-opengl-multithreaded
+++ /dev/null
@@ -1,24 +0,0 @@
-# qt-opencv-opencl-opengl-multithreaded  build targets
-qt-opencv-opencl-opengl-multithreaded:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building QT OpenCV Multithreaded
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-ope=
ncv-opencl-opengl-multithreaded*"`; make -f Makefile.build release
-
-qt-opencv-opencl-opengl-multithreaded_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning QT OpenCV Multithreaded
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-ope=
ncv-opencl-opengl-multithreaded*"`; make -f Makefile.build clean
-
-qt-opencv-opencl-opengl-multithreaded_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@echo   Installing QT OpenCV Multithreaded - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-ope=
ncv-opencl-opengl-multithreaded*"`; make -f Makefile.build install
-
-qt-opencv-opencl-opengl-multithreaded_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo   Installing QT OpenCV Multithreaded - Debug Version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-ope=
ncv-opencl-opengl-multithreaded*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_qt-tstat b/meta-arago-distro/recipes-tisdk/ti-tisdk-make=
file/ti-tisdk-makefile/Makefile_qt-tstat
deleted file mode 100644
index b39ef4b4..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_qt-tstat
+++ /dev/null
@@ -1,24 +0,0 @@
-# QT Thermostat build targets
-qt-tstat:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building QT Thermostat App
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-tst=
at*"`; make -f Makefile.build release
-
-qt-tstat_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning QT Thermostat App
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-tst=
at*"`; make -f Makefile.build clean
-
-qt-tstat_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@echo   Installing QT Thermostat App - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-tst=
at*"`; make -f Makefile.build install
-
-qt-tstat_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@echo   Installing QT Thermostat App - Debug version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*qt-tst=
at*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_quick-playground b/meta-arago-distro/recipes-tisdk/ti-ti=
sdk-makefile/ti-tisdk-makefile/Makefile_quick-playground
deleted file mode 100644
index f1e8de04..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_quick-playground
+++ /dev/null
@@ -1,24 +0,0 @@
-# Quick Playground build targets
-quick-playground:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building Quick Playground App
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*quick-=
playground*"`; make -f Makefile.build
-
-quick-playground_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning Quick Playground App
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*quick-=
playground*"`; make -f Makefile.build clean
-
-quick-playground_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-	@echo   Installing Quick Playground App - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*quick-=
playground*"`; make -f Makefile.build install
-
-quick-playground_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-	@echo   Installing Quick Playground App - Debug version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*quick-=
playground*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_refresh-screen b/meta-arago-distro/recipes-tisdk/ti-tisd=
k-makefile/ti-tisdk-makefile/Makefile_refresh-screen
deleted file mode 100644
index 5f33c20a..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_refresh-screen
+++ /dev/null
@@ -1,24 +0,0 @@
-# refresh-screen build targets
-refresh-screen:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building Refresh Screen
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*refres=
h-screen*"`; make -f Makefile.build release
-
-refresh-screen_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning Refresh Screen
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*refres=
h-screen*"`; make -f Makefile.build clean
-
-refresh-screen_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@echo   Installing Refresh Screen - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*refres=
h-screen*"`; make -f Makefile.build install
-
-refresh-screen_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo   Installing Refresh Screen - Debug Version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*refres=
h-screen*"`; make -f Makefile.build install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_sysfw-image b/meta-arago-distro/recipes-tisdk/ti-tisdk-m=
akefile/ti-tisdk-makefile/Makefile_sysfw-image
deleted file mode 100644
index cee03bc2..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_sysfw-image
+++ /dev/null
@@ -1,49 +0,0 @@
-# Define the following to support multple platforms
-PLATFORM_TYPE_$(PLATFORM) =3D gp
-PLATFORM_TYPE_am65xx-hs-evm =3D hs
-PLATFORM_TYPE_j721e-hs-evm =3D hs
-PLATFORM_TYPE =3D $(PLATFORM_TYPE_$(PLATFORM))
-
-SYSFW_CONFIG =3D evm
-
-SYSFW_SOC_$(PLATFORM) =3D NULL
-SYSFW_SOC_am65xx-evm =3D am65x
-SYSFW_SOC_am65xx-hs-evm =3D am65x
-SYSFW_SOC_j721e-evm =3D j721e
-SYSFW_SOC_j721e-hs-evm =3D j721e
-SYSFW_SOC =3D $(SYSFW_SOC_$(PLATFORM))
-
-SYSFW_PREFIX =3D ti-sci-firmware
-SYSFW_PREFIX_j7 =3D ti-fs-firmware
-
-SYSFW_BASE =3D $(SYSFW_PREFIX)-$(SYSFW_SOC)-$(PLATFORM_TYPE)
-
-SYSFW_MAKEARGS_common =3D SYSFW_DL_URL=3D"" SYSFW_HS_DL_URL=3D"" SYSFW_H=
S_INNER_CERT_DL_URL=3D"" \
-                        SYSFW_PATH=3D$(TI_SDK_PATH)/board-support/prebui=
lt-images/$(SYSFW_BASE).bin \
-                        SOC=3D$(SYSFW_SOC) CONFIG=3D$(SYSFW_CONFIG)
-
-SYSFW_MAKEARGS_gp =3D=20
-SYSFW_MAKEARGS_hs =3D HS=3D1 SYSFW_HS_PATH=3D$(TI_SDK_PATH)/board-suppor=
t/prebuilt-images/$(SYSFW_BASE)-enc.bin \
-                    SYSFW_HS_INNER_CERT_PATH=3D$(TI_SDK_PATH)/board-supp=
ort/prebuilt-images/$(SYSFW_BASE)-cert.bin
-
-SYSFW_MAKEARGS =3D $(SYSFW_MAKEARGS_common) $(SYSFW_MAKEARGS_$(PLATFORM_=
TYPE))
-
-# Depend on linux-dtbs for the dtc utility
-sysfw-image: linux-dtbs
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building SYSFW Image
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support; cd `find . -maxdepth 1 -type d -name "*k3-image*"`; =
\
-		make $(SYSFW_MAKEARGS) CROSS_COMPILE=3D$(CROSS_COMPILE_ARMV7) PATH=3D$=
(PATH):$(LINUXKERNEL_INSTALL_DIR)/scripts/dtc
-
-sysfw-image_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning SYSFW Image
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support; cd `find . -maxdepth 1 -type d -name "*k3-image*"`; =
make clean
-
-sysfw-image_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo   Installing SYSFW Image
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-	@echo "Nothing to do"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_ti-crypto-examples b/meta-arago-distro/recipes-tisdk/ti-=
tisdk-makefile/ti-tisdk-makefile/Makefile_ti-crypto-examples
deleted file mode 100644
index 6ad07e9a..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_ti-crypto-examples
+++ /dev/null
@@ -1,24 +0,0 @@
-# ti-crypto-examples build targets
-ti-crypto-examples:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building TI Crypto Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-cry=
pto-examples*"`; make release
-
-ti-crypto-examples_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning TI Crypto Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-cry=
pto-examples*"`; make clean
-
-ti-crypto-examples_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@echo   Installing TI Crypto Examples - Release version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-cry=
pto-examples*"`; make install
-
-ti-crypto-examples_install_debug:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@echo   Installing TI Crypto Examples - Debug Version
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*ti-cry=
pto-examples*"`; make install_debug
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_ti-gc320-driver b/meta-arago-distro/recipes-tisdk/ti-tis=
dk-makefile/ti-tisdk-makefile/Makefile_ti-gc320-driver
deleted file mode 100644
index fbf38885..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_ti-gc320-driver
+++ /dev/null
@@ -1,25 +0,0 @@
-# ti-gc320-driver module
-ti-gc320-driver: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Building ti-gc320-driver
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-gc320-driver*" -type d`; \
-	make -f Kbuild AQROOT=3D`pwd` KERNEL_DIR=3D${LINUXKERNEL_INSTALL_DIR} A=
RCH_TYPE=3Darm
-
-ti-gc320-driver_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Cleaning ti-gc320-driver
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-gc320-driver*" -type d`; \
-	make -f Kbuild AQROOT=3D`pwd` KERNEL_DIR=3D${LINUXKERNEL_INSTALL_DIR} A=
RCH_TYPE=3Darm clean
-
-ti-gc320-driver_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Installing ti-gc320-driver
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-gc320-driver*" -type d`; \
-	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=3D`pwd` INSTALL_MOD_PATH=3D$=
(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=3D$(INSTALL_MOD_S=
TRIP) modules_install
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_ti-img-rogue-driver b/meta-arago-distro/recipes-tisdk/ti=
-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-img-rogue-driver
deleted file mode 100644
index 6d8830b0..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_ti-img-rogue-driver
+++ /dev/null
@@ -1,26 +0,0 @@
-
-# ti-img-rogue-driver
-ti-img-rogue-driver: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Building ti-img-rogue-driver
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-img-rogue-driver*" -type d`; \
-	make ARCH=3D__KERNEL_ARCH__ KERNELDIR=3D${LINUXKERNEL_INSTALL_DIR} RGX_=
BVNC=3D"22.104.208.318" BUILD=3Drelease PVR_BUILD_DIR=3Dj721e_linux WINDO=
W_SYSTEM=3Dwayland
-
-ti-img-rogue-driver_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Cleaning ti-img-rogue-driver
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-img-rogue-driver*" -type d`; \
-	make ARCH=3D__KERNEL_ARCH__ KERNELDIR=3D${LINUXKERNEL_INSTALL_DIR} RGX_=
BVNC=3D"22.104.208.318" BUILD=3Drelease PVR_BUILD_DIR=3Dj721e_linux WINDO=
W_SYSTEM=3Dwayland clean
-
-ti-img-rogue-driver_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing ti-img-rogue-driver
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-img-rogue-driver*" -type d`; \
-	cd binary_j721e_linux_wayland_release/target_aarch64/kbuild; \
-	make -C ${LINUXKERNEL_INSTALL_DIR} INSTALL_MOD_PATH=3D${DESTDIR} INSTAL=
L_MOD_STRIP=3D${INSTALL_MOD_STRIP} M=3D`pwd` modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_ti-ipc b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefi=
le/ti-tisdk-makefile/Makefile_ti-ipc
deleted file mode 100644
index 682a7919..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_ti-ipc
+++ /dev/null
@@ -1,137 +0,0 @@
-TISDK_VERSION=3D__TISDK_VERSION__
-
-PRSDK_VERSION=3D$(shell echo $(TISDK_VERSION) | sed -e 's|^0||' -e 's|\.=
|_|g')
-PRSDK_PLATFORM=3D$(shell echo $(PLATFORM) | sed -e 's|-evm$$||' | sed -e=
 's|-lcdk$$||')
-
-ifneq ($(TI_RTOS_PATH),)
-  TI_IPC_TARGETS =3D ti-ipc-linux
-
-  TI_RTOS_PATH_ABS :=3D $(realpath $(TI_RTOS_PATH))
-
-  TI_PRSDK_PATH=3D$(TI_RTOS_PATH_ABS)/processor_sdk_rtos_$(PRSDK_PLATFOR=
M)_$(PRSDK_VERSION)
-  SDK_INSTALL_PATH=3D$(TI_RTOS_PATH_ABS)
-  include $(TI_PRSDK_PATH)/Rules.make
-
-  IPC_TOOLS_PATHS=3D__IPC_TOOLS_PATHS__
-
-else
-  TI_IPC_TARGETS =3D ti-ipc-rtos-missing
-endif
-
-TI_IPC_CLEAN =3D $(addsuffix _clean, $(TI_IPC_TARGETS))
-TI_IPC_INSTALL =3D $(addsuffix _install, $(TI_IPC_TARGETS))
-
-ti-ipc-rtos-missing ti-ipc-rtos-missing_clean ti-ipc-rtos-missing_instal=
l:
-	@echo
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     If you wish to build IPC, please install
-	@echo     Processor SDK RTOS $(TISDK_VERSION) for $(PLATFORM)
-	@echo     and set TI_RTOS_PATH in Rules.make
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-ti-ipc-rtos-path-check:
-	@if [ ! -d "$(TI_PRSDK_PATH)" ]; \
-	then \
-		echo; \
-		echo "Error: TI_RTOS_PATH ($(TI_RTOS_PATH_ABS)) does not contain"; \
-		echo "       the corresponding Processor SDK RTOS release!"; \
-		echo; \
-		echo "Please install Processor SDK RTOS $(TISDK_VERSION) for $(PLATFOR=
M)."; \
-		exit 1; \
-	fi
-
-ti-ipc: $(TI_IPC_TARGETS)
-
-ti-ipc_clean: $(TI_IPC_CLEAN)
-
-ti-ipc_install: $(TI_IPC_INSTALL)
-
-ti-ipc-linux-config: ti-ipc-rtos-path-check
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Configuring IPC
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	. $(ENV_SETUP); \
-	cd $(IPC_INSTALL_PATH); \
-	./configure $${CONFIGURE_FLAGS} \
-		CC=3D$${TOOLCHAIN_PREFIX}gcc \
-		--prefix=3D/usr \
-		PLATFORM=3D$(IPC_PLATFORM) \
-		KERNEL_INSTALL_DIR=3D$(LINUXKERNEL_INSTALL_DIR)
-
-
-ti-ipc-linux: ti-ipc-rtos-path-check linux ti-ipc-linux-config
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Building IPC
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	. $(ENV_SETUP); \
-	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH)
-
-ti-ipc-linux_clean: ti-ipc-rtos-path-check ti-ipc-linux-config
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Cleaning IPC
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	. $(ENV_SETUP); \
-	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH) clean
-
-ti-ipc-linux_install: ti-ipc-rtos-path-check ti-ipc-linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing IPC
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	. $(ENV_SETUP); \
-	$(MAKE) -j $(MAKE_JOBS) -C $(IPC_INSTALL_PATH) install DESTDIR=3D$(DEST=
DIR)
-
-ti-ipc-linux-examples: ti-ipc-rtos-path-check
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Building the IPC Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples \
-		HOSTOS=3D"linux" \
-		PLATFORM=3D"$(IPC_PLATFORM)" \
-		KERNEL_INSTALL_DIR=3D"$(LINUXKERNEL_INSTALL_DIR)" \
-		XDC_INSTALL_DIR=3D"$(XDC_INSTALL_PATH)" \
-		PDK_INSTALL_DIR=3D"$(PDK_INSTALL_PATH)/.." \
-		BIOS_INSTALL_DIR=3D"$(BIOS_INSTALL_PATH)" \
-		IPC_INSTALL_DIR=3D"$(IPC_INSTALL_PATH)" \
-		TOOLCHAIN_LONGNAME=3D$${TOOLCHAIN_SYS} \
-		TOOLCHAIN_INSTALL_DIR=3D$${SDK_PATH_NATIVE}/usr \
-		TOOLCHAIN_PREFIX=3D$(CROSS_COMPILE) \
-		LINUX_SYSROOT_DIR=3D$(SDK_PATH_TARGET) \
-		$(IPC_TOOLS_PATHS)
-
-ti-ipc-linux-examples_install: ti-ipc-rtos-path-check ti-ipc-linux-examp=
les
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing the IPC Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples install \
-		HOSTOS=3D"linux" \
-		PLATFORM=3D"$(IPC_PLATFORM)" \
-		EXEC_DIR=3D"$(EXEC_DIR)"
-
-ti-ipc-linux-examples_clean: ti-ipc-rtos-path-check
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Cleaning the IPC Examples
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	. $(ENV_SETUP); \
-	$(MAKE) -j $(MAKE_JOBS) -C $${IPC_INSTALL_PATH}/examples clean \
-		HOSTOS=3D"linux" \
-		PLATFORM=3D"$(IPC_PLATFORM)" \
-		KERNEL_INSTALL_DIR=3D"$(LINUXKERNEL_INSTALL_DIR)" \
-		XDC_INSTALL_DIR=3D"$(XDC_INSTALL_PATH)" \
-		BIOS_INSTALL_DIR=3D"$(BIOS_INSTALL_PATH)" \
-		IPC_INSTALL_DIR=3D"$(IPC_INSTALL_PATH)" \
-		TOOLCHAIN_LONGNAME=3D$${TOOLCHAIN_SYS} \
-		TOOLCHAIN_INSTALL_DIR=3D$${SDK_PATH_NATIVE}/usr \
-		TOOLCHAIN_PREFIX=3D$(CROSS_COMPILE) \
-		LINUX_SYSROOT_DIR=3D$(SDK_PATH_TARGET) \
-		$(IPC_TOOLS_PATHS)
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_ti-ocf-crypto-module b/meta-arago-distro/recipes-tisdk/t=
i-tisdk-makefile/ti-tisdk-makefile/Makefile_ti-ocf-crypto-module
deleted file mode 100644
index 04e37874..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_ti-ocf-crypto-module
+++ /dev/null
@@ -1,18 +0,0 @@
-# ti-ocf-crypto-module components
-ti-ocf-crypto-module: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building TI OCF Crypto Module
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; cd `find . -maxdepth 1 -type d -name "=
*ti-ocf-crypto-module*"`; make
-
-ti-ocf-crypto-module_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaning TI OCF Crypto Module
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; cd `find . -maxdepth 1 -type d -name "=
*ti-ocf-crypto-module*"`; make clean
-
-ti-ocf-crypto-module_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Installing TI OCF Crypto Module
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; cd `find . -maxdepth 1 -type d -name "=
*ti-ocf-crypto-module*"`; make install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_ti-sgx-ddk-km b/meta-arago-distro/recipes-tisdk/ti-tisdk=
-makefile/ti-tisdk-makefile/Makefile_ti-sgx-ddk-km
deleted file mode 100644
index ecb11688..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_ti-sgx-ddk-km
+++ /dev/null
@@ -1,25 +0,0 @@
-# ti-sgx-ddk-km module
-ti-sgx-ddk-km: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Building ti-sgx-ddk-km
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
-	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=3D__KERNEL=
_ARCH__ TARGET_PRODUCT=3D__TI_SGX_TARGET_PRODUCT__ KERNELDIR=3D$(LINUXKER=
NEL_INSTALL_DIR) WINDOW_SYSTEM=3Dnulldrmws
-
-ti-sgx-ddk-km_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Cleaning ti-sgx-ddk-km
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
-	make -C ./eurasia_km/eurasiacon/build/linux2/omap_linux ARCH=3D__KERNEL=
_ARCH__ KERNELDIR=3D$(LINUXKERNEL_INSTALL_DIR) WINDOW_SYSTEM=3Dnulldrmws =
clean
-
-ti-sgx-ddk-km_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Installing ti-sgx-ddk-km
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "ti-sgx-ddk-km*" -type d`; \
-	cd ./eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target__=
_TI_SGX_TARGET_ARCH__/kbuild; \
-	make -C $(LINUXKERNEL_INSTALL_DIR) SUBDIRS=3D`pwd` INSTALL_MOD_PATH=3D$=
(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET) INSTALL_MOD_STRIP=3D$(INSTALL_MOD_S=
TRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_tiovx-app-host b/meta-arago-distro/recipes-tisdk/ti-tisd=
k-makefile/ti-tisdk-makefile/Makefile_tiovx-app-host
deleted file mode 100644
index f25472d3..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_tiovx-app-host
+++ /dev/null
@@ -1,34 +0,0 @@
-# tiovx-app-host build targets
-tiovx-app-host:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Building TIOVX Host Application
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -name "*tiovx-app-host*"`; . $(ENV=
_SETUP); make \
-		TARGET_ROOTDIR=3D$(SDK_PATH_TARGET) \
-		GCCLINARO=3D$(LINUX_DEVKIT_PATH)/sysroots/x86_64-arago-linux/usr \
-		TIOVXPATH=3D$(SDK_PATH_TARGET)/usr/include/VX \
-		IPCPATH=3D$(SDK_PATH_TARGET)/usr/share/ti/ti-ipc-tree \
-		SDKPLATFORMIFPATH=3D$(SDK_PATH_TARGET)/usr/share/ti/ti-tiovx-lib-tree/=
sys-iface \
-		PROC_LIST=3D'host khronos_example'
-
-tiovx-app-host_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Installing TIOVX Host Application
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd example-applications; \
-	cd `find . -name "*tiovx-app-host*"`; \
-	install -m 0755 host/bin/debug/app_host $(DESTDIR)/usr/bin/tiovx-app_ho=
st; \
-	install -m 0755 khronos_example/bin/debug/opticalflow $(DESTDIR)/usr/bi=
n/tiovx-opticalflow
-
-tiovx-app-host_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo     Cleaning TIOVX Host Application
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd example-applications; cd `find . -name "*tiovx-app-host*"`; . $(ENV=
_SETUP); \
-	make PROC_LIST=3D'host khronos_example' clean
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_u-boot-legacy b/meta-arago-distro/recipes-tisdk/ti-tisdk=
-makefile/ti-tisdk-makefile/Makefile_u-boot-legacy
deleted file mode 100644
index 028644de..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_u-boot-legacy
+++ /dev/null
@@ -1,16 +0,0 @@
-# u-boot build targets
-u-boot-legacy: u-boot
-u-boot-legacy_clean: u-boot_clean
-u-boot-legacy_install: u-boot_install
-
-u-boot:
-	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_=
COMPILE=3D$(CROSS_COMPILE) $(UBOOT_MACHINE)
-	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_=
COMPILE=3D$(CROSS_COMPILE)
-
-u-boot_clean:
-	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=3D$(CROS=
S_COMPILE) clean
-
-u-boot_install:
-	install -d $(DESTDIR)/boot
-	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.bin $(DESTDIR)/boo=
t
-	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.map $(DESTDIR)/boo=
t
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk-ma=
kefile/ti-tisdk-makefile/Makefile_u-boot-spl
deleted file mode 100644
index 6e8dd6ef..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_u-boot-spl
+++ /dev/null
@@ -1,23 +0,0 @@
-# u-boot build targets
-u-boot-spl: u-boot
-u-boot-spl_clean: u-boot_clean
-u-boot-spl_install: u-boot_install
-
-u-boot:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building U-boot
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_=
COMPILE=3D$(CROSS_COMPILE) $(UBOOT_MACHINE)
-	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_=
COMPILE=3D$(CROSS_COMPILE) CONFIG_MKIMAGE_DTC_PATH=3D$(TI_SDK_PATH)/board=
-support/u-boot-*/scripts/dtc/dtc
-
-u-boot_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaining U-boot
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=3D$(CROS=
S_COMPILE) distclean
-
-u-boot_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Installing U-boot
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo "Nothing to do"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Makefile_uio-module-drv b/meta-arago-distro/recipes-tisdk/ti-tisd=
k-makefile/ti-tisdk-makefile/Makefile_uio-module-drv
deleted file mode 100644
index 544e0eb8..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Makefile_uio-module-drv
+++ /dev/null
@@ -1,28 +0,0 @@
-uio-module-drv: linux
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Building uio-module-drv
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "uio-module-drv*"`; \
-	make ARCH=3D__KERNEL_ARCH__ KERNEL_SRC=3D$(LINUXKERNEL_INSTALL_DIR)
-
-uio-module-drv_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Cleaning uio-module-drv
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "uio-module-drv*"`; \
-	make ARCH=3D__KERNEL_ARCH__ KERNEL_SRC=3D$(LINUXKERNEL_INSTALL_DIR) cle=
an
-
-uio-module-drv_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo      Installing uio-module-drv
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@if [ ! -d $(DESTDIR) ] ; then \
-		echo "The extracted target filesystem directory doesn't exist."; \
-		echo "Please run setup.sh in the SDK's root directory and then try aga=
in."; \
-		exit 1; \
-	fi
-	@cd board-support/extra-drivers; \
-	cd `find . -maxdepth 1 -type d -name "uio-module-drv*"`; \
-	make ARCH=3D__KERNEL_ARCH__  KERNEL_SRC=3D$(LINUXKERNEL_INSTALL_DIR)  I=
NSTALL_MOD_PATH=3D$(DESTDIR) PREFIX=3D$(SDK_PATH_TARGET) INSTALL_MOD_STRI=
P=3D$(INSTALL_MOD_STRIP) modules_install
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti=
-tisdk-makefile/Rules.make
deleted file mode 100644
index a2b7769f..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/Rules.make
+++ /dev/null
@@ -1,45 +0,0 @@
-#platform
-PLATFORM=3D__PLATFORM__
-
-#defconfig
-DEFCONFIG=3D__DEFCONFIG__
-
-#Architecture
-ARCH=3D__ARCH__
-
-#u-boot machine
-UBOOT_MACHINE=3D__UBOOT_MACHINE__
-
-#Points to the root of the TI SDK
-export TI_SDK_PATH=3D__SDK__INSTALL_DIR__
-
-#root of the target file system for installing applications
-DESTDIR ?=3D__DESTDIR__
-
-#Points to the root of the Linux libraries and headers matching the
-#demo file system.
-export LINUX_DEVKIT_PATH=3D$(TI_SDK_PATH)/linux-devkit
-
-#Cross compiler prefix
-export CROSS_COMPILE=3D$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arag=
o-linux__TOOLCHAIN_BINDIR__/__TOOLCHAIN_PREFIX__
-
-#Default CC value to be used when cross compiling.  This is so that the
-#GNU Make default of "cc" is not used to point to the host compiler
-export CC=3D$(CROSS_COMPILE)gcc --sysroot=3D$(SDK_PATH_TARGET)
-
-#Location of environment-setup file
-export ENV_SETUP=3D$(LINUX_DEVKIT_PATH)/environment-setup
-
-#The directory that points to the SDK kernel source tree
-LINUXKERNEL_INSTALL_DIR=3D$(TI_SDK_PATH)/board-support/__KERNEL_NAME__
-
-CFLAGS=3D__CFLAGS__
-
-#Strip modules when installing to conserve disk space
-INSTALL_MOD_STRIP=3D1
-
-SDK_PATH_TARGET=3D$(TI_SDK_PATH)/__SDK_PATH_TARGET__
-
-# Set EXEC_DIR to install example binaries.
-# This will be configured with the setup.sh script.
-EXEC_DIR ?=3D__EXEC_DIR__
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile/k3/Makefile_u-boot-spl b/meta-arago-distro/recipes-tisdk/ti-tisdk=
-makefile/ti-tisdk-makefile/k3/Makefile_u-boot-spl
deleted file mode 100644
index d1a5ed08..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
/k3/Makefile_u-boot-spl
+++ /dev/null
@@ -1,59 +0,0 @@
-
-# u-boot build targets
-u-boot-spl: u-boot
-u-boot-spl_clean: u-boot_clean
-u-boot-spl_install: u-boot_install
-
-UBOOT_A53_BUILD_DIR=3D$(TI_SDK_PATH)/board-support/u-boot_build/a53
-UBOOT_R5_BUILD_DIR=3D$(TI_SDK_PATH)/board-support/u-boot_build/r5
-
-UBOOT_ATF=3D$(TI_SDK_PATH)/board-support/prebuilt-images/bl31.bin
-UBOOT_TEE=3D$(TI_SDK_PATH)/board-support/prebuilt-images/bl32.bin
-UBOOT_SYSFW=3D$(TI_SDK_PATH)/board-support/prebuilt-images/sysfw.bin
-
-u-boot: u-boot-a53 u-boot-r5
-u-boot_clean: u-boot-a53_clean u-boot-r5_clean
-
-u-boot-a53:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building U-boot for A53
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_=
COMPILE=3D$(CROSS_COMPILE) \
-		 $(UBOOT_MACHINE) O=3D$(UBOOT_A53_BUILD_DIR)
-	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_=
COMPILE=3D$(CROSS_COMPILE) \
-		CONFIG_MKIMAGE_DTC_PATH=3D$(UBOOT_A53_BUILD_DIR)/scripts/dtc/dtc \
-		ATF=3D$(UBOOT_ATF) TEE=3D$(UBOOT_TEE) \
-		O=3D$(UBOOT_A53_BUILD_DIR)
-
-u-boot-a53_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaining U-boot for A53
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=3D$(CROS=
S_COMPILE) \
-		O=3D$(UBOOT_A53_BUILD_DIR) distclean
-	@rm -rf $(UBOOT_A53_BUILD_DIR)
-
-
-u-boot-r5:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Building U-boot for R5
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_=
COMPILE=3D$(CROSS_COMPILE_ARMV7) \
-		 $(UBOOT_MACHINE_R5) O=3D$(UBOOT_R5_BUILD_DIR)
-	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_=
COMPILE=3D$(CROSS_COMPILE_ARMV7) \
-		O=3D$(UBOOT_R5_BUILD_DIR)
-
-u-boot-r5_clean:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Cleaining U-boot for R5
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-* CROSS_COMPILE=3D$(CROS=
S_COMPILE_ARMV7) \
-		O=3D$(UBOOT_R5_BUILD_DIR) distclean
-	@rm -rf $(UBOOT_R5_BUILD_DIR)
-
-u-boot_install:
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo    Installing U-boot
-	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-	@echo "Nothing to do"
-
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tis=
dk-makefile_1.0.bb
deleted file mode 100644
index b991351f..00000000
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
+++ /dev/null
@@ -1,317 +0,0 @@
-DESCRIPTION =3D "Package containing Makefile and Rules.make file for TIS=
DKs"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
-
-# Build the list of component makefiles to put together to build the
-# Makefile that goes into the SDK.  For legacy devices the base Makefile
-# will be picked up and will contain everything.
-#
-# It is assumed that the component makefiles follow the naming
-# Makefile_$component.  All Makefiles will be part of the SRC_URI to be
-# fetched, but only the listed ones will be used to build the final Make=
file
-
-SRC_URI =3D "\
-    file://Makefile \
-    file://Rules.make \
-    file://Makefile_linux \
-    file://Makefile_linux-dtbs \
-    file://Makefile_u-boot-legacy \
-    file://Makefile_matrix-gui \
-    file://Makefile_arm-benchmarks \
-    file://Makefile_ti-crypto-examples \
-    file://Makefile_am-sysinfo \
-    file://Makefile_av-examples \
-    file://Makefile_u-boot-spl \
-    file://Makefile_matrix-gui-browser \
-    file://Makefile_refresh-screen \
-    file://Makefile_pru \
-    file://Makefile_ti-ocf-crypto-module \
-    file://Makefile_qt-tstat \
-    file://Makefile_omapconf \
-    file://Makefile_oprofile-example \
-    file://Makefile_dual-camera-demo \
-    file://Makefile_image-gallery \
-    file://Makefile_cryptodev \
-    file://Makefile_cmem-mod \
-    file://Makefile_debugss-module-drv \
-    file://Makefile_gdbserverproxy-module-drv \
-    file://Makefile_ti-sgx-ddk-km \
-    file://Makefile_opencl-examples \
-    file://Makefile_boot-monitor \
-    file://Makefile_hplib-mod \
-    file://Makefile_uio-module-drv \
-    file://Makefile_pru-icss \
-    file://Makefile_qt-opencv-opencl-opengl-multithreaded \
-    file://Makefile_openmpacc-examples \
-    file://Makefile_linalg-examples \
-    file://Makefile_ti-gc320-driver \
-    file://Makefile_barcode-roi \
-    file://Makefile_sysfw-image \
-    file://Makefile_mmwavegesture-hmi \
-    file://Makefile_pdm-anomaly-detection \
-    file://Makefile_tiovx-app-host \
-    file://Makefile_ti-ipc \
-    file://Makefile_ti-img-rogue-driver \
-"
-
-PR =3D "r106"
-
-MAKEFILES_MATRIX_GUI =3D "matrix-gui-browser \
-                        refresh-screen \
-                        qt-tstat \
-"
-
-MAKEFILES_MATRIX_GUI:omapl138 =3D ""
-MAKEFILES_MATRIX_GUI:j7 =3D ""
-
-MAKEFILES_COMMON =3D "linux \
-                    matrix-gui \
-                    arm-benchmarks \
-                    am-sysinfo \
-                    oprofile-example \
-                    ${MAKEFILES_MATRIX_GUI} \
-"
-MAKEFILES =3D ""
-
-# Add device specific make targets
-
-MAKEFILES:append:ti33x =3D " u-boot-spl \
-                           ti-crypto-examples \
-                           linux-dtbs \
-                           cryptodev \
-                           ti-sgx-ddk-km \
-                           pru-icss \
-                           uio-module-drv \
-			   mmwavegesture-hmi \
-                           pdm-anomaly-detection \
-"
-MAKEFILES:append:ti43x =3D " u-boot-spl \
-                           ti-crypto-examples \
-                           linux-dtbs \
-                           cryptodev \
-                           dual-camera-demo \
-                           image-gallery \
-                           ti-sgx-ddk-km \
-                           cmem-mod \
-                           pru-icss \
-                           uio-module-drv \
-			   mmwavegesture-hmi \
-                           pdm-anomaly-detection \
-"
-
-#                            debugss-module-drv=20
-#                            gdbserverproxy-module-drv=20
-MAKEFILES:append:dra7xx =3D " cryptodev \
-                            opencl-examples \
-                            openmpacc-examples \
-                            qt-opencv-opencl-opengl-multithreaded \
-                            linalg-examples \
-                            tiovx-app-host \
-"
-
-MAKEFILES:append:omap-a15 =3D " u-boot-spl \
-                              omapconf \
-                              linux-dtbs \
-                              ti-sgx-ddk-km \
-                              cmem-mod \
-                              pru-icss \
-                              ti-gc320-driver \
-                              barcode-roi \
-                              uio-module-drv \
-			      mmwavegesture-hmi \
-                              pdm-anomaly-detection \
-                              ti-ipc \
-"
-MAKEFILES:append:omapl138 =3D " linux-dtbs \
-                              u-boot-spl \
-                              ti-ipc \
-"
-
-MAKEFILES:append:k3 =3D " u-boot-spl \
-                        linux-dtbs \
-                        cryptodev \
-                        sysfw-image \
-                        ti-ipc \
-"
-
-MAKEFILES:append:am65xx =3D " \
-                        pru-icss \
-                        ti-sgx-ddk-km \
-                        barcode-roi \
-                        mmwavegesture-hmi \
-                        pdm-anomaly-detection \
-"
-
-MAKEFILES:append:j7 =3D " pru-icss \
-                            ti-img-rogue-driver \
-"
-MAKEFILES:append:am64xx =3D " \
-                        pru-icss \
-"
-
-# Use this to export kernel arch to ARCH
-#
-# We need to be very careful here. This class will also overwrite UBOOT_=
ARCH
-# even though it may be set in the machine configuration.
-inherit kernel-arch
-
-# Use ARCH format expected by the makefile
-PLATFORM_ARCH =3D "${ARMPKGARCH}"
-PLATFORM_ARCH:arm =3D "armv7-a"
-PLATFORM_ARCH:omapl138 =3D "armv5te"
-
-# ti-sgx-ddk-km configurations
-# See meta-ti/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
-TI_SGX_TARGET_PRODUCT =3D "jacinto6evm"
-TI_SGX_TARGET_PRODUCT:ti33x =3D "ti335x"
-TI_SGX_TARGET_PRODUCT:ti43x =3D "ti437x"
-TI_SGX_TARGET_PRODUCT:k3 =3D "ti654x"
-
-TI_SGX_TARGET_ARCH =3D "armhf"
-TI_SGX_TARGET_ARCH:k3 =3D "aarch64"
-
-PLATFORM_DEBUGSS =3D ""
-PLATFORM_DEBUGSS:dra7xx =3D "DRA7xx_PLATFORM"
-
-PLATFORM_GDBSERVERPROXY =3D ""
-PLATFORM_GDBSERVERPROXY:dra7xx =3D "DRA7xx_PLATFORM"
-
-PRU_ICSS_INSTALL_TARGET =3D "pru-icss_install_none"
-PRU_ICSS_INSTALL_TARGET:ti33x =3D "pru-icss_install_am335x"
-PRU_ICSS_INSTALL_TARGET:ti43x =3D "pru-icss_install_am437x"
-PRU_ICSS_INSTALL_TARGET:omap-a15 =3D "pru-icss_install_am572x"
-PRU_ICSS_INSTALL_TARGET:am65xx =3D "pru-icss_install_am65x"
-PRU_ICSS_INSTALL_TARGET:j7 =3D "pru-icss_install_j721e"
-PRU_ICSS_INSTALL_TARGET:am64xx =3D "pru-icss_install_am64x"
-
-# Path to toolchains for the various cores in TI SOCs
-#
-# These are provided by the TI RTOS SDK and used to build firmwares used=
 by the
-# IPC Linux examples.
-IPC_TOOLS_PATHS_C66 =3D "ti.targets.elf.C66=3D"\$\(C6X_GEN_INSTALL_PATH\=
)""
-IPC_TOOLS_PATHS_M4  =3D "ti.targets.arm.elf.M4=3D"\$\(TOOLCHAIN_PATH_M4\=
)" ti.targets.arm.elf.M4F=3D"\$\(TOOLCHAIN_PATH_M4\)""
-IPC_TOOLS_PATHS_R5F  =3D "ti.targets.arm.elf.R5F=3D"\$\(TOOLCHAIN_PATH_R=
5\)""
-IPC_TOOLS_PATHS_C674 =3D "ti.targets.elf.C674=3D"\$\(C6X_GEN_INSTALL_PAT=
H\)""
-
-IPC_TOOLS_PATHS =3D ""
-IPC_TOOLS_PATHS:append:omap-a15 =3D " ${IPC_TOOLS_PATHS_C66} ${IPC_TOOLS=
_PATHS_M4}"
-IPC_TOOLS_PATHS:append:omapl138 =3D " ${IPC_TOOLS_PATHS_C674}"
-IPC_TOOLS_PATHS:append:k3 =3D "${IPC_TOOLS_PATHS_R5F}"
-
-# If it's not defined at all, like for zImage case
-UBOOT_LOADADDRESS ?=3D "0"
-
-KERNEL_BUILD_CMDS =3D "${@oe.utils.conditional('KERNEL_IMAGETYPE','uImag=
e','LOADADDR=3D${UBOOT_LOADADDRESS}','',d)} ${KERNEL_IMAGETYPE}"
-
-DEFCONFIG =3D "tisdk_${MACHINE}${ARAGO_KERNEL_SUFFIX}_defconfig"
-
-AMSDK_DEFCONFIG =3D "singlecore-omap2plus_defconfig"
-
-DEFCONFIG :=3D "${@oe.utils.conditional('ARAGO_BRAND','amsdk','${AMSDK_D=
EFCONFIG}','${DEFCONFIG}',d)}"
-
-EXTERNAL_TOOLCHAIN_BINDIR =3D "/usr/bin"
-INTERNAL_TOOLCHAIN_BINDIR =3D "/usr/bin/${TARGET_ARCH}${TARGET_VENDOR}-$=
{TARGET_OS}"
-
-# This step will stitch together the final Makefile based on the support=
ed
-# make targets.
-do_install () {
-    install -d ${D}/
-
-    # Start with the base Makefile
-    install  ${WORKDIR}/Makefile ${D}/Makefile
-
-    # Remember the targets added so we can update the all target
-    targets=3D""
-    clean_targets=3D""
-    install_targets=3D""
-
-    # Now add common build targets
-    for x in ${MAKEFILES_COMMON}
-    do
-        cat ${WORKDIR}/Makefile_${x} >> ${D}/Makefile
-        targets=3D"$targets""$x\ "
-        clean_targets=3D"$clean_targets""$x""_clean\ "
-        install_targets=3D"$install_targets""$x""_install\ "
-    done
-
-    # Now add device specific build targets
-    for x in ${MAKEFILES}
-    do
-        cat ${WORKDIR}/Makefile_${x} >> ${D}/Makefile
-        targets=3D"$targets""$x\ "
-        clean_targets=3D"$clean_targets""$x""_clean\ "
-        install_targets=3D"$install_targets""$x""_install\ "
-    done
-
-    # Update the all, clean, and install targets if we added targets
-    if [ "$targets" !=3D "" ]
-    then
-        sed -i -e "s/__ALL_TARGETS__/$targets/" ${D}/Makefile
-        sed -i -e "s/__CLEAN_TARGETS__/$clean_targets/" ${D}/Makefile
-        sed -i -e "s/__INSTALL_TARGETS__/$install_targets/" ${D}/Makefil=
e
-    fi
-
-    sed -i -e "s/__KERNEL_ARCH__/${ARCH}/" ${D}/Makefile
-    sed -i -e "s/__KERNEL_IMAGE_TYPE__/${KERNEL_IMAGETYPE}/" ${D}/Makefi=
le
-    sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/" ${D}/Makef=
ile
-    sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/g" ${D}/Makefile
-
-    sed -i -e "s/__TI_SGX_TARGET_PRODUCT__/${TI_SGX_TARGET_PRODUCT}/" ${=
D}/Makefile
-    sed -i -e "s/__TI_SGX_TARGET_ARCH__/${TI_SGX_TARGET_ARCH}/" ${D}/Mak=
efile
-    sed -i -e "s/__PLATFORM_DEBUGSS__/${PLATFORM_DEBUGSS}/g" ${D}/Makefi=
le
-    sed -i -e "s/__PLATFORM_GDBSERVERPROXY__/${PLATFORM_GDBSERVERPROXY}/=
g" ${D}/Makefile
-    sed -i -e "s/__BOOT_MONITOR_MAKE_TARGET__/${BOOT_MONITOR_MAKE_TARGET=
}/g" ${D}/Makefile
-    sed -i -e "s/__PRU_ICSS_INSTALL_TARGET__/${PRU_ICSS_INSTALL_TARGET}/=
g" ${D}/Makefile
-    sed -i -e "s/__IPC_TOOLS_PATHS__/${IPC_TOOLS_PATHS}/g" ${D}/Makefile
-    sed -i -e "s/__TISDK_VERSION__/${TISDK_VERSION}/g" ${D}/Makefile
-
-    cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
-
-    if [ "$?" =3D "0" ]
-    then
-        sed -i -e "s|__KERNEL_DEVICETREE__|${KERNEL_DEVICETREE}|" ${D}/M=
akefile
-        sed -i -e "s/__DTB_DEPEND__/linux-dtbs/" ${D}/Makefile
-        sed -i -e "s/__DTB_DEPEND_INSTALL__/linux-dtbs_install/" ${D}/Ma=
kefile
-    else
-        sed -i -e "s/__DTB_DEPEND__//" ${D}/Makefile
-        sed -i -e "s/__DTB_DEPEND_INSTALL__//" ${D}/Makefile
-    fi
-
-
-    install  ${WORKDIR}/Rules.make ${D}/Rules.make
-
-    # fixup Rules.make values
-    sed -i -e "s/__PLATFORM__/${MACHINE}/" ${D}/Rules.make
-    sed -i -e "s/__DEFCONFIG__/${DEFCONFIG}/" ${D}/Rules.make
-    sed -i -e "s/__ARCH__/${PLATFORM_ARCH}/" ${D}/Rules.make
-    sed -i -e "s/__TOOLCHAIN_PREFIX__/${TOOLCHAIN_SYS}-/" ${D}/Rules.mak=
e
-    sed -i -e "s/__UBOOT_MACHINE__/${UBOOT_MACHINE}/" ${D}/Rules.make
-    sed -i -e "s/__CFLAGS__/${TARGET_CC_ARCH}/" ${D}/Rules.make
-    sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/" ${D}/Rules.make
-
-    if [ "${TOOLCHAIN_TYPE}" =3D "internal" ]; then
-        sed -i -e "s|__TOOLCHAIN_BINDIR__|${INTERNAL_TOOLCHAIN_BINDIR}|"=
 ${D}/Rules.make
-    else
-        sed -i -e "s|__TOOLCHAIN_BINDIR__|${EXTERNAL_TOOLCHAIN_BINDIR}|"=
 ${D}/Rules.make
-    fi
-
-}
-
-K3_UBOOT_MACHINE_R5 =3D ""
-K3_UBOOT_MACHINE_R5:am65xx-evm =3D "am65x_evm_r5_defconfig"
-K3_UBOOT_MACHINE_R5:am65xx-hs-evm =3D "am65x_hs_evm_r5_defconfig"
-K3_UBOOT_MACHINE_R5:j721e-evm =3D "j721e_evm_r5_config"
-K3_UBOOT_MACHINE_R5:j721e-hs-evm =3D "j721e_hs_evm_r5_config"
-
-do_install:append:k3() {
-    cat >> ${D}/Rules.make << __EOF__
-
-# Add CROSS_COMPILE and UBOOT_MACHINE for the R5
-export CROSS_COMPILE_ARMV7=3D\$(LINUX_DEVKIT_PATH)/sysroots/${SDKMACHINE=
}-arago-linux/usr/bin/arm-none-linux-gnueabihf-
-UBOOT_MACHINE_R5=3D${K3_UBOOT_MACHINE_R5}
-__EOF__
-}
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-FILES:${PN} =3D "/*"
--=20
2.25.1



