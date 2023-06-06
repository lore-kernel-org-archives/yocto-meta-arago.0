Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5221C7EE37
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 23:03:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1200.1686092597228561935
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 16:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 95BE040C37;
	Tue,  6 Jun 2023 23:03:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDGGhFR0MRMX; Tue,  6 Jun 2023 23:03:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5E30940AE9;
	Tue,  6 Jun 2023 23:03:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A290163956; Tue,  6 Jun 2023 19:02:24 -0400 (EDT)
Date: Tue, 6 Jun 2023 19:02:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, afd@ti.com, detheridge@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCHv2] ti-test: add piglit to
 ARAGO_TEST
Message-ID: <20230606230224.GX9226@denix.org>
References: <20230606195101.1611396-1-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606195101.1611396-1-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 23:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14508

On Tue, Jun 06, 2023 at 02:51:01PM -0500, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Piglit is an OpenGL test suite and test-suite runner with support for
> OpenGLES, Vulkan, OpenCL compliance tests. This in particular is very
> nice in tracking feature regressions and driver conformance.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 
> Ugh. I love how yocto will arbitrarily pad certain fields with
> whitespace and simultaneously expect you to pad others manually.

Sections 3.1.8, 3.1.9 and 3.1.10 of Bitbake manual:

3.1.8 Appending (+=) and prepending (=+) With Spaces
3.1.9 Appending (.=) and Prepending (=.) Without Spaces
3.1.10 Appending and Prepending (:append Override Style Syntax)

https://docs.yoctoproject.org/bitbake/2.4/bitbake-user-manual/bitbake-user-manual-metadata.html#appending-and-prepending-with-spaces
https://docs.yoctoproject.org/bitbake/2.4/bitbake-user-manual/bitbake-user-manual-metadata.html#appending-and-prepending-without-spaces
https://docs.yoctoproject.org/bitbake/2.4/bitbake-user-manual/bitbake-user-manual-metadata.html#appending-and-prepending-override-style-syntax


>  meta-arago-distro/conf/distro/arago.conf                | 3 +++
>  meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index a6425fae..2f81f118 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -95,6 +95,9 @@ PACKAGECONFIG:pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6",
>  
>  PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
>  
> +# Enable testing for opencl and vulkan with piglit
> +PACKAGECONFIG:append:pn-piglit = " ${@bb.utils.filter("DISTRO_FEATURES", "opencl vulkan", d)}"
> +
>  # Enable encryption support in open62541
>  PACKAGECONFIG:append:pn-open62541 = " encrypt"
>  
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> index 0b6e1eed..929d63c7 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> @@ -39,6 +39,9 @@ ARAGO_TEST = "\
>      nbench-byte \
>      stream \
>      cryptodev-tests \
> +    piglit \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
>  "
>  
>  ARAGO_TEST:append:armv7a = " \
> -- 
> 2.40.1
> 

