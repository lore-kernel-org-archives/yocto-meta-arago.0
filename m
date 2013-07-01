Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 90DA2529F7
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 15:54:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61FsO5V013031
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:54:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61FsOSY021811
	for <meta-arago@arago-project.org>; Mon, 1 Jul 2013 10:54:24 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 1 Jul 2013 10:54:24 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Mon, 1 Jul 2013 10:54:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] KMSCube: Add Demo 3D graphics application
Thread-Index: AQHOdnH/5TCIGRTxr0y2WnJR/2gfMJlP+Yfw
Date: Mon, 1 Jul 2013 15:54:23 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015962C011@DLEE11.ent.ti.com>
References: <20130701154513.GA1540@ti.com>
In-Reply-To: <20130701154513.GA1540@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] KMSCube: Add Demo 3D graphics application
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
X-List-Received-Date: Mon, 01 Jul 2013 15:54:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Monday, July 01, 2013 10:45 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] KMSCube: Add Demo 3D graphics
>application
>
>* Showcases 3D graphics on SGX using kms and gbm
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>---
> .../recipes-graphics/kmscube/kmscube.inc           |    8
>++++++++
> .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |    7 +++++++
> 2 files changed, 15 insertions(+), 0 deletions(-)
> create mode 100644 meta-arago-extras/recipes-
>graphics/kmscube/kmscube.inc
> create mode 100644 meta-arago-extras/recipes-
>graphics/kmscube/kmscube_1.0.0.bb
>
>diff --git a/meta-arago-extras/recipes-
>graphics/kmscube/kmscube.inc b/meta-arago-extras/recipes-
>graphics/kmscube/kmscube.inc
>new file mode 100644
>index 0000000..10a5b16
>--- /dev/null
>+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube.inc
>@@ -0,0 +1,8 @@
>+SUMMARY =3D "Demo application to showcase 3D graphics on SGX using
>kms and gbm"
>+HOMEPAGE =3D "http://git.ti.com"
>+LICENSE =3D "BSD"
>+LIC_FILES_CHKSUM =3D
>"file://kmscube.c;beginline=3D1;endline=3D23;md5=3D8b309d4ee67b7315ff738
>1270dd631fb"
>+
>+COMPATIBLE_MACHINE =3D "omap-a15"
>+
>+inherit autotools pkgconfig
>diff --git a/meta-arago-extras/recipes-
>graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-
>graphics/kmscube/kmscube_1.0.0.bb
>new file mode 100644
>index 0000000..af1c50b
>--- /dev/null
>+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
>@@ -0,0 +1,7 @@
>+require kmscube.inc
>+
>+SRC_URI =3D "git://git.ti.com/glsdk/kmscube.git;protocol=3Dgit"
>+
>+S =3D "${WORKDIR}/git"
>+
>+SRCREV =3D "5a03757c0aa52eff44fb0d8ac0529f8cc18b1da0"
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

