Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76C8EB64DD
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 17:45:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.25207.1686851106963705625
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 10:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9A11740C2E;
	Thu, 15 Jun 2023 17:45:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2M2mkZkqfpLg; Thu, 15 Jun 2023 17:45:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6C52B40A3D;
	Thu, 15 Jun 2023 17:45:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0C743163A6A; Thu, 15 Jun 2023 13:45:01 -0400 (EDT)
Date: Thu, 15 Jun 2023 13:45:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, afd@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] ti-test-extras: add
 package group for large tests
Message-ID: <20230615174500.GC1518@denix.org>
References: <20230615172807.673971-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615172807.673971-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jun 2023 17:45:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14637

On Thu, Jun 15, 2023 at 12:28:07PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> This is required for images that expect ti-test to be installed but
> actually use a ramdisk for primary storage. Piglit and the corresponding
> cts tests are the real problems at the moment so we're moving those
> first. Other tests may follow.

Why not make it a single packagegroup recipe producing 2 packages? Other 
packagegroups already doing it - tisdk-matrix, tisdk-addons, tisdk-opencl.


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../recipes-core/images/tisdk-default-image.bb   |  1 +
>  .../recipes-core/packagegroups/ti-test-extras.bb | 16 ++++++++++++++++
>  .../recipes-core/packagegroups/ti-test.bb        |  3 ---
>  3 files changed, 17 insertions(+), 3 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 3b9747c1..bb825e09 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -12,6 +12,7 @@ IMAGE_INSTALL += "\
>      packagegroup-arago-console \
>      packagegroup-arago-base-tisdk \
>      ti-test \
> +    ti-test-extras \
>      ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-graphics','',d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-gtk','',d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-qte','',d)} \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb
> new file mode 100644
> index 00000000..6d69b165
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test-extras.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "TI Testing packagegroup for big tests"
> +LICENSE = "MIT"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup
> +
> +ARAGO_TEST_EXTRAS = "\
> +    piglit \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
> +"
> +
> +RDEPENDS:${PN} = "\
> +    ${ARAGO_TEST_EXTRAS} \
> +"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> index 210bc5a9..3e45077b 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> @@ -38,9 +38,6 @@ ARAGO_TEST = "\
>      nbench-byte \
>      stream \
>      cryptodev-tests \
> -    piglit \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
>  "
>  
>  ARAGO_TEST:append:armv7a = " \
> -- 
> 2.41.0

