Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E2CD0529A6
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 14:38:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54EcYdo027634
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:38:34 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54EcYY6013560
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:38:34 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 4 Jun 2014 09:38:34 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 07/11] arago-source-ipk: Create source ipk
	for	image-gallery app
Thread-Index: AQHPe2021lJLP4e+Sk2KPltJEo9KSJthDnKQ
Date: Wed, 4 Jun 2014 14:38:33 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D08C263@DLEE11.ent.ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-7-git-send-email-fcooper@ti.com>
In-Reply-To: <1401388695-30526-7-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 07/11] arago-source-ipk: Create source ipk for	image-gallery app
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
X-List-Received-Date: Wed, 04 Jun 2014 14:38:36 -0000
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
>Subject: [meta-arago] [PATCH 07/11] arago-source-ipk: Create
>source ipk for image-gallery app
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../conf/distro/arago-source-ipk.conf              |    3 +++
> 1 files changed, 3 insertions(+), 0 deletions(-)
>
>diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf
>b/meta-arago-distro/conf/distro/arago-source-ipk.conf
>index 9b5c57e..a2777e9 100644
>--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
>+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
>@@ -67,6 +67,9 @@ SRCIPK_INSTALL_DIR_pn-qt-tstat =3D "example-
>applications/${PN}-${PV}"
> CREATE_SRCIPK_pn-dual-camera-demo =3D "1"
> SRCIPK_INSTALL_DIR_pn-dual-camera-demo =3D "example-
>applications/${PN}-${PV}"
>
>+CREATE_SRCIPK_pn-image-gallery =3D "1"
>+SRCIPK_INSTALL_DIR_pn-image-gallery =3D "example-
>applications/${PN}"
>+
> CREATE_SRCIPK_pn-matrix-gui-browser =3D "1"
> SRCIPK_INSTALL_DIR_pn-matrix-gui-browser =3D "example-
>applications/${PN}-${PV}"
>
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

