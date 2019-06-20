Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 61ABB5297E
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 13:11:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KDAeuH042874
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 08:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561036240;
	bh=9LmgvPYhSy4u6PE1/gr7oYxLM2FfelC3e4C/EQ30hmY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=PzMgHGKwzbdASXEg4rvjWim41K+P0CYh5hhURMD+Yl7s0DpldTw5rQhQASj+dwAqk
	OP4y9hWzfKIt8p7nfo4TbaMq+2in+SfYhr0xDXY7Cdk/Dv1yANTLRyRwHicJea6spu
	ZRXQKP4Ys+XgqOhIBDB40HolrXLK3xqhGtplILMs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KDAetc129888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 08:10:40 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 08:10:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 08:10:40 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KDAdiC028517
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 08:10:40 -0500
To: <meta-arago@arago-project.org>
References: <1560859950-12071-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <ecbb0e39-7c6f-93ec-dd99-f2a4594f8b02@ti.com>
Date: Thu, 20 Jun 2019 09:10:40 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560859950-12071-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [master/thud/ti2019.01][PATCH] tisdk-server-rootfs-image: remove ubi/ubifs freom IMAGE_FSTYPES
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
X-List-Received-Date: Thu, 20 Jun 2019 13:11:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake

On 6/18/2019 8:12 AM, Jacob Stiffler wrote:
> * The tisdk-server-rootfs-image size has exceeded HW limitations so
>    remove ubi/ubifs from IMAGE_FSTYPES.
> * Remove the tisdk-server-extra-rootfs-image as this was the original
>    intent of that image.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../recipes-core/images/arago-core-tisdk-image.inc          |  6 +++---
>   .../recipes-core/images/tisdk-server-extra-rootfs-image.bb  | 13 -------------
>   .../recipes-core/images/tisdk-server-rootfs-image.bb        |  8 ++++++++
>   3 files changed, 11 insertions(+), 16 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
>
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> index 45a8c1b..0125bb5 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> @@ -38,9 +38,9 @@ TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image arago-tiny-image"
>   TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
>   
>   # Some devices do not support display and use a server image instead
> -TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
> -TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
> -TARGET_IMAGES_j7-evm = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
> +TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
> +TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
> +TARGET_IMAGES_j7-evm = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
>   
>   TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
>   TOOLCHAIN_SUFFIX = "-tisdk"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
> deleted file mode 100644
> index 359dc90..0000000
> --- a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require recipes-core/images/tisdk-server-rootfs-image.bb
> -
> -IMAGE_INSTALL += "\
> -    packagegroup-arago-test-addons \
> -    packagegroup-arago-tisdk-addons-extra \
> -    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
> -    packagegroup-arago-tisdk-multimedia \
> -    packagegroup-arago-tisdk-matrix-extra \
> -"
> -
> -export IMAGE_BASENAME = "tisdk-server-extra-rootfs-image"
> -
> -IMAGE_FSTYPES = "tar.xz"
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> index b64d092..09d9f9d 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> @@ -6,11 +6,19 @@ SPLASH = ""
>   
>   IMAGE_INSTALL += "\
>       packagegroup-arago-tisdk-addons \
> +    packagegroup-arago-tisdk-addons-extra \
>       ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
> +    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
>       packagegroup-arago-tisdk-crypto \
> +    packagegroup-arago-tisdk-multimedia \
>       packagegroup-arago-tisdk-matrix \
> +    packagegroup-arago-tisdk-matrix-extra \
>       packagegroup-arago-base-tisdk-server-extra \
>       packagegroup-arago-tisdk-connectivity \
>   "
>   
>   export IMAGE_BASENAME = "tisdk-server-rootfs-image"
> +
> +# Disable ubi/ubifs as the filesystem requires more space than is
> +# available on the HW.
> +IMAGE_FSTYPES_remove = "ubifs ubi"

