Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 20C5C529D7
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2013 12:20:29 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2LCKSA5019613
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:20:28 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2LCKSTQ032350
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2013 07:20:28 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 21 Mar 2013 07:20:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 15/17] wpa-supplicant_r5.sp4.01: Rename
	bbappend
Thread-Index: AQHOJQ++jCG8I3g0hkaqcQMpOJVGXpiwErYw
Date: Thu, 21 Mar 2013 12:20:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015948ED37@DLEE11.ent.ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
	<1363745138-10288-15-git-send-email-fcooper@ti.com>
In-Reply-To: <1363745138-10288-15-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 15/17] wpa-supplicant_r5.sp4.01: Rename bbappend
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
X-List-Received-Date: Thu, 21 Mar 2013 12:20:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Why not combine this with the rename so it doesn't break in between these c=
ommits?


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Tuesday, March 19, 2013 9:06 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 15/17] wpa-supplicant_r5.sp4.01:
> Rename bbappend
>=20
> * Rename bbappend to match recipe name change.
> ---
>  ....bbappend =3D> wpa-supplicant_r5.sp4.01.bbappend} |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-arago-distro/recipes-connectivity/wpa-
> supplicant/{wpa-supplicant_git.bbappend =3D> wpa-
> supplicant_r5.sp4.01.bbappend} (100%)
>=20
> diff --git a/meta-arago-distro/recipes-connectivity/wpa-
> supplicant/wpa-supplicant_git.bbappend b/meta-arago-
> distro/recipes-connectivity/wpa-supplicant/wpa-
> supplicant_r5.sp4.01.bbappend
> similarity index 100%
> rename from meta-arago-distro/recipes-connectivity/wpa-
> supplicant/wpa-supplicant_git.bbappend
> rename to meta-arago-distro/recipes-connectivity/wpa-
> supplicant/wpa-supplicant_r5.sp4.01.bbappend
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

