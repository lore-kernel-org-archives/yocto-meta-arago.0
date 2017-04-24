Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id E091B520E3
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 17:13:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OHDccC027802
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 12:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493054018;
	bh=WBywU6JFaGx1mJyUq4Uga2mw46dckxe9y+8PXXnV1gA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ouAxRy2kr/ATZvlaNQ1+K0P+MnQJWVNYbwSdQOX77/ldolT+Q2LavP48rIwb5nTTs
	xCQ9ckILt2hJLtChlKuY6eDoBR5elVvZc8Rjcusgtu9G0lqdJpSq24h9lxGb8jEC/4
	JZFwga57v8Tg7eKvx/oCgY7t2DGBqodAgQuSCoJI=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OHDc3D011760
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 12:13:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 12:13:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OHDcs9021971;
	Mon, 24 Apr 2017 12:13:38 -0500
Date: Mon, 24 Apr 2017 13:13:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170424171337.GB24846@edge>
References: <20170424161757.9391-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170424161757.9391-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] linaro-optee: Update to v2.4.0 OPTEE release
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
X-List-Received-Date: Mon, 24 Apr 2017 17:13:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Dan,

This looks like a patch against Linaro's meta-optee - the right list would be openembedded@lists.linaro.org

-- 
Denys


On Mon, Apr 24, 2017 at 11:17:57AM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  meta-optee/recipes-security/optee/optee-client.bb   | 4 ++--
>  meta-optee/recipes-security/optee/optee-os_git.bb   | 4 ++--
>  meta-optee/recipes-security/optee/optee-test_git.bb | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-optee/recipes-security/optee/optee-client.bb b/meta-optee/recipes-security/optee/optee-client.bb
> index c31fb30..7b471f3 100644
> --- a/meta-optee/recipes-security/optee/optee-client.bb
> +++ b/meta-optee/recipes-security/optee/optee-client.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/OP-TEE/optee_client"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=a6d62e1b5fef18a1854bd538e3160d7c"
>  
> -PV = "2.3.0+git${SRCPV}"
> +PV = "2.4.0+git${SRCPV}"
>  
>  inherit pythonnative systemd
>  
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/OP-TEE/optee_client.git \
>             file://tee-supplicant.service"
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "365657667f8968f40237480169fea44fa3fb9949"
> +SRCREV = "1df4046bd729e866743454a18a71e72228e585fd"
>  
>  SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
>  
> diff --git a/meta-optee/recipes-security/optee/optee-os_git.bb b/meta-optee/recipes-security/optee/optee-os_git.bb
> index a194c8c..5dcb0e3 100644
> --- a/meta-optee/recipes-security/optee/optee-os_git.bb
> +++ b/meta-optee/recipes-security/optee/optee-os_git.bb
> @@ -4,13 +4,13 @@ DESCRIPTION = "OPTEE OS"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
>  
> -PV="2.3.0+git${SRCPV}"
> +PV="2.4.0+git${SRCPV}"
>  
>  DEPENDS = "python-wand-native python-pycrypto-native"
>  
>  inherit deploy pythonnative
>  
> -SRCREV = "28fcee179fc908ee2001a135179366d794af7878"
> +SRCREV = "a92d4a6698b0acc8147fba21b10c7e4473da3b9e"
>  SRC_URI = "git://github.com/OP-TEE/optee_os.git \
>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>            "
> diff --git a/meta-optee/recipes-security/optee/optee-test_git.bb b/meta-optee/recipes-security/optee/optee-test_git.bb
> index 3fd267c..cdc51ef 100644
> --- a/meta-optee/recipes-security/optee/optee-test_git.bb
> +++ b/meta-optee/recipes-security/optee/optee-test_git.bb
> @@ -8,14 +8,14 @@ DEPENDS = "optee-client optee-os python-pycrypto-native"
>  
>  inherit pythonnative
>  
> -PV = "2.3.0+git${SRCPV}"
> +PV = "2.4.0+git${SRCPV}"
>  
>  SRC_URI = "git://github.com/OP-TEE/optee_test.git \
>             file://fix-build-failure-with-GCC6.patch \
>            "
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "a4653559d989d5006f67f4498be4cb090be12f79"
> +SRCREV = "170a1ee60a98b407790d97dc682568981d344ca3"
>  
>  OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
>  TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
> -- 
> 1.9.1
> 

