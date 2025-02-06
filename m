Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44929C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 16:27:46 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.45570.1738859256229963002
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 08:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=g0doSgAd;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516GRZok2836296
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Feb 2025 10:27:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738859255;
	bh=guOdLeagLcTN79zko42SBPvf14QCKw0bZD7qzHwDpKk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=g0doSgAdZsh3GT/hcZWdHpmbSYfz7r13LbqPQEh3zAo/x++MQt6zB+v5NNrRmmJPW
	 vSxQ3496CCOeqmWzW+6G6UOEBv/VXEqGby5Z77lo616/yLCOXrIPBWf4tgv267T5SU
	 X3Ej2IvOxXEjgAzn8/hTfvzhfPvHf3fZxDkZ4FnM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516GRZxI017356
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 6 Feb 2025 10:27:35 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 10:27:35 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 10:27:35 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516GRX3A065610;
	Thu, 6 Feb 2025 10:27:34 -0600
Message-ID: <35cba39b-148b-49ec-8a1b-8480afe363ea@ti.com>
Date: Thu, 6 Feb 2025 21:57:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago] [PATCH 1/3] meta-arago-test: Ignore
 Compiler Warnings Patch for OpenCL-CTS
To: <a-christidis@ti.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20250205200411.686617-1-a-christidis@ti.com>
 <20250205200411.686617-2-a-christidis@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250205200411.686617-2-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 516GRZok2836296
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Feb 2025 16:27:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15829


On 06/02/25 01:34, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a0507488@=E2=80=8Auda0867391-2.=E2=80=8Adhcp=
.=E2=80=8Ati.=E2=80=8Acom>=20
> Within the cmake build system, the compiler -Werror flag is enabeled.=20
> This turns all warnings into errors and doens't allow the system to=20
> compile correctly. Change the system
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uRdqXRfP1m1bKqYkP=
NMD_F8gldlTqLdGpJz9zdNE3i7SGylNrydwCm3CzQOW3Meo6Sa62BDFt95wryJu21hgPsXsYH=
0$>=20
>
> ZjQcmQRYFpfptBannerEnd
> From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>
>
> Within the cmake build system, the compiler -Werror flag is enabeled.



enabled



>    This
> turns all warnings into errors and doens't


doesn't



--
Chirag


> allow the system to compile
> correctly.  Change the system to ignore the 3 warning rules that show u=
p when
> compiling.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../files/0001-Ignore-Compiler-Warnings.patch | 35 ++++++++++++++++++=
+
>   1 file changed, 35 insertions(+)
>   create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001=
-Ignore-Compiler-Warnings.patch
>
> diff --git a/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-=
Compiler-Warnings.patch b/meta-arago-test/recipes-graphics/opencl/files/0=
001-Ignore-Compiler-Warnings.patch
> new file mode 100644
> index 00000000..c21db6fb
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compile=
r-Warnings.patch
> @@ -0,0 +1,35 @@
> +From 082ce10dd191f036f5a6e1fb31134e9736ba3643 Mon Sep 17 00:00:00 2001
> +From: Antonios Christidis <a-christidis@ti.com>
> +Date: Fri, 17 Jan 2025 15:05:39 -0600
> +Subject: [PATCH] Ignore Compiler Warnings
> +
> +Within the cmake build system, the compiler -Werror flag is enabeled. =
 This
> +turns all warnings into errors and doens't allow the system to compile
> +correctly.  Change the system to ignore the 3 warning rules that show =
up when
> +compiling.
> +
> +Upstream-Status: Inappropriate [oe specific - compilation errors due t=
o cross-compiling]
> +
> +Singed-Off-By: Antonios Christidis <a-christidis@ti.com>
> +---
> + CMakeLists.txt | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5cfef6b3..71b6ddb4 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPILE=
R_ID}" MATCHES "(Apple)?Clang"
> +     add_cxx_flag_if_supported(-Wno-error=3Dcpp) # Allow #warning dire=
ctive
> +     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
> +     add_cxx_flag_if_supported(-Wno-error=3Dasm-operand-widths) # Issu=
e #784
> +-
> ++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
> ++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
> ++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
> +     # -msse -mfpmath=3Dsse to force gcc to use sse for float math,
> +     # avoiding excess precision problems that cause tests like int2fl=
oat
> +     # to falsely fail. -ffloat-store also works, but WG suggested
> +--
> +2.34.1
> +
> --=20
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15814):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15814__;!!G3vK!SE5kwceOXxQ9IuoC2fBFl3=
0oafkus7SzSXSWEgBIwu7_kSG2I-9KQsM5mi9PdnXTyk4UG1bc8v9HTGCGee0L1ERDCn8tCKN=
QedRA$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/111019654/7030289__;!!G3vK!SE5kwceOXxQ9IuoC2fBFl30oafkus7SzSXSWEgB=
Iwu7_kSG2I-9KQsM5mi9PdnXTyk4UG1bc8v9HTGCGee0L1ERDCn8tCP6o9QNC$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!SE5kwceOXxQ9IuoC2fBFl30oafkus7SzSXSWEgBIwu7_k=
SG2I-9KQsM5mi9PdnXTyk4UG1bc8v9HTGCGee0L1ERDCn8tCJ3iflM5$  [c-shilwant@ti.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

