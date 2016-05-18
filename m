Return-Path: <anandb@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E441752004
	for <meta-arago@arago-project.org>;
	Wed, 18 May 2016 16:19:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4IGJAl5014653;
	Wed, 18 May 2016 11:19:10 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4IGJ94l027992;
	Wed, 18 May 2016 11:19:10 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4IGJ6ut010446;
	Wed, 18 May 2016 21:49:07 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0294.000; Wed, 18 May 2016 21:49:06 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [RFC][PATCH 2/2] weston-init: disable systemd
	service to fall back to old initscript
Thread-Index: AQHRr/kxfQ0P7DNtrE+t2Tcs4ZQGlJ++TB+ggAA0JACAAGDCXw==
Date: Wed, 18 May 2016 16:19:05 +0000
Message-ID: <05CF4794C98B244ABDC620C1090376227329A1B3@DBDE04.ent.ti.com>
References: <1463461288-32423-1-git-send-email-denis@denix.org>
	<1463461288-32423-2-git-send-email-denis@denix.org>
	<05CF4794C98B244ABDC620C10903762273299878@DBDE04.ent.ti.com>,
	<20160518155905.GZ16188@edge>
In-Reply-To: <20160518155905.GZ16188@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.56]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC][PATCH 2/2] weston-init: disable systemd service to fall back to old initscript
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
X-List-Received-Date: Wed, 18 May 2016 16:19:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On the target filesystem, I see that weston.service is installed to /lib/sy=
stemd/system. If you delete ${systemd_system_unitdir}, will those files als=
o be removed?=0A=
=0A=
Regards,=0A=
Anand=0A=
________________________________________=0A=
From: Dmytriyenko, Denys=0A=
Sent: Wednesday, May 18, 2016 9:29 PM=0A=
To: Balagopalakrishnan, Anand=0A=
Cc: Denys Dmytriyenko; meta-arago@arago-project.org=0A=
Subject: Re: [meta-arago] [RFC][PATCH 2/2] weston-init: disable systemd ser=
vice to fall back to old initscript=0A=
=0A=
On Wed, May 18, 2016 at 07:23:59AM +0000, Balagopalakrishnan, Anand wrote:=
=0A=
> Instead of the following:=0A=
> > +    rm -rf ${D}${systemd_system_unitdir}=0A=
>=0A=
> should you have this line:=0A=
> rm -f ${D}${systemd_system_unitdir}/weston.service=0A=
=0A=
Why?=0A=
=0A=
=0A=
> -----Original Message-----=0A=
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@ara=
go-project.org] On Behalf Of Denys Dmytriyenko=0A=
> Sent: Tuesday, May 17, 2016 10:31 AM=0A=
> To: meta-arago@arago-project.org=0A=
> Subject: [meta-arago] [RFC][PATCH 2/2] weston-init: disable systemd servi=
ce to fall back to old initscript=0A=
>=0A=
> From: Denys Dmytriyenko <denys@ti.com>=0A=
>=0A=
> Touchscreen calibration and other customizations are required from initsc=
ript=0A=
>=0A=
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>=0A=
> ---=0A=
>  meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend  | 5 +++=
+-  meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston | 2 +-=
=0A=
>  2 files changed, 5 insertions(+), 2 deletions(-)=0A=
>=0A=
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbapp=
end b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend=0A=
> index 78a839f..041e5ab 100644=0A=
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend=0A=
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend=0A=
> @@ -1,4 +1,4 @@=0A=
> -PR_append =3D ".arago6"=0A=
> +PR_append =3D ".arago7"=0A=
>=0A=
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"=0A=
>=0A=
> @@ -9,4 +9,7 @@ SRC_URI_append =3D " \=0A=
>  do_install_append() {=0A=
>      install -d ${D}${bindir}=0A=
>      install -m 755 ${WORKDIR}/runWeston ${D}${bindir}=0A=
> +    rm -rf ${D}${systemd_system_unitdir}=0A=
>  }=0A=
> +=0A=
> +SYSTEMD_SERVICE_${PN} =3D ""=0A=
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWe=
ston b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston=0A=
> index 6ef574a..aed5d5f 100644=0A=
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston=0A=
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston=0A=
> @@ -1,4 +1,4 @@=0A=
> -#!/bin/bash=0A=
> +#!/bin/sh=0A=
>=0A=
>  clear=0A=
>  cat << EOF=0A=
> --=0A=
> 2.2.0=0A=
>=0A=
> _______________________________________________=0A=
> meta-arago mailing list=0A=
> meta-arago@arago-project.org=0A=
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago=0A=
> _______________________________________________=0A=
> meta-arago mailing list=0A=
> meta-arago@arago-project.org=0A=
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago=0A=

