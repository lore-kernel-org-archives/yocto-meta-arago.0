Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42780C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:11:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6323.1714626700901471276
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 May 2024 22:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=mFW+opRd;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-choudhary@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4425BW4b031569;
	Thu, 2 May 2024 00:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714626692;
	bh=azZLg0bY0z1l3kA109kVzFR4X8dqVQ/fIcKEUTA6NCo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mFW+opRd7x+WCfXjeg7/hNsXa4Nyz/lN+TS3yic6ELHXTu75pu/7/DA334DN5lG7B
	 WHuHPPvoK6lGQvhBKL6xIdthNjbiIlzqpiqJOGk6dlv/mJPYJkrIqZrXOWzT7EZngE
	 qxFtOvC6dAKRKmaAiVWggjSG9s8hoKrp8fni7gDM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4425BWGK112295
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 May 2024 00:11:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 00:11:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 00:11:32 -0500
Received: from [172.24.227.115] (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4425BTYi114842;
	Thu, 2 May 2024 00:11:30 -0500
Message-ID: <53366e0d-5e2d-4084-9e7d-dfe9c3e7e174@ti.com>
Date: Thu, 2 May 2024 10:41:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone/master][PATCH] kms++: update to the latest
 and bump version
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <denis@denix.org>
CC: <devarsht@ti.com>, <tomi.valkeinen@ideasonboard.com>, <a-limaye@ti.com>
References: <20240430094003.196209-1-j-choudhary@ti.com>
 <da9dde0d-8555-46ba-83db-3e76f5c8f477@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <da9dde0d-8555-46ba-83db-3e76f5c8f477@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 4425BW4b031569
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 May 2024 05:11:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15320



On 01/05/24 04:24, Ryan Eatmon wrote:
>=20
> Is this supposed to be for kirkstone?=C2=A0 Or did you mean scarthgap?
>=20

Are we not maintaining kirstone anymore?

This patch applies to all three branches. It applies on scarthgap too.

-Jayesh

>=20
> On 4/30/2024 4:40 AM, Jayesh Choudhary wrote:
>> ltp-ddt scripts are using latest dmabuf utilities but the current
>> source code does not have that support in kms++.
>> Bump up the SRCREV to take into account the latest dmabuf changes.
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>> =C2=A0 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb=20
>> b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>> index 2c0abaa7..bae03683 100644
>> --- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>> +++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
>> @@ -3,12 +3,12 @@ HOMEPAGE =3D "https://github.com/tomba/kmsxx"
>> =C2=A0 LICENSE =3D "MPL-2.0"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D815ca599c9df247a0c7f619bab123dad"
>> -PV =3D "2.1"
>> +PV =3D "2.2"
>> =C2=A0 PR =3D "r1"
>> =C2=A0 BRANCH =3D "master"
>> =C2=A0 SRC_URI =3D=20
>> "git://github.com/tomba/kmsxx.git;protocol=3Dhttps;branch=3D${BRANCH}"
>> -SRCREV =3D "5afc8d918f2c084acd65027604868dfde43395cf"
>> +SRCREV =3D "9ae90ce75478e49844cf984562db0dc1a074462f"
>> =C2=A0 DEPENDS =3D "drm fmt"
>=20

