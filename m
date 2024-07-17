Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B61C3DA59
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 01:36:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5782.1721180206278627126
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 18:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=bsDFx1lJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46H1acFL073554;
	Tue, 16 Jul 2024 20:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721180198;
	bh=JZx6v9L+PglJd8pfSZLwDOHYR3JIRY2gPCFVoFzmqv8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bsDFx1lJgquD2pf8NS8mMju2YMGJqfEzfOmyGoPABYcGlzfZG3S9EEx7wUpelFBWs
	 3iDs6pfICpcr2E7TTHOhPCJJUJceToh2p7l0TZTznbh7UWRrvcbburkE7Y2A5vAIxA
	 QJ0qQXDB+vZYHP6WQc8mdN0LCh2+pHklyxeafdmA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46H1acA2057116
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 20:36:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 20:36:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 20:36:38 -0500
Received: from [10.249.34.122] ([10.249.34.122])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46H1acah096263;
	Tue, 16 Jul 2024 20:36:38 -0500
Message-ID: <31f1102b-1f05-448c-bda5-a4f9ebecdaf4@ti.com>
Date: Tue, 16 Jul 2024 20:36:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master][PATCH] ti-llvm: adopt an LLVM fix for
 buildpaths errors
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240716015013.3051611-1-denis@denix.org>
 <20240716015013.3051611-2-denis@denix.org>
 <17E2D909CD64B7EE.6764@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17E2D909CD64B7EE.6764@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 46H1acFL073554
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Jul 2024 01:36:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15455



On 7/16/2024 7:37 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 7/15/2024 8:50 PM, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> Make sure llvm-configs doesn't have absolute build paths.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>> =C2=A0 meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 5 +++++
>> =C2=A0 1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb=20
>> b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>> index 4b990b7f..810c603b 100644
>> --- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>> +++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>> @@ -62,6 +62,11 @@ EXTRA_OECONF +=3D "=20
>> --enable-targets=3D"host,arm,c6000,msp430" \
>> =C2=A0 EXTRA_OEMAKE +=3D "LIBXML2_INC=3D"${LIBXML2_INC}"=20
>> LIBXML2_LIBS=3D"${LIBXML2_LIBS}""
>> +# patch out build host paths for reproducibility
>> +do_compile:prepend() {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e "s,${WORKDIR},,g=
"=20
>> ${LLVM_BUILD_DIR}/tools/llvm-config/Release/BuildVariables.inc
>> +}
>> +
>> =C2=A0 do_compile:class-native() {
>> =C2=A0=C2=A0=C2=A0 cd ${LLVM_BUILD_DIR}
>=20
> I'm getting build errors with this.
>=20
> native:
>=20
> sed: can't read=20
> /scratch/jenkins_builds/arago-master-wip/build/build/arago-tmp-default-=
glibc/work/x86_64-linux/ti-llvm3.6-native/3.6/llvm-3.6.build/tools/llvm-c=
onfig/Release/BuildVariables.inc: No such file or directory
>=20
> nativesdk:
>=20
> sed: can't read=20
> /scratch/jenkins_builds/arago-master-wip/build/build/arago-tmp-default-=
glibc/work/x86_64-nativesdk-arago-linux/nativesdk-ti-llvm3.6/3.6/llvm-3.6=
.build/tools/llvm-config/Release/BuildVariables.inc: No such file or dire=
ctory
>=20

I think that during the build it creates this file, but before the=20
builds the files does not exist yet.  Maybe you tested this against a=20
built directory where the file existed but from a clean dir it fails?


--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

