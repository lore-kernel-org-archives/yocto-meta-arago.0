Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 675E4529DA
	for <meta-arago@arago-project.org>;
	Sat, 21 Mar 2015 00:10:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2L0A9hU031405
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 19:10:09 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2L0A863025100
	for <meta-arago@arago-project.org>; Fri, 20 Mar 2015 19:10:08 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Mar 2015 19:10:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2L0A7LQ025436;
	Fri, 20 Mar 2015 19:10:07 -0500
Date: Fri, 20 Mar 2015 20:10:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150321001006.GS11557@edge>
References: <1426127016-21527-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1426127016-21527-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/5] recovery-kernel: recovery kernel build for keystone
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
X-List-Received-Date: Sat, 21 Mar 2015 00:10:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Well, there are few minor issues with some of the recipes in this patchset, 
but overall is fine.


On Wed, Mar 11, 2015 at 10:23:32PM -0400, Sam Nelson wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> Build recovery kernel image and k2hk-evm dtb image for Keystone II
> devices.
> 
> Normally when kernel is booted by u-boot,  u-boot takes care to reserve
> free memory space in the DTB, which is required for kernel. For recovery
> image, user has to add the free space manually using dtc compiler.
> 
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  .../recovery-kernel/recovery-kernel_1.0.bb         |   39 ++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
> 
> diff --git a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
> new file mode 100644
> index 0000000..634f7c5
> --- /dev/null
> +++ b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
> @@ -0,0 +1,39 @@
> +DESCRIPTION = "Recovery kernel building for Keystone EVM"
> +LICENSE = "GPLv2"
> +
> +PR = "r2"
> +EXTRA_OEMAKE += " KALLSYMS_EXTRA_PASS=1"
> +DEFAULT_PREFERENCE = "1"
> +COMPATIBLE_MACHINE = "keystone"
> +BRANCH = "master"
> +SRCREV = "9bc93706b37c39c3a95593dc3d56773e9b7425ad"
> +SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}"
> +S = "${WORKDIR}/git"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
> +FILES_${PN} += "${bindir}/crashdump"
> +LINUX_ZIMAGE = "zImage"
> +KERNEL_MACHINE ?= "keystone2_recovery_defconfig"
> +KERNEL_DTBTYPE = "k2hk-evm-recovery.dtb"
> +CRASHDIR = "crashdump"
> +ARCH = "${TARGET_ARCH}"
> +CROSS_COMPILE = "${TARGET_PREFIX}"
> +
> +export ARCH
> +export CROSS_COMPILE
> +
> +do_configure () {
> +	make ${KERNEL_MACHINE}
> +}
> +
> +do_compile() {
> +	make ${LINUX_ZIMAGE} KALLSYMS_EXTRA_PASS=1
> +	make ${KERNEL_DTBTYPE}
> +	dtc -I dtb -O dtb -p 2048 -o ${KERNEL_DTBTYPE} arch/arm/boot/dts/${KERNEL_DTBTYPE}
> +}
> +
> +do_install () {
> +	install -d ${D}${bindir}/${CRASHDIR}/
> +	install ${S}/arch/arm/boot/${LINUX_ZIMAGE} ${D}${bindir}/${CRASHDIR}
> +	install ${S}/${KERNEL_DTBTYPE} ${D}${bindir}/${CRASHDIR}
> +}
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

