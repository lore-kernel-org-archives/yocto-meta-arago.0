Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1E9C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 16:03:13 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.17319.1741276989467788190
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 08:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=odubkzqZ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526G38CM3770652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Mar 2025 10:03:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741276988;
	bh=3Fc+QfbwQw8Kv5cXLyzc9t7sxnmQsG5Xa8dh09lVzUk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=odubkzqZiuLmjuhCMpIe2sFR3oMZBtESgBXGvxfSZkD414+2yT0k1sPlySMNmdAzk
	 FKiGFsFz//fOlQQNvKM4ZJfUztxmfB7qwhb/Nc4vqB0sl7Jb6D2TXVHXYeKtKdPFA7
	 GUFdbkHuVb+850XkdMJnsHY+PA52cBrwQikO4LaU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 526G38c9054677
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Mar 2025 10:03:08 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 10:03:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 10:03:08 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526G373Y000926;
	Thu, 6 Mar 2025 10:03:08 -0600
Message-ID: <d8de6c4a-ab46-4dfc-b8a8-5db25df59cf1@ti.com>
Date: Thu, 6 Mar 2025 10:03:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH v2] ti-gc320-tests: Add
 RDEPENDS ti-gc320-libs-dev
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250306000441.408976-1-a-christidis@ti.com>
 <86cd4026-810e-49e1-8fc3-145014c14e2e@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <86cd4026-810e-49e1-8fc3-145014c14e2e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 526G38CM3770652
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Mar 2025 16:03:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15951


On 3/6/25 7:32 AM, Andrew Davis wrote:
> On 3/5/25 6:04 PM, a-christidis@ti.com wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Include the package ti-gc320-libs-dev as a runtime dependency.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>>
>> v2:
>> - Added dev-deps on INSANE_SKIP
>>
>> =C2=A0 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb | 3 ++-
>> =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git=20
>> a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0=
.11.p7.bb=20
>> b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0=
.11.p7.bb=20
>>
>> index f9b9685f..14278d76 100644
>> ---=20
>> a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0=
.11.p7.bb
>> +++=20
>> b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0=
.11.p7.bb
>> @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=3D22a001855467f373c=
47f45de5330e3c9"
>> =C2=A0 =C2=A0 DEPENDS =3D "ti-gc320-libs"
>> +RDEPENDS:${PN}:append =3D " ti-gc320-libs-dev"
>
> This should be detected and set for you based on DEPENDS. You don't
> need any change here.
>
> Andrew
>
The way DEPENDS is setup it will not include ti-gc320-libs-dev package=20
in the fs.

 =C2=A0The contents of the -dev package are required at runtime for the g=
c320=20
tests.

>> =C2=A0 =C2=A0 BRANCH =3D "ti-${PV}"
>> =C2=A0 @@ -32,5 +33,5 @@ do_install() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>> =C2=A0 }
>> =C2=A0 -INSANE_SKIP:${PN} +=3D "ldflags already-stripped libdir"
>> +INSANE_SKIP:${PN} +=3D "ldflags already-stripped libdir dev-deps"
>> =C2=A0 INSANE_SKIP:${PN}-dbg +=3D "libdir"

