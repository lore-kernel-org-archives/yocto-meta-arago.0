Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id EE97252975
	for <meta-arago@arago-project.org>;
	Tue, 27 Feb 2018 14:53:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1REr5nf013694
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 08:53:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519743185;
	bh=EgPq3mE1eWO+gGLp581sBIbKmNFrKMUdnJ/ap90dmyU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=IxJdP7YlndGJHVHXXgAuGn60bN1AJTwtOsK29pk/mKleIfIG1JqMVPwDA5pxQXw8M
	4nn600oDnYZLUQddSe/jio//njGePxLphjdg2y17iik/MLcyP1KymOmvfsmQDvsam/
	w516ZNphDGdknAyweIK8VBsvLceVZhnCUY+mg2kI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1REr5fR027318
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 08:53:05 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 27 Feb 2018 08:53:01 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 27 Feb 2018 08:53:01 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1REr1uv028373;
	Tue, 27 Feb 2018 08:53:01 -0600
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1519742560-35895-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e270bce5-38e7-802c-8581-3d0fb1b6517d@ti.com>
Date: Tue, 27 Feb 2018 09:53:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1519742560-35895-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v2] ti-pdk-build-rtos: Installing newly added comp_paths.mk
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
X-List-Received-Date: Tue, 27 Feb 2018 14:53:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/27/2018 9:42 AM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   v2 - Updating the commit# after upstreaming
>   v1 - Updating the file list to install
>
>   recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> index e1e8ccc..3a29c14 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -11,8 +11,8 @@ PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
>   PDK_BUILD_GIT_PROTOCOL = "git"
>   PDK_BUILD_GIT_BRANCH = "master"
>   
> -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.07"
> -PDK_BUILD_SRCREV = "cbac264f08aa9cdc2cd533d1433ef57b922cccb5"
> +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08"

It looks like PV should be updated as well.

I also see that 'PACKAGE_ARCH = "${MACHINE_ARCH}"' is in the upstream 
recipe, got dropped from here. Can you add this back?

Please submit this update to meta-ti.

> +PDK_BUILD_SRCREV = "f68931ff82eb051fc026ae28b2555f3c581eb6b9"
>   
>   BRANCH = "${PDK_BUILD_GIT_BRANCH}"
>   SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
> @@ -35,6 +35,7 @@ do_install() {
>   
>       install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
>       install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
> +    install -m 0755 comp_paths.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
>   
>       install -m 0755 makerules/build_config.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules
>       install -m 0755 makerules/common.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/makerules


