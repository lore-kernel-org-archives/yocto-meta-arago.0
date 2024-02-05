Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619C9C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 23:04:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.8762.1707174268375418910
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 15:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Y0zRdlmE;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415N4Njr068918;
	Mon, 5 Feb 2024 17:04:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707174263;
	bh=n8LxeV9oipYBEvwcckW7RiPDIx/nbc3LmVYmGgTh+XM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y0zRdlmEe51qao6C0J1iZ4NCketLukv7pUZYxh5oy+Fy7VouhvcJiTb3/s+SdSoGN
	 5+WCaEc420hO3DMDVA/poM4UJVMsrIzaR1Ry+2H8cf2f8pb0ZXeHzMyKKG1pWYBFKJ
	 925Lk2Isg3jAZHDx9h6/SmDy9KBddzJDHTWXW5fs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415N4Nb9022618
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 17:04:23 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 17:04:22 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 17:04:23 -0600
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415N4Nek047806;
	Mon, 5 Feb 2024 17:04:23 -0600
Message-ID: <aeb9fdad-97c7-46b8-91ea-d0adf15acdb4@ti.com>
Date: Mon, 5 Feb 2024 17:04:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone][PATCH] recipes-devtools: mtd-utils:
 Switch to infraroot.at for https over git protocol
Content-Language: en-US, en-US-large
To: <c-shilwant@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20240129095834.77985-1-c-shilwant@ti.com>
 <17B1188AFDC73564.26550@lists.yoctoproject.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <17B1188AFDC73564.26550@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 415N4Njr068918
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Feb 2024 23:04:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15112

On 2/5/24 16:38, Randolph Sapp via lists.yoctoproject.org wrote:
> On 1/29/24 03:58, Chirag Shilwant via lists.yoctoproject.org wrote:
>> - In past, there have been issues in do_fetch from infradead.org over=20
>> git protocol in proxy based network [1].
>>
>> - As per the latest release announcement from mtd-utils, infraroot.at=20
>> is the official mirror for infradead.org [2].
>>
>> - Since infradead.org has fetch failures over git, start using=20
>> infraroot.at over https in SRC_URI.
>>
>> Reference
>> ---------
>> [1]=20
>> https://e2e.ti.com/support/processors-group/processors/f/processors-fo=
rum/962170/processor-sdk-am65x-how-to-resolve-the-fetch-error-that-occurs=
-when-executing-bitbake
>> [2]=20
>> https://lists.infradead.org/pipermail/linux-mtd/2023-August/100922.htm=
l
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 .../recipes-devtools/mtd/mtd-utils_git.bbappend=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 +++++++-
>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git=20
>> a/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend=20
>> b/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
>> index aec6a1ac..341d0600 100644
>> --- a/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
>> +++ b/meta-arago-test/recipes-devtools/mtd/mtd-utils_git.bbappend
>> @@ -1,4 +1,10 @@
>> -PR:append =3D ".arago1"
>> +PR:append =3D ".arago2"
>> +
>> +SRC_URI:remove =3D "git://git.infradead.org/mtd-utils.git;branch=3Dma=
ster \
>> +"
>> +
>> +SRC_URI:prepend =3D=20
>> "git://git.infraroot.at/mtd-utils.git;branch=3Dmaster;protocol=3Dhttps=
 \
>> +"
>> =C2=A0 BBCLASSEXTEND +=3D "nativesdk"
>=20
> This could be simplified as just:
> MIRRORS +=3D "git://git.infradead.org/.*=20
> git://git.infraroot.at/PATH;protocol=3Dhttps"
>=20
> Which could be upstreamable since I imagine this has been hitting a few=
=20
> people and oe-core already has a few packages that update the MIRROR va=
r.
>=20

Actually, it could be even shorter:
MIRRORS +=3D "git://git.infradead.org/.* git://git.infraroot.at/PATH"

As the git fetcher has built in fail-over logic that will catch https if=20
the git protocol fails anyway.

