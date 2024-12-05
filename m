Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEED9E7716E
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 21:10:05 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.22878.1733432997544135823
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 13:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oUy1vN7y;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5L9r0i1976425
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 5 Dec 2024 15:09:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733432993;
	bh=JMOkLchTYdBErduePUKhffIORuq+tY1lvc2K+Hu5YCc=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=oUy1vN7y7uUUUQPTx6inyxB7dAy5Hil7394othF4lMTRoEuCdIT+RIJPKlwe5luKS
	 U4XE9QB7gzZNl2cnY9gu4PHGB1LKpJyL8b7TFwgYz0ZnwdUfqOvpN54pfSsm7iX4U4
	 ReSaoHAPIad0dCp/RvDgu2yNkBZC2gyOUJ1ZxbqU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5L9rA5007359;
	Thu, 5 Dec 2024 15:09:53 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 15:09:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 15:09:53 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5L9r3W022452;
	Thu, 5 Dec 2024 15:09:53 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Dec 2024 15:09:53 -0600
Message-ID: <D642PNR09HV2.14HQW6M4SVQ63@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: [meta-arago][master/kirkstone][PATCH] ti-test: Add rng-tools
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <jm@ti.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241205201212.1114249-1-jm@ti.com>
 <20241205203925.GC23825@denix.org>
In-Reply-To: <20241205203925.GC23825@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Dec 2024 21:10:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15644

On Thu Dec 5, 2024 at 2:39 PM CST, Denys Dmytriyenko wrote:
> rng-tools were removed back in 2023:
> https://git.yoctoproject.org/meta-arago/commit/?id=3Ddc19fed1b898cf5abdf5=
0fa04dda7b1d9afd22ca
>
> and added back last September to master and scarthgap:
> https://git.yoctoproject.org/meta-arago/commit/?id=3D662a5119446e7d47094a=
68efe8b775b3dda2b4e8
>
> I see you are trying to backport that to kirkstone, even though the subje=
ct=20
> states master...

Yeah, noticed the tags were a bit off.

> Anyway, based on Randolph's comments for the removal, rngd was deprecated=
=20
> and is no longer needed - should testcases be adjusted for the removal of=
=20
> rng-tools?

I did have a conversation with Judith about this. While I still believe the
rng-tools service is deprecated and does nothing more than hinder general u=
sage,
the package itself actually has some useful tools for testing hardware RNG
devices. I wasn't able to find any similar tools to replace them in my brie=
f
search.

> On Thu, Dec 05, 2024 at 02:12:12PM -0600, Mendez, Judith via lists.yoctop=
roject.org wrote:
> > Add rng-tools to the ti-test tool list.
> >=20
> > RNG testcases are failing since they require
> > rngtest, so add rng-tools to ti-test only.
> >=20
> > Signed-off-by: Judith Mendez <jm@ti.com>
> > ---
> > This patch has been previously sent and merged to scarthgap
> > branch, but is also required for kirkstone
> > ---
> >  meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/me=
ta-arago-test/recipes-core/packagegroups/ti-test.bb
> > index a80b943b..85398eaf 100644
> > --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > @@ -44,6 +44,7 @@ TI_TEST_BASE =3D "\
> >      powertop \
> >      procps \
> >      pulseaudio-misc \
> > +    rng-tools \
> >      rt-tests \
> >      rwmem \
> >      smcroute \
> > --=20
> > 2.46.0


