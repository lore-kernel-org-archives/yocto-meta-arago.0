Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B428CEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 23:22:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4287.1687303338427529144
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 16:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=V5Mm9Kov;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KNMDRm020738;
	Tue, 20 Jun 2023 18:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687303333;
	bh=c6VcldxRancrODhHrhwAlxS5BE5MxU/baahB05KJAYA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=V5Mm9KovQ4mhkMPRB0EQDS4IobAiQ2xrdpQXQ0LlJZPnSDYG1WvLvMJlz+UBS/4VT
	 9dvlk2fr3emIkT9NN2j4i8IJGsZuWefy4a20KPdvXLyGjUNS0uN7EgefS0+RdSTIjA
	 i2NTRqZED//h9JLX8G3GO21IJ/l4dl8vSfW0LVH0=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KNMDol011640
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 18:22:13 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 18:22:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 18:22:13 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KNMDxR006132;
	Tue, 20 Jun 2023 18:22:13 -0500
Message-ID: <5a267786-26e1-fb52-3f7a-1d6f8d6d30bb@ti.com>
Date: Tue, 20 Jun 2023 18:22:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-arago][master/kirkstone][PATCH] piglit: add conditional
 config to point at deqp bins
Content-Language: en-US, en-US-large
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230620230902.1864984-2-rs@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230620230902.1864984-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jun 2023 23:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14664

On 6/20/23 18:09, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add a PACKAGECONFIG to define runtime dependencies on deqp tests and
> conditionally set values for the default config so piglit works out of
> the box.
> 
> Adjust the arago.conf accordingly. Drop the explicit requirements for
> individual cts tests in ti-test-extras.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 
> Not sure how I feel about this patch. Feel free to tear it to shreds if
> it's a bad idea.
> 
>   meta-arago-distro/conf/distro/arago.conf      |  6 +++-
>   .../recipes-core/packagegroups/ti-test.bb     |  2 --
>   .../recipes-graphics/piglit/piglit_%.bbappend | 30 +++++++++++++++++++
>   3 files changed, 35 insertions(+), 3 deletions(-)
>   create mode 100644 meta-arago-distro/recipes-graphics/piglit/piglit_%.bbappend
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index f770345c..512bc175 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -99,7 +99,11 @@ PACKAGECONFIG:pn-glmark2 = "drm-gles2 wayland-gles2"
>   PACKAGECONFIG:pn-weston-init = ""
>   
>   # Enable testing for opencl and vulkan with piglit
> -PACKAGECONFIG:append:pn-piglit = " ${@bb.utils.filter("DISTRO_FEATURES", "opencl vulkan", d)}"
> +PACKAGECONFIG:append:pn-piglit = " \
> +    ${@bb.utils.filter("DISTRO_FEATURES", "opencl vulkan", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "deqp-gles", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "deqp-vk", "", d)} \
> +"
>   PACKAGECONFIG:pn-opengl-es-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
>   PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
>   
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> index 793eb583..11c327a0 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> @@ -43,8 +43,6 @@ ARAGO_TEST = "\
>   ARAGO_TEST_EXTRAS = " \
>       python3-numpy \
>       piglit \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "vulkan", "vulkan-cts", "", d)} \
>   "
>   
>   ARAGO_TEST:append:armv7a = " \
> diff --git a/meta-arago-distro/recipes-graphics/piglit/piglit_%.bbappend b/meta-arago-distro/recipes-graphics/piglit/piglit_%.bbappend
> new file mode 100644
> index 00000000..e4cb9525
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/piglit/piglit_%.bbappend
> @@ -0,0 +1,30 @@
> +# add a config to point piglit at the default install location for deqp tests
> +# if they are selected
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +
> +PACKAGECONFIG[deqp-gles] = ",,,opengl-es-cts"
> +PACKAGECONFIG[deqp-vk] = ",,,vulkan-cts"
> +
> +do_install:append() {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-gles', 'true', 'false', d)}; then
> +        printf "%s\n" \
> +            "[deqp-egl]" \
> +            "bin=/usr/lib/opengl-es-cts/deqp-egl" \
> +            "[deqp-gles2]" \
> +            "bin=/usr/lib/opengl-es-cts/deqp-gles2" \
> +            "[deqp-gles3]" \
> +            "bin=/usr/lib/opengl-es-cts/deqp-gles3" \
> +            "[deqp-gles31]" \
> +            "bin=/usr/lib/opengl-es-cts/deqp-gles31" \
> +            >> ${D}/usr/lib/piglit/piglit.conf

Should have just tagged this as an RFC apparently. Forgot to use ${libdir}.

> +    fi
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-vk', 'true', 'false', d)}; then
> +        printf "%s\n" \
> +            "[deqp-vk]" \
> +            "bin=/usr/lib/vulkan-cts/deqp-vk" \
> +            "[deqp-vksc]" \
> +            "bin=/usr/lib/vulkan-cts/deqp-vksc" \
> +            >> ${D}/usr/lib/piglit/piglit.conf

Same here.

> +    fi
> +}


