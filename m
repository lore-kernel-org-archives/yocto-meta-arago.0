Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id F0DC652972
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2013 14:39:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rADEd42L004712;
	Wed, 13 Nov 2013 08:39:04 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rADEd35L002198;
	Wed, 13 Nov 2013 08:39:04 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 13 Nov 2013 08:39:04 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 4/6]
	nativesdk-packagegroup-arago-qte-toolchain-host: update to support Qt4
	and Qt5
Thread-Index: AQHO32Gy0qoL0f44FEOjydkpoPSOw5ojPWsw
Date: Wed, 13 Nov 2013 14:39:03 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598157FD@DLEE11.ent.ti.com>
References: <1384231333-26952-1-git-send-email-denis@denix.org>
	<1384231333-26952-5-git-send-email-denis@denix.org>
In-Reply-To: <1384231333-26952-5-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 4/6] nativesdk-packagegroup-arago-qte-toolchain-host: update to support Qt4 and Qt5
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
X-List-Received-Date: Wed, 13 Nov 2013 14:39:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, November 11, 2013 10:42 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 4/6] nativesdk-packagegroup-arago-
>qte-toolchain-host: update to support Qt4 and Qt5
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../packagegroups/nativesdk-packagegroup-arago-qte-toolchain-
>host.bb  | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/meta-arago-extras/recipes-
>core/packagegroups/nativesdk-packagegroup-arago-qte-toolchain-
>host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-
>packagegroup-arago-qte-toolchain-host.bb
>index e17127d..bb8367f 100644
>--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-
>packagegroup-arago-qte-toolchain-host.bb
>+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-
>packagegroup-arago-qte-toolchain-host.bb
>@@ -1,6 +1,8 @@
>+inherit qt-vars
>+
> require nativesdk-packagegroup-arago-sdk-host.bb
>
> DESCRIPTION =3D "Host packages for Qt Embedded SDK"
> LICENSE =3D "MIT"
>
>-RDEPENDS_${PN} +=3D "qt4-tools-nativesdk"
>+RDEPENDS_${PN} +=3D "${QT_RDEPENDS_NATIVESDK_TOOLS}"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

