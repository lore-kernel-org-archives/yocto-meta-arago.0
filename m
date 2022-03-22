Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06666C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 23:06:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.2506.1647990381129612866
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 16:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0EA0340C3E;
	Tue, 22 Mar 2022 23:06:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZubN6ZIOLJgU; Tue, 22 Mar 2022 23:06:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C347B40951;
	Tue, 22 Mar 2022 23:06:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 012F5174837; Tue, 22 Mar 2022 19:06:13 -0400 (EDT)
Date: Tue, 22 Mar 2022 19:06:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Etheridge, Darren" <detheridge@ti.com>
Cc: nm@ti.com, reatmon@ti.com, Yogesh Siraswar <yogeshs@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][dunfell][PATCH 2/3] packagegroup-*-graphics: add
 virtual provider for AM62x GPU driver v2
Message-ID: <20220322230612.GW23554@denix.org>
References: <20220322193554.24404-1-reatmon@ti.com>
 <20220322193554.24404-3-reatmon@ti.com>
 <20220322204955.kj74x5e6lx4qtghr@borrowing>
 <4adcaba5-e45d-451a-75a5-3cc8d52ce8fc@ti.com>
 <20220322221338.GT23554@denix.org>
 <cd27dea1-9d16-38b8-611e-24a554700dbf@ti.com>
 <20220322222702.GV23554@denix.org>
 <1a1e58fe-70a3-bc92-9b33-75d02c92a283@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a1e58fe-70a3-bc92-9b33-75d02c92a283@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 23:06:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13723

On Tue, Mar 22, 2022 at 05:44:39PM -0500, Etheridge, Darren wrote:
> 
> 
> On 3/22/2022 5:27 PM, Denys Dmytriyenko wrote:
> >On Tue, Mar 22, 2022 at 05:16:20PM -0500, Etheridge, Darren wrote:
> >>
> >>
> >>On 3/22/2022 5:13 PM, Denys Dmytriyenko wrote:
> >>>On Tue, Mar 22, 2022 at 03:58:04PM -0500, Etheridge, Darren via lists.yoctoproject.org wrote:
> >>>>
> >>>>
> >>>>On 3/22/2022 3:49 PM, Nishanth Menon via lists.yoctoproject.org wrote:
> >>>>>On 14:35-20220322, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>>>>>From: Krunal Bhargav <k-bhargav@ti.com>
> >>>>>>
> >>>>>>Signed-off-by: Krunal Bhargav <k-bhargav@ti.com>
> >>>>>>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>>>>---
> >>>>>>  .../conf/distro/include/arago-prefs.inc              | 12 ++++++------
> >>>>>>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>>>>>
> >>>>>>diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>>>>>index a356c76c..7bc2ba52 100644
> >>>>>>--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>>>>>+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >>>>>>@@ -14,12 +14,12 @@ PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
> >>>>>>  PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
> >>>>>>  PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
> >>>>>>-# J7 has a Rogue GPU core
> >>>>>>-PREFERRED_PROVIDER_virtual/egl_j7 = "ti-img-rogue-umlibs"
> >>>>>>-PREFERRED_PROVIDER_virtual/libgles1_j7 = "ti-img-rogue-umlibs"
> >>>>>>-PREFERRED_PROVIDER_virtual/libgles2_j7 = "ti-img-rogue-umlibs"
> >>>>>>-PREFERRED_PROVIDER_virtual/libgbm_j7 = "ti-img-rogue-umlibs"
> >>>>>>-PREFERRED_PROVIDER_virtual/gpudriver_j7 = "ti-img-rogue-driver"
> >>>>>>+# K3 TI Platforms has a Rogue GPU core
> >>>>>>+PREFERRED_PROVIDER_virtual/egl = "ti-img-rogue-umlibs"
> >>>>>>+PREFERRED_PROVIDER_virtual/libgles1 = "ti-img-rogue-umlibs"
> >>>>>>+PREFERRED_PROVIDER_virtual/libgles2 = "ti-img-rogue-umlibs"
> >>>>>>+PREFERRED_PROVIDER_virtual/libgbm = "ti-img-rogue-umlibs"
> >>>>>>+PREFERRED_PROVIDER_virtual/gpudriver = "ti-img-rogue-driver"
> >>>>>
> >>>>>How does this apply to k3 and leave non-k3 alone? Also, am65x for example is
> >>>>>sgx.
> >>>>>
> >>>>
> >>>>That is a very good point.  This will mess up SGX platforms.   I
> >>>>wish we had k3_ as the prefix for the name here for all the k3
> >>>>platforms.
> >>>
> >>>There is "k3" defined and you can do _k3 override to address all K3 platforms,
> >>>but again, some are SGX and some are RGX...
> >>>
> >>>
> >>>>So I guess the only solution is leave all the _j7 as they were
> >>>>
> >>>>and add:
> >>>>+PREFERRED_PROVIDER_virtual/egl_am62 = "ti-img-rogue-umlibs"
> >>>>+PREFERRED_PROVIDER_virtual/libgles1_am62 = "ti-img-rogue-umlibs"
> >>>>+PREFERRED_PROVIDER_virtual/libgles2_am62 = "ti-img-rogue-umlibs"
> >>>>+PREFERRED_PROVIDER_virtual/libgbm_am62 = "ti-img-rogue-umlibs"
> >>>>+PREFERRED_PROVIDER_virtual/gpudriver_am62 = "ti-img-rogue-driver"
> >>>
> >>>And there's no "am62" defined, but "am62xx" :)
> >>>
> >>
> >>Isn't it a partial pattern match?   If it is not the _j7 won't work
> >>for j721s2 either.
> >
> >No, it's not a partial pattern match. Overrides use exact matches only, so
> >those have to be defined. Specifically these overrides come from SOC_FAMILY
> >variable and there are definitions for "k3", "j7", but there's no "j721s2"
> >SOC_FAMILY defined, so you cannot use _j721s2, nor _j7 will match it.
> >https://git.yoctoproject.org/meta-ti/tree/conf/machine/include?h=dunfell
> >
> 
> Thanks for the explanation Denys,  I was making totally wrong
> assumption on how that was being derived.
> 
> So we could actually use _k3 and get am62xx-evm, j721s2-evm and
> j7-evm with a single override.  All k3's use the IMG Rogue driver if
> they have a GPU.

What about am65xx? It is SGX.
And I assume am64xx and j7200 have no GPU.
If am65xx is the only exception in K3 family, then we could flip the 
compatibility setting.

-- 
Denys

