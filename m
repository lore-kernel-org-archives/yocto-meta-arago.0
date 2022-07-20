Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 313BEC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 22:35:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3744.1658356534115204212
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 15:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6663D40CF0;
	Wed, 20 Jul 2022 22:35:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6D-QSTZXkyzx; Wed, 20 Jul 2022 22:35:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 377BC40CE0;
	Wed, 20 Jul 2022 22:35:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C6C771749AF; Wed, 20 Jul 2022 18:35:29 -0400 (EDT)
Date: Wed, 20 Jul 2022 18:35:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nishanth Menon <nm@ti.com>
Cc: reatmon@ti.com, Daniel Thompson <daniel.thompson@linaro.org>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [dunfell/master PATCH] meta-arago-extras: recipes-devtools:
 eventdump: Fix linking against local library
Message-ID: <20220720223529.GK18692@denix.org>
References: <20220720203655.17875-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720203655.17875-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Jul 2022 22:35:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13957

On Wed, Jul 20, 2022 at 03:36:55PM -0500, Nishanth Menon wrote:
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
>    is not maintained.. but we can fix it while we can.
> 2. Still looking to find the owner of this repo, apparently been almost
>    a decade old - so probability of pending status changing for the
>    patch is unlikely.
> 
>  .../eventdump/eventdump_git.bb                |  7 ++--
>  ...Play_nicer_with_bitbake-OpenEmbedded.patch | 34 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 2 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch
> 
> diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
> index 3cd0b8e3919b..831d2e047319 100644
> --- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
> +++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
> @@ -2,12 +2,15 @@ SUMMARY = "Utility for parsing system events"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://eventdump.c;beginline=1;endline=34;md5=23b59be24a88ddc407b553035f3fd3e9"
>  
> -PR = "r3"
> +PR = "r4"
>  PV = "1.0+git${SRCPV}"
>  
>  SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
>  
> -SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=https;branch=master"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

This is not needed in .bb - it already contains files/ in the search paths 
list. This is only required in .bbappend


> +SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=https;branch=master \
> +	file://0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch"
>  
>  S = "${WORKDIR}/git"
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
> -- 
> 2.31.1
> 

