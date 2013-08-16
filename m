Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C47B8529DA
	for <meta-arago@arago-project.org>;
	Fri, 16 Aug 2013 13:50:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7GDoOqY001172
	for <meta-arago@arago-project.org>; Fri, 16 Aug 2013 08:50:24 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7GDoOG8000466
	for <meta-arago@arago-project.org>; Fri, 16 Aug 2013 08:50:24 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 16 Aug 2013 08:50:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCHv3] KMSCube: Add Demo 3D graphics application
Thread-Index: AQHOfJKQeygmuE3UIES7RKloopKrqZmX5lLQgAAveKA=
Date: Fri, 16 Aug 2013 13:50:23 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596C4484@DLEE11.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D5444396@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D5444396@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv3] KMSCube: Add Demo 3D graphics application
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
X-List-Received-Date: Fri, 16 Aug 2013 13:50:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Friday, August 16, 2013 6:00 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv3] KMSCube: Add Demo 3D graphics
>application
>
>
>* Showcases 3D graphics on SGX using kms and gbm
>
>v2:
>
>* Added DEPENDS for libdrm, libgbm and omap-sgx userspace
>* INSANE_SKIP to avoid package dependencies
>
>v3:
>
>* Remove inc file as we have a version only .bb file. This
>  fixes the review comment received with v1.
>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |   18
>++++++++++++++++++
> 1 files changed, 18 insertions(+), 0 deletions(-)  create mode
>100644 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
>
>diff --git a/meta-arago-extras/recipes-
>graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-
>graphics/kmscube/kmscube_1.0.0.bb
>new file mode 100644
>index 0000000..e18e398
>--- /dev/null
>+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
>@@ -0,0 +1,18 @@
>+SUMMARY =3D "Demo application to showcase 3D graphics on SGX using
>kms and gbm"
>+HOMEPAGE =3D "http://git.ti.com"
>+LICENSE =3D "BSD"
>+LIC_FILES_CHKSUM =3D
>"file://kmscube.c;beginline=3D1;endline=3D23;md5=3D8b309d4ee67b7315ff738
>1270dd631fb"
>+
>+DEPENDS =3D "libdrm libgbm-glsdk omap5-sgx-ddk-um-linux"

Have these dependencies such as omap5-sgx and libgbm-glsdk been submitted a=
nd accepted?

>+
>+COMPATIBLE_MACHINE =3D "omap-a15"
>+
>+inherit autotools pkgconfig
>+
>+SRC_URI =3D "git://git.ti.com/glsdk/kmscube.git;protocol=3Dgit"
>+
>+S =3D "${WORKDIR}/git"
>+
>+SRCREV =3D "5a03757c0aa52eff44fb0d8ac0529f8cc18b1da0"
>+
>+INSANE_SKIP_kmscube +=3D "dev-deps"
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

