Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E021052972
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2013 14:40:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rADEe7QX019530;
	Wed, 13 Nov 2013 08:40:07 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rADEe7MF004083;
	Wed, 13 Nov 2013 08:40:07 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 13 Nov 2013 08:40:07 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 5/6]
	packagegroup-arago-qt5-toolchain-target: add Qt5-specific version
Thread-Index: AQHO32GuYp+Bj1LcTEK+DYtzzpiqhpojPaOw
Date: Wed, 13 Nov 2013 14:40:06 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159815878@DLEE11.ent.ti.com>
References: <1384231333-26952-1-git-send-email-denis@denix.org>
	<1384231333-26952-6-git-send-email-denis@denix.org>
In-Reply-To: <1384231333-26952-6-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] packagegroup-arago-qt5-toolchain-target: add Qt5-specific version
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
X-List-Received-Date: Wed, 13 Nov 2013 14:40:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

But no need to start for r1 for PR.

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, November 11, 2013 10:42 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 5/6] packagegroup-arago-qt5-
>toolchain-target: add Qt5-specific version
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../packagegroup-arago-qt5-toolchain-target.bb     | 33
>++++++++++++++++++++++
> 1 file changed, 33 insertions(+)
> create mode 100644 meta-arago-extras/recipes-
>core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
>
>diff --git a/meta-arago-extras/recipes-
>core/packagegroups/packagegroup-arago-qt5-toolchain-target.bb
>b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-
>qt5-toolchain-target.bb
>new file mode 100644
>index 0000000..7e0d12c
>--- /dev/null
>+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-
>arago-qt5-toolchain-target.bb
>@@ -0,0 +1,33 @@
>+DESCRIPTION =3D "Target packages for Qt5 SDK"
>+LICENSE =3D "MIT"
>+
>+PR =3D "r1"
>+
>+inherit packagegroup
>+
>+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>+
>+RDEPENDS_${PN} +=3D " \
>+        packagegroup-arago-standalone-sdk-target \
>+        libsqlite3-dev \
>+        qtbase-mkspecs \
>+        qtdeclarative-mkspecs \
>+        qtscript-mkspecs \
>+        qtwebkit-mkspecs \
>+        qt3d-mkspecs \
>+        qtlocation-mkspecs \
>+        qtsensors-mkspecs \
>+        qtsvg-mkspecs \
>+        qtjsbackend-mkspecs \
>+        qtxmlpatterns-mkspecs \
>+        qtbase-dev \
>+        qtdeclarative-dev \
>+        qtscript-dev \
>+        qtwebkit-dev \
>+        qt3d-dev \
>+        qtlocation-dev \
>+        qtsensors-dev \
>+        qtsvg-dev \
>+        qtjsbackend-dev \
>+        qtxmlpatterns-dev \
>+"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

