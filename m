Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21CFCAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 11:27:58 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.9312.1758799668659772985
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 04:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=XJD4h53T;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: c-shilwant@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PBRmoG1446452
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 06:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758799668;
	bh=zOmdN0kPd/HGlhwL6hwE/3jZR69oqm3xg3jf2k79QW4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XJD4h53TDxT4quu7av3mVtt9Wk8d3A6LW21tzBsCsQ0/en+I2/FMauZcoafJE7K5L
	 vqZt4kF1fCQikQaoZabYwLFuPdX4+RInDplewA/hrXWvFMUQWAvefctbyMg9k+20J0
	 +Iqe6RbSL5bJD8/OLfX5K6nebHMBHl9sMLSeVMLg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PBRmXf2605862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 06:27:48 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 06:27:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 06:27:47 -0500
Received: from [10.24.72.117] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.117])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PBRiVE3666264;
	Thu, 25 Sep 2025 06:27:45 -0500
Message-ID: <e457bd21-5054-4c2f-81fd-40f3b44a656c@ti.com>
Date: Thu, 25 Sep 2025 16:57:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [scarthgap][PATCH] meta-arago-test: hwspinlocktest:
 Update SRCREV to latest
To: Paresh Bhagat <p-bhagat@ti.com>, Judith Mendez <jm@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <khasim@ti.com>, <v-singh1@ti.com>
References: <20250924172610.8166-1-p-bhagat@ti.com>
 <c5c20af9-e117-4f05-9884-6685e06d9e49@ti.com>
 <90cd3e3a-28b1-4e7e-a831-b59b6d69a0a3@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <90cd3e3a-28b1-4e7e-a831-b59b6d69a0a3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 58PBRmoG1446452
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 11:27:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16631


On 25/09/25 14:47, Paresh Bhagat wrote:
> Hi Judith,
>
>
> On 25/09/25 00:34, Judith Mendez wrote:
>> Hi Paresh,
>>
>> On 9/24/25 12:26 PM, Paresh Bhagat via lists.yoctoproject.org wrote:
>>> Pulls in AM62D SoC support.
>>>
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> ---
>>> .../recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git=20
>>> a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb=
=20
>>> b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>>> index 39171041..6dec53e7 100644
>>> ---=20
>>> a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>>> +++=20
>>> b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>>> @@ -10,7 +10,7 @@ SRC_URI =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Fix-Makefile-for-to-build-=
with-yocto.patch \
>>> =C2=A0 "
>>> =C2=A0 -SRCREV =3D "a8297c7a2ca9e127929095045228dd4761121d56"
>>> +SRCREV =3D "1d154fbe5b56ef81045763f574c2098a35d6a8b8"
>>> =C2=A0 =C2=A0 S =3D "${WORKDIR}/git"
>>
>>
>> please send to master as well.
>
>
> master is still using the patch approach and old source(not TI one).=20
> Should I add a new patch for AM62D support?


the patch is already in master-next [0]
you can just send a SRCREV update patch on top of master-next


[0] -=20
https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=3Dmaster-next&=
id=3D10e3c057594b75d486c90c730fe6b83faecda8d7


Chirag


>
>
>
>>
>> ~ Judith

