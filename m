Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D118C7619A
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 18:53:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22984.1681239181792571440
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 11:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB5AF40C7B;
	Tue, 11 Apr 2023 18:53:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KjoNG3FIorO; Tue, 11 Apr 2023 18:53:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8F11040C2A;
	Tue, 11 Apr 2023 18:52:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4BD061637FE; Tue, 11 Apr 2023 14:52:20 -0400 (EDT)
Date: Tue, 11 Apr 2023 14:52:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] branding: Remove old
 AM/GL/MC SDKs
Message-ID: <20230411185220.GT9226@denix.org>
References: <20230411180016.14341-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411180016.14341-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Apr 2023 18:53:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14306

On Tue, Apr 11, 2023 at 01:00:16PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> These have not been used nor updated in a long time. They point
> to old and/or non-existent versions of packages. Drop them.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../conf/distro/include/branding-amsdk.inc    | 31 -------------------
>  .../conf/distro/include/branding-glsdk.inc    | 11 -------
>  .../conf/distro/include/branding-mcsdk.inc    | 18 -----------
>  3 files changed, 60 deletions(-)
>  delete mode 100644 meta-arago-distro/conf/distro/include/branding-amsdk.inc
>  delete mode 100644 meta-arago-distro/conf/distro/include/branding-glsdk.inc
>  delete mode 100644 meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-amsdk.inc b/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> deleted file mode 100644
> index 96df5660..00000000
> --- a/meta-arago-distro/conf/distro/include/branding-amsdk.inc
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -ARAGO_TISDK_IMAGE = "arago-amsdk-image"
> -
> -PREFERRED_PROVIDER_virtual/kernel:am335x-evm = "sitara-linux-ti-staging"
> -PREFERRED_PROVIDER_virtual/kernel:am437x-evm = "sitara-linux-ti-staging"
> -PREFERRED_VERSION_sitara-linux-ti-staging = "3.14%"
> -
> -# To create newlines in the message \n is used and the slash must be escaped
> -# to function properly
> -
> -SRCIPK_GIT_COMMIT_MESSAGE = "\
> -Create local branch\\n\
> -\\n\
> -The below commit is used for this local branch and is the one used by\\n\
> -this sdk:\\n\
> -${SRCREV}."
> -
> -SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE ="${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
> -To reduce the size of the SDK installer only a portion of the git commit\\n\
> -history has been preserved. Also links to remote branches and tags do\\n\
> -not exist in this copy of the repository.\\n\
> -To fix this please run the unshallow-repositories.sh\\n\
> -script located in the sdk\'s bin directory\\n\
> -\\n\
> -The script may take several minutes but you will then have a full copy of\\n\
> -the git repository including its entire git history.\\n"
> -
> -SRCIPK_CUSTOM_GIT_BRANCH:pn-sitara-linux-ti-staging = "amsdk-8.0"
> -SRCIPK_CUSTOM_GIT_MESSAGE:pn-sitara-linux-ti-staging = "${SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE}"
> -
> -SRCIPK_CUSTOM_GIT_BRANCH:pn-u-boot-ti-staging = "amsdk-8.0"
> -SRCIPK_CUSTOM_GIT_MESSAGE:pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
> diff --git a/meta-arago-distro/conf/distro/include/branding-glsdk.inc b/meta-arago-distro/conf/distro/include/branding-glsdk.inc
> deleted file mode 100644
> index 0abd73cc..00000000
> --- a/meta-arago-distro/conf/distro/include/branding-glsdk.inc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -# GLSDK branding configuration
> -
> -# Use the SDK supported kernel and kernel version
> -PREFERRED_PROVIDER_virtual/kernel = "linux-ti-glsdk"
> -
> -PREFERRED_PROVIDER_virtual/bootloader:omap-a15 = "u-boot-ti-staging"
> -PREFERRED_PROVIDER_u-boot:omap-a15 = "u-boot-ti-staging"
> -
> -# Set the PREFERRED_VERSION of libdrm to the glsdk version for the 
> -# glsdk branded builds
> -PREFERRED_VERSION_libdrm = "2.4.41"
> diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> deleted file mode 100644
> index 7dbffd3a..00000000
> --- a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -# MCSDK branding configuration
> -
> -# Use the MCSDK supported versions
> -PREFERRED_VERSION_libnl = "3.2.24"
> -
> -DISTRO_FEATURES += "x11"
> -
> -# Java preferences.
> -PREFERRED_VERSION_icedtea7-native = "2.1.3"
> -PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
> -
> -PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
> -
> -PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> -PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
> -
> -PREFERRED_PROVIDER_jpeg-native = "jpeg-native"
> -PREFERRED_PROVIDER_glibc-gconv-iso8859-1 = "glibc-locale"
> -- 
> 2.39.2

