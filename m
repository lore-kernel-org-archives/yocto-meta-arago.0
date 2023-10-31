Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC1BC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 16:21:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3036.1698769285306497069
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 09:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6BD7740C8F;
	Tue, 31 Oct 2023 16:21:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbmbmU7i6Hq2; Tue, 31 Oct 2023 16:21:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E648640C24;
	Tue, 31 Oct 2023 16:21:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A797B163D30; Tue, 31 Oct 2023 12:21:14 -0400 (EDT)
Date: Tue, 31 Oct 2023 12:21:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Cormier <jcormier@criticallink.com>
Cc: s-adivi@ti.com, Chirag Shilwant <c-shilwant@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org, Paresh Bhagat <p-bhagat@ti.com>,
	Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk: Add
 new config for AM33x, AM43x
Message-ID: <20231031162114.GG2408@denix.org>
References: <20231031090703.2510347-1-c-shilwant@ti.com>
 <20231031091311.vqev25qgaqt443ut@SHIELD01>
 <CADL8D3a5pGUyYqagHk=wK32g3ujYhQca9r7KJerbtMAH83vRyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADL8D3a5pGUyYqagHk=wK32g3ujYhQca9r7KJerbtMAH83vRyQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 31 Oct 2023 16:21:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14982

AM33x, AM43x (and AM57x) are ARMv7-based TI platforms/families and are no=
w=20
considered "legacy" - those are in maintenance mode, no new development.=20
That has been the case for at least couple years now...

All current active platforms are K3-based (ARMv8/Aarch64) with J7, AM6x, =
etc.
families of devices.

And my understanding is that this config is specific to those 2 legacy=20
platforms, hence the naming. Not sure if it's the right way to name it=20
though...


On Tue, Oct 31, 2023 at 12:00:48PM -0400, Jon Cormier wrote:
> Why is it labeled -legacy?
>=20
> On Tue, Oct 31, 2023 at 5:13=E2=80=AFAM Sai Sree Kartheek Adivi via
> lists.yoctoproject.org <s-adivi=3Dti.com@lists.yoctoproject.org> wrote:
>=20
> > On 14:37-20231031, Chirag Shilwant wrote:
> > > - Add processor-sdk-09.01.00-legacy-config.txt used for building AM=
33x,
> > AM43x.
> > >
> > > Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >
> > Acked-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> >
> > > ---
> > >  .../processor-sdk-09.01.00-legacy-config.txt      | 15 +++++++++++=
++++
> > >  1 file changed, 15 insertions(+)
> > >  create mode 100644
> > configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt
> > >
> > > diff --git
> > a/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt
> > b/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt
> > > new file mode 100644
> > > index 0000000..66a47e3
> > > --- /dev/null
> > > +++ b/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.tx=
t
> > > @@ -0,0 +1,15 @@
> > > +# This file takes repo entries in the format
> > > +# repo name,repo uri,repo branch,repo
> > commit[,layers=3Dlayer1:layer2...:layern]
> > > +
> > > +bitbake,
> > https://git.openembedded.org/bitbake,2.0,9993a89e5b97dda5f3657e5a7cc3=
a4fa94ff7111
> > > +meta-processor-sdk,
> > https://git.ti.com/git/processor-sdk/meta-processor-sdk.git,kirkstone=
,09.01.00.001,layers=3D
> > > +meta-arago,
> > https://git.yoctoproject.org/meta-arago,kirkstone,09.01.00.001,layers=
=3Dmeta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> > > +meta-qt5,
> > https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1ab=
c297636f7933d0e35f22be,layers=3D
> > > +meta-virtualization,
> > https://git.yoctoproject.org/meta-virtualization,kirkstone,2d8b3cba8f=
f27c9ec2187a52b6a551fe1dcfaa07,layers=3D
> > > +meta-openembedded,
> > https://git.openembedded.org/meta-openembedded,kirkstone,9c5541f7e18a=
1fac3b8dea71e1ebb8398d58e6ff,layers=3Dmeta-networking:meta-python:meta-oe=
:meta-gnome:meta-filesystems:meta-multimedia
> > > +meta-ti,
> > https://git.yoctoproject.org/meta-ti,kirkstone,09.01.00.001,layers=3D=
meta-ti-extras:meta-ti-bsp
> > > +meta-arm,
> > https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f9=
0b4715958546fc41d73,layers=3Dmeta-arm:meta-arm-toolchain
> > > +oe-core,
> > https://git.openembedded.org/openembedded-core,kirkstone,2572b32e7298=
31762790ebfbf930a1140657faea,layers=3Dmeta
> > > +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> > > +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> > > +BITBAKE_INCLUSIVE_VARS=3Dyes
> > > --
> > > 2.34.1

