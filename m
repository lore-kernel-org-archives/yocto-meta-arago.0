Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B25E552B55
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 17:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D4F8D40C2A;
	Tue, 20 Apr 2021 17:58:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3c41JUZx09Sw; Tue, 20 Apr 2021 17:58:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B76A840B66;
	Tue, 20 Apr 2021 17:58:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 832A31745C5; Tue, 20 Apr 2021 13:58:03 -0400 (EDT)
Date: Tue, 20 Apr 2021 13:58:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>
Message-ID: <20210420175803.GP15937@denix.org>
References: <20210420174155.50628-1-x0257345@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210420174155.50628-1-x0257345@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master PATCH 1/1] AM64x Unification Add recipes to generate WIC file
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
X-List-Received-Date: Tue, 20 Apr 2021 17:57:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 20, 2021 at 11:11:55PM +0530, Sinthu Raja wrote:
>   Add two recipies to generate two WIC files for AM64x EVM and SK.
>   Each recipe has its own path to the deployed boot images and
>   corresponding WIC file name.

Adding extra and very specialized images would only increase complexity. Just 
last year we went to extra efforts to simplify this area down to 3 generic 
images...


> ---
>  .../images/tisdk-base-image-evm.bb            | 19 +++++++++++++++++
>  .../images/tisdk-base-image-sk.bb             | 21 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-base-image-evm.bb
>  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-base-image-sk.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image-evm.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image-evm.bb
> new file mode 100644
> index 00000000..14813bad
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/tisdk-base-image-evm.bb
> @@ -0,0 +1,19 @@
> +# Arago TI SDK base image with test tools
> +# Suitable for initramfs
> +
> +require recipes-core/images/arago-image.inc
> +
> +IMAGE_FSTYPES += "cpio.xz"
> +IMAGE_FSTYPES_append_dra7xx = " ubifs ubi"
> +
> +IMAGE_INSTALL += "\
> +    packagegroup-arago-base \
> +    packagegroup-arago-console \
> +    packagegroup-arago-base-tisdk \
> +    ${VIRTUAL-RUNTIME_initramfs} \
> +    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', d)} \
> +    "
> +
> +export IMAGE_BASENAME = "tisdk-base-image-evm"
> +export IMAGE_LINK_NAME = "tisdk-base-image-am64xx-evm"
> +export DEPLOY_DIR_IMAGE="/mnt/4TB-VD1/ti_devm_sdk/devm_linux/am64x_sk/yocto_local_am64x_sk/oe-layersetup/build/arago-tmp-external-arm-glibc/deploy/images/am64xx-evm/evm"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image-sk.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image-sk.bb
> new file mode 100644
> index 00000000..571e8395
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/tisdk-base-image-sk.bb
> @@ -0,0 +1,21 @@
> +# Arago TI SDK base image with test tools
> +# Suitable for initramfs
> +
> +require  recipes-core/images/arago-image.inc
> +
> +IMAGE_FSTYPES += "cpio.xz"
> +IMAGE_FSTYPES_append_dra7xx = " ubifs ubi"
> +
> +IMAGE_INSTALL += "\
> +    packagegroup-arago-base \
> +    packagegroup-arago-console \
> +    packagegroup-arago-base-tisdk \
> +    ${VIRTUAL-RUNTIME_initramfs} \
> +    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', d)} \
> +    "
> +
> +export IMAGE_BASENAME = "tisdk-base-image-sk"
> +
> +export IMAGE_BASENAME = "tisdk-base-image-sk"

Duplicate?


> +export IMAGE_LINK_NAME = "tisdk-base-image-am64xx-sk"
> +export DEPLOY_DIR_IMAGE="/mnt/4TB-VD1/ti_devm_sdk/devm_linux/am64x_sk/yocto_local_am64x_sk/oe-layersetup/build/arago-tmp-external-arm-glibc/deploy/images/am64xx-evm/sk"

I don't have "/mnt/4TB-VD1/..." - should not be an absolute path.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

