Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B95C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 20:16:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3393.1654546595925367900
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 13:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9E52940C5D;
	Mon,  6 Jun 2022 20:16:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id llLJZ1U3fesy; Mon,  6 Jun 2022 20:16:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B47840BEB;
	Mon,  6 Jun 2022 20:16:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 54D7A174961; Mon,  6 Jun 2022 16:16:33 -0400 (EDT)
Date: Mon, 6 Jun 2022 16:16:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: danielrparks@ti.com
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [dunfell PATCH v3] cifs-utils: add patch for
 upstream build bug
Message-ID: <20220606201633.GU9834@denix.org>
References: <20220606200405.15381-1-danielrparks@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606200405.15381-1-danielrparks@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 06 Jun 2022 20:16:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13893

Thank you!


On Mon, Jun 06, 2022 at 03:04:05PM -0500, Daniel Parks via lists.yoctoproject.org wrote:
> cifs-utils upstream has a bug that causes our build to fail when
> PARALLEL_MAKE is set to "-j1". This adds an overlay with the patch for
> the bug, which I have also submitted upstream.
> 
> Signed-off-by: Daniel Parks <danielrparks@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  ...automake-treat-sbin-as-exec-not-data.patch | 35 +++++++++++++++++++
>  .../cifs/cifs-utils_6.10.bbappend             |  4 +++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch
>  create mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils_6.10.bbappend
> 
> diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch b/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch
> new file mode 100644
> index 00000000..dd9c7958
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch
> @@ -0,0 +1,35 @@
> +From fd5f395514256572c451127006a68483106cf2b8 Mon Sep 17 00:00:00 2001
> +From: Daniel Parks <danielrparks@ti.com>
> +Date: Fri, 3 Jun 2022 15:34:59 -0500
> +Subject: [PATCH] cifs-utils: Make automake treat /sbin as exec, not data
> +
> +Otherwise, $(DESTDIR)/sbin doesn't get created until install-data on a
> +-j1 build and install-exec-hook can fail because it might not exist.
> +
> +Steps to reproduce this bug:
> +$ autoreconf -i
> +$ ./configure
> +$ mkdir image
> +$ make DESTDIR=image install -j1
> +
> +Upstream-Status: Pending
> +Signed-off-by: Daniel Parks <danielrparks@ti.com>
> +---
> + Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index e9be6b3..edb1b7f 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,8 +1,8 @@
> + AM_CFLAGS = -Wall -Wextra -D_FORTIFY_SOURCE=2 $(PIE_CFLAGS) $(RELRO_CFLAGS)
> + ACLOCAL_AMFLAGS = -I aclocal
> + 
> +-root_sbindir = $(ROOTSBINDIR)
> +-root_sbin_PROGRAMS = mount.cifs
> ++root_exec_sbindir = $(ROOTSBINDIR)
> ++root_exec_sbin_PROGRAMS = mount.cifs
> + mount_cifs_SOURCES = mount.cifs.c mtab.c resolve_host.c util.c
> + mount_cifs_LDADD = $(LIBCAP) $(CAPNG_LDADD) $(RT_LDADD)
> + include_HEADERS = cifsidmap.h
> diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils_6.10.bbappend b/meta-arago-distro/recipes-support/cifs/cifs-utils_6.10.bbappend
> new file mode 100644
> index 00000000..33030b87
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/cifs/cifs-utils_6.10.bbappend
> @@ -0,0 +1,4 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += "file://0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch"
> +
> -- 
> 2.17.1

