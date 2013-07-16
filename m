Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DAF4A52A07
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 12:59:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6GCxj68015616
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 07:59:45 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6GCxjPX006275
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 07:59:45 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 16 Jul 2013 07:59:44 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 1/5] ti-tisdk-setup: Add
	Beaglebone Black support
Thread-Index: AQHOfnIC+VC9b52QA0uORiWOtF7xCZlnS7LQ
Date: Tue, 16 Jul 2013 12:59:44 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159657702@DLEE11.ent.ti.com>
References: <1373574210-4398-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1373574210-4398-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 1/5] ti-tisdk-setup: Add	Beaglebone Black support
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
X-List-Received-Date: Tue, 16 Jul 2013 12:59:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, July 11, 2013 3:23 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [master & danny][PATCH 1/5] ti-tisdk-setup:
>Add Beaglebone Black support
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-
>tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>setup/ti-tisdk-setup.bb
>index f5b9060..280e58c 100644
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
>-PR =3D "r13"
>+PR =3D "r14"
>
> BRANCH ?=3D "master"
>-SRCREV =3D "49833f742ec151108e7f8a75eab99d5e4433f7eb"
>+SRCREV =3D "5d2d712607d5bba1d15f199bb7b185d963a23d1e"
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

