Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1251852A1E
	for <meta-arago@arago-project.org>;
	Fri, 15 Aug 2014 12:12:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7FCC4UD003742;
	Fri, 15 Aug 2014 07:12:04 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7FCC349019191;
	Fri, 15 Aug 2014 07:12:03 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Fri, 15 Aug 2014 07:12:03 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] omapconf: update to 1.70 version,	add
	am335x support
Thread-Index: AQHPuBSAAKpKHxH+UkWevNJQs1H/fJvRlAqg
Date: Fri, 15 Aug 2014 12:12:02 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D1D58F2@DLEE11.ent.ti.com>
References: <1408057607-15900-1-git-send-email-denis@denix.org>
In-Reply-To: <1408057607-15900-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] omapconf: update to 1.70 version, add am335x support
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
X-List-Received-Date: Fri, 15 Aug 2014 12:12:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ack


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Thursday, August 14, 2014 6:07 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/2] omapconf: update to 1.70
>version, add am335x support
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb | 6
>+++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/meta-arago-extras/recipes-
>devtools/omapconf/omapconf_git.bb b/meta-arago-extras/recipes-
>devtools/omapconf/omapconf_git.bb
>index 2170d9e..590b3a5 100644
>--- a/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
>+++ b/meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb
>@@ -4,13 +4,13 @@ HOMEPAGE =3D
>"https://github.com/omapconf/omapconf"
> LICENSE =3D "GPLv2 BSD"
> LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D205c83c4e2242a765acb923fc766e914"
>
>-PV =3D "1.68"
>+PV =3D "1.70"
> PR =3D "r0"
>
>-COMPATIBLE_MACHINE =3D "omap-a15|omap4"
>+COMPATIBLE_MACHINE =3D "ti33x|omap-a15|omap4"
>
> BRANCH ?=3D "master"
>-SRCREV =3D "51fa0acb6ae24a9f14b11bc4b56c4f764b017f3f"
>+SRCREV =3D "f24676c8283b94216a8cb1d398bdb00ec1324946"
>
> SRC_URI =3D
>"git://github.com/omapconf/omapconf.git;protocol=3Dgit;branch=3D${BRAN
>CH}"
>
>--
>2.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

