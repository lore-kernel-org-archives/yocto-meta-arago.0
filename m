Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6C6DC529A6
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 14:31:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54EVSlj016063
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:31:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54EVSY0003846
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:31:28 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 4 Jun 2014 09:31:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 04/11] ti-tisdk-makefile: Fix u-boot cleaning
Thread-Index: AQHPe20yJbAST6cyQ0O7AwbggK6/HJthDHSg
Date: Wed, 4 Jun 2014 14:31:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D08C182@DLEE11.ent.ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1401388695-30526-4-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 04/11] ti-tisdk-makefile: Fix u-boot cleaning
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
X-List-Received-Date: Wed, 04 Jun 2014 14:31:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, May 29, 2014 1:38 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 04/11] ti-tisdk-makefile: Fix u-boot
>cleaning
>
>* The proper command to clean u-boot binaries is distclean.
>* Update u-boot_clean to reflect this change.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../ti-tisdk-makefile/Makefile_u-boot-spl          |    2 +-
> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_u-boot-spl b/meta-arago-distro/recipes-
>tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_u-boot-spl
>index d2de7a9..65f6288 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_u-boot-spl
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_u-boot-spl
>@@ -14,7 +14,7 @@ u-boot_clean:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 	@echo    Cleaining U-boot
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>-	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
>CROSS_COMPILE=3D$(CROSS_COMPILE) clean
>+	$(MAKE) -C $(TI_SDK_PATH)/board-support/u-boot-*
>CROSS_COMPILE=3D$(CROSS_COMPILE) distclean
>
> u-boot_install:
> 	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-makefile_1.0.bb
>index 4d8c486..770c2ae 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>@@ -35,7 +35,7 @@ SRC_URI =3D "\
>     file://Makefile_cryptodev \
> "
>
>-PR =3D "r32"
>+PR =3D "r33"
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

