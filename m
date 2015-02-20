Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5EDC752A3F
	for <meta-arago@arago-project.org>;
	Fri, 20 Feb 2015 02:52:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1K2pxhC030785
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 20:51:59 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1K2pwq7031522
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 20:51:58 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Feb 2015 20:51:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1K2pwhF009751;
	Thu, 19 Feb 2015 20:51:58 -0600
Date: Thu, 19 Feb 2015 21:51:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150220025157.GF31287@edge>
References: <1424400404-29489-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1424400404-29489-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] ipsecmgr: Add recipes for ipsec manager kernel module and libraries
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
X-List-Received-Date: Fri, 20 Feb 2015 02:52:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Looks good. I'll take it, probably apply tomorrow. Thanks.


On Thu, Feb 19, 2015 at 09:46:44PM -0500, Sam Nelson wrote:
> - Provides module and libraries to offload IPSec security
>  policy & associated security association to NETCP for
>  crypto operations
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Changes from previous version of patch
> - Adjusted path wrt WORKDIR
> ---
> ---
>  .../recipes-support/ipsecmgr/ipsecmgr-mod_git.bb   |   20 +++++++++++++
>  .../recipes-support/ipsecmgr/ipsecmgr.inc          |    6 ++++
>  .../recipes-support/ipsecmgr/ipsecmgr_git.bb       |   30 ++++++++++++++++++++
>  3 files changed, 56 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
>  create mode 100644 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
>  create mode 100644 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
> 
> diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
> new file mode 100644
> index 0000000..b00da58
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "IPSec Manager kernel module"
> +DESCRIPTION = "Provides Module to offload IPSec security policy & associated security association to NETCP for crypto operations"
> +
> +LIC_FILES_CHKSUM = "file://../../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7eadca4fb5599f508dc11fa1e752919"
> +
> +include ipsecmgr.inc
> +
> +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +EXTRA_OEMAKE += "KDIR="${STAGING_KERNEL_DIR}""
> +
> +inherit module
> +
> +S = "${WORKDIR}/git/src/module"
> +
> +do_install() {
> +# Install kernel module
> +	oe_runmake INSTALL_MOD_PATH="${D}" install
> +}
> diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
> new file mode 100644
> index 0000000..2aafa57
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
> @@ -0,0 +1,6 @@
> +LICENSE = "BSD-3-Clause"
> +BRANCH="master"
> +SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
> +#Commit ID corresponding to DEV.IPSECMGR.01.01.00.03
> +SRCREV = "1ea8355ae9142311901c842c97a58d2846b308e6"
> +PV     = "01.01.00.03"
> diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
> new file mode 100644
> index 0000000..d134baf
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "IPSec Manager libraries"
> +DESCRIPTION = "Provides library to offload IPSec security policy & associated security association to NETCP for crypto operations"
> +
> +LIC_FILES_CHKSUM = "file://../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7eadca4fb5599f508dc11fa1e752919"
> +
> +include ipsecmgr.inc
> +
> +DEPENDS = "libnl-xfrm"
> +
> +CFLAGS += "-I${STAGING_INCDIR}/libnl3"
> +
> +S = "${WORKDIR}/git/build"
> +LIB_INC_DIR = "${WORKDIR}/git"
> +UTILS_LIB_INC_DIR = "${WORKDIR}/git/utils/iface/"
> +
> +do_compile() {
> +# Compile the library
> +	make clean
> +	make all
> +}
> +do_install() {
> +# Install libraries
> +	install -d ${D}${libdir}/
> +	install -c -m 666 libipsecmgr_snoop.a ${D}${libdir}/
> +	install -c -m 666 libipsecmgr_ipc.a ${D}${libdir}/
> +	install -c -m 666 libipsecmgr_syslog.a ${D}${libdir}/
> +	install -d ${D}${includedir}/
> +	install -c -m 666 ${LIB_INC_DIR}/*.h ${D}${includedir}/
> +	install -c -m 666 ${UTILS_LIB_INC_DIR}/*.h ${D}${includedir}/
> +}
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

