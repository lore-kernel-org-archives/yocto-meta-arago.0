Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BFEC7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 18:32:36 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1947.1686249153195329019
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 11:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=a606frj2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358IWTAx009847;
	Thu, 8 Jun 2023 13:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686249149;
	bh=xfrGoA23gcF+lgZ5x+DwlnUU+l8tjEQMViEBagNqaHY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=a606frj2wRRjT8uSFdvwmYjORjMfjzVkA4wH+MVdOuqc/KS1bz+WfnxAEMSdhd4n9
	 BMojAoBamXjWx6kLDSwcM/uISiBw8UflRGLWdnuYg6qg9ZMsEivD31X1RjEywBKvJm
	 JS0z/1l2fz04BM2x4LZAcKD9wxjr9IEfw0szt8TE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358IWT3b081982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 13:32:29 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 13:32:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 13:32:29 -0500
Received: from [10.250.37.94] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358IWSaN027673;
	Thu, 8 Jun 2023 13:32:29 -0500
Message-ID: <2d09ee83-b854-0b75-7d81-e53a00173941@ti.com>
Date: Thu, 8 Jun 2023 13:32:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [oe-layersetup][PATCH 00/15] Sacrifice your first
 born to the linter
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20230607200504.3810426-1-rs@ti.com>
 <20230608174829.GA9226@denix.org>
 <f17625d9-96c4-4638-b368-678e59a66dcb@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <f17625d9-96c4-4638-b368-678e59a66dcb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 358IWTAx009847
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 18:32:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14546

On 6/8/23 1:13 PM, Randolph Sapp wrote:
> On 6/8/23 12:48, Denys Dmytriyenko wrote:
>> Do you need to correct From: and SoB: lines in all the patches?
>>
>=20
> I don't know, do I? I did this work at home at 5AM with my personal mac=
hine, hence my personal account being the author, signer, and sender. If =
you need me to change it I can.
>=20

Probably fine to use your personal email if you did this completely outsi=
de the context of work,
but also assuming your personal email isn't "35777938+StaticRocket@users.=
noreply.github.com"..

Andrew

>>
>> On Wed, Jun 07, 2023 at 03:04:49PM -0500, rs@ti.com wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Last night someone in the beagle community reported some cryptic erro=
rs from
>>> oe-layersetup so I took the time to address all of the issues reporte=
d
>>> by Shellcheck and add some extra sanity checks.
>>>
>>> I tried to split it into reasonable segments.
>>>
>>> StaticRocket (15):
>>> =C2=A0=C2=A0 oe-layertool-setup: prefer use of $() notation
>>> =C2=A0=C2=A0 oe-layertool-setup: replace all x comparisons with -n/-z
>>> =C2=A0=C2=A0 oe-layertool-setup: fix all the printf calls
>>> =C2=A0=C2=A0 oe-layertool-setup: fix all quoting, switch eval to expo=
rt
>>> =C2=A0=C2=A0 oe-layertool-setup: only invoke read with -r
>>> =C2=A0=C2=A0 oe-layertool-setup: check exit code directly
>>> =C2=A0=C2=A0 oe-layertool-setup: guard all cd calls
>>> =C2=A0=C2=A0 oe-layertool-setup: eliminate useless cat
>>> =C2=A0=C2=A0 oe-layertool-setup: use subshell execution with redirect
>>> =C2=A0=C2=A0 oe-layertool-setup: guard against invalid expression in =
case
>>> =C2=A0=C2=A0 oe-layertool-setup: replace all calls to echo with print=
f
>>> =C2=A0=C2=A0 oe-layertool-setup: drop unused variable
>>> =C2=A0=C2=A0 oe-layertool-setup: add a path sanity check for oebase
>>> =C2=A0=C2=A0 oe-layertool-setup: fix multi-line printfs
>>> =C2=A0=C2=A0 oe-layertool-setup: add sanity check for layer names
>>>
>>> =C2=A0 oe-layertool-setup.sh | 435 +++++++++++++++++++++-------------=
--------
>>> =C2=A0 1 file changed, 220 insertions(+), 215 deletions(-)
>>>
>>> --=20
>>> 2.40.1
>=20

