Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067F1CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 09:17:58 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.7106.1758791871910388388
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 02:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=X0DB9jfd;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58P9HpY71895860
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 04:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758791871;
	bh=5E6Fh4tc3xkgIDfsuJg7gRDaYxkiRd8TwalckyZBTKk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=X0DB9jfdjskSM2igMvjpQp9LB4aub7x+gntHQJDcMW5r5rLuQjTkrW32tzuxispq3
	 +pxyNTNYlcEdZsu/ED+VU8sloypBlG8RFk41y6bwv2Ks4wkNZWJKoVaS19s182PyzV
	 oH9mRoIyYAR3XFHBIQfjnuNsACg/UkxbpmjjJTes=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58P9HpOq3447148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 04:17:51 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 04:17:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 04:17:50 -0500
Received: from [172.24.233.249] (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58P9HmlE3509237;
	Thu, 25 Sep 2025 04:17:48 -0500
Message-ID: <90cd3e3a-28b1-4e7e-a831-b59b6d69a0a3@ti.com>
Date: Thu, 25 Sep 2025 14:47:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [scarthgap][PATCH] meta-arago-test: hwspinlocktest:
 Update SRCREV to latest
To: Judith Mendez <jm@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <reatmon@ti.com>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <v-singh1@ti.com>
References: <20250924172610.8166-1-p-bhagat@ti.com>
 <c5c20af9-e117-4f05-9884-6685e06d9e49@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <c5c20af9-e117-4f05-9884-6685e06d9e49@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 58P9HpY71895860
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 09:17:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16630

Hi Judith,


On 25/09/25 00:34, Judith Mendez wrote:
> Hi Paresh,
>
> On 9/24/25 12:26 PM, Paresh Bhagat via lists.yoctoproject.org wrote:
>> Pulls in AM62D SoC support.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> .../recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git=20
>> a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb=20
>> b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>> index 39171041..6dec53e7 100644
>> ---=20
>> a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>> +++=20
>> b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>> @@ -10,7 +10,7 @@ SRC_URI =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Fix-Makefile-for-to-build-w=
ith-yocto.patch \
>> =C2=A0 "
>> =C2=A0 -SRCREV =3D "a8297c7a2ca9e127929095045228dd4761121d56"
>> +SRCREV =3D "1d154fbe5b56ef81045763f574c2098a35d6a8b8"
>> =C2=A0 =C2=A0 S =3D "${WORKDIR}/git"
>
>
> please send to master as well.


master is still using the patch approach and old source(not TI one).=20
Should I add a new patch for AM62D support?


>
> ~ Judith

