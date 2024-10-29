Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2366FD74942
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 21:33:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.295.1730237601325710033
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Oct 2024 14:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jLveTU7l;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: jm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TLXKgb060538
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Oct 2024 16:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730237600;
	bh=lFgA5FwWblV3CBqmQ2g3A6eYnKcWv27xatLYgd5bHF4=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=jLveTU7lgBHFQKH/nGU0iXWphR5IWmQdfGmBK5I1VA/z4+0ahnGZRDcalU+4S9S4s
	 ODdeLSAhCpUjTvSlIeF1Xi93EVWx7srnDV+2fXUFaOCDZ4FP1YMzY8m5Inm8ePTnWb
	 Tg9WUCqtZFuljivK6RQXCxNtgOxJGn+DFuW/RbF8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49TLXKAe093118
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Oct 2024 16:33:20 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 16:33:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 16:33:19 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TLXJb4082404;
	Tue, 29 Oct 2024 16:33:19 -0500
Message-ID: <18715ce4-c12b-4a3a-ab6e-347684dc5da9@ti.com>
Date: Tue, 29 Oct 2024 16:33:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [meta-ti][kirkstone/scarthgap][RFC PATCH] ti-test:
 Add hwspinlocktest
To: <c-shilwant@ti.com>
References: <20241016225830.3178108-1-jm@ti.com>
 <b34eb17f-2061-4667-8231-16a055de4429@ti.com>
 <88e236e9-fb31-4117-ae92-16219d18d881@ti.com>
 <a43c95abdad64b7fb0a20a51986ef201@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Randolph Sapp <rs@ti.com>, <denys@ti.com>,
        "Mendez, Judith" <jm@ti.com>
In-Reply-To: <a43c95abdad64b7fb0a20a51986ef201@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 49TLXKgb060538
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Oct 2024 21:33:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15583

Hi Chirag,

>> On 10/16/2024 5:58 PM, Judith Mendez wrote:
>> > Add hwspinlock recipe to build out of tree module hwspinlock test.
>> >=20
>> > Signed-off-by: Judith Mendez <jm@ti.com>
>> > ---
>> >=C2=A0=C2=A0 .../recipes-core/packagegroups/ti-test.bb=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> >=C2=A0=C2=A0 .../hwspinlocktest/files/LICENSE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 29 ++
>> >=C2=A0=C2=A0 .../hwspinlocktest/files/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++
>> >=C2=A0=C2=A0 .../files/omap_hwspinlock_test.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 251 ++++++++++++=
++++++
>> >=C2=A0=C2=A0 .../hwspinlocktest/hwspinlocktest_0.1.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 18 ++
>> >=C2=A0=C2=A0 5 files changed, 318 insertions(+)
>> >=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/hwspin=
locktest/files/LICENSE
>> >=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/hwspin=
locktest/files/Makefile
>> >=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/hwspin=
locktest/files/omap_hwspinlock_test.c
>> >=C2=A0=C2=A0 create mode 100644 meta-arago-test/recipes-kernel/hwspin=
locktest/hwspinlocktest_0.1.bb
>> >=20
>=20
>=20
> Any particular reasons to maintain the files in meta-arago layer instea=
d
> of leveraging the repository [1]?
>=20
> [1]: https://github.com/sumananna/omap-hwspinlock-test=20
> <https://github.com/sumananna/omap-hwspinlock-test>


ATM this test is in a personal github repo. Apparently we do not
want to pull from personal repos and there is a JIRA req to move
the repo to ti.com, but the target date is for 11.0. Since we
want to add the test asap, the idea is to add to yocto and update
the recipe later when the repo has been moved.

~ Judith


