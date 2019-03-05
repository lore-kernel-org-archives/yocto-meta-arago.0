Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B6899529C0
	for <meta-arago@arago-project.org>;
	Tue,  5 Mar 2019 20:20:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25KK9l1017991
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 14:20:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551817209;
	bh=2jPtP0pOGdKeB0UTUUoam175mDjMyXNJOMkoJPNmVwY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wL7CEvA5aGRTkiNJCcMEDE48sLQajTJ+zZ+BOcAAnQhWbh/o75ILCYKC43u/ok3h2
	0lOGuf03hVJzK7eKIBJ203YI5FsaU/e9p5MT+Ffl0N9Bm0jxN1KpRsorpew7H7rbvw
	xUvL0R/eE9wi078VGUWlZd+cngCv2D8f1P+XyoQs=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25KK9xL065412
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 5 Mar 2019 14:20:09 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 14:20:09 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Mar 2019 14:20:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25KK7B4016448;
	Tue, 5 Mar 2019 14:20:08 -0600
Date: Tue, 5 Mar 2019 15:20:07 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <yan-liu@ti.com>
Message-ID: <20190305202006.GE26081@beryl>
References: <1551816114-11226-1-git-send-email-yan-liu@ti.com>
MIME-Version: 1.0
In-Reply-To: <1551816114-11226-1-git-send-email-yan-liu@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Tue, 05 Mar 2019 20:20:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Please make it a diff - use -M/-C git flags as needed


On Tue, Mar 05, 2019 at 03:01:54PM -0500, yan-liu@ti.com wrote:
> From: Yan Liu <yan-liu@ti.com>
> 
> Signed-off-by: Yan Liu <yan-liu@ti.com>
> ---
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb   |   94 --------------------
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb   |   94 ++++++++++++++++++++
>  2 files changed, 94 insertions(+), 94 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
>  create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
> deleted file mode 100644
> index 2f491ad..0000000
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20180118.bb
> +++ /dev/null
> @@ -1,94 +0,0 @@
> -SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
> -HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
> -SECTION = "console/utils"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -
> -PR = "r22"
> -PV_append = "+git${SRCPV}"
> -
> -PROVIDES += "ltp"
> -DEPENDS = "alsa-lib attr libaio libcap acl openssl zip-native"
> -
> -RDEPENDS_${PN} = "\
> -    acl \
> -    at \
> -    attr \
> -    bash \
> -    cpio \
> -    cronie \
> -    curl \
> -    e2fsprogs-mke2fs \
> -    expect \
> -    gawk \
> -    gzip \
> -    iproute2 \
> -    ldd \
> -    libaio \
> -    logrotate \
> -    perl \
> -    pm-qa \
> -    python-core \
> -    serialcheck \
> -    unzip \
> -    util-linux \
> -    which \
> -    libgcc\
> -    memtester\
> -"
> -
> -inherit autotools-brokensep
> -
> -SRCREV = "cc77bda07ecfc3bc7c42a559ec17d7a7736d1e9f"
> -BRANCH ?= "master"
> -
> -SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
> -    file://0003-Add-knob-to-control-tirpc-support.patch \
> -"
> -
> -S = "${WORKDIR}/git"
> -
> -LTPROOT = "/opt/ltp"
> -
> -# disable TI RPC (Transport-Independent RPC) due to missing dependency
> -EXTRA_OECONF += " --without-tirpc"
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
> -FILES_${PN}-staticdev += "${LTPROOT}/lib ${LTPROOT}/lib/libmem.a ${LTPROOT}/testcases/data/nm01/lib.a"
> -FILES_${PN} += "${LTPROOT}/*"
> -
> -do_install() {
> -    oe_runmake install
> -}
> -
> -# Avoid file dependency scans, as LTP checks for things that may or may not
> -# exist on the running system.  For instance it has specific checks for
> -# csh and ksh which are not typically part of OpenEmbedded systems (but
> -# can be added via additional layers.)
> -SKIP_FILEDEPS_${PN} = '1'
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
> new file mode 100644
> index 0000000..9ff582f
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
> @@ -0,0 +1,94 @@
> +SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
> +HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +PR = "r1"
> +PV_append = "+git${SRCPV}"
> +
> +PROVIDES += "ltp"
> +DEPENDS = "alsa-lib attr libaio libcap acl openssl zip-native"
> +
> +RDEPENDS_${PN} = "\
> +    acl \
> +    at \
> +    attr \
> +    bash \
> +    cpio \
> +    cronie \
> +    curl \
> +    e2fsprogs-mke2fs \
> +    expect \
> +    gawk \
> +    gzip \
> +    iproute2 \
> +    ldd \
> +    libaio \
> +    logrotate \
> +    perl \
> +    pm-qa \
> +    python-core \
> +    serialcheck \
> +    unzip \
> +    util-linux \
> +    which \
> +    libgcc\
> +    memtester\
> +"
> +
> +inherit autotools-brokensep
> +
> +SRCREV = "22e65405811dc47a4254a52aaaf09a5a83387bdd"
> +BRANCH ?= "master"
> +
> +SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
> +    file://0003-Add-knob-to-control-tirpc-support.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +LTPROOT = "/opt/ltp"
> +
> +# disable TI RPC (Transport-Independent RPC) due to missing dependency
> +EXTRA_OECONF += " --without-tirpc"
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
> +FILES_${PN}-staticdev += "${LTPROOT}/lib ${LTPROOT}/lib/libmem.a ${LTPROOT}/testcases/data/nm01/lib.a"
> +FILES_${PN} += "${LTPROOT}/*"
> +
> +do_install() {
> +    oe_runmake install
> +}
> +
> +# Avoid file dependency scans, as LTP checks for things that may or may not
> +# exist on the running system.  For instance it has specific checks for
> +# csh and ksh which are not typically part of OpenEmbedded systems (but
> +# can be added via additional layers.)
> +SKIP_FILEDEPS_${PN} = '1'
> -- 
> 1.7.9.5
> 

