Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1A7D7977F
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 15:40:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11194.1769874006250107900
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 31 Jan 2026 07:40:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 74DF940CB4;
	Sat, 31 Jan 2026 15:40:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LC3MT8D4uuHc; Sat, 31 Jan 2026 15:40:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2B08D40A20;
	Sat, 31 Jan 2026 15:40:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D67D6178162; Sat, 31 Jan 2026 10:40:00 -0500 (EST)
Date: Sat, 31 Jan 2026 10:40:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Anurag Dutta <a-dutta@ti.com>
Cc: reatmon@ti.com, gehariprasath@ti.com, a-limaye@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH v3] meta-ti-bsp: Add udev rules for
 MCAN to meta-ti
Message-ID: <20260131154000.GR11121@denix.org>
References: <20260130110622.2338091-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130110622.2338091-1-a-dutta@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 31 Jan 2026 15:40:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17062

On Fri, Jan 30, 2026 at 04:36:22PM +0530, Anurag Dutta wrote:
> Add MCAN udev rules to meta-ti so that MCAN tests run
> successfully.

Thanks, this is getting close, but I have a couple of comments (besides the 
wrong list), see below.


> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> Tested on j721s2 (poky) : https://gist.github.com/anuragdutta731/67c24da1616e74efa2b117a3bd88ada6
> 
> Link to v1 : https://lore.kernel.org/all/20260106060815.868724-1-a-dutta@ti.com/
> changelog v2:
> 1. moved all the rules from meta-arago-distro to meta-arago-test
> 2. removed udev* from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> 
> Link to v2: https://lore.kernel.org/all/20260107052154.1598698-1-a-dutta@ti.com/
> changelog v3:
> 1.Added the udev rules to meta-ti
> 
>  meta-ti-bsp/conf/machine/include/k3.inc       |  2 +-
>  .../udev/udev-ticonf/37-can-am62.rules        |  4 ++++
>  .../udev/udev-ticonf/37-can-dra7.rules        |  2 ++
>  .../udev/udev-ticonf/37-can-j7.rules          | 20 +++++++++++++++++
>  .../udev/udev-ticonf/37-can-ti33x.rules       |  2 ++
>  .../recipes-core/udev/udev-ticonf_1.bb        | 22 +++++++++++++++++++
>  6 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules
>  create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules
>  create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules
>  create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules
>  create mode 100644 meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb
> 
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 698b46d7..68129df9 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -39,7 +39,7 @@ UBI_VOLNAME = "rootfs"
>  
>  # List common SoC features, may need to add touchscreen for specific machines
>  MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci optee-ftpm"
> -MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw udev-ticonf"

You are only adding this to k3.inc, but the recipe installs rules for 4 SoC 
families - am62, j7, dra7 and ti33x. The last 2 are not part of k3 and the 
same change needs to be added to their corresponding SoC family .inc files.


>  IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
>  
> diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules
> new file mode 100644
> index 00000000..59dc8075
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-am62.rules
> @@ -0,0 +1,4 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e08000.can", NAME="mcu_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4e18000.can", NAME="mcu_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20701000.can", NAME="main_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="20711000.can", NAME="main_mcan1"
> diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules
> new file mode 100644
> index 00000000..3b14150d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-dra7.rules
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="4ae3c000.can", NAME="main_dcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="48480000.can", NAME="main_dcan2"
> diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules
> new file mode 100644
> index 00000000..f2804ecd
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-j7.rules
> @@ -0,0 +1,20 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="40528000.can", NAME="mcu_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="40568000.can", NAME="mcu_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2701000.can", NAME="main_mcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2711000.can", NAME="main_mcan1"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2721000.can", NAME="main_mcan2"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2731000.can", NAME="main_mcan3"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2741000.can", NAME="main_mcan4"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2751000.can", NAME="main_mcan5"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2761000.can", NAME="main_mcan6"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2771000.can", NAME="main_mcan7"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2781000.can", NAME="main_mcan8"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2791000.can", NAME="main_mcan9"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27a1000.can", NAME="main_mcan10"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27b1000.can", NAME="main_mcan11"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27c1000.can", NAME="main_mcan12"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="27d1000.can", NAME="main_mcan13"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2681000.can", NAME="main_mcan14"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="2691000.can", NAME="main_mcan15"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="26a1000.can", NAME="main_mcan16"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="26b1000.can", NAME="main_mcan17"
> diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules
> new file mode 100644
> index 00000000..62d650fe
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf/37-can-ti33x.rules
> @@ -0,0 +1,2 @@
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="481cc000.can", NAME="main_dcan0"
> +SUBSYSTEM=="net", ACTION=="add", KERNELS=="481d0000.can", NAME="main_dcan1"
> diff --git a/meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb b/meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb
> new file mode 100644
> index 00000000..1ef487c2
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-core/udev/udev-ticonf_1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Udev rules for assorted TI SoCs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +inherit bin_package
> +
> +SRC_URI = " \
> +    file://37-can-j7.rules \
> +    file://37-can-am62.rules \
> +    file://37-can-dra7.rules \
> +    file://37-can-ti33x.rules \
> +"
> +
> +S = "${WORKDIR}"

This is incorrect for master, need to use UNPACKDIR.


> +do_install() {
> +    install -d ${D}${libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/37-can-j7.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-am62.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-dra7.rules ${D}${libdir}/udev/rules.d/
> +    install -m 0644 ${WORKDIR}/37-can-ti33x.rules ${D}${libdir}/udev/rules.d/
> +}
> -- 
> 2.34.1

