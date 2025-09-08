Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C94CAC586
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 13:47:54 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.14079.1757339274138767640
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 06:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=AKu+6vjR;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588DlrSb062702
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 08:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757339273;
	bh=EysVMjzDiHvdNhtgWJEo2/BoVe/fNRI61mHcs8VlVNU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=AKu+6vjRaNnMYcZXXgHW6Mz6EM17vCJNnBnXkdMpCJObALx2xIiSKdG8yBCpGPV9D
	 wNurvwg6ZiA9LQwqIixTczlQsEv0PNfbSQZJ5m+nZry5rzC2mbTOOPlp+cuBi1wd3g
	 xwzP3gzefuUKD+e7eLJ2u9x1HuZUDRC0txvlGOQg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588Dlr9r3040363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 8 Sep 2025 08:47:53 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 08:47:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 08:47:53 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588DlqqM689601;
	Mon, 8 Sep 2025 08:47:53 -0500
Message-ID: <4e4ea3ea-8c63-454c-8a59-cc6ec34d0a91@ti.com>
Date: Mon, 8 Sep 2025 08:47:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 0/3] opencl-clhpp v2.0.16 ->
 v2024.05.08
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <reatmon@ti.com>
References: <20250905233849.2506703-1-a-christidis@ti.com>
 <e7e456cd-e8b6-4998-946b-36d01381211b@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <e7e456cd-e8b6-4998-946b-36d01381211b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 588DlrSb062702
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 08 Sep 2025 13:47:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16543

Dear Andrew,


Mistake on my end, this series is meant for scarthgap not master.

Sorry !


Kind Regards,

Antonios

On 9/5/25 8:34 PM, Andrew Davis wrote:
> On 9/5/25 6:38 PM, Antonios Christidis via lists.yoctoproject.org wrote=
:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Dear all,
>>
>> The C OpenCL Headers are on version 2024.05.08, however the C++ are=20
>> lagging
>> behind. With this patch series, I am bumping the C++ OpenCL headers=20
>> also to
>> version 2024.05.08.
>
> I was going to suggest just updating these in meta-oe upstream, but loo=
ks
> like the latest master branch has both the C and C++ headers at=20
> 2025.07.22
> now, do you still need this at all on our master branch?
>
> Andrew
>
>>
>> The C++ headers, depend on cmake files from the C headers. The current
>> package was not providing them. I made some changes to correct this.
>>
>> This series is a v2 to the following:
>> https://patchwork.yoctoproject.org/project/arago/list/?series=3D34239&=
state=3D*=20
>>
>>
>> Kind Regards,
>> Antonios
>>
>>
>> Antonios Christidis (3): meta-arago-test: recipes-extended: Cmake=20
>> support
>> for opencl-headers meta-arago-test: recipes-extended: Specify correct =
PV
>> for ocl headers meta-arago-test: recipes-extended: opencl-clhpp=20
>> v2.0.16 ->
>> v2024.05.08
>>
>> =C2=A0 .../opencl/opencl-clhpp_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
>> .../recipes-extended/opencl/opencl_clhpp-ti.inc=C2=A0 |=C2=A0 7 ++++++=
+
>> .../opencl/opencl_headers-ti.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 16 ++++++++++=
++++++ 3
>> files changed, 27 insertions(+) create mode 100644
>> meta-arago-test/recipes-extended/opencl/opencl-clhpp_%.bbappend=20
>> create mode
>> 100644 meta-arago-test/recipes-extended/opencl/opencl_clhpp-ti.inc
>>
>> -- 2.34.1
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16537):=20
>> https://lists.yoctoproject.org/g/meta-arago/message/16537
>> Mute This Topic: https://lists.yoctoproject.org/mt/115092087/3619733
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
>> [afd@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>

