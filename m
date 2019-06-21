Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 293E252970
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 15:27:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LFQZ8D005628
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 10:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561130795;
	bh=hB8cEvRoTqc/jeIuIEBvVn7XInJqk/P/IBbWFryulHU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=yiHdoourILxDACyz63gOG/dN/RAKyOI7oZBp2TCEyZg9bAK21gISAgzMcdW7QudA4
	21W7khkBF+G7Bz5bf5ZcCKrlV9iUOLWeC9gzT1oJQxcS3Q7ItcQJl2izsoe37MJVbC
	n2BeCxFd4OSzBHGC+2f477scBYuegZYxgTt1i6oI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LFQZn2042001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 10:26:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 10:26:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 10:26:35 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LFQZYE125872;
	Fri, 21 Jun 2019 10:26:35 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <20190620063815.18898-1-x0157990@ti.com>
	<20190620063815.18898-3-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <2b82f163-3502-4c5c-d2fe-c109cb9af202@ti.com>
Date: Fri, 21 Jun 2019 11:26:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190620063815.18898-3-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH v2 3/3] glow: Add glow and demo-glow to packagegroups
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jun 2019 15:27:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/20/2019 2:38 AM, Djordje Senicic wrote:
> - Add glow to nativesdk
> - Add demo to target and src packagegroups
> - Also include demo-glow to example-applications
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb | 3 +++
>   .../packagegroup-arago-tisdk-addons-sdk-target.bb             | 3 +++
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 3 +++
>   .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb  | 4 ++++
>   .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb  | 1 +
>   5 files changed, 14 insertions(+)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index 3b734554..addb4818 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -90,14 +90,17 @@ EXTRA_PACKAGES = ""
>   
>   EXTRA_PACKAGES_append_omap-a15 = " \
>       pdm-anomaly-detection-src \
> +    demo-glow-src \
>   "
>   
>   EXTRA_PACKAGES_append_ti33x = " \
>       pdm-anomaly-detection-src \
> +    demo-glow-src \
>   "
>   
>   EXTRA_PACKAGES_append_ti43x = " \
>       pdm-anomaly-detection-src \
> +    demo-glow-src \
>   "
>   
>   EXTRA_PACKAGES_append_k3 = " \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> index 8bce1756..d998a1eb 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> @@ -161,16 +161,19 @@ EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev \
>                                   arm-compute-library-dev \
>                                   ${ARMNN_PACKAGES} \
>                                   pdm-anomaly-detection-dev \
> +                                demo-glow-dev \
>   "
>   EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev \
>                                   arm-compute-library-dev \
>                                   ${ARMNN_PACKAGES} \
>                                   pdm-anomaly-detection-dev \
> +                                demo-glow-dev \
>   "
>   EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev \
>                                   arm-compute-library-dev \
>                                   ${ARMNN_PACKAGES} \
>                                   pdm-anomaly-detection-dev \
> +                                demo-glow-dev \
>   "
>   EXTRA_PACKAGES_append_k3 = " arm-compute-library-dev \
>                                ${ARMNN_PACKAGES} \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 6558a21a..38ec3065 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -152,12 +152,14 @@ EXTRA_PACKAGES_append_ti33x = " voxelsdk \
>                                   arm-compute-library \
>                                   ${ARMNN_PACKAGES} \
>                                   pdm-anomaly-detection \
> +                                demo-glow \
>   "
>   
>   EXTRA_PACKAGES_append_ti43x = " voxelsdk \
>                                   arm-compute-library \
>                                   ${ARMNN_PACKAGES} \
>                                   pdm-anomaly-detection \
> +                                demo-glow \
>   "
>   
>   EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
> @@ -166,6 +168,7 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
>                                      arm-compute-library \
>                                      ${ARMNN_PACKAGES} \
>                                      pdm-anomaly-detection \
> +                                   demo-glow \
>   "
>   
>   EXTRA_PACKAGES_append_k3 = " arm-compute-library \
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> index e0d409a2..2200def1 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
> @@ -52,6 +52,7 @@ SRC_URI = "\
>       file://Makefile_sysfw-image \
>       file://Makefile_mmwavegesture-hmi \
>       file://Makefile_pdm-anomaly-detection \
> +    file://Makefile_demo-glow \


This file does not appear to be added.


>   "
>   
>   PR = "r95"
> @@ -98,6 +99,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
>                              uio-module-drv \
>   			   mmwavegesture-hmi \
>                              pdm-anomaly-detection \
> +                           demo-glow \
>   "
>   MAKEFILES_append_ti43x = " u-boot-spl \
>                              ${QUICK_PLAYGROUND} \
> @@ -113,6 +115,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
>                              uio-module-drv \
>   			   mmwavegesture-hmi \
>                              pdm-anomaly-detection \
> +                           demo-glow \
>   "
>   
>   #                            debugss-module-drv
> @@ -136,6 +139,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
>                                 uio-module-drv \
>   			      mmwavegesture-hmi \
>                                 pdm-anomaly-detection \
> +                              demo-glow \
>   "
>   MAKEFILES_append_omapl138 = " linux-dtbs \
>                                 u-boot-spl \
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> index ef54253d..28d817da 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
> @@ -17,6 +17,7 @@ EXTRA_TI_TOOLS = " \
>       nativesdk-tidl-viewer \
>       nativesdk-tidl-utils \
>       nativesdk-gcc-arm-none-eabi \
> +    nativesdk-glow \
>   "
>   
>   RDEPENDS_${PN} = "\

