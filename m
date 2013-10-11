Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 75D255299B
	for <meta-arago@arago-project.org>;
	Fri, 11 Oct 2013 15:42:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9BFgsfw004308
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2013 10:42:54 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9BFgsUS028003
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2013 10:42:54 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 11 Oct 2013 10:42:54 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 4/4] ti-tisdk-makefile: Pass in LOADADDR
	for	Linux kernel
Thread-Index: AQHOxpaFQaUkuckKqkuLx3zJGCDD2Jnvo93Q
Date: Fri, 11 Oct 2013 15:42:54 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597A0B1F@DLEE11.ent.ti.com>
References: <1381508186-30546-1-git-send-email-fcooper@ti.com>
	<1381508186-30546-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1381508186-30546-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 4/4] ti-tisdk-makefile: Pass in LOADADDR for	Linux kernel
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
X-List-Received-Date: Fri, 11 Oct 2013 15:42:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-By: Chase Maupin <chase.maupin@ti.com>

And nice job BTW


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Friday, October 11, 2013 11:16 AM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCHv2 4/4] ti-tisdk-makefile: Pass in
>LOADADDR for Linux kernel
>
>* Newer versions of the kernel now require a LOADADDR to be set
>when building
>  uImage.
>* Depending on the KERNEL_IMAGETYPE used allow support for
>zImages.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
>Version 2 changes:
>Support both uImage and zImage
>
> .../ti-tisdk-makefile/Makefile_linux               |    2 +-
> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    6 +++++-
> 2 files changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-
>tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
>index 4a13f48..c53ee29 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_linux
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_linux
>@@ -4,7 +4,7 @@ linux:
> 	@echo     Building the Linux Kernel
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
>CROSS_COMPILE=3D$(CROSS_COMPILE) tisdk_$(PLATFORM)_defconfig
>-	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR)
>ARCH=3Darm CROSS_COMPILE=3D$(CROSS_COMPILE) uImage
>+	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR)
>ARCH=3Darm CROSS_COMPILE=3D$(CROSS_COMPILE) __KERNEL_BUILD_CMDS__
> 	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR)
>ARCH=3Darm CROSS_COMPILE=3D$(CROSS_COMPILE) modules
>
> linux_install:
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-makefile_1.0.bb
>index a1faffd..58b8dfa 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>@@ -33,7 +33,7 @@ SRC_URI =3D "\
>     file://Makefile_oprofile-example \
> "
>
>-PR =3D "r15"
>+PR =3D "r16"
>
> MAKEFILES_COMMON =3D "linux \
>                     matrix-gui \
>@@ -80,6 +80,8 @@ MAKEFILES_append_am180x-evm =3D " pru \
> PLATFORM_ARCH =3D "armv7-a"
> PLATFORM_ARCH_omapl138 =3D "armv5te"
>
>+KERNEL_BUILD_CMDS =3D
>"${@base_contains('KERNEL_IMAGETYPE','uImage','LOADADDR=3D${UBOOT_LO
>ADADDRESS} uImage','zImage',d)}"
>+
> # This step will stitch together the final Makefile based on the
>supported
> # make targets.
> do_install () {
>@@ -119,6 +121,8 @@ do_install () {
>         sed -i -e "s/__INSTALL_TARGETS__/$install_targets/"
>${D}/Makefile
>     fi
>
>+    sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/"
>${D}/Makefile
>+
>     install  ${WORKDIR}/Rules.make ${D}/Rules.make
>
>     # fixup Rules.make values
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

