Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B43C3A59E
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.203.1667598074264766597
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 015ED40D80
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wYgWOIW3tQmw for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E965340D82
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7DBF116367E
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 05/14] ti-pru-sw: Remove old TI-PRU-SW examples and helpers
Date: Fri,  4 Nov 2022 21:41:03 +0000
Message-Id: <20221104214112.1221365-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14102

From: Andrew Davis <afd@ti.com>

The source for these is long gone and they were not the correct
way to use the PRUs these days anyway. Remove them.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../ti-pru-sw-app-loader_1.00.00.bb           | 26 ----------------
 .../ti-pru-sw-edma-library_1.00.00.bb         | 30 ------------------
 .../ti-pru-sw-examples_1.00.00.bb             | 31 -------------------
 3 files changed, 87 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-app-loader/t=
i-pru-sw-app-loader_1.00.00.bb
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-edma-library=
/ti-pru-sw-edma-library_1.00.00.bb
 delete mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-=
pru-sw-examples_1.00.00.bb

diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-s=
w-app-loader_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-app-lo=
ader/ti-pru-sw-app-loader_1.00.00.bb
deleted file mode 100644
index 5eaad599..00000000
--- a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-l=
oader_1.00.00.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION =3D "PRU sw application loader"
-HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://interface/prussdrv.c;beginline=3D1;endline=3D=
47;md5=3D6012fea45c1fbced663277bc90d2163a"
-
-RRECOMMENDS:${PN} =3D "kernel-module-uio-pru"
-PR =3D "r0"
-PV:append =3D "+svn${SRCPV}"
-
-COMPATIBLE_MACHINE =3D "omapl138"
-
-SRC_URI =3D "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;protocol=3Dh=
ttps;user=3Danonymous;pswd=3D''"
-
-SRCREV =3D "33"
-S =3D "${WORKDIR}/trunk/app_loader"
-
-do_compile () {
-        make -C ${S}/interface CCTOOL_PREFIX=3D${TOOLCHAIN_PATH}/bin/${T=
ARGET_PREFIX}
-}
-
-do_install () {
-        install -d ${D}${libdir}
-        install -d ${D}${includedir}
-        install -m 0644 ${S}/include/* ${D}${includedir}
-        install -m 0644 ${S}/lib/* ${D}${libdir}
-}
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru=
-sw-edma-library_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-ed=
ma-library/ti-pru-sw-edma-library_1.00.00.bb
deleted file mode 100644
index 88b86d63..00000000
--- a/meta-arago-extras/recipes-core/ti-pru-sw-edma-library/ti-pru-sw-edm=
a-library_1.00.00.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "eDMA library for use by PRU sw example applications"
-HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://edma.c;beginline=3D1;endline=3D46;md5=3Df6b=
de95a8e2277050e36b257ca9214a6"
-
-DEPENDS +=3D "virtual/kernel"
-
-RDEPENDS:${PN} +=3D "ti-pru-sw-edma-driver"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE =3D "omapl138"
-
-MACHINE_KERNEL_PR:append =3D "a"
-PR =3D "${MACHINE_KERNEL_PR}"
-PV:append =3D "+svn${SRCPV}"
-
-SRC_URI =3D "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;protocol=3Dh=
ttps;user=3Danonymous;pswd=3D''"
-
-SRCREV =3D "33"
-S =3D "${WORKDIR}/trunk/peripheral_lib/edma_driver/interface"
-
-do_compile () {
-	oe_runmake KERNEL_DIR=3D"${STAGING_KERNEL_DIR}" CCTOOL_PREFIX=3D${TOOLC=
HAIN_PATH}/bin/${TARGET_PREFIX}
-}
-
-do_install () {
-	install -d ${D}/${libdir}
-	install -m 0755 ${S}/../lib/libedmautils.a ${D}/${libdir}/
-}
diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-=
examples_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-examples/t=
i-pru-sw-examples_1.00.00.bb
deleted file mode 100644
index 60bc3d5a..00000000
--- a/meta-arago-extras/recipes-core/ti-pru-sw-examples/ti-pru-sw-example=
s_1.00.00.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION =3D "PRU sw example applications"
-HOMEPAGE =3D "https://gforge.ti.com/gf/project/pru_sw/"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dc4fd8ee7443c1b2b6238b4b5d=
f796481"
-DEPENDS =3D "ti-pru-sw-app-loader ti-pru-sw-edma-library"
-RDEPENDS:${PN} =3D "ti-pru-sw-edma-driver"
-PR =3D "r0"
-PV:append =3D "+svn${SRCPV}"
-
-COMPATIBLE_MACHINE =3D "omapl138"
-
-SRC_URI =3D "svn://gforge.ti.com/svn/pru_sw/;module=3Dtrunk;protocol=3Dh=
ttps;user=3Danonymous;pswd=3D''"
-
-SRCREV =3D "33"
-S =3D "${WORKDIR}/trunk"
-
-do_compile () {
-        make -C ${S}/example_apps \
-          CCTOOLS=3D"${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc ${TOOLCHA=
IN_OPTIONS}"\
-          BINDIR_APPLICATIONS=3D"${S}/example_apps/bin" \
-          BINDIR_FW=3D"${S}/example_apps/bin" \
-          UTILS_DIR=3D"${S}/utils"
-}
-
-do_install () {
-        install -d ${D}/usr/share/ti/ti-pru-eg/
-        install -m 0755 ${S}/example_apps/bin/* ${D}/usr/share/ti/ti-pru=
-eg/
-}
-
-FILES:${PN} +=3D "${datadir}/ti/ti-pru-eg/*"
-FILES:${PN}-dbg +=3D "${datadir}/ti/ti-pru-eg/.debug/*"
--=20
2.25.1


