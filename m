Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C662CC3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 22:30:58 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.2310.1746657049004105189
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 May 2025 15:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=VA32MN+l;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547MUkqB934318
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 17:30:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746657046;
	bh=1XgrvwEv8ABmoOMgm8E8TF7NDtEkzEVpW03ZNAHVOxQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VA32MN+lqkrB8h8SVhMmtT31U/5aDDhB9A+alaMWPn+KWE+J/rqAVys1CwvSaObMb
	 Wi/ZjGvYvrBdEimyZfxkG2cMtu8gf2dlTJUle5vfg0V1DOJw9woPUNfSKdrnwOwSol
	 eIJ+wZa5V4AKgQCtT2tW0lzM8pi5ringmyMG7EM8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547MUjiC016566
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 17:30:45 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 17:30:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 17:30:45 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547MUjbN083384;
	Wed, 7 May 2025 17:30:45 -0500
Message-ID: <dbc875f7-a899-474f-a00e-94a359e1dba9@ti.com>
Date: Wed, 7 May 2025 17:30:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-layersetup][PATCHv2 00/16] Sacrifice your first born to the
 linter
To: Randolph Sapp <rs@ti.com>, PRC Automation <automated_prc_response@ti.com>,
        Randolph Sapp <res.sapp@gmail.com>
CC: <denis@denix.org>, <afd@ti.com>, <nm@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230614034507.598391-1-res.sapp@gmail.com>
 <20250507221606.C917EABF56@fllvdckhpci078.itg.ti.com>
 <51b0566e-5b14-4d62-9388-258f3e6cad68@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <51b0566e-5b14-4d62-9388-258f3e6cad68@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 547MUkqB934318
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 May 2025 22:30:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16189



On 5/7/2025 5:29 PM, Randolph Sapp wrote:
> On 5/7/25 17:16, PRC Automation wrote:
>> oe-layersetup / na / 20230614034507.598391-1-res.sapp
>>
>> PRC Results: FAIL
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> =C2=A0=C2=A0 apply-patch: FAIL
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Summary:
>> - Patch Series: [oe-layersetup][PATCHv2 00/16] Sacrifice your first=20
>> born to the linter
>> - Submitter: From: Randolph Sapp <res.sapp@gmail.com>
>> - Date: Date: Tue, 13 Jun 2023 22:44:51 -0500
>> - Num Patches: 16
>> - Mailing List (public inbox) Commit SHA:=20
>> 5a49bf112d3685aeb2f6e7b0a0c6f5b45e440e23
>>
>> Applied to:
>> - Repository:
>> - Base Branch:
>> - Commit Author:
>> - Commit Subject:
>> - Commit SHA:
>>
>> Patches
>> ----------------------------------------
>> FAIL - [oe-layersetup][PATCHv2 01/16] oe-layertool-setup: split logic=20
>> and/or expressions
>> =C2=A0=C2=A0=C2=A0=C2=A0 fatal: not a git repository (or any parent up=
 to mount point=20
>> /scratch)
>> =C2=A0=C2=A0=C2=A0=C2=A0 Stopping at filesystem boundary (GIT_DISCOVER=
Y_ACROSS_FILESYSTEM=20
>> not set).
>>
>>
>>
>=20
> How far back are you going with this test?

Doh!  No one should have been getting these emails...


--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

