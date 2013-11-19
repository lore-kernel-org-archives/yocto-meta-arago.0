Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 71CD452A76
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 20:17:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJKHP70015254
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:17:25 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJKHPRt022044
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:17:25 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 19 Nov 2013 14:17:25 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/7] ti-tisdk-makefile: Add DTB support
	for	AM43x and AM335x
Thread-Index: AQHO5VFYuvyCDOVRHUqHvBj2s0kmvZos/g9A
Date: Tue, 19 Nov 2013 20:17:24 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159839D91@DLEE11.ent.ti.com>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
	<1384887728-8628-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1384887728-8628-4-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] ti-tisdk-makefile: Add DTB support for	AM43x and AM335x
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
X-List-Received-Date: Tue, 19 Nov 2013 20:17:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, November 19, 2013 1:02 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 4/7] ti-tisdk-makefile: Add DTB
>support for AM43x and AM335x
>
>* Add support to build DTB files for AM43x and AM335x
>* Add a target dependency to force dtb files to be built and
>installed when make
>  linux/linux_install are ran.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../ti-tisdk-makefile/Makefile_linux               |    4 +-
> .../ti-tisdk-makefile/Makefile_linux-dtbs          |    2 +-
> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |   23
>+++++++++++++++++++-
> 3 files changed, 25 insertions(+), 4 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-
>tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
>index c53ee29..f4dc75f 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_linux
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_linux
>@@ -1,5 +1,5 @@
> # Kernel build targets
>-linux:
>+linux: __DTB_DEPEND__
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo     Building the Linux Kernel
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>@@ -7,7 +7,7 @@ linux:
> 	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR)
>ARCH=3Darm CROSS_COMPILE=3D$(CROSS_COMPILE) __KERNEL_BUILD_CMDS__
> 	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR)
>ARCH=3Darm CROSS_COMPILE=3D$(CROSS_COMPILE) modules
>
>-linux_install:
>+linux_install: __DTB_DEPEND_INSTALL__
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo     Installing the Linux Kernel
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-
>tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
>index 5093649..168d1ad 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_linux-dtbs
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_linux-dtbs
>@@ -3,7 +3,7 @@ linux-dtbs:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo     Building the Linux Kernel DTBs
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR)
>ARCH=3Darm CROSS_COMPILE=3D$(CROSS_COMPILE) dtbs
>+	$(MAKE) -j $(MAKE_JOBS) -C $(LINUXKERNEL_INSTALL_DIR)
>ARCH=3Darm CROSS_COMPILE=3D$(CROSS_COMPILE) __KERNEL_DEVICETREE__
>
> linux-dtbs_install:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-makefile_1.0.bb
>index 13d3f38..16f7662 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>@@ -33,7 +33,7 @@ SRC_URI =3D "\
>     file://Makefile_oprofile-example \
> "
>
>-PR =3D "r17"
>+PR =3D "r18"
>
> MAKEFILES_COMMON =3D "linux \
>                     matrix-gui \
>@@ -65,10 +65,12 @@ MAKEFILES_append_ti33x =3D " u-boot-spl \
>                            ${QUICK_PLAYGROUND} \
>                            wireless \
>                            ti-crypto-examples \
>+                           linux-dtbs \
> "
> MAKEFILES_append_ti43x =3D " u-boot-spl \
>                            ${QUICK_PLAYGROUND} \
>                            ti-crypto-examples \
>+                           linux-dtbs \
> "
> MAKEFILES_append_omap-a15 =3D " u-boot-spl \
>                               ${QUICK_PLAYGROUND} \
>@@ -86,6 +88,12 @@ PLATFORM_ARCH_omapl138 =3D "armv5te"
>
> KERNEL_BUILD_CMDS =3D
>"${@base_contains('KERNEL_IMAGETYPE','uImage','LOADADDR=3D${UBOOT_LO
>ADADDRESS} uImage','zImage',d)}"
>
>+KERNEL_DEVICETREE_ti33x =3D "am335x-evm.dtb am335x-evmsk.dtb
>am335x-bone.dtb am335x-boneblack.dtb"
>+KERNEL_DEVICETREE_ti43x =3D "am43x-epos-evm.dtb am437x-gp-evm.dtb"
>+KERNEL_DEVICETREE_beaglebone =3D "am335x-bone.dtb am335x-
>boneblack.dtb"
>+KERNEL_DEVICETREE_omap5-evm =3D "omap5-uevm.dtb"
>+KERNEL_DEVICETREE_dra7xx-evm =3D "dra7-evm.dtb"
>+
> # This step will stitch together the final Makefile based on the
>supported
> # make targets.
> do_install () {
>@@ -127,6 +135,19 @@ do_install () {
>
>     sed -i -e "s/__KERNEL_BUILD_CMDS__/${KERNEL_BUILD_CMDS}/"
>${D}/Makefile
>
>+    cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
>+
>+    if [ "$?" =3D=3D "0" ]
>+    then
>+        sed -i -e "s/__KERNEL_DEVICETREE__/${KERNEL_DEVICETREE}/"
>${D}/Makefile
>+        sed -i -e "s/__DTB_DEPEND__/linux-dtbs/" ${D}/Makefile
>+        sed -i -e "s/__DTB_DEPEND_INSTALL__/linux-dtbs_install/"
>${D}/Makefile
>+    else
>+        sed -i -e "s/__DTB_DEPEND__//" ${D}/Makefile
>+        sed -i -e "s/__DTB_DEPEND_INSTALL__//" ${D}/Makefile
>+    fi
>+
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

