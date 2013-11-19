Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D571D52A76
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 20:17:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJKHwDA029478
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:17:58 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJKHwgN027379
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:17:58 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 19 Nov 2013 14:17:58 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 6/7] ti-tisdk-setup: Pull in fix to sd
	card	creation script
Thread-Index: AQHO5VFanTX17qiNMEmAKCYFQ2QaVZos/jgw
Date: Tue, 19 Nov 2013 20:17:57 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159839DE0@DLEE11.ent.ti.com>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
	<1384887728-8628-6-git-send-email-fcooper@ti.com>
In-Reply-To: <1384887728-8628-6-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] ti-tisdk-setup: Pull in fix to sd card	creation script
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
X-List-Received-Date: Tue, 19 Nov 2013 20:17:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, November 19, 2013 1:02 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 6/7] ti-tisdk-setup: Pull in fix to
>sd card creation script
>
>* Pull in syntax errors that were found in create sd card script
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-
>tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-
>setup/ti-tisdk-setup.bb
>index 51ac1c3..0084005 100644
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
>-PR =3D "r16"
>+PR =3D "r17"
>
> BRANCH ?=3D "master"
>-SRCREV =3D "21706aebe3c2adda84fafe8b15a8f4989b2afec8"
>+SRCREV =3D "01f88ec0391f00860bac1648dc95fc0eec0b8b99"
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

