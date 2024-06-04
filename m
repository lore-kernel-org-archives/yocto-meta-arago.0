Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E150C25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 05:46:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.14567.1717480013461743610
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Jun 2024 22:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=nWIP6bTX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4545kr9m033940
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Jun 2024 00:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717480013;
	bh=UUNjZzpNjT/8SClBct+pSwlkDCviJ8ihaf1nuTTwg4U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nWIP6bTXgSB+Wf2btIsOEgy7tUl93GV6qAIVoQRxd7+JEql8LmnaC0fJEwKsuS2KX
	 uhf1xocuOeBnJ2kl73UHWfp0xIViS4F8ZI10E4foa9RimsNtMAaR4hS+9BvjhIlFiX
	 KKhopRCJDQK77xfockOn9vfGuKgkrK+HXfAP2rno=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4545kqE5094974
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Jun 2024 00:46:53 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 00:46:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 00:46:52 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4545kogP029603;
	Tue, 4 Jun 2024 00:46:51 -0500
Message-ID: <b0b575d6-52d7-473d-ad1e-9c11aa0d43af@ti.com>
Date: Tue, 4 Jun 2024 11:16:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] recipes-core:
 packagegroup-arago-tisdk-addons: Add back kmscube
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
References: <20240603063846.2815948-1-c-shilwant@ti.com>
 <d43cd99f-7f9f-4a54-8e4b-ee9158d93e7c@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <d43cd99f-7f9f-4a54-8e4b-ee9158d93e7c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 4545kr9m033940
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Jun 2024 05:46:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15358

Hi Ryan,
On 03/06/24 21:53, Ryan Eatmon wrote:
>
>
> On 6/3/2024 1:38 AM, Chirag Shilwant wrote:
>> - kmscube was earlier packaged as a run time dependency for matrix-gui.
>> But now as matrix-gui is removed [1], add kmscube manually.
>>
>> - kmscube can be used by developers to quickly validate the GPU and=20
>> display
>> after driver or userspace changes. So it is good to add it back.
>>
>> [1]:=20
>> https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=3Dmaster&id=
=3De4b33fbc34aa90d156310b3cd1cb23f1d0cadab4
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> .../packagegroups/packagegroup-arago-tisdk-addons.bb | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git=20
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd=
k-addons.bb=20
>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd=
k-addons.bb=20
>>
>> index 8dbffa81..d25c9eb1 100644
>> ---=20
>> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd=
k-addons.bb
>> +++=20
>> b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd=
k-addons.bb
>> @@ -79,6 +79,7 @@ EXTRA_PACKAGES =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nodejs-npm \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 protobuf \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ccief-basic \
>> +=C2=A0=C2=A0=C2=A0 kmscube \
>> =C2=A0 "
>
> Previously the kmscube was only included for builds that support=20
> graphics.=C2=A0 This change just adds it in for all builds.=C2=A0 I thi=
nk we=20
> need to limit the scope of when it gets added in.
>
> Plus, is tisdk-addons the right place to add this?=C2=A0 Versus=20
> tisdk-graphics?=C2=A0 I think tisdk-graphics is already gated behind th=
e=20
> check that I was mentioning above.



Agreed! Sent a v2 patch -=20
https://lists.yoctoproject.org/g/meta-arago/message/15357



>
>
>
>
>> =C2=A0 EXTRA_PACKAGES:omapl138 =3D " \
>

