Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 2ACB3529E0
	for <meta-arago@arago-project.org>;
	Wed, 21 Oct 2020 18:04:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LI0vVC049955
	for <meta-arago@arago-project.org>; Wed, 21 Oct 2020 13:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603303257;
	bh=Gi1jIj/JFwZ+eIY0EZbgkrFEffYz+j5m0ut820OOQwI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=q/z/P+NFU5oYGph7P5wdCVjOrDypInvBPlFlbtho2WG+DeYVF0N2ZWgIbJCHnUMfd
	h/O9upGjWmQG3BS2LuJw+NMmb1lB5m6d6RfwFBkOTEEUCq4XngnC+x5ARlQ6lqVI4b
	iWLzJuFV/PcKuFJgOCKFp6BmPTvOoXgP5eJdao8o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LI0vPH092690
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Oct 2020 13:00:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 21 Oct 2020 13:00:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 21 Oct 2020 13:00:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LI0uck070189;
	Wed, 21 Oct 2020 13:00:56 -0500
Date: Wed, 21 Oct 2020 14:00:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Suman Anna <s-anna@ti.com>
Message-ID: <20201021180056.GR14852@beryl>
References: <20201021175306.13253-1-s-anna@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201021175306.13253-1-s-anna@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] packagegroup-*-addons: add ti-rpmsg-char for all K3 platforms
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
X-List-Received-Date: Wed, 21 Oct 2020 18:04:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 21, 2020 at 12:53:06PM -0500, Suman Anna wrote:
> libti_rpmsg_char is a new utility library providing a simple API for
> applications wanting to talk to remote processors over the rpmsg_char
> Linux kernel driver with virtio-rpmsg back-end transport.
> 
> Add this library and examples for all the K3 platforms. It does not
> support legacy SoCs at the moment, but this can be adjusted later on
> when the support for the same is added to the library.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb | 3 ++-
>  .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 4 +++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> index 46817f999894..914fa07bf705 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install sources for additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r36"
> +PR = "r37"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -40,6 +40,7 @@ UTILS_append_k3 = " \
>      jailhouse-src \
>      ti-sci-fw-source \
>      trusted-firmware-a-src \
> +    ti-rpmsg-char-src \

This won't work ^^^


>  "
>  
>  UTILS_append_j7-evm = " \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index e2c3774a287a..adfd45f2af11 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to install additional utilities/demos for SDKs"
>  LICENSE = "MIT"
> -PR = "r77"
> +PR = "r78"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -72,6 +72,8 @@ UTILS_append_k3 = " mmc-utils \
>                      switch-config \
>                      irqbalance \
>                      jailhouse \
> +                    ti-rpmsg-char \
> +                    ti-rpmsg-char-examples \
>  "
>  
>  UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
> -- 
> 2.28.0
> 

