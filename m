Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B13DC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 23:17:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.4115.1658359016240492524
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 16:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S993upnl;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26KNGpC7026965;
	Wed, 20 Jul 2022 18:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658359011;
	bh=weFNaEirW+67TThUVJi3xdX768JjE49/JbwncmoYCIU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S993upnlxluSvSkesLJARNO9cShy3wuGq4awWgeY4VyiW6DHnJcaWK8t2NREEb47Q
	 hb4lX0/OeYOq4N4Og8vaoVVyv3VX/wJhiK5W20Y5qu9iTaaBRmoDp88xRsm85YJWUh
	 m90SQi/G89egQMw11wSlrKhEJ52FvOicg8tGsLPk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26KNGpBe008912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Jul 2022 18:16:51 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Jul 2022 18:16:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Jul 2022 18:16:51 -0500
Received: from [10.250.34.168] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26KNGoFQ062648;
	Wed, 20 Jul 2022 18:16:50 -0500
Message-ID: <a2f36894-6631-30e9-5bed-701fb6c38d4c@ti.com>
Date: Wed, 20 Jul 2022 18:16:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-arago] [dunfell/master PATCH] meta-arago-extras:
 recipes-devtools: eventdump: Fix linking against local library
Content-Language: en-US
To: <nm@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: Daniel Thompson <daniel.thompson@linaro.org>,
        <meta-arago@lists.yoctoproject.org>
References: <20220720203655.17875-1-nm@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220720203655.17875-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Jul 2022 23:17:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13959

On 7/20/22 3:36 PM, Nishanth Menon via lists.yoctoproject.org wrote:
> https://github.com/TI-ECS/eventdump unfortunately is a unmaintained
> project.
> 
> LDFLAGS += -L$(NFSROOT)/lib should have dependent on NFSROOT variable.
> Instead this forces the eventdump to break the sandbox and attempt to
> link up against the local PC's lib - which is a NO-NO for many reasons.
> 
> Reported to have failed on a Fedora system.
> 
> Bump the PR up to indicate a fix up where we have proper linkage
> 
> Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> PS:
> 1. We should probably drop the entire recipe in Master branch if this
>     is not maintained.. but we can fix it while we can.


Why fix it, just delete it. This tool was superseded by a better program evtest[0]
which was already available in in OE before this was even written, why do we keep
random throwaway projects like this around bloating our layers at all??

Andrew

[0] meta-openembedded/meta-oe/recipes-test/evtest


> 2. Still looking to find the owner of this repo, apparently been almost
>     a decade old - so probability of pending status changing for the
>     patch is unlikely.
> 
>   .../eventdump/eventdump_git.bb                |  7 ++--
>   ...Play_nicer_with_bitbake-OpenEmbedded.patch | 34 +++++++++++++++++++
>   2 files changed, 39 insertions(+), 2 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch
> 
> diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
> index 3cd0b8e3919b..831d2e047319 100644
> --- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
> +++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
> @@ -2,12 +2,15 @@ SUMMARY = "Utility for parsing system events"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://eventdump.c;beginline=1;endline=34;md5=23b59be24a88ddc407b553035f3fd3e9"
>   
> -PR = "r3"
> +PR = "r4"
>   PV = "1.0+git${SRCPV}"
>   
>   SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
>   
> -SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=https;branch=master"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +
> +SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=https;branch=master \
> +	file://0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch"
>   
>   S = "${WORKDIR}/git"
>   
> diff --git a/meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch b/meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch
> new file mode 100644
> index 000000000000..b14d5bb34aa2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch
> @@ -0,0 +1,34 @@
> +From e8c5094e2d59fe48ad0e7234f196d04508f53727 Mon Sep 17 00:00:00 2001
> +From: Daniel Thompson <daniel.thompson@linaro.org>
> +Date: Wed, 20 Jul 2022 18:05:09 +0100
> +Subject: [PATCH] Makefile: Play nicer with bitbake/OpenEmbedded
> +
> +Unconditionally adding -L$(NFSROOT)/lib to the link line risks seriously
> +confusing the linker if NFSROOT is not set (which would be common when
> +building OE/bitbake) because we end up trying to link against whatever
> +zany things we might find in the host /lib directory). Fix this the
> +obvious way.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> +---
> + Makefile | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Makefile b/Makefile
> +index e313e50..afb5472 100755
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,7 +1,9 @@
> + CC = $(CROSS_COMPILE)gcc
> + CFLAGS = -O2 -Wall
> +
> ++ifneq ($(NFSROOT),)
> + LDFLAGS += -L$(NFSROOT)/lib
> ++endif
> + #LIBS += -lopenobex -lbluetooth -lmisc
> +
> + OBJS = eventdump.o
> +--
> +2.36.1
> +

