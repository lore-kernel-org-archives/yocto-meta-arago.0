Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 211BF529A4
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 17:32:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93HWKGV023306
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 12:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507051940;
	bh=Tg0TvONk0RvWszrblqUl/JZlcM/n9BmirDLymh48i3o=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=u+QD9FbbrhsXTGgPjuvDSbz9th4dLRucgVgHpkH6FlFExqKxuh7gsIZxp7IGLpmAW
	HqvidcYfsT1s72OAZsTB5Duq6cGlR9lXSXFVG1v/ekUwVhBdRpu3Yvzpj4aZ1G2qMQ
	I58nXbVkDZ3SoqqdQ3vc9j79gLo9kpqUtpnQKdYM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93HWJ4i001217
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 12:32:20 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 12:32:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 12:32:19 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93HWJRG002084;
	Tue, 3 Oct 2017 12:32:19 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
	<1507046051-57949-24-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <1cff3f05-d6fb-3f69-936c-d3f78bf6ec94@ti.com>
Date: Tue, 3 Oct 2017 13:32:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507046051-57949-24-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH v2 23/23] packagegroup-arago-tisdk-addons(-sdk-target): removed unsupported modules for X11(xsgx) build
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
X-List-Received-Date: Tue, 03 Oct 2017 17:32:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This patch also fails to apply.


On 10/3/2017 11:54 AM, Eric Ruei wrote:
> X11 build: remove opencv
> Non-Wayland build: remove glsdk-example-apps
>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>   .../packagegroup-arago-tisdk-addons-sdk-target.bbappend        | 10 ++++++----
>   .../packagegroups/packagegroup-arago-tisdk-addons.bbappend     | 10 ++++++----
>   2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
> index 14e4930..88a73d7 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bbappend
> @@ -1,15 +1,17 @@
> -PR_append = "-tisdk25"
> +PR_append = "-tisdk26"
> +
> +EXTRA_PACKAGES_remove = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'voxelsdk-dev', '', d)}"
>   
>   UTILS_append_ti33x = " \
> -    opencv-dev \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "opencv-dev", d)} \
>   "
>   
>   UTILS_append_ti43x = " \
> -    opencv-dev \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "opencv-dev", d)} \
>   "
>   
>   UTILS_append_omap-a15 = " \
> -    opencv-dev \
> +    ${@bb.utils.contains("MACHINE_FEATURES", "xsgx", '', "opencv-dev", d)} \
>   "
>   
>   UTILS_append_keystone = " \
> diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> index 91e92ff..b7f2b44 100644
> --- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> +++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
> @@ -1,8 +1,9 @@
> -PR_append = "-tisdk40"
> +PR_append = "-tisdk41"
>   
> -EXTRA_PACKAGES_append_ti33x = " opencv"
> -EXTRA_PACKAGES_append_ti43x = " opencv"
> -EXTRA_PACKAGES_append_omap-a15 = " opencv"
> +EXTRA_PACKAGES_remove = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'voxelsdk', '', d)}"
> +EXTRA_PACKAGES_append_ti33x = " ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', ' opencv', d)}"
> +EXTRA_PACKAGES_append_ti43x = " ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', ' opencv', d)}"
> +EXTRA_PACKAGES_append_omap-a15 = "${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', '', ' opencv', d)}"
>   EXTRA_PACKAGES_append_keystone = " opencv"
>   EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"
>   
> @@ -29,6 +30,7 @@ UTILS_append_ti33x = " uio-module-drv-test \
>                          uio-test-pruss \
>   "
>   
> +UTILS_remove_dra7xx = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'glsdk-example-apps', d)}"
>   UTILS_append_k2g = " uio-test-pruss"
>   
>   EXTRA_PACKAGES_append_omap-a15 = " big-data-ipc-demo-linux \


