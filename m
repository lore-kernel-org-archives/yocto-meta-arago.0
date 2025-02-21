Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C897C021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 16:40:05 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.27677.1740156004684814731
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 08:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Vc2cgtlC;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51LGe3E6896827
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 10:40:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740156004;
	bh=GxV6mz3TXHjSpVzUfD9SJCM+yqT2ttsphUradDRi7xk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Vc2cgtlCqtksc7b36BhtfcH6YA7/BmqEkL2rUXEpjJw0ummmz8GCMXda2OcijrY/w
	 0Iqmv8vGd+ED0cUAvc060Ue5O4Lg+AxV0zKB5ckvf3ug71lrsKee4DNVequPFNqm/X
	 NHun9XZiJ84Kr2e3sirKFqtPX5743cn49ZSNPneo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51LGe3vB018147
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 10:40:03 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 10:40:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 10:40:03 -0600
Received: from [10.249.33.110] ([10.249.33.110])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LGe3Ki090141;
	Fri, 21 Feb 2025 10:40:03 -0600
Message-ID: <40b76a47-e1e5-479b-a962-2d7e43646b4a@ti.com>
Date: Fri, 21 Feb 2025 10:40:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH 2/3 v3] meta-arago-test: ignore
 compiler warnings patch for opencl-cts
To: <a-christidis@ti.com>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20250220210359.214628-1-a-christidis@ti.com>
 <20250220210359.214628-3-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250220210359.214628-3-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 16:40:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15887



On 2/20/2025 3:03 PM, a-christidis@ti.com wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Within the cmake build system, the compiler -Werror flag is enabled.  This
> turns all warnings into errors and doesn't allow the system to compile
> correctly.  Change the system to ignore the 3 warning rules that show up when
> compiling.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
> v3:
> - Changed from adress, it was wrong.
> 
> v2:
> - Fixed spelling mistakes
> 
>   .../files/0001-Ignore-Compiler-Warnings.patch  | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
> 
> diff --git a/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
> new file mode 100644
> index 00000000..067cffa1
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
> @@ -0,0 +1,18 @@
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5cfef6b3..71b6ddb4 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -109,7 +109,9 @@ if(CMAKE_COMPILER_IS_GNUCC OR "${CMAKE_CXX_COMPILER_ID}" MATCHES "(Apple)?Clang"
> +     add_cxx_flag_if_supported(-Wno-error=cpp) # Allow #warning directive
> +     add_cxx_flag_if_supported(-Wno-unknown-pragmas) # Issue #785
> +     add_cxx_flag_if_supported(-Wno-error=asm-operand-widths) # Issue #784
> +-
> ++    add_cxx_flag_if_supported(-Wno-maybe-uninitialized)
> ++    add_cxx_flag_if_supported(-Wno-stringop-truncation)
> ++    add_cxx_flag_if_supported(-Wno-strict-aliasing)
> +     # -msse -mfpmath=sse to force gcc to use sse for float math,
> +     # avoiding excess precision problems that cause tests like int2float
> +     # to falsely fail. -ffloat-store also works, but WG suggested
> +--
> +2.34.1
> +

The first patch in the series refers to this patch.  The second patch 
(this one) provides the patch.  You need to fix in one of two ways:

1) Squash the two patches together in a single patch.

2) Move the inclusion of this patch file in the SRC_URI into this patch. 
  So that the first patch creates the recipe.  And the second patch adds 
a patch file.

I lean towards #1, but your call.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

