Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D4B26529B0
	for <meta-arago@arago-project.org>;
	Thu, 10 Oct 2013 15:45:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9AFjN1F012600
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:45:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9AFjNS5006895
	for <meta-arago@arago-project.org>; Thu, 10 Oct 2013 10:45:23 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 10 Oct 2013 10:45:23 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Monk, Roger" <r-monk@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 10/11] ti-connectivity/bt-firmware:
	Update to	latest BT Firmware + allow more targets
Thread-Index: AQHOxcn2eJ2BndcU80SojoQm6NjQcJnuE3Yg
Date: Thu, 10 Oct 2013 15:45:23 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015979BEB0@DLEE11.ent.ti.com>
References: <1381420942-16810-1-git-send-email-r-monk@ti.com>
	<1381420942-16810-11-git-send-email-r-monk@ti.com>
In-Reply-To: <1381420942-16810-11-git-send-email-r-monk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 10/11] ti-connectivity/bt-firmware: Update to	latest BT Firmware + allow more targets
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
X-List-Received-Date: Thu, 10 Oct 2013 15:45:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

General question, since you were adding recipes for omap-a15 does there nee=
d to be a setting of PLATFORM for those devices or is the default "unknown"=
 OK?

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Monk, Roger
>Sent: Thursday, October 10, 2013 11:02 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv2 10/11] ti-connectivity/bt-firmware:
>Update to latest BT Firmware + allow more targets
>
>       * Add latest BT firmware
>       * Add patch to enable unspecifified platforms to pick up
>default firmware
>
>Signed-off-by: Roger Monk <r-monk@ti.com>
>---
> ...-Remove-platform-check-and-install-defaul.patch |   41
>++++++++++++++++++++
> .../recipes-bsp/bt-firmware/bt-firmware_git.bb     |   10 +++--
> 2 files changed, 47 insertions(+), 4 deletions(-)
> create mode 100644 meta-arago-extras/recipes-bsp/bt-firmware/bt-
>firmware/0001-bt-firmware-Remove-platform-check-and-install-
>defaul.patch
>
>diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-
>firmware/0001-bt-firmware-Remove-platform-check-and-install-
>defaul.patch b/meta-arago-extras/recipes-bsp/bt-firmware/bt-
>firmware/0001-bt-firmware-Remove-platform-check-and-install-
>defaul.patch
>new file mode 100644
>index 0000000..4ad457e
>--- /dev/null
>+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware/0001-
>bt-firmware-Remove-platform-check-and-install-defaul.patch
>@@ -0,0 +1,41 @@
>+From 40bb43c136ec8001d35f6077e5de5f8ac72f4da0 Mon Sep 17 00:00:00
>2001
>+From: Roger Monk <r-monk@ti.com>
>+Date: Thu, 3 Oct 2013 02:59:54 +0100
>+Subject: [PATCH] bt-firmware:  Remove platform check and install
>default
>+ firmware
>+
>+   * For undefined plaforms, install default firmware
>+   * Remove configuration of 'unknown' so that install picks
>+     firmware from root directory (default)
>+
>+Signed-off-by: Roger Monk <r-monk@ti.com>
>+---
>+ Makefile |    6 +++---
>+ 1 file changed, 3 insertions(+), 3 deletions(-)
>+
>+diff --git a/Makefile b/Makefile
>+index bd94881..ca8280a 100644
>+--- a/Makefile
>++++ b/Makefile
>+@@ -5,8 +5,8 @@
>+ # If KERNEL_DIR is not set then use the default in Rules.make
>+ DEST_DIR ?=3D ${DESTDIR}
>+
>+-PLATFORM ?=3D "unknown"
>+-MACHINE_NAME ?=3D "unknown"
>++#PLATFORM ?=3D "unknown"
>++#MACHINE_NAME ?=3D "unknown"
>+
>+ ifeq ($(PLATFORM), am335x-evm)
>+     MACHINE_NAME :=3D am335x
>+@@ -23,6 +23,6 @@ endif
>+
>+ install:
>+ 	install -d $(DEST_DIR)${BASE_LIB_DIR}/firmware
>+-	cp -f ./${MACHINE_NAME}/*
>$(DEST_DIR)${BASE_LIB_DIR}/firmware
>++	cp -f ./${MACHINE_NAME}/*.bts
>$(DEST_DIR)${BASE_LIB_DIR}/firmware
>+
>+
>+--
>+1.7.9.5
>+
>diff --git a/meta-arago-extras/recipes-bsp/bt-firmware/bt-
>firmware_git.bb b/meta-arago-extras/recipes-bsp/bt-firmware/bt-
>firmware_git.bb
>index 2b320da..3a0191e 100644
>--- a/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
>+++ b/meta-arago-extras/recipes-bsp/bt-firmware/bt-firmware_git.bb
>@@ -13,13 +13,15 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> RCONFLICTS_${PN} =3D "linux-firmware-wl12xx"
> RREPLACES_${PN}  =3D "linux-firmware-wl12xx"
>
>-PR =3D "r2+gitr${SRCPV}"
>+PR =3D "r3+gitr${SRCPV}"
>
>-COMPATIBLE_MACHINE =3D "omap3|omapl138|da850-omapl138-evm|ti33x"
>+COMPATIBLE_MACHINE =3D "omap3|omapl138|da850-omapl138-
>evm|ti3x|omap-a15"
>
>-SRCREV =3D "adbc27c11d5c5c8c20a93a8beca647b4a6aaa03b"
>+SRCREV =3D "3a020e30a0e28e6b7b7cdd2a8fb37b29e1e58040"
> SRC_URI =3D "git://github.com/TI-ECS/bt-firmware.git;protocol=3Dgit \
>-           file://0001-Makefile-allow-building-within-the-
>OE.patch"
>+           file://0001-Makefile-allow-building-within-the-
>OE.patch \
>+           file://0001-bt-firmware-Remove-platform-check-and-
>install-defaul.patch \
>+"
>
> PLATFORM =3D "unknown"
> PLATFORM_ti33x =3D "am335x-evm"
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

