Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3A1EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 16:13:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.173.1687277610055657532
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 09:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D949040C88;
	Tue, 20 Jun 2023 16:13:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiAjdjKetVdi; Tue, 20 Jun 2023 16:13:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A8DE540C16;
	Tue, 20 Jun 2023 16:13:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C8C09163B09; Tue, 20 Jun 2023 12:13:24 -0400 (EDT)
Date: Tue, 20 Jun 2023 12:13:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org,
	g-gupta@ti.com
Subject: Re: [oe-layersetup PATCH] configs: Update Kirkstone config for
 sysrepo
Message-ID: <20230620161324.GI1518@denix.org>
References: <20230616084538.10530-1-r-gunasekaran@ti.com>
 <20230616194834.GG1518@denix.org>
 <2c6142f3-a4f5-99d7-9738-65560e10e18c@ti.com>
 <be4894a1-47c6-d2dc-a95c-8fd028a147a0@ti.com>
 <089e1c0a-2d7b-21a6-91f5-3d745bf4e388@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <089e1c0a-2d7b-21a6-91f5-3d745bf4e388@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jun 2023 16:13:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14658

On Tue, Jun 20, 2023 at 09:36:12AM +0530, Ravi Gunasekaran wrote:
>=20
>=20
> On 6/20/2023 3:34 AM, Ryan Eatmon wrote:
> >
> >
> > On 6/18/2023 11:34 PM, Ravi Gunasekaran wrote:
> >> Denys,
> >>
> >> On 6/17/23 1:18 AM, Denys Dmytriyenko wrote:
> >>> On Fri, Jun 16, 2023 at 02:15:38PM +0530, Ravi Gunasekaran wrote:
> >>>> NETCONF/YANG is implemented through netopeer2/sysrepo.
> >>>> A Yocto project for sysrepo is available in public domain[1].
> >>>>
> >>>> [1] is compatible only with Yocto Honister branch. So update
> >>>> the config with [2] which is fork of [1] for Kirkstone.
> >>>>
> >>>> [1] - https://github.com/sartura/meta-sysrepo
> >>>> [2] - https://github.com/ravig07/meta-sysrepo
> >>>
> >>> So, you are bumping many of the recipes in that layer, plus updatin=
g to the
> >>> new override syntax and setting compatibility with kirkstone. The P=
R has been
> >>> setting open since May 4 w/o any comments, so it's probably safe to=
 assume the
> >>> layer is abandoned. Why not move the recipes to an active layer? At=
 least to
> >>> meta-arago, or even better work on upstreaming them to meta-openemb=
edded?
> >>>
> >>> Regardless, the changes for kirkstone appear to be safe to langdale=
 and
> >>> mickledore - that would allow including the change in master builds=
 too.
> >>
> >> Yes, the PR has been open since quite some time.
> >> I did think of adding the recipes to meta-arago, but since the recip=
es already
> >> exists in the public domain, I felt moving them to meta-arago might =
not be the
> >> right way.
> >
> > We should pull any needed recipes into meta-arago and not in a forked=
 repo of
> > meta-sysrepo...
> >
> > Are you signing up to maintain your forked copy of meta-sysrepo for a=
ll time?=A0
> > If not, then we should migrate your required changes into meta-arago-=
extras
> > and just deal with the fact that we as TI need to maintain them.
> >
>=20
> Understood. I will add the recipes to meta-aragos-extras then.

What is "aragos"?


> >>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> >>>> ---
> >>>> I have sent a Pull Request for [2]. Once it gets merged, then the =
URI
> >>>> in the config.txt can be replaced with it.
> >>>>
> >>>> =A0 configs/arago-kirkstone-config.txt | 1 +
> >>>> =A0 1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/configs/arago-kirkstone-config.txt
> >>>> b/configs/arago-kirkstone-config.txt
> >>>> index c2524a4..e80ab80 100644
> >>>> --- a/configs/arago-kirkstone-config.txt
> >>>> +++ b/configs/arago-kirkstone-config.txt
> >>>> @@ -10,6 +10,7 @@
> >>>> meta-openembedded,https://git.openembedded.org/meta-openembedded,k=
irkstone,HEAD,
> >>>> =A0
> >>>> meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=
=3Dmeta-ti-extras:meta-ti-bsp
> >>>> =A0
> >>>> meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,laye=
rs=3Dmeta-arm:meta-arm-toolchain
> >>>> =A0
> >>>> oe-core,https://git.openembedded.org/openembedded-core,kirkstone,H=
EAD,layers=3Dmeta
> >>>> +meta-sysrepo,https://github.com/ravig07/meta-sysrepo,kirkstone,HE=
AD,layers=3D
> >>>> =A0 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> >>>> =A0 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> >>>> =A0 BITBAKE_INCLUSIVE_VARS=3Dyes
> >>>> --=A0
> >>>> 2.17.1

