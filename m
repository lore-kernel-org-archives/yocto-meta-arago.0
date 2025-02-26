Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B781C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 20:43:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.16024.1740602590190291887
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Feb 2025 12:43:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 07AF6407DA;
	Wed, 26 Feb 2025 20:43:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuBqJQVe-M7E; Wed, 26 Feb 2025 20:43:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CE1AB40021;
	Wed, 26 Feb 2025 20:43:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 39F7C1642AF; Wed, 26 Feb 2025 15:43:04 -0500 (EST)
Date: Wed, 26 Feb 2025 15:43:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-arago@lists.yoctoproject.org, detheridge@ti.com,
	vijayp@ti.com
Subject: Re: [meta-arago][scarthgap/master][PATCH] packagegroups: opencl
 and vulkan utilities
Message-ID: <20250226204304.GH1879@denix.org>
References: <20250226201334.3807093-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226201334.3807093-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Feb 2025 20:43:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15922

On Wed, Feb 26, 2025 at 02:13:34PM -0600, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add package groups for OpenCL and Vulkan related utilities.
> Conditionally install them in tisdk-default-image if we enable the
> required distro features.
> 
> Currently these package groups consist of clinfo and vulkaninfo
> respectively. These are useful tools for checking device extension
> compatibility and ICD loader functionality.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../recipes-core/images/tisdk-default-image.bb      |  2 ++
>  .../packagegroups/packagegroup-arago-opencl.bb      | 13 +++++++++++++
>  .../packagegroups/packagegroup-arago-vulkan.bb      | 13 +++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index aace490b..bc067857 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -17,6 +17,8 @@ IMAGE_INSTALL += "\
>      ti-test-extras \
>      ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-opencl','',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','vulkan','packagegroup-arago-vulkan','',d)} \
>      packagegroup-arago-tisdk-connectivity \
>      packagegroup-arago-tisdk-crypto \
>      packagegroup-arago-tisdk-multimedia \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
> new file mode 100644
> index 00000000..49b6efc8
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Group containing various useful 0penCL packages"

SUMMARY is required these days.


> +LICENSE = "MIT"
> +PR = "r0"

No explicit PR is needed these days.


> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup features_check
> +
> +REQUIRED_DISTRO_FEATURES = "opencl"
> +
> +RDEPENDS:${PN} = "\
> +    clinfo \
> +"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb
> new file mode 100644
> index 00000000..36ee4b7b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Group containing various useful Vulkan packages"
> +LICENSE = "MIT"
> +PR = "r0"

Same 2 comments as above.


> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup features_check
> +
> +REQUIRED_DISTRO_FEATURES = "vulkan"
> +
> +RDEPENDS:${PN} = "\
> +    vulkan-tools \
> +"
> -- 
> 2.48.1

