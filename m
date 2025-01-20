Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77237C02182
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 21:29:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1817.1737408584932378366
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 20 Jan 2025 13:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3D6E440C06;
	Mon, 20 Jan 2025 21:29:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07J1PfW7DMcn; Mon, 20 Jan 2025 21:29:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0693240021;
	Mon, 20 Jan 2025 21:29:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BDE3016415A; Mon, 20 Jan 2025 16:29:40 -0500 (EST)
Date: Mon, 20 Jan 2025 16:29:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][scarthgap/master][PATCH 4/5] opencv: Remove
 OpenCV customization and DISTRO_FEATURE
Message-ID: <20250120212940.GM21836@denix.org>
References: <20250117211951.698377-1-afd@ti.com>
 <20250117211951.698377-4-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117211951.698377-4-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 20 Jan 2025 21:29:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15716

On Fri, Jan 17, 2025 at 03:19:50PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> These customizations are leftover from when we had DSP acceleration
> for OpenCV. 

> Also "opencv" is not a DISTRO_FEATURE

Do you mean it is not a DISTRO_FEATURE already defined in OE-Core? True.

Do you mean it cannot be used as a DISTRO_FEATURE? False.

Either way, in this context "opencv" *is* a DISTRO_FEATURE and is being used 
as such.

Any Distro is free to define its own set of additional DISTRO_FEATURES to be 
used locally or downstream, which was the case here.

Moreover, please note that "openmp" is another example of a locally-defined 
DISTRO_FEATURE here.

In other words - I'm fine with the changes, but not fine with the reasoning 
behind them...


>, it is a regular
> library, if you need OpenCV for a package you should just DEPEND on it.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../point-cloud-viewer/point-cloud-viewer_git.bb             | 4 ----
>  meta-arago-distro/conf/distro/arago.conf                     | 5 ++---
>  .../recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh     | 3 ---
>  .../recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh     | 3 ---
>  .../recipes-support/opencv/opencv/keystone/setupEnv.sh       | 3 ---
>  meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh  | 2 --
>  meta-arago-distro/recipes-support/opencv/opencv_%.bbappend   | 3 ---
>  7 files changed, 2 insertions(+), 21 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
>  delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
>  delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
>  delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
>  delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
> 
> diff --git a/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> index 0388a2e0..d08e0f6b 100644
> --- a/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> +++ b/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> @@ -3,10 +3,6 @@ HOMEPAGE = "https://git.ti.com/processor-sdk/point-cloud-viewer/"
>  LICENSE = "TI-TSPA"
>  LIC_FILES_CHKSUM := "file://PointCloudViewer_manifest.html;md5=7ea694db2dd8d82fd91a18cab8c2c2db"
>  
> -inherit features_check
> -
> -REQUIRED_DISTRO_FEATURES = "opencv"
> -
>  PR = "r2"
>  
>  COMPATIBLE_MACHINE = "dra7xx"
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index f1948523..baa526a9 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -50,13 +50,12 @@ DISTRO_FEATURES:append = " pam wayland opengl"
>  DISTRO_FEATURES:remove = "x11"
>  #DISTRO_FEATURES:append = " opencl"
>  DISTRO_FEATURES:append = " vulkan"
> -DISTRO_FEATURES:append = " opencv"
>  DISTRO_FEATURES:append = " openmp"
>  
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value
> -DISTRO_FEATURES_FILTER_NATIVE:append = " opencl opencv openmp"
> -DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
> +DISTRO_FEATURES_FILTER_NATIVE:append = " opencl openmp"
> +DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl openmp"
>  
>  # Set global runtime providers for major components
>  ARAGO_SYSVINIT ??= "0"
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
> deleted file mode 100644
> index 3ad25601..00000000
> --- a/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
> -export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
> -export OPENCV_OPENCL_DEVICE='TI AM57:ACCELERATOR:TI Multicore C66 DSP'
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
> deleted file mode 100644
> index 3ad25601..00000000
> --- a/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
> -export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
> -export OPENCV_OPENCL_DEVICE='TI AM57:ACCELERATOR:TI Multicore C66 DSP'
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
> deleted file mode 100644
> index 5b6bdb78..00000000
> --- a/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
> -export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
> -export OPENCV_OPENCL_DEVICE='TI KeyStone II:ACCELERATOR:TI Multicore C66 DSP'
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
> deleted file mode 100644
> index 5bf7afd3..00000000
> --- a/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
> -export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
> deleted file mode 100644
> index 2ee6bff7..00000000
> --- a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -inherit features_check
> -
> -REQUIRED_DISTRO_FEATURES = "opencv"
> -- 
> 2.39.2

