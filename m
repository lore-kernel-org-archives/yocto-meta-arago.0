Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19D0C3DA62
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 17:04:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3673.1721235841206238756
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Jul 2024 10:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=H8dbHbcl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46HH3vkf073951;
	Wed, 17 Jul 2024 12:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721235837;
	bh=HpSbyqgltBAV9E4Vc5TbLpZeC8OGGdSZgna1quBALj0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=H8dbHbclC8P74SWnnWPS12XT0L2F0jOi1h8zy/q8o2QN9spnfJBlwXFZPnTmEI9dM
	 y9/G5gjn7WELe9AfoR4OW9Uv/dLXiOwSc13RvPcb/l5KnS/xCrhyGJjTOwiylBsaRr
	 0ehSiSKRcsTs9XaSLEOveIxaTm7Gn0x/WQavPh9E=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46HH3vpA003811
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jul 2024 12:03:57 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 12:03:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 12:03:57 -0500
Received: from [10.249.34.122] ([10.249.34.122])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46HH3vLA095705;
	Wed, 17 Jul 2024 12:03:57 -0500
Message-ID: <c65c9f0a-b038-4abc-9c83-6469ae0bdeb2@ti.com>
Date: Wed, 17 Jul 2024 12:03:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH] ti-llvm: adopt an LLVM fix for
 buildpaths errors
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
References: <20240716015013.3051611-1-denis@denix.org>
 <20240716015013.3051611-2-denis@denix.org>
 <17E2D909CD64B7EE.6764@lists.yoctoproject.org>
 <17E2DC4752C1D1A6.6764@lists.yoctoproject.org>
 <1de9d49f-4f0b-4f34-b956-02d0acd98290@ti.com>
 <20240717165638.GD17572@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240717165638.GD17572@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 46HH3vkf073951
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Jul 2024 17:04:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15458



On 7/17/2024 11:56 AM, Denys Dmytriyenko wrote:
> On Wed, Jul 17, 2024 at 08:45:58AM -0500, Ryan Eatmon wrote:
>>
>>
>> On 7/16/2024 8:36 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>
>>>
>>> On 7/16/2024 7:37 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>
>>>>
>>>> On 7/15/2024 8:50 PM, Denys Dmytriyenko wrote:
>>>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>>>
>>>>> Make sure llvm-configs doesn't have absolute build paths.
>>>>>
>>>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>>>> ---
>>>>>  =C2=A0 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 5 +=
++++
>>>>>  =C2=A0 1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>>>>> b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>>>>> index 4b990b7f..810c603b 100644
>>>>> --- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>>>>> +++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>>>>> @@ -62,6 +62,11 @@ EXTRA_OECONF +=3D "
>>>>> --enable-targets=3D"host,arm,c6000,msp430" \
>>>>>  =C2=A0 EXTRA_OEMAKE +=3D "LIBXML2_INC=3D"${LIBXML2_INC}"
>>>>> LIBXML2_LIBS=3D"${LIBXML2_LIBS}""
>>>>> +# patch out build host paths for reproducibility
>>>>> +do_compile:prepend() {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e "s,${WORKDIR}=
,,g"
>>>>> ${LLVM_BUILD_DIR}/tools/llvm-config/Release/BuildVariables.inc
>>>>> +}
>>>>> +
>>>>>  =C2=A0 do_compile:class-native() {
>>>>>  =C2=A0=C2=A0=C2=A0 cd ${LLVM_BUILD_DIR}
>>>>
>>>> I'm getting build errors with this.
>>>>
>>>> native:
>>>>
>>>> sed: can't read /scratch/jenkins_builds/arago-master-wip/build/build=
/arago-tmp-default-glibc/work/x86_64-linux/ti-llvm3.6-native/3.6/llvm-3.6=
.build/tools/llvm-config/Release/BuildVariables.inc:
>>>> No such file or directory
>>>>
>>>> nativesdk:
>>>>
>>>> sed: can't read /scratch/jenkins_builds/arago-master-wip/build/build=
/arago-tmp-default-glibc/work/x86_64-nativesdk-arago-linux/nativesdk-ti-l=
lvm3.6/3.6/llvm-3.6.build/tools/llvm-config/Release/BuildVariables.inc:
>>>> No such file or directory
>>>>
>>>
>>> I think that during the build it creates this file, but before the
>>> builds the files does not exist yet.=C2=A0 Maybe you tested this
>>> against a built directory where the file existed but from a clean
>>> dir it fails?
>>>
>>
>> Also, it looks the contents of the BuildVariables.inc might be in a
>> "bad" state with this change.  But I could be wrong as I don't know
>> how all of this package works.
>>
>> #define LLVM_SRC_ROOT "/git"
>> #define LLVM_OBJ_ROOT "/llvm-3.6.build"
>>
>> By just replacing the WORKDIR with "" we are pointing this file to
>> the root directory where I doubt these things will be living.
>> Again, without knowing how this package works and uses those two
>> variables I can't speak as to the correctness of this.  I agree it
>> fixes the buildpaths issue, but does it break the software package
>> at that point?
>=20
> This is exactly what OE-Core does with upstream LLVM.
>=20

Good enough for me then. =3D)

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

