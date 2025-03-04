Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BD0C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 20:54:58 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.33524.1741121692673475806
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 12:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=VSKgU9Ql;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 524KspVk3223221
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 14:54:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741121691;
	bh=enb9szaVBx7HJGohWQAMqcoAQZ6RrOyit5Zp8WfUylY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=VSKgU9QlmVRNMpmZSaH3KKtH5aF+FDMlA2AqQkltfZYzGBzN7h2RqYO7MNfwIiwWo
	 vY+SsQEnTv8FGeVioRNcCc9tcV4NktPVHKAPRS8Yc+/Ypi+3Ge3+jhSfgGY4piaOjT
	 Y0zrdTkhfIHKahVw2A7y/cIqdJ/iafpejcDG8+u4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 524KsoCO116696
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 14:54:50 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 14:54:50 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 14:54:50 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 524Kso39056268;
	Tue, 4 Mar 2025 14:54:50 -0600
Message-ID: <89dabf5c-f948-45b6-9046-75b53a274a93@ti.com>
Date: Tue, 4 Mar 2025 14:54:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-test: Add runtime
 dependencies for pytesseract
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250304060645.217310-1-a-christidis@ti.com>
 <a790bc63-0a40-44f6-94bf-da7f067ce52d@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <a790bc63-0a40-44f6-94bf-da7f067ce52d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 524KspVk3223221
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Mar 2025 20:54:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15939

Thank you for point this out.

v2 just sent.

Regards

Antonios

On 3/4/25 1:35 PM, Ryan Eatmon wrote:
>
> The subject is not quite right.=C2=A0 It should be:
>
> pytesseract: Add runtime dependencies
>
> I don't care so much about knowing this patch was for meta-arago-test=20
> or whichever layer.=C2=A0 But the first part should always contain the=20
> recipe name being updated.
>
> Please fix.
>
>
> On 3/4/2025 12:06 AM, Antonios Christidis via lists.yoctoproject.org=20
> wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Pytesseract is a python wrapper for tesseract, so it should depend on=20
>> it.
>> The pytesseract script calls the python packaging module, so add it as
>> well as a dependecy.
>>
>> This is only for scarthgap branch, as the master recipe for this packa=
ge
>> is in meta-openembedded.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>> .../recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb | 2 ++
>> =C2=A0 1 file changed, 2 insertions(+)
>>
>> diff --git=20
>> a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3=
.13.bb=20
>> b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3=
.13.bb=20
>>
>> index 91350cd5..0f505f63 100644
>> ---=20
>> a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3=
.13.bb
>> +++=20
>> b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3=
.13.bb
>> @@ -7,6 +7,8 @@ HOMEPAGE =3D "https://github.com/madmaze/pytesseract"
>> =C2=A0 LICENSE =3D "Apache-2.0"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327"
>> =C2=A0 +RDEPENDS:${PN}:append =3D "python3-packaging tesseract"
>> +
>> =C2=A0 SRC_URI[sha256sum] =3D=20
>> "4bf5f880c99406f52a3cfc2633e42d9dc67615e69d8a509d74867d3baddb5db9"
>> =C2=A0 =C2=A0 PYPI_PACKAGE =3D "pytesseract"
>

