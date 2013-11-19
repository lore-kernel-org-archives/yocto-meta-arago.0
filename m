Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 98E7852A76
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 20:17:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJKHkLb006725
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:17:46 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJKHkFq022206
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:17:46 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 19 Nov 2013 14:17:46 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 5/7] ti-tisdk-makefile: Fix linux_install
Thread-Index: AQHO5VFZZXcf6zDE0EWdh4FfEPrz95os/iig
Date: Tue, 19 Nov 2013 20:17:44 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159839DCC@DLEE11.ent.ti.com>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
	<1384887728-8628-5-git-send-email-fcooper@ti.com>
In-Reply-To: <1384887728-8628-5-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] ti-tisdk-makefile: Fix linux_install
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
X-List-Received-Date: Tue, 19 Nov 2013 20:17:46 -0000
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
>Subject: [meta-arago] [PATCH 5/7] ti-tisdk-makefile: Fix
>linux_install
>
>* Update linux_install to support zImage
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../ti-tisdk-makefile/Makefile_linux               |    2 +-
> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_linux b/meta-arago-distro/recipes-
>tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux
>index f4dc75f..6220a3c 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_linux
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_linux
>@@ -12,7 +12,7 @@ linux_install: __DTB_DEPEND_INSTALL__
> 	@echo     Installing the Linux Kernel
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	install -d $(DESTDIR)/boot
>-	install $(LINUXKERNEL_INSTALL_DIR)/arch/arm/boot/uImage
>$(DESTDIR)/boot
>+	install
>$(LINUXKERNEL_INSTALL_DIR)/arch/arm/boot/__KERNEL_BUILD_CMDS__
>$(DESTDIR)/boot
> 	install $(LINUXKERNEL_INSTALL_DIR)/vmlinux $(DESTDIR)/boot
> 	install $(LINUXKERNEL_INSTALL_DIR)/System.map
>$(DESTDIR)/boot
> 	$(MAKE) -C $(LINUXKERNEL_INSTALL_DIR) ARCH=3Darm
>CROSS_COMPILE=3D$(CROSS_COMPILE) INSTALL_MOD_PATH=3D$(DESTDIR)
>modules_install
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-makefile_1.0.bb
>index 16f7662..7019db5 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>@@ -33,7 +33,7 @@ SRC_URI =3D "\
>     file://Makefile_oprofile-example \
> "
>
>-PR =3D "r18"
>+PR =3D "r19"
>
> MAKEFILES_COMMON =3D "linux \
>                     matrix-gui \
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

