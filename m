Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 9DC4D529C6
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 19:23:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v23JNDfk002654
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 13:23:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488568993;
	bh=yDfSe61po/+I0r/6LrZnZmKzmc+fT7tNcV86DBkcJS0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=e+UJGc7zgnh5zUGWiKyAwseeBVRBP1I6Gmrk5j09JOcyGND38mZIFEzmx2X8pZhv4
	QPxDeKvlGEcAE6tMULG0v2+dKl01zNnRUmkAf1HpXKqgv1sVm7skY9WZGtECtKs2zG
	ymjWBo4+iyT+BS/ceBB4/CuOIDmfCaTsZsCHyR2E=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23JNDMH016847
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 13:23:13 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Mar 2017 13:23:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23JNCnP003579;
	Fri, 3 Mar 2017 13:23:13 -0600
Date: Fri, 3 Mar 2017 14:23:12 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20170303192312.GL12614@edge>
References: <1488551149-39460-2-git-send-email-ceh@ti.com>
	<1488568612-42684-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
In-Reply-To: <1488568612-42684-1-git-send-email-ceh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, yan-liu@ti.com
Subject: Re: [PATCH 2/2 v2] ltp-ddt: update to latest ltp release 20170116
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
X-List-Received-Date: Fri, 03 Mar 2017 19:23:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Did you forget -M/-C flag in git format-patch? :)

On Fri, Mar 03, 2017 at 02:16:52PM -0500, Carlos Hernandez wrote:
> Signed-off-by: Carlos Hernandez <ceh@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb   | 66 ----------------------
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb   | 66 ++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 66 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
>  create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
> deleted file mode 100644
> index 3bb17c8f8535..000000000000
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
> -HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
> -SECTION = "console/utils"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -
> -PR = "r10"
> -PV_append = "+git${SRCPV}"
> -
> -PROVIDES += "ltp"
> -DEPENDS += "zip-native alsa-lib libaio"
> -
> -RDEPENDS_${PN} += "pm-qa serialcheck"
> -
> -inherit autotools-brokensep
> -
> -SRCREV = "429d12779e28e1997f656db19c5bf73edf9e9365"
> -BRANCH ?= "master"
> -
> -SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
> -
> -S = "${WORKDIR}/git"
> -
> -LTPROOT = "/opt/ltp"
> -
> -EXTRA_OEMAKE_append = " \
> -    prefix=${LTPROOT} \
> -    CROSS_COMPILE=${HOST_PREFIX} \
> -    SKIP_IDCHECK=1 \
> -    KERNEL_USR_INC=${STAGING_INCDIR} \
> -    ALSA_INCPATH=${STAGING_INCDIR} \
> -    ALSA_LIBPATH=${STAGING_LIBDIR} \
> -    RANLIB=${RANLIB} \
> -    DESTDIR=${D} \
> -    CC='${CC}' \
> -"
> -
> -TARGET_CC_ARCH += "${LDFLAGS}"
> -
> -FILES_${PN}-dbg += " \
> -    ${LTPROOT}/.debug \
> -    ${LTPROOT}/bin/.debug \
> -    ${LTPROOT}/runtest/.debug \
> -    ${LTPROOT}/testcases/bin/.debug \
> -    ${LTPROOT}/testcases/bin/*/bin/.debug \
> -    ${LTPROOT}/testcases/bin/*/test/.debug \
> -    ${LTPROOT}/testcases/bin/ddt/.debug \
> -    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
> -    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
> -    ${LTPROOT}/testcases/realtime/*/*/.debug \
> -"
> -
> -FILES_${PN}-staticdev += "${LTPROOT}/lib"
> -FILES_${PN} += "${LTPROOT}/*"
> -
> -# The makefiles make excessive use of make -C and several include testcases.mk
> -# which triggers a build of the syscall header. To reproduce, build ltp,
> -# then delete the header, then "make -j XX" and watch regen.sh run multiple
> -# times. Its easier to generate this once here instead.
> -do_compile_prepend () {
> -    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
> -}
> -
> -do_install() {
> -    oe_runmake install
> -}
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
> new file mode 100644
> index 000000000000..2d78fa835c9f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
> @@ -0,0 +1,66 @@
> +SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
> +HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +PR = "r11"
> +PV_append = "+git${SRCPV}"
> +
> +PROVIDES += "ltp"
> +DEPENDS += "zip-native alsa-lib libaio"
> +
> +RDEPENDS_${PN} += "pm-qa serialcheck"
> +
> +inherit autotools-brokensep
> +
> +SRCREV = "7b43afae8b931541388b0a7e6f65d7ceb6d01b3e"
> +BRANCH ?= "master"
> +
> +SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +LTPROOT = "/opt/ltp"
> +
> +EXTRA_OEMAKE_append = " \
> +    prefix=${LTPROOT} \
> +    CROSS_COMPILE=${HOST_PREFIX} \
> +    SKIP_IDCHECK=1 \
> +    KERNEL_USR_INC=${STAGING_INCDIR} \
> +    ALSA_INCPATH=${STAGING_INCDIR} \
> +    ALSA_LIBPATH=${STAGING_LIBDIR} \
> +    RANLIB=${RANLIB} \
> +    DESTDIR=${D} \
> +    CC='${CC}' \
> +"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +FILES_${PN}-dbg += " \
> +    ${LTPROOT}/.debug \
> +    ${LTPROOT}/bin/.debug \
> +    ${LTPROOT}/runtest/.debug \
> +    ${LTPROOT}/testcases/bin/.debug \
> +    ${LTPROOT}/testcases/bin/*/bin/.debug \
> +    ${LTPROOT}/testcases/bin/*/test/.debug \
> +    ${LTPROOT}/testcases/bin/ddt/.debug \
> +    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
> +    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
> +    ${LTPROOT}/testcases/realtime/*/*/.debug \
> +"
> +
> +FILES_${PN}-staticdev += "${LTPROOT}/lib"
> +FILES_${PN} += "${LTPROOT}/*"
> +
> +# The makefiles make excessive use of make -C and several include testcases.mk
> +# which triggers a build of the syscall header. To reproduce, build ltp,
> +# then delete the header, then "make -j XX" and watch regen.sh run multiple
> +# times. Its easier to generate this once here instead.
> +do_compile_prepend () {
> +    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
> +}
> +
> +do_install() {
> +    oe_runmake install
> +}
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

