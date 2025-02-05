Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1A6C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 20:12:10 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.22771.1738786322359107283
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 12:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=QP5gqT7N;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515KC1gB2665180
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:12:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738786321;
	bh=jcK65QPFgqKehFAFbcjph7jPe6k99SryG+M/17hD0B8=;
	h=Date:Subject:References:To:From:In-Reply-To;
	b=QP5gqT7NdUVQU0/+A9prT3c/i+KJBwunoTr3KxyW3zAJJkBAkesqiZe40j7Tiq5pD
	 9N9SnnG4mzqIAPBEVj/CjXXfHT+2ka6L2H/Wt0PvMsyoA7ABW9x02Vj2AVzRnXaRyT
	 ZyPrbkBMY9sgnHNyIMsLcNJ8ZbaOaaCNIP9zZf68=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515KC1o6008464
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:12:01 -0600
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 14:12:01 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Wed, 5 Feb
 2025 14:12:01 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 14:12:00 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515KC0Hr076006
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 14:12:00 -0600
Message-ID: <6c539a68-dd39-46ae-b101-3316ff765481@ti.com>
Date: Wed, 5 Feb 2025 14:12:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago] [PATCH 1/3] meta-arago-test: Ignore
 Compiler Warnings Patch for OpenCL-CTS
References: <20250205200411.686617-1-a-christidis@ti.com>
 <18216885381BCE4F.752@lists.yoctoproject.org>
Content-Language: en-US
To: <meta-arago@lists.yoctoproject.org>
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <18216885381BCE4F.752@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 515KC1gB2665180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 20:12:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15818

Forgot to tag the patches. All patches in this series are for scarthgap.

On 2/5/25 2:04 PM, Antonios Christidis via lists.yoctoproject.org wrote:
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
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uRdqPBfPVqwaKqYFP=
P3NsvaOW-AC0f2W5AKZr2gZk4GyKmNn6P9WH_O3f5crwuRtqfpZzQALJjaRVfm6nsYFMQwAZs=
8g$>=20
>
> ZjQcmQRYFpfptBannerEnd
> From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>
>
> Within the cmake build system, the compiler -Werror flag is enabeled.  =
This
> turns all warnings into errors and doens't allow the system to compile
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
ctoproject.org/g/meta-arago/message/15814__;!!G3vK!VU6Bx3Q5OIRRTq2hv8bOVD=
uwJFJNPEUWBXxrYPF1d_H8AjBdwcpTefEFc4WHcFSEFI5XC9ty1GZ516xqqesdeOnMeHGcxUK=
h3zxd$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/111019654/9164840__;!!G3vK!VU6Bx3Q5OIRRTq2hv8bOVDuwJFJNPEUWBXxrYPF=
1d_H8AjBdwcpTefEFc4WHcFSEFI5XC9ty1GZ516xqqesdeOnMeHGcxTPinxbc$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!VU6Bx3Q5OIRRTq2hv8bOVDuwJFJNPEUWBXxrYPF1d_H8A=
jBdwcpTefEFc4WHcFSEFI5XC9ty1GZ516xqqesdeOnMeHGcxQVuUZZq$  [a-christidis@t=
i.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

