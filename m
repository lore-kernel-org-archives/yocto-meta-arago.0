Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045D9C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 13:47:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.13870.1686318475853908798
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 06:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=EqVscvz6;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359DlqX3036035;
	Fri, 9 Jun 2023 08:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686318472;
	bh=OA+hV7nGhhPhrbJ1NMvnywL0YoiXaffBbeFDV3k1hHY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EqVscvz6THb70yKFLhgS+vnvRWbVZJVS6vLXAzW6NKaRHyMTWoxqb+tQkHa7mTpJn
	 7BkjZZwrIivUtyYrRP1KiGMgWBKI1aXm5PUj/RfvzV08JhKIpYbMJDQKjr9xCCZXAJ
	 4SMAyMglWIdoZLQoDRTm/xGKTCkiNKTEJeeqtYZY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359DlqMc118578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 08:47:52 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 08:47:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 08:47:52 -0500
Received: from [10.249.33.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359Dlq3A104639;
	Fri, 9 Jun 2023 08:47:52 -0500
Message-ID: <fe599e03-6f42-7765-2bb9-47529a934d1f@ti.com>
Date: Fri, 9 Jun 2023 08:47:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXTERNAL] Re: [oe-layersetup][PATCH 00/15] Sacrifice your first
 born to the linter
Content-Language: en-US
To: Randolph Sapp <rs@ti.com>, Andrew Davis <afd@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <nm@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230607200504.3810426-1-rs@ti.com>
 <20230608174829.GA9226@denix.org>
 <f17625d9-96c4-4638-b368-678e59a66dcb@ti.com>
 <2d09ee83-b854-0b75-7d81-e53a00173941@ti.com>
 <e8be16d6-0584-b11c-5bb2-3f3312b34192@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <e8be16d6-0584-b11c-5bb2-3f3312b34192@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 359DlqX3036035
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 13:47:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14573



On 6/8/2023 1:48 PM, Randolph Sapp wrote:
> On 6/8/23 13:32, Andrew Davis wrote:
>> On 6/8/23 1:13 PM, Randolph Sapp wrote:
>>> On 6/8/23 12:48, Denys Dmytriyenko wrote:
>>>> Do you need to correct From: and SoB: lines in all the patches?
>>>>
>>>
>>> I don't know, do I? I did this work at home at 5AM with my personal=20
>>> machine, hence my personal account being the author, signer, and=20
>>> sender. If you need me to change it I can.
>>>
>>
>> Probably fine to use your personal email if you did this completely=20
>> outside the context of work,
>> but also assuming your personal email isn't=20
>> "35777938+StaticRocket@users.noreply.github.com"..
>>
>> Andrew
>=20
> Nah, I've had a long history of obscuring my personal email. Should=20
> probably make a secondary account for stuff now that I'm actually=20
> participating in mailing list related development. Or just give up the=20
> sentiment of a private email address completely. Eh, whatever.

I would prefer you to use a more "stable" personal email address...


>>
>>>>
>>>> On Wed, Jun 07, 2023 at 03:04:49PM -0500, rs@ti.com wrote:
>>>>> From: Randolph Sapp <rs@ti.com>
>>>>>
>>>>> Last night someone in the beagle community reported some cryptic=20
>>>>> errors from
>>>>> oe-layersetup so I took the time to address all of the issues repor=
ted
>>>>> by Shellcheck and add some extra sanity checks.
>>>>>
>>>>> I tried to split it into reasonable segments.
>>>>>
>>>>> StaticRocket (15):
>>>>> =C2=A0=C2=A0 oe-layertool-setup: prefer use of $() notation
>>>>> =C2=A0=C2=A0 oe-layertool-setup: replace all x comparisons with -n/=
-z
>>>>> =C2=A0=C2=A0 oe-layertool-setup: fix all the printf calls
>>>>> =C2=A0=C2=A0 oe-layertool-setup: fix all quoting, switch eval to ex=
port
>>>>> =C2=A0=C2=A0 oe-layertool-setup: only invoke read with -r
>>>>> =C2=A0=C2=A0 oe-layertool-setup: check exit code directly
>>>>> =C2=A0=C2=A0 oe-layertool-setup: guard all cd calls
>>>>> =C2=A0=C2=A0 oe-layertool-setup: eliminate useless cat
>>>>> =C2=A0=C2=A0 oe-layertool-setup: use subshell execution with redire=
ct
>>>>> =C2=A0=C2=A0 oe-layertool-setup: guard against invalid expression i=
n case
>>>>> =C2=A0=C2=A0 oe-layertool-setup: replace all calls to echo with pri=
ntf
>>>>> =C2=A0=C2=A0 oe-layertool-setup: drop unused variable
>>>>> =C2=A0=C2=A0 oe-layertool-setup: add a path sanity check for oebase
>>>>> =C2=A0=C2=A0 oe-layertool-setup: fix multi-line printfs
>>>>> =C2=A0=C2=A0 oe-layertool-setup: add sanity check for layer names
>>>>>
>>>>> =C2=A0 oe-layertool-setup.sh | 435=20
>>>>> +++++++++++++++++++++---------------------
>>>>> =C2=A0 1 file changed, 220 insertions(+), 215 deletions(-)
>>>>>
>>>>> --=20
>>>>> 2.40.1
>>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

