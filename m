Return-Path: <dmurphy@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7E23152A81
	for <meta-arago@arago-project.org>;
	Mon, 30 Oct 2017 14:49:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9UEnfYg030822
	for <meta-arago@arago-project.org>; Mon, 30 Oct 2017 09:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509374981;
	bh=xfTc0Rj1nVkhu2mxeKX1wYFQeqCifArPuma5TTquAqA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=aKNOt3yLeZVe/Om1OtU7O0d99O6GUx8GIplgfxfDmprTBbiF1Xm5zt4qUKg+x4ExQ
	yUJqh1oLS32oFln3wE0rv7ZfFTsKXaKGVQKjizU2ojVm1l8Jv3TRjy2j2a0YIMJJUP
	qhPPXU9X3VLsnqtfrMpYasTvoV18H/usi8qIALd0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9UEnfXw017747
	for <meta-arago@arago-project.org>; Mon, 30 Oct 2017 09:49:41 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 30 Oct 2017 09:49:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 30 Oct 2017 09:49:41 -0500
Received: from [172.22.172.9] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9UEne5Q000845;
	Mon, 30 Oct 2017 09:49:41 -0500
To: <meta-arago@arago-project.org>
References: <20171030144901.12511-1-dmurphy@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <8429cc01-72b6-ae6f-b84d-d764d6814b9d@ti.com>
Date: Mon, 30 Oct 2017 09:49:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171030144901.12511-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] optee: Update SRCREV for client, os and test
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
X-List-Received-Date: Mon, 30 Oct 2017 14:49:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

+Andrew

On 10/30/2017 09:49 AM, Dan Murphy wrote:
> Updating the SRCREV for the optee-client,
> optee-os and optee-test to Linaro's tagged
> version of 2.6.0 release.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 4 ++--
>  meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 4 ++--
>  meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> index 16437019..fcfb2bb0 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> @@ -5,7 +5,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
>  
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
>  
> -PV = "2.5.0+git${SRCPV}"
> +PV = "2.6.0+git${SRCPV}"
>  
>  BRANCH = "ti_optee_client"
> -SRCREV = "0efaf6bae1066d06a075d1f4fe1011b8b3576f75"
> +SRCREV = "73b4e490a8ed0b4a7714818e80998b9d8a7da958"
> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> index 550d75ca..8b84ca33 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  PR_append = ".arago7"
>  
> -PV="2.5.0+git${SRCPV}"
> +PV="2.6.0+git${SRCPV}"
>  
>  is_armv7 = "1"
>  
> @@ -10,7 +10,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>  "
>  BRANCH = "ti_optee_os"
> -SRCREV = "342a75f64d69fa9a60a2934d56131243d540fe42"
> +SRCREV = "f918b24d27744d682e6f2c7fa91828a7b818b5a0"
>  
>  EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
>                  CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
> diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> index 17228b13..996032ed 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> @@ -2,7 +2,7 @@ PR_append = ".arago1"
>  
>  SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
>  
> -PV = "2.5.0+git${SRCPV}"
> +PV = "2.6.0+git${SRCPV}"
>  
>  BRANCH = "ti_optee_test"
> -SRCREV = "e0ab180a643b67e865b35f869a2ed3b3dee9112d"
> +SRCREV = "cc72dd2ce5c45318ad1618633bf0c859ad56cd8a"
> 


-- 
------------------
Dan Murphy

