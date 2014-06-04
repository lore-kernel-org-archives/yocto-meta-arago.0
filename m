Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 047ED529A6
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 14:30:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54EUCIE003241
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:30:12 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54EUC78002102
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:30:12 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 4 Jun 2014 09:30:12 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 01/11] ti-tisdk-setup: Use latest commit
	for	create-sdcard.sh
Thread-Index: AQHPe20uURuBdq2lMEO71eFgcfQrj5thC7Ug
Date: Wed, 4 Jun 2014 14:30:12 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D08C0E9@DLEE11.ent.ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1401388695-30526-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 01/11] ti-tisdk-setup: Use latest commit for	create-sdcard.sh
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
X-List-Received-Date: Wed, 04 Jun 2014 14:30:15 -0000
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
>Subject: [meta-arago] [PATCH 01/11] ti-tisdk-setup: Use latest
>commit for create-sdcard.sh
>
>* The latest commit adds support for built sd card readers
>connected to native
>  Linux machines.
>* Previously only sd cards connected to usb sd card reader were
>supported.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-
>tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>setup/ti-tisdk-setup.bb
>index af10101..3a65909 100644
>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-
>setup.bb
>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-
>setup.bb
>@@ -2,10 +2,10 @@ DESCRIPTION =3D "Package containing scripts to
>setup the development host and targ
> LICENSE =3D "BSD"
> LIC_FILES_CHKSUM =3D
>"file://setup.sh;beginline=3D3;endline=3D31;md5=3Dfc4b04a33df6d892c9f4d4
>a9d92b945e"
>
>-PR =3D "r18"
>+PR =3D "r19"
>
> BRANCH ?=3D "master"
>-SRCREV =3D "3e3e750153147f789dee5d59f45abcd14d001c64"
>+SRCREV =3D "6aa269296c4fdede74b067ee961cb20a897d21df"
> SRC_URI =3D "git://arago-project.org/git/projects/tisdk-setup-
>scripts.git;protocol=3Dgit;branch=3D${BRANCH}"
>
> S =3D "${WORKDIR}/git/"
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

