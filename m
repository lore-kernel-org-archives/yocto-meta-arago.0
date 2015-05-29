Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6A73F52A31
	for <meta-arago@arago-project.org>;
	Fri, 29 May 2015 19:34:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TJYYO8003231
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 14:34:34 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TJYYMw031562
	for <meta-arago@arago-project.org>; Fri, 29 May 2015 14:34:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 14:34:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TJYYG6025933;
	Fri, 29 May 2015 14:34:34 -0500
Date: Fri, 29 May 2015 15:34:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <hzhang@ti.com>
Message-ID: <20150529193433.GO16418@edge>
References: <1432758765-28548-1-git-send-email-hzhang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432758765-28548-1-git-send-email-hzhang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] recovery-kernel: add recovery kernel dtb build for K2L and K2E
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
X-List-Received-Date: Fri, 29 May 2015 19:34:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Wed, May 27, 2015 at 04:32:45PM -0400, hzhang@ti.com wrote:
> From: Hao Zhang <hzhang@ti.com>
> 
> The patch adds the Linux recovery kernel device tree build for K2L and
> K2E devices based on kernel v3.10.72.
> 
> Signed-off-by: Hao Zhang <hzhang@ti.com>
> ---
>  .../recovery-kernel/recovery-kernel_1.0.bb         |   18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
> index ad3528e..6e4f9c7 100644
> --- a/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
> +++ b/meta-arago-extras/recipes-kernel/recovery-kernel/recovery-kernel_1.0.bb
> @@ -1,10 +1,10 @@
>  DESCRIPTION = "Recovery kernel building for Keystone EVM"
>  LICENSE = "GPLv2"
>  
> -PR = "r2"
> +PR = "r3"
>  COMPATIBLE_MACHINE = "keystone"
> -BRANCH = "master"
> -SRCREV = "9bc93706b37c39c3a95593dc3d56773e9b7425ad"
> +BRANCH = "v3.10.72/master"
> +SRCREV = "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
>  SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}"
>  S = "${WORKDIR}/git"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>  FILES_${PN} += "${bindir}/crashdump"
>  LINUX_ZIMAGE = "zImage"
>  KERNEL_MACHINE ?= "keystone2_recovery_defconfig"
> -KERNEL_DTBTYPE = "k2hk-evm-recovery.dtb"
> +KERNEL_DTBTYPE = "k2hk-evm-recovery.dtb k2l-evm-recovery.dtb k2e-evm-recovery.dtb "
>  CRASHDIR = "crashdump"
>  ARCH = "${TARGET_ARCH}"
>  CROSS_COMPILE = "${TARGET_PREFIX}"
> @@ -27,11 +27,17 @@ do_configure () {
>  do_compile() {
>  	make ${LINUX_ZIMAGE} KALLSYMS_EXTRA_PASS=1
>  	make ${KERNEL_DTBTYPE}
> -	dtc -I dtb -O dtb -p 2048 -o ${KERNEL_DTBTYPE} arch/arm/boot/dts/${KERNEL_DTBTYPE}
> +        for d in ${KERNEL_DTBTYPE}
> +        do
> +            dtc -I dtb -O dtb -p 2048 -o $d arch/arm/boot/dts/$d
> +        done
>  }
>  
>  do_install () {
>  	install -d ${D}${bindir}/${CRASHDIR}/
>  	install ${S}/arch/arm/boot/${LINUX_ZIMAGE} ${D}${bindir}/${CRASHDIR}
> -	install ${S}/${KERNEL_DTBTYPE} ${D}${bindir}/${CRASHDIR}
> +        for d in ${KERNEL_DTBTYPE}
> +        do
> +            install ${S}/$d ${D}${bindir}/${CRASHDIR}
> +        done
>  }
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

