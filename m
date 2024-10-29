Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35448D74943
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 21:38:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.427.1730237935882083128
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Oct 2024 14:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=qhFiL6S8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: jm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TLctwx073162
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Oct 2024 16:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730237935;
	bh=w4vmfC8H3+uCPCM44JqUXgf4V73PX200JE17lJNkQVg=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=qhFiL6S8qv5V+6UFG/p6DcdJOTENXIiHTknZBydVnAAYw7AUP2ubFDyB48GdixGpf
	 1hLCk1YYB/Nuapahl+iUBjCc9i/u6WnBPrx5SEkTyP5B1d2j3KioSzrRk4FnOPw0FT
	 +Cc6Y2OMQdmueHkO+pm9Ylc5ubvx4kPchPXras7Y=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49TLct4Q095696
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Oct 2024 16:38:55 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 16:38:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 16:38:54 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TLcsJ3087282;
	Tue, 29 Oct 2024 16:38:54 -0500
Message-ID: <4d7d8ddb-d5dc-4243-b180-7198ec55abcc@ti.com>
Date: Tue, 29 Oct 2024 16:38:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone/scarthgap][RFC PATCH] ti-test: Add
 hwspinlocktest
To: Ryan Eatmon <reatmon@ti.com>
References: <20241016225830.3178108-1-jm@ti.com>
 <b34eb17f-2061-4667-8231-16a055de4429@ti.com>
 <dec45a6a76754b10a053aa3f64dd1e3b@ti.com>
Content-Language: en-US
CC: "Mendez, Judith" <jm@ti.com>, Randolph Sapp <rs@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <denys@ti.com>
From: Judith Mendez <jm@ti.com>
In-Reply-To: <dec45a6a76754b10a053aa3f64dd1e3b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 49TLctwx073162
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Oct 2024 21:38:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15584

Hi Ryan,

> On 10/16/2024 5:58 PM, Judith Mendez wrote:
>> Add hwspinlock recipe to build out of tree module hwspinlock test.
>>=20
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>=C2=A0=C2=A0 .../recipes-core/packagegroups/ti-test.bb=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 1 +
>>=C2=A0=C2=A0 .../hwspinlocktest/files/LICENSE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 29 ++
>>=C2=A0=C2=A0 .../hwspinlocktest/files/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++
>>=C2=A0=C2=A0 .../files/omap_hwspinlock_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 251 +++++++++++++++=
+++
>>=C2=A0=C2=A0 .../hwspinlocktest/hwspinlocktest_0.1.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 18 ++
>>=C2=A0=C2=A0 5 files changed, 318 insertions(+)
>>=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/hwspinlo=
cktest/files/LICENSE
>>=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/hwspinlo=
cktest/files/Makefile
>>=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/hwspinlo=
cktest/files/omap_hwspinlock_test.c
>>=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/hwspinlo=
cktest/hwspinlocktest_0.1.bb
>>=20
>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/m=
eta-arago-test/recipes-core/packagegroups/ti-test.bb
>> index 695bed5c..91ebec44 100644
>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> @@ -17,6 +17,7 @@ TI_TEST_BASE =3D "\
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evtest \
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fio \
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git \
>> +=C2=A0=C2=A0=C2=A0 hwspinlocktest \
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdparm \
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c-tools \
>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iozone3 \
>=20
> One piece of feedback.=C2=A0 If this kind of test is only applicable to=
 some
> platforms, then we should only be adding it for those platforms and not
> for all platforms.


I believe this test should apply for all platforms, am335x, am437x,
am65x, and Sitara platforms as well. I am not 100% sure about Jacinto
though.

~ Judith

