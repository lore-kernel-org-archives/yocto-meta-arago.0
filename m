Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 721FB529D0
	for <meta-arago@arago-project.org>;
	Tue,  3 Sep 2013 15:17:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83FHYP1009298;
	Tue, 3 Sep 2013 10:17:34 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83FHYh9024856;
	Tue, 3 Sep 2013 10:17:34 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 3 Sep 2013 10:17:34 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] arago-prefs: set up remaining preferred
	providers for libgles packages
Thread-Index: AQHOpsHY9/9AIoFBvUuxlWDW6g00D5m0I8ig
Date: Tue, 3 Sep 2013 15:17:33 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597011D6@DLEE11.ent.ti.com>
References: <1378005447-32278-1-git-send-email-denis@denix.org>
In-Reply-To: <1378005447-32278-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] arago-prefs: set up remaining preferred providers for libgles packages
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
X-List-Received-Date: Tue, 03 Sep 2013 15:17:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Saturday, August 31, 2013 10:17 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] arago-prefs: set up remaining
>preferred providers for libgles packages
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/conf/distro/include/arago-prefs.inc | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>index 28b4caf..70f02b9 100644
>--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>@@ -16,7 +16,11 @@ PREFERRED_VERSION_omap3-sgx-modules =3D
>"4.09.00.01"
> PREFERRED_VERSION_libgles-omap3 =3D "4.09.00.01"
> PREFERRED_PROVIDER_omap3-sgx-modules =3D "omap3-sgx-modules"
> PREFERRED_PROVIDER_libgles-omap3 =3D "libgles-omap3"
>+PREFERRED_PROVIDER_libgles-omap3-dev =3D "libgles-omap3-dev"
>+PREFERRED_PROVIDER_libgles-omap3-dbg =3D "libgles-omap3-dbg"
> PREFERRED_PROVIDER_virtual/egl =3D "libgles-omap3"
>+PREFERRED_PROVIDER_virtual/libgles1 =3D "libgles-omap3"
>+PREFERRED_PROVIDER_virtual/libgles2 =3D "libgles-omap3"
>
> # Use latest TI staging kernel and u-boot trees
> PREFERRED_VERSION_linux-libc-headers_am335x-evm =3D "3.8"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

