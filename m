Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3903852A8E
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 03:06:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v23368I9027664;
	Thu, 2 Mar 2017 21:06:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488510368;
	bh=LKpYdaqWxY0D1KDk5XP/Wy7HBeizD/DoKQWfU4doQ7E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=p3A40faUWX5TgTnNolhNdLYco/CgvU27pQfQF7IGG8avB3wQzRcf/k30ASMsytsjg
	6IeL02cD9lzReQh4MAQtQesm3FvlkrKWIheWA17J1p4zHpomvts1v8F/xQOo2CcaHA
	CpCjW9zgVu6JehQ7NTT1whLiAIFgZJrR+Mh4NIOU=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23368qR004320;
	Thu, 2 Mar 2017 21:06:08 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Mar 2017 21:06:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23367kA000314;
	Thu, 2 Mar 2017 21:06:07 -0600
Date: Thu, 2 Mar 2017 22:06:07 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170303030607.GD12614@edge>
References: <1488509945-12853-1-git-send-email-denis@denix.org>
	<1488509945-12853-7-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1488509945-12853-7-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master][PATCH 06/12] images: disable matrix, as php was blacklised upstream for breakage
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
X-List-Received-Date: Fri, 03 Mar 2017 03:06:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Should probably use "HACK:" prefix to easily spot in the future.


On Thu, Mar 02, 2017 at 09:58:59PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc   | 3 ++-
>  meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb        | 3 ++-
>  meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> index 71041f8..98e824d 100644
> --- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> +++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
> @@ -51,12 +51,13 @@ IMAGE_INSTALL_QT = "\
>  IMAGE_INSTALL_QT_keystone = ""
>  IMAGE_INSTALL_QT_omapl138 = ""
>  
> +# Disable in master due to php breakage
> +#    packagegroup-arago-tisdk-matrix-sdk-host
>  IMAGE_INSTALL = "\
>      packagegroup-arago-tisdk-addons-sdk-host \
>      ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-sdk-host','',d)} \
>      packagegroup-arago-tisdk-crypto-sdk-host \
>      ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
> -    packagegroup-arago-tisdk-matrix-sdk-host \
>      packagegroup-arago-tisdk-multimedia-sdk-host \
>      packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
>      ${IMAGE_INSTALL_QT} \
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> index c511b83..3744d0b 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> @@ -2,6 +2,8 @@
>  
>  require arago-image.inc
>  
> +# Disbaled in master due to php breakage
> +#    packagegroup-arago-tisdk-matrix
>  IMAGE_INSTALL += "\
>      packagegroup-arago-base \
>      packagegroup-arago-console \
> @@ -14,7 +16,6 @@ IMAGE_INSTALL += "\
>      ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
>      packagegroup-arago-tisdk-connectivity \
>      packagegroup-arago-tisdk-crypto \
> -    packagegroup-arago-tisdk-matrix \
>      packagegroup-arago-tisdk-multimedia \
>      packagegroup-arago-tisdk-amsdk \
>      packagegroup-arago-tisdk-addons \
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> index b64d092..5f4caa6 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> @@ -4,11 +4,12 @@ require arago-base-tisdk-image.bb
>  
>  SPLASH = ""
>  
> +# Disable in master due to php breakage
> +#    packagegroup-arago-tisdk-matrix
>  IMAGE_INSTALL += "\
>      packagegroup-arago-tisdk-addons \
>      ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
>      packagegroup-arago-tisdk-crypto \
> -    packagegroup-arago-tisdk-matrix \
>      packagegroup-arago-base-tisdk-server-extra \
>      packagegroup-arago-tisdk-connectivity \
>  "
> -- 
> 2.7.4
> 

