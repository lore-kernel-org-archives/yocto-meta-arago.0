Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF39C3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 13:46:14 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.15536.1721223966462868418
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Jul 2024 06:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=uzQpOPU0;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46HDjx98024603;
	Wed, 17 Jul 2024 08:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721223959;
	bh=AWbzJ1iLmFjy+wyT02H44eCrvEqPiqkSqyPekO1lONs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uzQpOPU0O13X3i73SVpc57fBapwMVz9d0xOsBqkQCwwKz74Ra6z6z6yD0ZPTTU2l5
	 6nS1xPETx+mXYoV6AUhNuFL5vTuVeancKGxfR9PpKAYciwcXRAYoQQIsaum7Hkzw1G
	 9WpJNbkUqFtwRkZ1LhWBRL7F3++qH59Dg0576nRo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46HDjxh0073888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jul 2024 08:45:59 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 08:45:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 08:45:58 -0500
Received: from [10.249.34.122] ([10.249.34.122])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46HDjw98026219;
	Wed, 17 Jul 2024 08:45:58 -0500
Message-ID: <1de9d49f-4f0b-4f34-b956-02d0acd98290@ti.com>
Date: Wed, 17 Jul 2024 08:45:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH] ti-llvm: adopt an LLVM fix for
 buildpaths errors
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240716015013.3051611-1-denis@denix.org>
 <20240716015013.3051611-2-denis@denix.org>
 <17E2D909CD64B7EE.6764@lists.yoctoproject.org>
 <17E2DC4752C1D1A6.6764@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17E2DC4752C1D1A6.6764@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 46HDjx98024603
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Jul 2024 13:46:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15456



On 7/16/2024 8:36 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 7/16/2024 7:37 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 7/15/2024 8:50 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> Make sure llvm-configs doesn't have absolute build paths.
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>> =C2=A0 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 5 ++++=
+
>>> =C2=A0 1 file changed, 5 insertions(+)
>>>
>>> diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb=20
>>> b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>>> index 4b990b7f..810c603b 100644
>>> --- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>>> +++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>>> @@ -62,6 +62,11 @@ EXTRA_OECONF +=3D "=20
>>> --enable-targets=3D"host,arm,c6000,msp430" \
>>> =C2=A0 EXTRA_OEMAKE +=3D "LIBXML2_INC=3D"${LIBXML2_INC}"=20
>>> LIBXML2_LIBS=3D"${LIBXML2_LIBS}""
>>> +# patch out build host paths for reproducibility
>>> +do_compile:prepend() {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e "s,${WORKDIR},,=
g"=20
>>> ${LLVM_BUILD_DIR}/tools/llvm-config/Release/BuildVariables.inc
>>> +}
>>> +
>>> =C2=A0 do_compile:class-native() {
>>> =C2=A0=C2=A0=C2=A0 cd ${LLVM_BUILD_DIR}
>>
>> I'm getting build errors with this.
>>
>> native:
>>
>> sed: can't read=20
>> /scratch/jenkins_builds/arago-master-wip/build/build/arago-tmp-default=
-glibc/work/x86_64-linux/ti-llvm3.6-native/3.6/llvm-3.6.build/tools/llvm-=
config/Release/BuildVariables.inc: No such file or directory
>>
>> nativesdk:
>>
>> sed: can't read=20
>> /scratch/jenkins_builds/arago-master-wip/build/build/arago-tmp-default=
-glibc/work/x86_64-nativesdk-arago-linux/nativesdk-ti-llvm3.6/3.6/llvm-3.=
6.build/tools/llvm-config/Release/BuildVariables.inc: No such file or dir=
ectory
>>
>=20
> I think that during the build it creates this file, but before the=20
> builds the files does not exist yet.=C2=A0 Maybe you tested this agains=
t a=20
> built directory where the file existed but from a clean dir it fails?
>=20

Also, it looks the contents of the BuildVariables.inc might be in a=20
"bad" state with this change.  But I could be wrong as I don't know how=20
all of this package works.

#define LLVM_SRC_ROOT "/git"
#define LLVM_OBJ_ROOT "/llvm-3.6.build"

By just replacing the WORKDIR with "" we are pointing this file to the=20
root directory where I doubt these things will be living.  Again,=20
without knowing how this package works and uses those two variables I=20
can't speak as to the correctness of this.  I agree it fixes the=20
buildpaths issue, but does it break the software package at that point?



--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

