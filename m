Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 68B1052A52
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2014 14:28:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s16ESDuf021142
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:28:13 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s16ESD2S001676
	for <meta-arago@arago-project.org>; Thu, 6 Feb 2014 08:28:13 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 6 Feb 2014 08:28:13 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/5] ti-tisdk-makefile: Update U-boot
	makefile
Thread-Index: AQHPI0SRMSr1rdPgFk2/9pzqE2V365qoSJAQ
Date: Thu, 6 Feb 2014 14:28:12 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159950281@DLEE11.ent.ti.com>
References: <1391700887-26166-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1391700887-26166-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] ti-tisdk-makefile: Update U-boot makefile
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 14:28:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, February 06, 2014 10:35 AM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 1/5] ti-tisdk-makefile: Update U-boot
>makefile
>
>* Add echo statements to make U-boot make,clean,install steps
>stand out.
>* Remove installing of U-boot files since installing them into the
>file system
>  servers no purpose.

I would argue that this doesn't hurt anything and having them on the file s=
ystem allows for people to update the bootloader from Linux itself.

>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../ti-tisdk-makefile/Makefile_u-boot-spl          |   14
>++++++++++----
> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
> 2 files changed, 11 insertions(+), 5 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_u-boot-spl b/meta-arago-distro/recipes-
>tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
>index 9ce6429..d2de7a9 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_u-boot-spl
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_u-boot-spl
>@@ -4,14 +4,20 @@ u-boot-spl_clean: u-boot_clean
> u-boot-spl_install: u-boot_install
>
> u-boot:
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+	@echo    Building U-boot
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-
>boot-* CROSS_COMPILE=3D$(CROSS_COMPILE) $(UBOOT_MACHINE)
> 	$(MAKE) -j $(MAKE_JOBS) -C $(TI_SDK_PATH)/board-support/u-
>boot-* CROSS_COMPILE=3D$(CROSS_COMPILE)
>
> u-boot_clean:
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+	@echo    Cleaining U-boot
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
>CROSS_COMPILE=3D$(CROSS_COMPILE) clean
>
> u-boot_install:
>-	install -d $(DESTDIR)/boot
>-	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.img
>$(DESTDIR)/boot
>-	install $(TI_SDK_PATH)/board-support/u-boot-*/MLO
>$(DESTDIR)/boot
>-	install $(TI_SDK_PATH)/board-support/u-boot-*/u-boot.map
>$(DESTDIR)/boot
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+	@echo    Installing U-boot
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+	@echo "Nothing to do"
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-makefile_1.0.bb
>index 30c2901..374fa81 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>@@ -34,7 +34,7 @@ SRC_URI =3D "\
>     file://Makefile_dual-camera-demo \
> "
>
>-PR =3D "r25"
>+PR =3D "r26"
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

