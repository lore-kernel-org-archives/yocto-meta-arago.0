Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C383852A09
	for <meta-arago@arago-project.org>;
	Wed, 21 Jul 2021 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F108740C4E;
	Wed, 21 Jul 2021 16:54:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id wtI-ZRSSQVgk; Wed, 21 Jul 2021 16:54:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B1E1040A46;
	Wed, 21 Jul 2021 16:53:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7BD3717463E; Wed, 21 Jul 2021 12:53:55 -0400 (EDT)
Date: Wed, 21 Jul 2021 12:53:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <20210721165355.GK1528@denix.org>
References: <20210721152941.21640-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210721152941.21640-1-grygorii.strashko@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [dunfell][PATCH] iproute2: upgrade to 5.10
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
X-List-Received-Date: Wed, 21 Jul 2021 16:53:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 21, 2021 at 06:29:41PM +0300, Grygorii Strashko wrote:
> Upgrade iproute2 to 5.10

Same comment as ethtool, but otherwise is fine.


> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  .../iproute2/iproute2.inc                     | 88 +++++++++++++++++++
>  ...01-libc-compat.h-add-musl-workaround.patch | 39 ++++++++
>  .../iproute2/iproute2_5.10.0.bb               | 12 +++
>  3 files changed, 139 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc
>  create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
>  create mode 100644 meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.10.0.bb
> 
> diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc b/meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc
> new file mode 100644
> index 00000000..6a5dafaa
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2.inc
> @@ -0,0 +1,88 @@
> +SUMMARY = "TCP / IP networking and traffic control utilities"
> +DESCRIPTION = "Iproute2 is a collection of utilities for controlling \
> +TCP / IP networking and traffic control in Linux.  Of the utilities ip \
> +and tc are the most important.  ip controls IPv4 and IPv6 \
> +configuration and tc stands for traffic control."
> +HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
> +SECTION = "base"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
> +                    file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
> +
> +DEPENDS = "flex-native bison-native iptables libcap"
> +
> +inherit update-alternatives bash-completion pkgconfig
> +
> +CLEANBROKEN = "1"
> +
> +PACKAGECONFIG ??= "tipc elf devlink"
> +PACKAGECONFIG[tipc] = ",,libmnl,"
> +PACKAGECONFIG[elf] = ",,elfutils,"
> +PACKAGECONFIG[devlink] = ",,libmnl,"
> +
> +IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}"
> +
> +EXTRA_OEMAKE = "\
> +    CC='${CC}' \
> +    KERNEL_INCLUDE=${STAGING_INCDIR} \
> +    DOCDIR=${docdir}/iproute2 \
> +    SUBDIRS='${IPROUTE2_MAKE_SUBDIRS}' \
> +    SBINDIR='${base_sbindir}' \
> +    LIBDIR='${libdir}' \
> +"
> +
> +do_configure_append () {
> +    sh configure ${STAGING_INCDIR}
> +    # Explicitly disable ATM support
> +    sed -i -e '/TC_CONFIG_ATM/d' config.mk
> +}
> +
> +do_install () {
> +    oe_runmake DESTDIR=${D} install
> +    mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
> +    install -d ${D}${datadir}
> +    mv ${D}/share/* ${D}${datadir}/ || true
> +    rm ${D}/share -rf || true
> +}
> +
> +# The .so files in iproute2-tc are modules, not traditional libraries
> +INSANE_SKIP_${PN}-tc = "dev-so"
> +
> +IPROUTE2_PACKAGES =+ "\
> +    ${PN}-devlink \
> +    ${PN}-genl \
> +    ${PN}-ifstat \
> +    ${PN}-ip \
> +    ${PN}-lnstat \
> +    ${PN}-nstat \
> +    ${PN}-rtacct \
> +    ${PN}-ss \
> +    ${PN}-tc \
> +    ${PN}-tipc \
> +"
> +
> +PACKAGE_BEFORE_PN = "${IPROUTE2_PACKAGES}"
> +RDEPENDS_${PN} += "${PN}-ip"
> +
> +FILES_${PN}-tc = "${base_sbindir}/tc* \
> +                  ${libdir}/tc/*.so"
> +FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
> +                      ${base_sbindir}/ctstat \
> +                      ${base_sbindir}/rtstat"
> +FILES_${PN}-ifstat = "${base_sbindir}/ifstat"
> +FILES_${PN}-ip = "${base_sbindir}/ip.${PN} ${sysconfdir}/iproute2"
> +FILES_${PN}-genl = "${base_sbindir}/genl"
> +FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
> +FILES_${PN}-nstat = "${base_sbindir}/nstat"
> +FILES_${PN}-ss = "${base_sbindir}/ss"
> +FILES_${PN}-tipc = "${base_sbindir}/tipc"
> +FILES_${PN}-devlink = "${base_sbindir}/devlink"
> +
> +ALTERNATIVE_${PN}-ip = "ip"
> +ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
> +ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
> +ALTERNATIVE_PRIORITY = "100"
> +
> +ALTERNATIVE_${PN}-tc = "tc"
> +ALTERNATIVE_LINK_NAME[tc] = "${base_sbindir}/tc"
> +ALTERNATIVE_PRIORITY_${PN}-tc = "100"
> diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
> new file mode 100644
> index 00000000..74e3de1c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
> @@ -0,0 +1,39 @@
> +From c25f8d1f7a6203dfeb10b39f80ffd314bb84a58d Mon Sep 17 00:00:00 2001
> +From: Baruch Siach <baruch@tkos.co.il>
> +Date: Thu, 22 Dec 2016 15:26:30 +0200
> +Subject: [PATCH] libc-compat.h: add musl workaround
> +
> +The libc-compat.h kernel header uses glibc specific macros (__GLIBC__ and
> +__USE_MISC) to solve conflicts with libc provided headers. This patch makes
> +libc-compat.h work for musl libc as well.
> +
> +Upstream-Status: Pending
> +
> +Taken From:
> +https://git.buildroot.net/buildroot/tree/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +Signed-off-by: Maxin B. John <maxin.john@intel.com>
> +
> +---
> + include/uapi/linux/libc-compat.h | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
> +index a159991..22198fa 100644
> +--- a/include/uapi/linux/libc-compat.h
> ++++ b/include/uapi/linux/libc-compat.h
> +@@ -50,10 +50,12 @@
> + #define _LIBC_COMPAT_H
> + 
> + /* We have included glibc headers... */
> +-#if defined(__GLIBC__)
> ++#if 1
> ++#define __USE_MISC
> + 
> + /* Coordinate with glibc net/if.h header. */
> + #if defined(_NET_IF_H) && defined(__USE_MISC)
> ++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
> + 
> + /* GLIBC headers included first so don't define anything
> +  * that would already be defined. */
> diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.10.0.bb b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.10.0.bb
> new file mode 100644
> index 00000000..6bdb5907
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_5.10.0.bb
> @@ -0,0 +1,12 @@
> +require iproute2.inc
> +
> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
> +           file://0001-libc-compat.h-add-musl-workaround.patch \
> +	   file://0014-iplink-hsr-prp-add-support-for-vlan-tagged-supervisi.patch \
> +           "
> +
> +SRC_URI[sha256sum] = "a54a34ae309c0406b2d1fb3a46158613ffb83d33fefd5d4a27f0010237ac53e9"
> +
> +# CFLAGS are computed in Makefile and reference CCOPTS
> +#
> +EXTRA_OEMAKE_append = " CCOPTS='${CFLAGS}'"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

