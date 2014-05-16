Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8465152A2C
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 18:54:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GIsIQY001719
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:54:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GIsIdc024327
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:54:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 13:54:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GIsIg5026426;
	Fri, 16 May 2014 13:54:18 -0500
Date: Fri, 16 May 2014 14:54:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Aravind Batni <aravindbr@ti.com>
Message-ID: <20140516185417.GE18053@edge>
References: <1400266196-9047-1-git-send-email-aravindbr@ti.com>
MIME-Version: 1.0
In-Reply-To: <1400266196-9047-1-git-send-email-aravindbr@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ti-transportnetlib-ipsecmgr: provides ti-ipsecmgr for ti KeyStone devices
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
X-List-Received-Date: Fri, 16 May 2014 18:54:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Aravind,

Please stop submitting new recipes. They are very similar to each other and 
full of errors and non-conformities.

Let's start with ti- prefix for all of them and dumping everything into 
recipes-bsp directory...

-- 
Denys


On Fri, May 16, 2014 at 02:49:56PM -0400, Aravind Batni wrote:
> - TI ipsecmgr library collections
> 
> Signed-off-by: Aravind Batni <aravindbr@ti.com>
> ---
>  .../ti-ipsecmgr/ti-transportnetlib-ipsecmgr_git.bb |   52 ++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-bsp/ti-ipsecmgr/ti-transportnetlib-ipsecmgr_git.bb
> 
> diff --git a/meta-arago-extras/recipes-bsp/ti-ipsecmgr/ti-transportnetlib-ipsecmgr_git.bb b/meta-arago-extras/recipes-bsp/ti-ipsecmgr/ti-transportnetlib-ipsecmgr_git.bb
> new file mode 100644
> index 0000000..7a73c3f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-bsp/ti-ipsecmgr/ti-transportnetlib-ipsecmgr_git.bb
> @@ -0,0 +1,52 @@
> +DESCRIPTION = "IPSec Manager"
> +LICENSE = "TI BSD"
> +LIC_FILES_CHKSUM = "file://ipsecmgr_snoop.h;md5=9ac68c91483a0ab7a9b1fb79622f2487" 
> +
> +BRANCH="master"
> +SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
> +#Commit ID corresponding to DEV.IPSECMGR.01.00.00.01
> +SRCREV = "fa51fbd4ad849627e02f2404edfa5be44043551a"
> +PR     = "r0"
> +PV     = "01.00.00.01"
> +
> +DEPENDS = "virtual/kernel"
> +DEPENDS += "libnl-xfrm"
> +
> +ALLOW_EMPTY_${PN} = "1"
> + 
> +S = "${WORKDIR}/git"
> +LIB_BUILD_DIR = "${S}/build"
> +MODULE_BUILD_DIR = "${S}/src/module"
> +LIB_INC_DIR = "${S}/"
> +UTILS_LIB_INC_DIR = "${S}/utils/iface/"
> +
> +inherit module
> +
> +MACHINE_KERNEL_PR_append = "a"
> +
> +do_compile() {
> +    cd ${LIB_BUILD_DIR}
> +    make clean;
> +    make all;
> +
> +    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +    cd ${MODULE_BUILD_DIR}
> +    make KDIR="${STAGING_KERNEL_DIR}" clean
> +    make KDIR="${STAGING_KERNEL_DIR}"
> +}
> +
> +do_install() {
> +    install -d ${D}${libdir}/
> +    install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_snoop.a ${D}${libdir}/
> +    install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_ipc.a ${D}${libdir}/
> +    install -c -m 666 ${LIB_BUILD_DIR}/libipsecmgr_syslog.a ${D}${libdir}/
> +    install -d ${D}${includedir}/
> +    install -c -m 666 ${LIB_INC_DIR}/*.h ${D}${includedir}/
> +    install -c -m 666 ${UTILS_LIB_INC_DIR}/*.h ${D}${includedir}/
> +
> +    cd ${MODULE_BUILD_DIR}
> +    make KDIR="${STAGING_KERNEL_DIR}" INSTALL_MOD_PATH="${D}" install
> +}
> +
> +PACKAGE_STRIP = "no"
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

