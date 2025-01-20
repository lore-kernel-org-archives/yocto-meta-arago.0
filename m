Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8A0C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 21:13:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1475.1737407631807605326
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 20 Jan 2025 13:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2153D40C06;
	Mon, 20 Jan 2025 21:13:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fNmf01e_pcIf; Mon, 20 Jan 2025 21:13:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E0B5B40021;
	Mon, 20 Jan 2025 21:13:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4BBE216415A; Mon, 20 Jan 2025 16:13:47 -0500 (EST)
Date: Mon, 20 Jan 2025 16:13:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: reatmon@ti.com, c-shilwant@ti.com, meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH] meta-arago: break dependency on
 meta-arago-demos
Message-ID: <20250120211347.GK21836@denix.org>
References: <20250116192950.3391293-2-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116192950.3391293-2-rs@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 20 Jan 2025 21:13:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15714

On Thu, Jan 16, 2025 at 01:29:51PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Remove any explicit dependencies on meta-arago-demos. These were the
> last of the "demos" in this layer and they were only being built for
> legacy devices. Demos should primarily be in layers above this unless
> they are used for functionality testing.

Why not move those pieces to meta-arago-demos then?

E.g. move the packagegroups there and add bbappends for the default image and 
world recipes, etc.


> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 
> Trying to do this gracefully. Break the dependency first, then update the
> oe-layersetup configs, then drop the layer entirely.
> 
>  .../images/tisdk-default-image.bb             | 14 +-------
>  ...kagegroup-arago-tisdk-addons-sdk-target.bb | 17 ---------
>  .../packagegroup-arago-tisdk-addons.bb        |  2 --
>  .../packagegroup-arago-tisdk-hmi.bb           | 36 -------------------
>  .../recipes-core/packagegroups/ti-demos.bb    | 18 ----------
>  .../recipes-core/packagegroups/ti-world.bb    | 10 +-----
>  6 files changed, 2 insertions(+), 95 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
>  delete mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index 6c46c423..10493415 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -23,24 +23,13 @@ IMAGE_INSTALL += "\
>      packagegroup-arago-tisdk-multimedia \
>      packagegroup-arago-tisdk-addons \
>      packagegroup-arago-tisdk-addons-extra \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
> -    ti-demos \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-tisdk-server-extra',d)} \
>      ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
>      packagegroup-arago-tisdk-sysrepo \
>  "
>  
>  export IMAGE_BASENAME = "tisdk-default-image${ARAGO_IMAGE_SUFFIX}"
>  
> -EXTRABROWSERS = " \
> -    qtwebbrowser-examples \
> -    qtwebengine-qmlplugins \
> -    qtwebengine-examples \
> -"
> -
> -PYTHON2APPS = " \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRABROWSERS}",'',d)} \
> -"
> -
>  DEVTOOLS = " \
>      linux-libc-headers-dev \
>      build-essential \
> @@ -50,7 +39,6 @@ DEVTOOLS = " \
>  "
>  
>  IMAGE_INSTALL += "\
> -    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
>      ${DEVTOOLS} \
>      ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
>      docker \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> index 3e0a2720..8690a874 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> @@ -31,24 +31,7 @@ EXTRA_LIBS:append:dra7xx = " libulm-dev \
>                               gdbserver-c6x-dev \
>  "
>  
> -PDM_ANOMALY_PKG_DEV = "\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection-dev', '', d)} \
> -"
> -
> -
>  EXTRA_PACKAGES = ""
> -#EXTRA_PACKAGES:append:ti33x = " \
> -#                                ${PDM_ANOMALY_PKG_DEV} \
> -#"
> -#EXTRA_PACKAGES:append:ti43x = " \
> -#                                ${PDM_ANOMALY_PKG_DEV} \
> -#"
> -#EXTRA_PACKAGES:append:omap-a15 = " \
> -#                                ${PDM_ANOMALY_PKG_DEV} \
> -#"
> -#EXTRA_PACKAGES:append:am65xx = " \
> -#                             ${PDM_ANOMALY_PKG_DEV} \
> -#"
>  
>  IPCDEV = " \
>  	ti-ipc-dev \
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> index 6b6533f5..b0d76b28 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> @@ -85,10 +85,8 @@ EXTRA_PACKAGES:omapl138 = " \
>      protobuf \
>  "
>  
> -# acontis-atemsys
>  #EXTRA_PACKAGES:append:am335x-evm = " pruss-lld-apps"
>  #EXTRA_PACKAGES:append:am437x-evm = " pruss-lld-apps"
> -# acontis-atemsys
>  #EXTRA_PACKAGES:append:am57xx-evm = " pruss-lld-apps"
>  
>  RDEPENDS:${PN} = "\
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
> deleted file mode 100644
> index a8261bf2..00000000
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -SUMMARY = "Task to add HMI related packages"
> -LICENSE = "MIT"
> -PR = "r0"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -inherit packagegroup
> -
> -HMI = " \
> -"
> -
> -
> -HMI:append:ti33x = " \
> -    evse-hmi \
> -    protection-relays-hmi \
> -    mmwavegesture-hmi \
> -"
> -
> -HMI:append:ti43x = " \
> -    evse-hmi \
> -    mmwavegesture-hmi \
> -"
> -
> -HMI:append:omap-a15 = " \
> -    evse-hmi \
> -    mmwavegesture-hmi \
> -"
> -
> -HMI:append:am65xx = " \
> -    evse-hmi \
> -    mmwavegesture-hmi \
> -"
> -
> -RDEPENDS:${PN} = "\
> -	${HMI} \
> -"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> deleted file mode 100644
> index 7bccb4de..00000000
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "TI World packagegroup"
> -LICENSE = "MIT"
> -
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -inherit packagegroup
> -
> -PDM_ANOMALY_PKG = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'pdm-anomaly-detection', '', d)}"
> -
> -PDM_ANOMALY = ""
> -PDM_ANOMALY:ti33x = "${PDM_ANOMALY_PKG}"
> -PDM_ANOMALY:ti43x = "${PDM_ANOMALY_PKG}"
> -PDM_ANOMALY:omap-a15 = "${PDM_ANOMALY_PKG}"
> -PDM_ANOMALY:am65xx = "${PDM_ANOMALY_PKG}"
> -
> -RDEPENDS:${PN} = "\
> -    ${PDM_ANOMALY} \
> -"
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> index 438dd8d0..fc3eac74 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> @@ -15,14 +15,7 @@ CHROMIUM:append:k3 = "\
>      chromium-ozone-wayland \
>  "
>  
> -EXTRABROWSERS = " \
> -    qtwebbrowser-examples \
> -    qtwebengine-qmlplugins \
> -    qtwebengine-examples \
> -"
> -
>  PYTHON2APPS = " \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl',"${EXTRABROWSERS}",'',d)} \
>      ${@bb.utils.contains("BBFILE_COLLECTIONS","browser-layer",bb.utils.contains('DISTRO_FEATURES','wayland',"${CHROMIUM}",'',d),'',d)} \
>  "
>  
> @@ -45,11 +38,10 @@ RDEPENDS:${PN} = "\
>      packagegroup-arago-tisdk-multimedia \
>      packagegroup-arago-tisdk-addons \
>      packagegroup-arago-tisdk-addons-extra \
> -    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago-base-tisdk-server-extra',d)} \
>      ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2APPS}", "", d)} \
>      ${DEVTOOLS} \
>      ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
>      packagegroup-arago-misc \
> -    ti-demos \
>      ${PREFERRED_PROVIDER_virtual/docker} \
>  "
> -- 
> 2.47.1

