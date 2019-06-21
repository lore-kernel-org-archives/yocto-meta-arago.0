Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0454952970
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 15:15:05 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LFENhf002673
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 10:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561130063;
	bh=bYlmF7w2VPKFpuCvXsRc4shgG+bLs6PFDY4PH1tt6og=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KOcywSqI/YlPG1TRZNrZV1GlcqOR8hI+OifGNslsH2HifurJGi4H/CVRI8MCyaaRw
	Q8KXrAB7+qcvvS0pv0CId6pdUH4PkffWdE4OVMoa4oDwEyGRTMnUSwslEa+5iiG1qx
	PbM2yQZJuWseu7LBiF9TdT9TXbcE2fOdTv2s7jHQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LFEN1U028278
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 10:14:23 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 10:14:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 10:14:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LFENFN083196;
	Fri, 21 Jun 2019 10:14:23 -0500
Date: Fri, 21 Jun 2019 11:14:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20190621151423.GH4849@beryl>
References: <1561034412-64937-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1561034412-64937-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud][PATCH] packagegroup-*-graphics: add virtual provider for GPU driver
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
X-List-Received-Date: Fri, 21 Jun 2019 15:15:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Anand,

Can you please rebase this patch? Thanks.


On Thu, Jun 20, 2019 at 06:10:12PM +0530, Anand Balagopalakrishnan wrote:
> - Add a new virtual provider for GPU driver
> - Specify Rogue and SGX as GPU driver provider for J7 and other platforms
> - Replace SGX with virtual GPU provider in package groups
> 
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/arago-prefs.inc                   | 2 ++
>  .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb         | 2 +-
>  .../packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb       | 2 +-
>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb     | 2 +-
>  4 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index e9e9177..3f36747 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -9,11 +9,13 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
>  PREFERRED_PROVIDER_virtual/egl = "ti-sgx-ddk-um"
>  PREFERRED_PROVIDER_virtual/libgles1 = "ti-sgx-ddk-um"
>  PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
> +PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
>  
>  # J7 has a Rogue GPU core
>  PREFERRED_PROVIDER_virtual/egl_j7-evm = "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/libgles1_j7-evm = "ti-img-rogue-umlibs"
>  PREFERRED_PROVIDER_virtual/libgles2_j7-evm = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/gpudriver_j7-evm = "ti-img-rogue-driver"
>  
>  PREFERRED_PROVIDER_libgbm = "libgbm"
>  PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
> index 96ed27b..486d080 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
> @@ -6,7 +6,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit packagegroup
>  
> -GRAPHICS_RDEPENDS = "ti-sgx-ddk-km-src"
> +GRAPHICS_RDEPENDS = "${PREFERRED_PROVIDER_virtual/gpudriver}-src"
>  
>  GRAPHICS_RDEPENDS_append_omap-a15 = "\
>      ti-gc320-driver-src \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> index 7e18d08..3f6485f 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
> @@ -12,7 +12,7 @@ GRAPHICS_RDEPENDS = "\
>      wayland-dev \
>      weston-dev \
>      ${PREFERRED_PROVIDER_virtual/egl}-dev \
> -    ti-sgx-ddk-km-dev \
> +    ${PREFERRED_PROVIDER_virtual/gpudriver}-dev \
>  "
>  
>  GRAPHICS_RDEPENDS_append_omap-a15 = "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> index 69cfea5..de9e8c4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
> @@ -24,7 +24,7 @@ GRAPHICS_WAYLAND_append_k3 = "\
>  GRAPHICS_RDEPENDS = "\
>      libgbm \
>      ${PREFERRED_PROVIDER_virtual/egl} \
> -    ${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-sgx-ddk-km','',d)} \
> +    ${@bb.utils.contains('MACHINE_FEATURES','sgx','${PREFERRED_PROVIDER_virtual/gpudriver}','',d)} \
>      ${@bb.utils.contains('MACHINE_FEATURES','sgx','glmark2','',d)} \
>  "
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

