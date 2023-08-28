Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4122C83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 15:02:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.16412.1693234967183150884
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 08:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 832B540C53;
	Mon, 28 Aug 2023 15:02:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYGmhXiEZOVU; Mon, 28 Aug 2023 15:02:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 54DEB40C3A;
	Mon, 28 Aug 2023 15:02:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1234D163C86; Mon, 28 Aug 2023 11:02:43 -0400 (EDT)
Date: Mon, 28 Aug 2023 11:02:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] openntpd: Update to
 version 6.8p1
Message-ID: <20230828150243.GO3359@denix.org>
References: <20230818212349.1060-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818212349.1060-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Aug 2023 15:02:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14871

On Fri, Aug 18, 2023 at 04:23:47PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> The 3.9p1 version is really old, and we ran into compile issues with the
> latest upstream testing.  Take this opportunity to upgrade to the latest
> version.

1. a proper diff would have been nice
2. I see LIC_FILES_CHKSUM has changed - needs a brief explanation


> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../openntpd/openntpd_3.9p1.bb                | 21 ---------------
>  .../openntpd/openntpd_6.8p1.bb                | 26 +++++++++++++++++++
>  2 files changed, 26 insertions(+), 21 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
>  create mode 100644 meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
> deleted file mode 100644
> index 008d4d33..00000000
> --- a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_3.9p1.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
> -Network Time Protocol."
> -HOMEPAGE = "http://www.openntpd.org/"
> -SECTION = "console/network"
> -LICENSE = "BSD-3-Clause & ISC"
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=4b4f5158007cc97e6b0e2325bb99854a"
> -
> -PR = "r0"
> -
> -SRC_URI = "http://mirror.ece.vt.edu/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
> -
> -S = "${WORKDIR}/openntpd-${PV}"
> -EXTRA_OECONF = "--disable-strip"
> -inherit autotools
> -
> -LDFLAGS += "-lrt"
> -EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
> -                 --with-privsep-user=root --with-privsep-path=/${prefix}"
> -
> -SRC_URI[md5sum] = "afc34175f38d08867c1403d9008600b3"
> -SRC_URI[sha256sum] = "83dd7c1e8ec8b4567afe49af539271b5a73562fb7a3ca51df73eccba89ec8c49"
> diff --git a/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
> new file mode 100644
> index 00000000..e4aa27fc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/openntpd/openntpd_6.8p1.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
> +Network Time Protocol."
> +HOMEPAGE = "http://www.openntpd.org/"
> +SECTION = "console/network"
> +LICENSE = "BSD-3-Clause & ISC"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fe922aad2b6ad1c359cf2adfdaaab1b6"
> +
> +PR = "r0"
> +
> +SRC_URI = "https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
> +SRC_URI[md5sum] = "7c68ce2627b2ea13f2b95db1ef4fcfc5"
> +SRC_URI[sha256sum] = "8582db838a399153d4a17f2a76518b638cc3020f58028575bf54127518f55a46"
> +
> +S = "${WORKDIR}/openntpd-${PV}"
> +inherit autotools
> +
> +LDFLAGS += "-lrt"
> +EXTRA_OECONF += "LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS}"\
> +                 --with-privsep-user=root"
> +
> +do_install:append() {
> +    # don't install empty /var/run and /run to avoid conflict with base-files
> +    rm -rf ${D}${localstatedir}/run
> +    rm -rf ${D}/run
> +}
> +
> -- 
> 2.17.1

