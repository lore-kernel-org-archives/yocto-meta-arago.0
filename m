Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482B0C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 18:48:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2328.1686250085648337479
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 11:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=LejCh8Pb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358Im1TB013720;
	Thu, 8 Jun 2023 13:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686250081;
	bh=0KHqy8Kxtxmyyo/XdQLjJKO388Hgg+epqSCceKYe/oM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LejCh8PbO6fprCUAVo3KV+bi1CSOJP8POvU7FtS4QaALIV4gddLeRdHO24a57sIAe
	 4D854mshXFCTRxB3o1EzErLuOyDAzBAJoWw/Iqx+WlGEgOksx2ruFCrL+m0AJM41RM
	 N0OE1IaJk0np89tanBVQQewa6yPLSCHnp4IJ+X2o=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358Im1lP113308
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 13:48:01 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 13:48:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 13:48:01 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358Im0w8039286;
	Thu, 8 Jun 2023 13:48:01 -0500
Message-ID: <e8be16d6-0584-b11c-5bb2-3f3312b34192@ti.com>
Date: Thu, 8 Jun 2023 13:48:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [EXTERNAL] Re: [oe-layersetup][PATCH 00/15] Sacrifice your first
 born to the linter
Content-Language: en-US, en-US-large
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230607200504.3810426-1-rs@ti.com>
 <20230608174829.GA9226@denix.org>
 <f17625d9-96c4-4638-b368-678e59a66dcb@ti.com>
 <2d09ee83-b854-0b75-7d81-e53a00173941@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <2d09ee83-b854-0b75-7d81-e53a00173941@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 358Im1TB013720
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 18:48:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14549

On 6/8/23 13:32, Andrew Davis wrote:
> On 6/8/23 1:13 PM, Randolph Sapp wrote:
>> On 6/8/23 12:48, Denys Dmytriyenko wrote:
>>> Do you need to correct From: and SoB: lines in all the patches?
>>>
>>
>> I don't know, do I? I did this work at home at 5AM with my personal=20
>> machine, hence my personal account being the author, signer, and=20
>> sender. If you need me to change it I can.
>>
>=20
> Probably fine to use your personal email if you did this completely=20
> outside the context of work,
> but also assuming your personal email isn't=20
> "35777938+StaticRocket@users.noreply.github.com"..
>=20
> Andrew

Nah, I've had a long history of obscuring my personal email. Should=20
probably make a secondary account for stuff now that I'm actually=20
participating in mailing list related development. Or just give up the=20
sentiment of a private email address completely. Eh, whatever.

>=20
>>>
>>> On Wed, Jun 07, 2023 at 03:04:49PM -0500, rs@ti.com wrote:
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> Last night someone in the beagle community reported some cryptic=20
>>>> errors from
>>>> oe-layersetup so I took the time to address all of the issues report=
ed
>>>> by Shellcheck and add some extra sanity checks.
>>>>
>>>> I tried to split it into reasonable segments.
>>>>
>>>> StaticRocket (15):
>>>> =C2=A0=C2=A0 oe-layertool-setup: prefer use of $() notation
>>>> =C2=A0=C2=A0 oe-layertool-setup: replace all x comparisons with -n/-=
z
>>>> =C2=A0=C2=A0 oe-layertool-setup: fix all the printf calls
>>>> =C2=A0=C2=A0 oe-layertool-setup: fix all quoting, switch eval to exp=
ort
>>>> =C2=A0=C2=A0 oe-layertool-setup: only invoke read with -r
>>>> =C2=A0=C2=A0 oe-layertool-setup: check exit code directly
>>>> =C2=A0=C2=A0 oe-layertool-setup: guard all cd calls
>>>> =C2=A0=C2=A0 oe-layertool-setup: eliminate useless cat
>>>> =C2=A0=C2=A0 oe-layertool-setup: use subshell execution with redirec=
t
>>>> =C2=A0=C2=A0 oe-layertool-setup: guard against invalid expression in=
 case
>>>> =C2=A0=C2=A0 oe-layertool-setup: replace all calls to echo with prin=
tf
>>>> =C2=A0=C2=A0 oe-layertool-setup: drop unused variable
>>>> =C2=A0=C2=A0 oe-layertool-setup: add a path sanity check for oebase
>>>> =C2=A0=C2=A0 oe-layertool-setup: fix multi-line printfs
>>>> =C2=A0=C2=A0 oe-layertool-setup: add sanity check for layer names
>>>>
>>>> =C2=A0 oe-layertool-setup.sh | 435=20
>>>> +++++++++++++++++++++---------------------
>>>> =C2=A0 1 file changed, 220 insertions(+), 215 deletions(-)
>>>>
>>>> --=20
>>>> 2.40.1
>>


