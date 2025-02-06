Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B98AC02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 16:08:26 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.45038.1738858099204040550
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 08:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=L1iqLjCd;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516G8IvR2759515
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Feb 2025 10:08:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738858098;
	bh=Cjai9t9f1vkgBTybKEumFgqcWusWcFdpw7KtKnBj5Wo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=L1iqLjCdcTCgAopo1dXZaPpfWXYgo1PAwnlVoGkXk7+doeQtO6Qg/5d3xrBqDglDW
	 /yTFnPHNk92PaFa8VLq3VGPoMqcHDUz1ey7k7lH6ie6dCezFEJl0RFsDkyLJJ47qFK
	 0JfjFEM67KKDVx5VpE7vTQNU+53S5H7cUkoIWFEI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516G8Ikq004903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Feb 2025 10:08:18 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 10:08:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 10:08:17 -0600
Received: from [10.249.32.100] ([10.249.32.100])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516G8G52041010;
	Thu, 6 Feb 2025 10:08:17 -0600
Message-ID: <9522a401-e57e-49ea-a9b0-bbb7437dab35@ti.com>
Date: Thu, 6 Feb 2025 10:08:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [PATCH 1/3] meta-arago-test: Ignore Compiler
 Warnings Patch for OpenCL-CTS
To: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250205200411.686617-1-a-christidis@ti.com>
 <18216885381BCE4F.752@lists.yoctoproject.org>
 <6c539a68-dd39-46ae-b101-3316ff765481@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <6c539a68-dd39-46ae-b101-3316ff765481@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 516G8IvR2759515
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Feb 2025 16:08:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15827



On 2/5/2025 2:12 PM, Antonios Christidis via lists.yoctoproject.org wrote=
:
> Forgot to tag the patches. All patches in this series are for scarthgap.

There needs to be a master version of this patch that adds the package=20
to ti-test.


> On 2/5/25 2:04 PM, Antonios Christidis via lists.yoctoproject.org wrote=
:
>> From: Antonios Christidis <a0507488@=E2=80=8Auda0867391-2.=E2=80=8Adhc=
p.=E2=80=8Ati.=E2=80=8Acom>=20
>> Within the cmake build system, the compiler -Werror flag is enabeled.=20
>> This turns all warnings into errors and doens't allow the system to=20
>> compile correctly. Change the system
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source=
=20
>> of this email and know the content is safe.
>> Report=C2=A0Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uRdqPBfPVqwaKqYF=
PP3NsvaOW-AC0f2W5AKZr2gZk4GyKmNn6P9WH_O3f5crwuRtqfpZzQALJjaRVfm6nsYFMQwAZ=
s8g$>
>> ZjQcmQRYFpfptBannerEnd
>> From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>
>>
>> Within the cmake build system, the compiler -Werror flag is enabeled. =
=20
>> This
>> turns all warnings into errors and doens't allow the system to compile
>> correctly.=C2=A0 Change the system to ignore the 3 warning rules that =
show=20
>> up when
>> compiling.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>> =C2=A0 .../files/0001-Ignore-Compiler-Warnings.patch | 35 ++++++++++++=
+++++++
>> =C2=A0 1 file changed, 35 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-War=
nings.patch
>>
>> diff --git=20
>> a/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-W=
arnings.patch b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore=
-Compiler-Warnings.patch
>> new file mode 100644
>> index 00000000..c21db6fb
>> --- /dev/null
>> +++=20
>> b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-W=
arnings.patch
>> @@ -0,0 +1,35 @@
>> +From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 200=
1
>> +From: Antonios Christidis <a-christidis@ti.com>
>> +Date: Fri, 17 Jan 2025 15:05:39 -0600
>> +Subject: [PATCH] Ignore Compiler Warnings
>> +
>> +Within the cmake build system, the compiler -Werror flag is=20
>> enabeled.=C2=A0 This
>> +turns all warnings into errors and doens't allow the system to compil=
e
>> +correctly.=C2=A0 Change the system to ignore the 3 warning rules that=
 show=20
>> up when
>> +compiling.
>> +
>> +Upstream-Status: Inappropriate [oe specific - compilation errors due=20
>> to cross-compiling]
>> +
>> +Singed-Off-By: Antonios Christidis <a-christidis@ti.com>
>> +---
>> + CMakeLists.txt | 4 +++-
>> + 1 file changed, 3 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 5cfef6b3..71b6ddb4 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR=20
>> "${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?Clang"
>> +=C2=A0=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-error=3Dcpp) =
# Allow #warning=20
>> directive
>> +=C2=A0=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-unknown-pragm=
as) # Issue #785
>> +=C2=A0=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-error=3Dasm-o=
perand-widths) # Issue=20
>> #784
>> +-
>> ++=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-maybe-uninitialize=
d)
>> ++=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-stringop-truncatio=
n)
>> ++=C2=A0=C2=A0=C2=A0 add_cxx_flag_if_supported(-Wno-strict-aliasing)
>> +=C2=A0=C2=A0=C2=A0=C2=A0 # -msse -mfpmath=3Dsse to force gcc to use s=
se for float math,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 # avoiding excess precision problems that ca=
use tests like=20
>> int2float
>> +=C2=A0=C2=A0=C2=A0=C2=A0 # to falsely fail. -ffloat-store also works,=
 but WG suggested
>> +--
>> +2.34.1
>> +
>> --=20
>> 2.34.1
>>
>>
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15818):=20
> https://lists.yoctoproject.org/g/meta-arago/message/15818
> Mute This Topic: https://lists.yoctoproject.org/mt/111019823/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub=20
> [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

