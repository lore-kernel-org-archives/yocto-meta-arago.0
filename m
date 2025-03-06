Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF84C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 16:57:33 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.19065.1741280245082086669
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 08:57:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=i2HuAe0F;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526GvOJj128721
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Mar 2025 10:57:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741280244;
	bh=1gEscLAKJbKyC9n8aDVfR1B50DmqwJ2WeOBrCiBjUdY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=i2HuAe0Fzs6hxC/R0cRw8h+yY79WlNOOpKuYpe9aulXpQe4YSzDuk08swaIrzJ6rH
	 /Olxw7tWmn+15Z22jVTcaSBkrkAgQMTvK/mXKWaQhyTxCEC54ez31A4762syQvreaF
	 +fwWtHFISzvQtbTwZ4kCG+nlKHa726KNyILymi6Y=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 526GvOb0086278
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Mar 2025 10:57:24 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 10:57:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 10:57:23 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526GvNxD004426;
	Thu, 6 Mar 2025 10:57:23 -0600
Message-ID: <84408d91-3248-4366-b440-3d715badf112@ti.com>
Date: Thu, 6 Mar 2025 10:57:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH v2] ti-gc320-tests: Add
 RDEPENDS ti-gc320-libs-dev
To: Antonios Christidis <a-christidis@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250306000441.408976-1-a-christidis@ti.com>
 <86cd4026-810e-49e1-8fc3-145014c14e2e@ti.com>
 <d8de6c4a-ab46-4dfc-b8a8-5db25df59cf1@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <d8de6c4a-ab46-4dfc-b8a8-5db25df59cf1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 526GvOJj128721
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Mar 2025 16:57:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15952

On 3/6/25 10:03 AM, Antonios Christidis wrote:
>=20
> On 3/6/25 7:32 AM, Andrew Davis wrote:
>> On 3/5/25 6:04 PM, a-christidis@ti.com wrote:
>>> From: Antonios Christidis <a-christidis@ti.com>
>>>
>>> Include the package ti-gc320-libs-dev as a runtime dependency.
>>>
>>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>>> ---
>>>
>>> v2:
>>> - Added dev-deps on INSANE_SKIP
>>>
>>> =C2=A0 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb | 3 ++-
>>> =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc3=
20-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests=
/ti-gc320-tests_5.0.11.p7.bb
>>> index f9b9685f..14278d76 100644
>>> --- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-test=
s_5.0.11.p7.bb
>>> +++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-test=
s_5.0.11.p7.bb
>>> @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
>>> =C2=A0 LIC_FILES_CHKSUM =3D "file://dra7x-sdk-ti-gc320-tests_manifest=
.html;md5=3D22a001855467f373c47f45de5330e3c9"
>>> =C2=A0 =C2=A0 DEPENDS =3D "ti-gc320-libs"
>>> +RDEPENDS:${PN}:append =3D " ti-gc320-libs-dev"
>>
>> This should be detected and set for you based on DEPENDS. You don't
>> need any change here.
>>
>> Andrew
>>
> The way DEPENDS is setup it will not include ti-gc320-libs-dev package =
in the fs.
>=20
>  =C2=A0The contents of the -dev package are required at runtime for the=
 gc320 tests.
>=20

Why? What is going into the dev package that is needed by the tests?

Andrew

>>> =C2=A0 =C2=A0 BRANCH =3D "ti-${PV}"
>>> =C2=A0 @@ -32,5 +33,5 @@ do_install() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>> =C2=A0 }
>>> =C2=A0 -INSANE_SKIP:${PN} +=3D "ldflags already-stripped libdir"
>>> +INSANE_SKIP:${PN} +=3D "ldflags already-stripped libdir dev-deps"
>>> =C2=A0 INSANE_SKIP:${PN}-dbg +=3D "libdir"

