Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D533A529B0
	for <meta-arago@arago-project.org>;
	Thu, 24 Oct 2013 13:33:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9ODXWqg003033
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2013 08:33:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9ODXW25007439
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2013 08:33:32 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 24 Oct 2013 08:33:32 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ti-tisdk-setup: Update create sd-card
	script	for 3.12 kernel
Thread-Index: AQHO0Lklua/FOZaYwUGkVosGdtRVyJoD2b7w
Date: Thu, 24 Oct 2013 13:33:32 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597D7027@DLEE11.ent.ti.com>
References: <1382622828-31731-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1382622828-31731-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] ti-tisdk-setup: Update create sd-card script	for 3.12 kernel
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
X-List-Received-Date: Thu, 24 Oct 2013 13:33:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, October 24, 2013 8:54 AM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH] ti-tisdk-setup: Update create sd-
>card script for 3.12 kernel
>
>* Update the create sd-card script to support device tree.
>* Also to align with recent u-boots also update the sd card script
>to also
>  support zImage and move kernel files from the boot partition to
>the boot
>  directory on the rootfs.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-
>tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>setup/ti-tisdk-setup.bb
>index 9ef3da9..51ac1c3 100644
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
>-PR =3D "r15"
>+PR =3D "r16"
>
> BRANCH ?=3D "master"
>-SRCREV =3D "89067bae7d1b211e7a8c42c35a8f43e0762b258b"
>+SRCREV =3D "21706aebe3c2adda84fafe8b15a8f4989b2afec8"
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

