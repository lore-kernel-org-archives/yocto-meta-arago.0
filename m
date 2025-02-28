Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0985C282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 22:08:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.971.1740780534007188545
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Feb 2025 14:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB53B40C37;
	Fri, 28 Feb 2025 22:08:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCKGocsGbenH; Fri, 28 Feb 2025 22:08:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A7CED40800;
	Fri, 28 Feb 2025 22:08:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D90CD1642BB; Fri, 28 Feb 2025 17:08:47 -0500 (EST)
Date: Fri, 28 Feb 2025 17:08:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, meta-arago@lists.yoctoproject.org, detheridge@ti.com,
	vijayp@ti.com
Subject: Re: [meta-arago][scarthgap/master][PATCHv3] packagegroups: opencl
 and vulkan utilities
Message-ID: <20250228220847.GK1879@denix.org>
References: <20250227225001.412870-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227225001.412870-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Feb 2025 22:08:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15931

On Thu, Feb 27, 2025 at 04:50:01PM -0600, rs@ti.com wrote:
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

LGTM.


> ---
> 
> v2: Remove LICENSE and PR. Add a SUMMARY.
> v3: Remove PACKAGE_ARCH.
> 
>  .../recipes-core/images/tisdk-default-image.bb         |  2 ++
>  .../packagegroups/packagegroup-arago-opencl.bb         | 10 ++++++++++
>  .../packagegroups/packagegroup-arago-vulkan.bb         | 10 ++++++++++
>  3 files changed, 22 insertions(+)
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
> index 00000000..dd5b0f1e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-opencl.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Useful OpenCL packages for Arago"
> +DESCRIPTION = "Packages we recommend for working with OpenCL"
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
> index 00000000..c2e69921
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-vulkan.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Useful Vulkan packages for Arago"
> +DESCRIPTION = "Packages we recommend for working with Vulkan"
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

