Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 0F9AA52A34
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 17:29:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29HTFbT030973
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 11:29:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489080555;
	bh=G+7L+z2AWPOoMpThanZYMQ90vpIunfSWvLqV5HmlX/o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gqIvKg2mx4GmY+tWxvp2k+Fr/FuXZ9SSSDytM6epbv2bSAh7WkzLAgPgq6FZ3dH2X
	UYJhefRzZUD6CuoWnAJozzQ2FTgjoosp2h2K9AR85Z47oOz1K0GkpUq2UJfNT9fyHE
	JLH5JWRB7vl/oxnHvmPlIGrvOPg0Lq4Rd7W2aU98=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29HTFoQ020990
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 11:29:15 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 11:29:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29HTF5j014708;
	Thu, 9 Mar 2017 11:29:15 -0600
Date: Thu, 9 Mar 2017 12:29:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20170309172914.GH578@edge>
References: <1488904376-21769-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1488904376-21769-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/krogoth][PATCH] packagegroup-arago-tisdk-multimedia*: add hevc-arm-decoder for keystone
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
X-List-Received-Date: Thu, 09 Mar 2017 17:29:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 07, 2017 at 11:32:56AM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../packagegroup-arago-tisdk-multimedia-sdk-target.bb             | 8 ++++++--
>  .../packagegroups/packagegroup-arago-tisdk-multimedia.bb          | 6 ++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> index 3c72bf0..6f3b559 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to build and install header and libs into sdk"
>  LICENSE = "MIT"
> -PR = "r10"
> +PR = "r11"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -18,7 +18,11 @@ MULTIMEDIA_append_ti33x = " barcode-roi-dev"
>  MULTIMEDIA_append_ti43x = " barcode-roi-dev"
>  MULTIMEDIA_append_omap-a15 = " barcode-roi-dev"
>  
> -MULTIMEDIA_append_keystone = " barcode-roi-dev"
> +MULTIMEDIA_append_keystone = " \
> +    hevc-arm-decoder-dev \
> +    hevc-arm-decoder-staticdev \
> +    barcode-roi-dev \
> +"
>  
>  RDEPENDS_${PN} = "\
>      ${MULTIMEDIA} \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> index cb143b8..d850e0f 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Task to add multimedia related packages"
>  LICENSE = "MIT"
> -PR = "r20"
> +PR = "r21"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -10,7 +10,9 @@ MULTIMEDIA = " \
>      amsdk-av-files \
>  "
>  
> -MULTIMEDIA_keystone = ""
> +MULTIMEDIA_append_keystone = " \

This would also pull amsdk-av-files from above - is it expected?


> +    hevc-arm-decoder \
> +"
>  
>  MULTIMEDIA_append_ti43x = " \
>      dual-camera-demo \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

