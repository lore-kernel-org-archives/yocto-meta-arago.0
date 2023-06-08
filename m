Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20266C7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 21:47:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6530.1686260868951187731
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 14:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 30CA340C62;
	Thu,  8 Jun 2023 21:47:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmW73aeBRH8F; Thu,  8 Jun 2023 21:47:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C675040AE9;
	Thu,  8 Jun 2023 21:47:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9C9D31639CE; Thu,  8 Jun 2023 17:46:52 -0400 (EDT)
Date: Thu, 8 Jun 2023 17:46:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: meta-arago@lists.yoctoproject.org,
	"Bajjuri, Praneeth" <praneeth@ti.com>, reatmon@ti.com,
	khasim@ti.com, c-shilwant@ti.com, s-adivi@ti.com, g-gupta@ti.com
Subject: Re: [EXTERNAL] Re: [meta-arago] [kirkstone][PATCH v2]
 meta-arago-distro: Add recipe for jailhouse image and update kernel and
 u-boot repo for jailhouse build.
Message-ID: <20230608214652.GF9226@denix.org>
References: <20230606140237.178008-1-p-bhagat@ti.com>
 <20230606223027.GU9226@denix.org>
 <46a21a1e-1bb5-5710-98a2-cb438877a998@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <46a21a1e-1bb5-5710-98a2-cb438877a998@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 21:47:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14562

On Wed, Jun 07, 2023 at 02:41:10PM +0530, Paresh Bhagat wrote:
> Hi Denys,
>=20
> On 07/06/23 04:00, Denys Dmytriyenko wrote:
> >On Tue, Jun 06, 2023 at 07:32:37PM +0530, Paresh Bhagat via lists.yoct=
oproject.org wrote:
> >>Add a recipe to build and package jailhouse image for am62xx-evm. new=
 image will
> >>be named as tisdk-jailhouse-image. jailhouse recipe will also package=
 overlay
> >>used for jailhouse.
> >>
> >>Add functionality to change kernel and u-boot source via MACHINE_FEAT=
URES for
> >>jailhouse. so if MACHINE_FEATURES:append =3D " jailhouse" is added to=
 local.conf
> >>different recipe for kernel (linux-ti-extras) and u-boot (u-boot-ti-e=
xtras) will
> >>be used.
> >>
> >>So for jailhouse build for am62xx-evm user will have to add
> >>MACHINE_FEATURES:append =3D " jailhouse" to local.conf and then start=
 a jailhouse
> >>build with MACHINE=3Dam62xx-evm bitbake -k tisdk-jailhouse-image.
> >>
> >>Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> >>---
> >>  .../conf/distro/include/arago-prefs.inc            |  7 +++++++
> >>  .../recipes-core/images/tisdk-jailhouse-image.bb   | 14 +++++++++++=
+++
> >>  2 files changed, 21 insertions(+)
> >>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jail=
house-image.bb
> >>
> >>diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/=
meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>index 34c3c539..40269b56 100644
> >>--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>@@ -19,3 +19,10 @@ PREFERRED_PROVIDER_wpa-supplicant =3D "wpa-supplic=
ant"
> >>  #PREFERRED_PROVIDER_wpa-supplicant:ti33x =3D "wpa-supplicant-wl18xx=
"
> >>  #PREFERRED_PROVIDER_wpa-supplicant:ti43x =3D "wpa-supplicant-wl18xx=
"
> >>  #PREFERRED_PROVIDER_wpa-supplicant:omap-a15 =3D "wpa-supplicant-wl1=
8xx"
> >>+
> >>+# change kernel when jailhouse image is build
> >>+PREFERRED_PROVIDER_virtual/kernel =3D "${@bb.utils.contains('MACHINE=
_FEATURES','jailhouse','linux-ti-extras','linux-ti-staging',d)}"
> >>+
> >>+#Change uboot source when jailhouse image is build
> >>+PREFERRED_PROVIDER_virtual/bootloader =3D "${@bb.utils.contains('MAC=
HINE_FEATURES','jailhouse','u-boot-ti-extras','u-boot-ti-staging',d)}"
> >>+PREFERRED_PROVIDER_u-boot =3D "${@bb.utils.contains('MACHINE_FEATURE=
S','jailhouse','u-boot-ti-extras','u-boot-ti-staging',d)}"
> >This would conflict with all the other places PREFERRED_PROVIDERs are =
being
> >set. In other words, if "jailhouse" in MACHINE_FEATURES is not set, yo=
u are
> >forcing everyone into "ti-staging" trees, which is not always the case=
!
> >What about "bb.org" trees, or "next", or "mainline" or any downstream =
ones?
>=20
> based on your review, i tried changing PREFERRED_PROVIDERs in
> tisdk-jailhouse-image.bb using:
>=20
> if 'jailhouse' in d.getVar('MACHINE_FEATURES',True).split():
> =A0=A0=A0 d.setVar('PREFERRED_PROVIDER_virtual/kernel', 'linux-ti-extra=
s')
> =A0=A0=A0 d.setVar('PREFERRED_PROVIDER_virtual/bootloader', 'u-boot-ti-=
extras')
> =A0=A0=A0 d.setVar('PREFERRED_PROVIDER_u-boot', 'u-boot-ti-extras')
>=20
> i added above code to do_configure:append() . also tried adding
> above code inside a custom function "do_change_provider()" and used
> "addtask do_change_provider" inside tisdk-jailhouse-image recipe.
> but either the build failed or the preferred_providers didn't
> change. can you help with this or suggest any alternate method we
> can use? We want to change preferred_providers if MACHINE_FEATURES
> has jailhouse and not have a conflict with other places as you
> mentioned.

As PREFERRED_PROVIDER has a global scope, changing it in a recipe will ha=
ve=20
only recipe-local scope and won't affect its value anywhere else. It must=
 be=20
set during initial configuration step in one of the .conf files or .inc f=
iles=20
that are included form .conf - local.conf, <machine>.conf, <distro>.conf,=
 etc.

Specifically to your change - yes, arago-prefs.inc is such a file that ge=
ts=20
included from arago.conf, but you shouldn't try to handle "else" part of =
the=20
conditional to avoid overwriting unrelated cases. Maybe even check that t=
he=20
initial value points to "ti-staging" before modifying it.

And moreover, would it be easier to just handle this case and switch BRAN=
CH or=20
SRC_URI inside the existing "ti-staging" recipes, as discussed on meta-ti=
 list?

--=20
Denys

