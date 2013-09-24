Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9CE1F529B0
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 14:58:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OEwGhZ018960;
	Tue, 24 Sep 2013 09:58:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OEwGev010522;
	Tue, 24 Sep 2013 09:58:16 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 09:58:16 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] gadget-init: replace RDEPENDS with
	RRECOMMENDS for recommended modules
Thread-Index: AQHOuOlwm5+jomdlf0ChcqxxTnhFOZnU+yBg
Date: Tue, 24 Sep 2013 14:58:15 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159747D2F@DLEE11.ent.ti.com>
References: <1380001570-25248-1-git-send-email-denis@denix.org>
In-Reply-To: <1380001570-25248-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] gadget-init: replace RDEPENDS with RRECOMMENDS for recommended modules
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
X-List-Received-Date: Tue, 24 Sep 2013 14:58:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, September 24, 2013 12:46 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/2] gadget-init: replace RDEPENDS
>with RRECOMMENDS for recommended modules
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb | 4
>++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-
>init.bb b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-
>init.bb
>index 34885c7..477f16a 100644
>--- a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
>+++ b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
>@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
>"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3
> COMPATIBLE_MACHINE =3D "ti33x"
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
>-PR =3D "r1"
>+PR =3D "r2"
>
> SRC_URI =3D "file://init"
>
>@@ -21,4 +21,4 @@ do_install() {
> }
>
> FILES_${PN} =3D "${sysconfdir} ${bindir}"
>-RDEPENDS_${PN} +=3D "kernel-module-g-ether kernel-module-g-mass-
>storage"
>+RRECOMMENDS_${PN} +=3D "kernel-module-g-ether kernel-module-g-mass-
>storage"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

