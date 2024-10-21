Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76763D0E6DF
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:12:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.42654.1729505538204858620
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 03:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=qWuBA3mt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49LACGEq005124;
	Mon, 21 Oct 2024 05:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729505536;
	bh=SFUyxdxguXjEUMrOa7yxLAn1nfB7YRVYzs0fcbWuKTc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qWuBA3mtOWBRp7U4XvvZmYWMvP5g2q3UregBXM3rnMgeMAzB37zOpacprKG6ui0Or
	 DyotvIqf1kAauuTKGDXWUTXxxInaEp8XlV/3hP1UrLM1rMDa2wP/x+oNG89OcHBUru
	 eaKpvf6cmoe+bi2q/o1c723VZPYbudnraAdLqY54=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LACGH7035408;
	Mon, 21 Oct 2024 05:12:16 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Oct 2024 05:12:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Oct 2024 05:12:15 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LACDQI081049;
	Mon, 21 Oct 2024 05:12:14 -0500
Message-ID: <88e236e9-fb31-4117-ae92-16219d18d881@ti.com>
Date: Mon, 21 Oct 2024 15:42:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago] [meta-ti][kirkstone/scarthgap][RFC
 PATCH] ti-test: Add hwspinlocktest
To: Judith Mendez <jm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Randolph Sapp <rs@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <reatmon@ti.com>
References: <20241016225830.3178108-1-jm@ti.com>
 <b34eb17f-2061-4667-8231-16a055de4429@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <b34eb17f-2061-4667-8231-16a055de4429@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 49LACGEq005124
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 21 Oct 2024 10:12:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15579

Hi Judith,

s/[meta-arago][meta-ti]/ [meta-arago] in subject.

On 21/10/24 03:49, Ryan Eatmon via lists.yoctoproject.org wrote:
> On 10/16/2024 5:=E2=80=8A58 PM, Judith Mendez wrote: > Add hwspinlock r=
ecipe=20
> to build out of tree module hwspinlock test. > > Signed-off-by: Judith=20
> Mendez <jm@=E2=80=8Ati.=E2=80=8Acom> > --- >=20
> ..=E2=80=8A.=E2=80=8A/recipes-core/packagegroups/ti-test.=E2=80=8Abb | =
1 + >=20
> ..=E2=80=8A.=E2=80=8A/hwspinlocktest/files/LICENSE
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uRdgXXcF3C07wMXEf=
NND_wyXhpB0lFf6zT_57GliBcGIaEQPPgCRKf-GH3PQoL5FAbNeNV6XMTUJwlRTG2jOhnNXDc=
w$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On 10/16/2024 5:58 PM, Judith Mendez wrote:
> > Add hwspinlock recipe to build out of tree module hwspinlock test.
> >=20
> > Signed-off-by: Judith Mendez <jm@ti.com>
> > ---
> >   .../recipes-core/packagegroups/ti-test.bb     |   1 +
> >   .../hwspinlocktest/files/LICENSE              |  29 ++
> >   .../hwspinlocktest/files/Makefile             |  19 ++
> >   .../files/omap_hwspinlock_test.c              | 251 +++++++++++++++=
+++
> >   .../hwspinlocktest/hwspinlocktest_0.1.bb      |  18 ++
> >   5 files changed, 318 insertions(+)
> >   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/fi=
les/LICENSE
> >   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/fi=
les/Makefile
> >   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/fi=
les/omap_hwspinlock_test.c
> >   create mode 100644 meta-arago-test/recipes-kernel/hwspinlocktest/hw=
spinlocktest_0.1.bb
> >=20


Any particular reasons to maintain the files in meta-arago layer instead=20
of leveraging the repository [1]?

[1]: https://github.com/sumananna/omap-hwspinlock-test

---
Chirag


> > diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/=
meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > index 695bed5c..91ebec44 100644
> > --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> > @@ -17,6 +17,7 @@ TI_TEST_BASE =3D "\
> >       evtest \
> >       fio \
> >       git \
> > +    hwspinlocktest \
> >       hdparm \
> >       i2c-tools \
> >       iozone3 \

