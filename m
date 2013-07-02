Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DD19A52979
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 18:45:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62IjiMk028269
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:45:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62Ijisv028393
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:45:44 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 2 Jul 2013 13:45:43 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 4/6] ti-tisdk-makefile:
	Add	oprofile-example to SDK top level Makefile
Thread-Index: AQHOd0YCIxaPuDMmZkaAg5SvOyvLI5lRuiRQ
Date: Tue, 2 Jul 2013 18:45:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159630569@DLEE11.ent.ti.com>
References: <1372785354-1920-1-git-send-email-fcooper@ti.com>
	<1372785354-1920-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1372785354-1920-4-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 4/6] ti-tisdk-makefile: Add	oprofile-example to SDK top level Makefile
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
X-List-Received-Date: Tue, 02 Jul 2013 18:45:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, July 02, 2013 12:16 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [master & danny][PATCH 4/6] ti-tisdk-
>makefile: Add oprofile-example to SDK top level Makefile
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../ti-tisdk-makefile/Makefile_oprofile-example    |   18
>++++++++++++++++++
> .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |    4 +++-
> 2 files changed, 21 insertions(+), 1 deletions(-)
> create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-makefile/Makefile_oprofile-example
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile/Makefile_oprofile-example b/meta-arago-
>distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_oprofile-example
>new file mode 100644
>index 0000000..c7a4385
>--- /dev/null
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile/Makefile_oprofile-example
>@@ -0,0 +1,18 @@
>+# oprofile-example build targets
>+oprofile-example:
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>+	@echo    Building OProfile Example
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>+	@cd example-applications; cd `find . -name "*oprofile-
>example*"`; make
>+
>+oprofile-example_clean:
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>+	@echo    Cleaning OProfile Example
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>+	@cd example-applications; cd `find . -name "*oprofile-
>example*"`; make clean
>+
>+oprofile-example_install:
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+	@echo     Installing OProfile Example - Debug version
>+	@echo =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+	@cd example-applications; cd `find . -name "*oprofile-
>example*"`; make install
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-
>tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>makefile/ti-tisdk-makefile_1.0.bb
>index 0f14341..e0aea9a 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-
>makefile_1.0.bb
>@@ -30,9 +30,10 @@ SRC_URI =3D "\
>     file://Makefile_quick-playground \
>     file://Makefile_wireless \
>     file://Makefile_omapconf \
>+    file://Makefile_oprofile-example \
> "
>
>-PR =3D "r12"
>+PR =3D "r13"
>
> MAKEFILES_COMMON =3D "linux \
>                     matrix-gui \
>@@ -41,6 +42,7 @@ MAKEFILES_COMMON =3D "linux \
>                     matrix-gui-browser \
>                     refresh-screen \
>                     qt-tstat \
>+                    oprofile-example \
> "
> MAKEFILES =3D ""
>
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

