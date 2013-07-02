Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3BFF952979
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 18:43:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62IhkxD027090
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:43:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62IhkoB025575
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:43:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 2 Jul 2013 13:43:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 3/6] arago-source-ipk:
	Enable	sourceipk for oprofile-example
Thread-Index: AQHOd0YCK9NWpY5dGE+oybu0YeAndJlRuZcQ
Date: Tue, 2 Jul 2013 18:43:45 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596304DC@DLEE11.ent.ti.com>
References: <1372785354-1920-1-git-send-email-fcooper@ti.com>
	<1372785354-1920-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1372785354-1920-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 3/6] arago-source-ipk: Enable	sourceipk for oprofile-example
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
X-List-Received-Date: Tue, 02 Jul 2013 18:43:47 -0000
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
>Subject: [meta-arago] [master & danny][PATCH 3/6] arago-source-
>ipk: Enable sourceipk for oprofile-example
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../conf/distro/arago-source-ipk.conf              |    3 +++
> 1 files changed, 3 insertions(+), 0 deletions(-)
>
>diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf
>b/meta-arago-distro/conf/distro/arago-source-ipk.conf
>index 11a66ca..63cad0d 100644
>--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
>+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
>@@ -73,6 +73,9 @@ SRCIPK_INSTALL_DIR_pn-refresh-screen =3D "example-
>applications/${PN}-${PV}"
> CREATE_SRCIPK_pn-am-sysinfo =3D "1"
> SRCIPK_INSTALL_DIR_pn-am-sysinfo =3D "example-applications/${PN}-
>${PV}"
>
>+CREATE_SRCIPK_pn-oprofile-example =3D "1"
>+SRCIPK_INSTALL_DIR_pn-oprofile-example =3D "example-
>applications/${PN}"
>+
> CREATE_SRCIPK_pn-arm-benchmarks =3D "1"
> SRCIPK_INSTALL_DIR_pn-arm-benchmarks =3D "example-
>applications/${PN}-${PV}"
>
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

