Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C991BC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 19:27:15 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.30543.1713295630268856697
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 12:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Xg4wGGLX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43GJR7FF013781;
	Tue, 16 Apr 2024 14:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713295627;
	bh=l42y1QJ9pDymq/vKjGJLBAMKRFpNbqNVHiKVC6Ogl94=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Xg4wGGLX9v2FqnRGgAr3Nzy3ykQ9NRvlw7mJRm9Sc2/zoHHf409+LbNI8Qgx+bxmv
	 qNcyvjaLoEQqTU0lwr59mgXzwOOjda4rnSnWLMMJd51O50ZvbQOISOVrKzUFGxqrTi
	 N8bJQnIHGyjcyN88KOwGEKjZT+oMHiC+n5Uwi3YQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43GJR7j6114563
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 14:27:07 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Apr 2024 14:27:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Apr 2024 14:27:07 -0500
Received: from [10.249.33.251] ([10.249.33.251])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43GJR6G5016039;
	Tue, 16 Apr 2024 14:27:06 -0500
Message-ID: <04ade28e-de1a-43d4-afce-3c335bec8d97@ti.com>
Date: Tue, 16 Apr 2024 14:27:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][scarthgap][PATCH] meta-arago-extras:
 packagegroups: Fix QA Issue
To: Denys Dmytriyenko <denis@denix.org>, Chirag Shilwant <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Gyan Gupta <g-gupta@ti.com>
References: <17C6AE87F40E31DD.13290@lists.yoctoproject.org>
 <2636a20d-6d1a-40d0-abc4-2d97653764b6@ti.com>
 <20240416150926.GJ28791@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240416150926.GJ28791@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 43GJR7FF013781
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Apr 2024 19:27:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15293



On 4/16/2024 10:09 AM, Denys Dmytriyenko wrote:
> On Tue, Apr 16, 2024 at 12:07:33PM +0530, Chirag Shilwant wrote:
>> Just a head's up,
>>
>> Note that the reason to send the patch on scarthgap only is to ensure =
that
>> we don't break compatibility with all the older releases we have liste=
d in
>> LAYERSERIES_COMPAT in arago master [1] as "inherit_defer" was added
>> in bitbake's latest versions
>> and someone using arago master:HEAD & bitbake 2.0 for
>> |kirkstone|based buildwill face build issues
>> related to inherit_defer.
>>
>> [1]: https://git.ti.com/cgit/arago-project/meta-arago/tree/meta-arago-=
distro/conf/layer.conf#n11
>=20
> Ah, thanks for the clarification, I didn't see this reply and just comm=
ented
> about master for the original patch.
>=20
> That said, this raises the question whether master should get its
> compatibility updated to not be compatible with kirkstone any more.

Probably.  I'll send the needed changes.

>=20
>> On 16/04/24 11:53, Chirag Shilwant via lists.yoctoproject.org wrote:
>>> - Since packagegroup.=E2=80=8Abbclass is using inherit_defer in oe-co=
re,
>>> some classes are now appearing after nativesdk resulting in
>>> following QA errors. ``` QA Issue:
>>> nativesdk-packagegroup-arago-tisdk-host: native/nativesdk class is
>>> not inherited
>>> ZjQcmQRYFpfptBannerStart
>>> This message was sent from outside of Texas Instruments.
>>> Do not click links or open attachments unless you recognize the
>>> source of this email and know the content is safe. If you wish to
>>> report this message to IT Security, please forward the message as
>>> an attachment to phishing@list.ti.com
>>> ZjQcmQRYFpfptBannerEnd
>>> - Since packagegroup.bbclass is using inherit_defer in oe-core, some =
classes are
>>> now appearing after nativesdk resulting in following QA errors.
>>>
>>>   ```
>>>    QA Issue: nativesdk-packagegroup-arago-tisdk-host: native/nativesd=
k class is not inherited last, this can result in unexpected behaviour. C=
lasses inherited after native/nativesdk: allarch.bbclass [native-last]
>>>    QA Issue: nativesdk-packagegroup-arago-qte-toolchain-host: native/=
nativesdk class is not inherited last, this can result in unexpected beha=
viour. Classes inherited after native/nativesdk: allarch.bbclass [native-=
last]
>>>
>>>   ```
>>>
>>> - To fix this issue, use inherit_defer that was added in bitbake rece=
ntly [1].
>>>
>>> [1]:https://urldefense.com/v3/__https://github.com/openembedded/bitba=
ke/commit/5c2e840eafeba1f0f754c226b87bfb674f7bea29__;!!G3vK!XlpMRQ0dPBA3U=
p6LIrRyo2n5gEKzSXWswqZ4IyG9eG84QRRtFjpT5b7c1euiHHKkt_TsDxD6JXb0myK8YtlEGL=
w0V9We6idkBab_$
>>>
>>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>>> ---
>>>   .../nativesdk-packagegroup-arago-qte-toolchain-host.bb         | 3 =
++-
>>>   .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb   | 3 =
++-
>>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-p=
ackagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/=
packagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
>>> index 4d2a98ad..23c45abf 100644
>>> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packageg=
roup-arago-qte-toolchain-host.bb
>>> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packageg=
roup-arago-qte-toolchain-host.bb
>>> @@ -2,7 +2,8 @@ DESCRIPTION =3D "Host packages for Qt Embedded SDK"
>>>   PR =3D "r10"
>>>   LICENSE =3D "MIT"
>>> -inherit packagegroup nativesdk
>>> +inherit packagegroup
>>> +inherit_defer nativesdk
>>>   RDEPENDS:${PN} =3D "\
>>>       nativesdk-packagegroup-arago-tisdk-host \
>>> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-p=
ackagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packageg=
roups/nativesdk-packagegroup-arago-tisdk-host.bb
>>> index 7e77d12f..92a80b6b 100644
>>> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packageg=
roup-arago-tisdk-host.bb
>>> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packageg=
roup-arago-tisdk-host.bb
>>> @@ -2,7 +2,8 @@ SUMMARY =3D "Host packages for a standalone Arago SDK=
 with TI tools"
>>>   PR =3D "r2"
>>>   LICENSE =3D "MIT"
>>> -inherit packagegroup nativesdk
>>> +inherit packagegroup
>>> +inherit_defer nativesdk
>>>   PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
>>> --=20
>>> 2.34.1

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

