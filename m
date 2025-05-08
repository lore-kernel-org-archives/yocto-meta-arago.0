Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092A3C3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 14:01:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.16523.1746712902977594682
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 May 2025 07:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sjjgZJIj;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548E1b5S1685813
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 09:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746712897;
	bh=wGWbDvPxD729N8zpYDYGxwaZWGU03civu2rwav+836s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sjjgZJIjlJQHSnTMDmiSdgHspQHbB59CmFBB8dMKgu0Zh0Vptbs+6kkyPKGxOYnYR
	 f4aVVEO2v5qjhN31UPhDrl45xVXywr6Qb7avxtkWGZIP+o1/yqqgbGf+jjEkaib3p0
	 yGZ7ATvnKD3AsDhaFaB2e/5QK6g0bGufRyTi4wNY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548E1bdj093240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 09:01:37 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 09:01:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 09:01:37 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548E1aaN002246;
	Thu, 8 May 2025 09:01:36 -0500
Message-ID: <fedabe4b-451e-46e5-bf4a-178e35c95638@ti.com>
Date: Thu, 8 May 2025 09:01:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master/scarthgap][PATCH] omapconf: use proper
 definition of boolean type
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>,
        "Menon, Nishanth" <nm@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250507231810.2027418-1-denis@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250507231810.2027418-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 May 2025 14:01:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16192

On 5/7/25 6:18 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Newer versions of GCC and C standard have bool as a built-in
> keyword - use a standard stdbool.h header to properly handle it.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   ...se-proper-definition-of-boolean-type.patch | 41 +++++++++++++++++++
>   .../recipes-devtools/omapconf/omapconf_git.bb |  2 +
>   2 files changed, 43 insertions(+)
>   create mode 100644 meta-arago-test/recipes-devtools/omapconf/files/0001-Use-proper-definition-of-boolean-type.patch
> 
> diff --git a/meta-arago-test/recipes-devtools/omapconf/files/0001-Use-proper-definition-of-boolean-type.patch b/meta-arago-test/recipes-devtools/omapconf/files/0001-Use-proper-definition-of-boolean-type.patch
> new file mode 100644
> index 00000000..e1a29c9c
> --- /dev/null
> +++ b/meta-arago-test/recipes-devtools/omapconf/files/0001-Use-proper-definition-of-boolean-type.patch
> @@ -0,0 +1,41 @@
> +From c52280d923c167032a84f1c67574eb340e38572c Mon Sep 17 00:00:00 2001
> +From: Denys Dmytriyenko <denys@konsulko.com>
> +Date: Wed, 7 May 2025 17:03:20 -0400
> +Subject: [PATCH] Use proper definition of boolean type
> +
> +Newer versions of GCC and C standard have bool as a built-in
> +keyword - use a standard stdbool.h header to properly handle it.
> +
> +Upstream-Status: Inactive-Upstream

Are you sure? I bet +Nishanth would take this patch if you made the PR.

Andrew

> +
> +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> +---
> + arch/arm/mach-omap/common/statcoll/sci.h | 8 +-------
> + 1 file changed, 1 insertion(+), 7 deletions(-)
> +
> +diff --git a/arch/arm/mach-omap/common/statcoll/sci.h b/arch/arm/mach-omap/common/statcoll/sci.h
> +index 4134c00..1a393b4 100644
> +--- a/arch/arm/mach-omap/common/statcoll/sci.h
> ++++ b/arch/arm/mach-omap/common/statcoll/sci.h
> +@@ -48,17 +48,11 @@
> + #ifndef SCI_H
> + #define SCI_H
> +
> ++#include <stdbool.h>
> + #include <stdlib.h>
> + #include <stdint.h>		// The library uses C99 exact-width integer types
> + #include "sci_dev.h"
> +
> +-#if !defined(__bool_true_false_are_defined) && !defined(_STM_Logging)
> +-typedef enum {
> +-	false = 0,
> +-	true = 1
> +-} bool;
> +-#endif
> +-
> + #ifdef _STM_Logging
> + #include "StmLibrary.h"
> + #endif
> +--
> +2.25.1
> +
> diff --git a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
> index 175c6771..dad8ece0 100644
> --- a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
> +++ b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
> @@ -13,6 +13,8 @@ SRCREV = "ff07b6992bacb1e1586c72b7d2be469caee4a347"
>   
>   SRC_URI = "git://github.com/omapconf/omapconf.git;protocol=https;branch=${BRANCH}"
>   
> +SRC_URI += "file://0001-Use-proper-definition-of-boolean-type.patch"
> +
>   S = "${WORKDIR}/git"
>   
>   do_compile () {

