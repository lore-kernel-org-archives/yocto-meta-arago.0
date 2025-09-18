Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF9FCA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:52:04 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.14718.1758203514215121736
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 06:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gwTcQsOW;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IDprFi494707
	for <meta-arago@lists.yoctoproject.org>; Thu, 18 Sep 2025 08:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758203513;
	bh=O0+KHDrX5Z7jRk1Vv8LJ2gGNo2rKEJ0UqXYY/kWi7e4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=gwTcQsOW7Tjio2NzWa3SjQs7exlzfCshgjRnI/+htoZCBEd0bvW88PgMNWeNx5mt+
	 zAq0xLzLRod8HedgwZjVKzMgpx0LqBGJ4YvB+Td07E/bIP4rkXKILDaykgQ5/VrLHQ
	 rGozHFG7mktRDno+MM8refcyJNIk7LQzCkCGlxnY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IDprXW3192342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 18 Sep 2025 08:51:53 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 08:51:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 08:51:53 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IDprkV967136;
	Thu, 18 Sep 2025 08:51:53 -0500
Message-ID: <93d5f953-8d52-4f76-aa16-9deb4fee60ff@ti.com>
Date: Thu, 18 Sep 2025 08:51:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH v1 1/2] libsdl2: Add tests package
To: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250917220826.2078836-1-a-christidis@ti.com>
 <20250917220826.2078836-2-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250917220826.2078836-2-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 Sep 2025 13:52:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16593



On 9/17/2025 5:08 PM, a-christidis@ti.com wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> The software provides tests, configure cmake to build and install them.
> Package the tests in -tests package.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 5 +++++
>   meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
>   2 files changed, 9 insertions(+)
>   create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
>   create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
> 
> diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> new file mode 100644
> index 00000000..12e06295
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
> @@ -0,0 +1,5 @@
> +EXTRA_OECMAKE:append = " -DSDL_TESTS=ON \
> +                         -DSDL_INSTALL_TESTS=ON \
> +                       "
> +PACKAGE_BEFORE_PN = "${PN}-tests"
> +FILES:${PN}-tests += "${libexecdir} /usr/share/installed-tests/SDL2"


I'm getting QA errors related to nativesdk-libsdl2.  I had to change the 
above line to this:

FILES:${PN}-tests:append = " ${datadir}/installed-tests/SDL2"
FILES:${PN}-tests:append:class-nativesdk = " 
${datadir}/installed-tests/SDL2"

The libexecdir was not needed, and I changed the /usr/share to use the 
correct variable (datadir) in case someone wants to change the directory 
names in the Yocto manner.  I moved to append just so that the two lines 
looked the same.

I know this is also being submitted upstream, so these changes might be 
needed for those patches as well.


> diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
> new file mode 100644
> index 00000000..385aa801
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
> @@ -0,0 +1,4 @@
> +LIBSDL2_TI = ""
> +LIBSDL2_TI:ti-soc = "libsdl2-ti.inc"
> +
> +require ${LIBSDL2_TI}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


