Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BADE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 16:38:02 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.41842.1733503076228224388
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 08:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KWMqcdCh;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B6GbqYX036356;
	Fri, 6 Dec 2024 10:37:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733503072;
	bh=qlKdp8UKGHhGz26fi6bpd44n7JhRFx3+zCkkftPZd9U=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=KWMqcdChno8WNwE8giA1axPBZpMDfJDpIqGmrjIprYl0zrFXDY7JHZvfoIUFqQe36
	 zUtmwFsqxSdBDjzgtGJNvIeEs5bPHlwD++E55C8K2NyPoJ6J+gAyLPcFZDAw4r+9A/
	 7IyHNI89++8Gzk2cM8uqlLyjhYGr9tRrXhNBgJHA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B6Gbqes012951
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Dec 2024 10:37:52 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Dec 2024 10:37:51 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Dec 2024 10:37:51 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B6GbpNR060878;
	Fri, 6 Dec 2024 10:37:51 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 6 Dec 2024 10:37:51 -0600
Message-ID: <D64RJX8EQ1QV.OCCZSAE9ORZA@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH] ti-test: Add rng-tools
From: Randolph Sapp <rs@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <jm@ti.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241205201212.1114249-1-jm@ti.com>
 <20241205203925.GC23825@denix.org> <D642PNR09HV2.14HQW6M4SVQ63@ti.com>
 <3cbbeb0e-e14e-4bd4-8fd5-c6e9fece4d43@ti.com>
In-Reply-To: <3cbbeb0e-e14e-4bd4-8fd5-c6e9fece4d43@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 06 Dec 2024 16:38:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15647

On Fri Dec 6, 2024 at 8:37 AM CST, Ryan Eatmon wrote:
>
>
> On 12/5/2024 3:09 PM, Randolph Sapp wrote:
> > On Thu Dec 5, 2024 at 2:39 PM CST, Denys Dmytriyenko wrote:
> >> rng-tools were removed back in 2023:
> >> https://git.yoctoproject.org/meta-arago/commit/?id=3Ddc19fed1b898cf5ab=
df50fa04dda7b1d9afd22ca
> >>
> >> and added back last September to master and scarthgap:
> >> https://git.yoctoproject.org/meta-arago/commit/?id=3D662a5119446e7d470=
94a68efe8b775b3dda2b4e8
> >>
> >> I see you are trying to backport that to kirkstone, even though the su=
bject
> >> states master...
> >=20
> > Yeah, noticed the tags were a bit off.
> >=20
> >> Anyway, based on Randolph's comments for the removal, rngd was depreca=
ted
> >> and is no longer needed - should testcases be adjusted for the removal=
 of
> >> rng-tools?
> >=20
> > I did have a conversation with Judith about this. While I still believe=
 the
> > rng-tools service is deprecated and does nothing more than hinder gener=
al usage,
> > the package itself actually has some useful tools for testing hardware =
RNG
> > devices. I wasn't able to find any similar tools to replace them in my =
brief
> > search.
>
> Do we need to add something to a bbappend to disable the service while=20
> still getting the tools?  I haven't looked at the recipe, I'm just=20
> asking a general question.

Nah, previously we were going out of our way to enable it. If I remember
corectly it's disabled by default.

> >> On Thu, Dec 05, 2024 at 02:12:12PM -0600, Mendez, Judith via lists.yoc=
toproject.org wrote:
> >>> Add rng-tools to the ti-test tool list.
> >>>
> >>> RNG testcases are failing since they require
> >>> rngtest, so add rng-tools to ti-test only.
> >>>
> >>> Signed-off-by: Judith Mendez <jm@ti.com>
> >>> ---
> >>> This patch has been previously sent and merged to scarthgap
> >>> branch, but is also required for kirkstone
> >>> ---
> >>>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/=
meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>> index a80b943b..85398eaf 100644
> >>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> >>> @@ -44,6 +44,7 @@ TI_TEST_BASE =3D "\
> >>>       powertop \
> >>>       procps \
> >>>       pulseaudio-misc \
> >>> +    rng-tools \
> >>>       rt-tests \
> >>>       rwmem \
> >>>       smcroute \
> >>> --=20
> >>> 2.46.0
> >=20


