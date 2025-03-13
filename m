Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1406C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 18:02:22 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.21887.1741888937772377934
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 11:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C6A240C16;
	Thu, 13 Mar 2025 18:02:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rNOkxcluEPL; Thu, 13 Mar 2025 18:02:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CDF9440C06;
	Thu, 13 Mar 2025 18:02:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F39BA164302; Thu, 13 Mar 2025 14:02:12 -0400 (EDT)
Date: Thu, 13 Mar 2025 14:02:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 03/13] libyang: Add BBCLASSEXTEND
 for native
Message-ID: <20250313180212.GC23729@denix.org>
References: <20250313104029.14977-1-reatmon@ti.com>
 <20250313104029.14977-4-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313104029.14977-4-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 18:02:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16029

This patch is incorrect - it got extra stuff in it.


On Thu, Mar 13, 2025 at 05:40:19AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> We need to add BBCLASSEXTEND for native so that we can build
> sysrepo-native for the netopeer2-server install.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-sysrepo/libnetconf2/libnetconf2_git.bb          | 6 +++---
>  .../recipes-sysrepo/libyang/libyang_%.bbappend              | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
> 
> diff --git a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
> index c62d3faa..6b3f73ca 100644
> --- a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
> +++ b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
> @@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=08a5578c9bab06fb2ae84284630b973f"
>  
>  SRC_URI = "git://github.com/CESNET/libnetconf2.git;protocol=https;branch=devel"
>  
> -PV = "2.1.34+git"
> -SRCREV = "91cd6d75722c65de5c005d908f6d645b48cee89b"
> +PV = "3.5.5+git"
> +SRCREV = "4c7858c9c41f1ac04d2b15c032291e335fc0f5f5"
>  
>  S = "${WORKDIR}/git"
>  
> -DEPENDS = "libssh openssl libyang libxcrypt \
> +DEPENDS = "libssh openssl libyang libxcrypt mbedtls curl \
>      ${@bb.utils.contains('DISTRO_FEATURES','pam','libpam','',d)} \
>  "
>  
> diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend b/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
> new file mode 100644
> index 00000000..608377e3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/libyang/libyang_%.bbappend
> @@ -0,0 +1 @@
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.17.1

