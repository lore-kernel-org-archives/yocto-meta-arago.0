Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4411952AA6
	for <meta-arago@arago-project.org>;
	Fri, 27 Sep 2013 16:25:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8RGPkcw028374;
	Fri, 27 Sep 2013 11:25:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8RGPkS1031422;
	Fri, 27 Sep 2013 11:25:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 27 Sep 2013 11:25:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8RGPkD8022348;
	Fri, 27 Sep 2013 11:25:46 -0500
Date: Fri, 27 Sep 2013 12:25:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130927162545.GE19182@edge>
References: <1380261968-27765-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C561EE3@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C561EE3@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] external-linaro-toolchain: add a way to use specific linux-libc-headers provider and version
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
X-List-Received-Date: Fri, 27 Sep 2013 16:25:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 27, 2013 at 03:32:15PM +0000, Cooper Jr., Franklin wrote:
> To change the version of linux-libc-headers used is it enough to just set 
> the PREFERRED_PROVIDERS or should the following variables also need to be 
> updated?
> 
> SDKLINUXLIBCVERSION ?= "3.8%"
> LINUXLIBCVERSION ?= "3.8%"

Everything is happening automatically already - we have all the necessary 
PREFERRED_VERSION_linux-libc-headers in arago-prefs.inc and branding files.

This patch only changes the defaults, i.e. prefer separately built libc 
headers and version 3.8 if not specified otherwise.

Also, you don't want to change SDK* counterpart variables - those are for 
nativesdk components, i.e. x86 ones. Basically what the host tools are built 
against.

The target side, the one that goes into rootfs and devkit, is already taken 
care with specific versions being set in the files I mentioned above.

-- 
Denys


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Friday, September 27, 2013 1:06 AM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] external-linaro-toolchain: add a way to use
> > specific linux-libc-headers provider and version
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Use it by default in our distro - the preferred version may need to be adjusted
> > based on the kernel version used by individual platforms.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/include/toolchain-linaro.inc  |  7 +++++++
> >  .../recipes-core/meta/external-linaro-toolchain.bbappend    | 13
> > ++++++++++++-
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-
> > arago-distro/conf/distro/include/toolchain-linaro.inc
> > index 1ab13ee..cc12f08 100644
> > --- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > +++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
> > @@ -15,6 +15,11 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-
> > intermediate = "external-linaro-t  TOOLCHAIN_SYS := "${ELT_TARGET_SYS}"
> >  TOOLCHAIN_PREFIX := "${TOOLCHAIN_SYS}-"
> > 
> > +# Use specific libc headers instead of ones provided by toolchain
> > +PREFERRED_PROVIDER_linux-libc-headers_forcevariable = "linux-libc-
> > headers"
> > +PREFERRED_PROVIDER_linux-libc-headers-dev_forcevariable = "linux-libc-
> > headers"
> > +PREFERRED_PROVIDER_virtual/linux-libc-headers_forcevariable = "linux-libc-
> > headers"
> > +
> >  PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
> > "external-linaro-sdk-toolchain"
> >  PREFERRED_PROVIDER_binutils-cross-canadian-
> > ${TRANSLATED_TARGET_ARCH} ?= "external-linaro-sdk-toolchain"
> >  #PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}
> > = "external-linaro-sdk-toolchain"
> > @@ -27,6 +32,7 @@ SDKGCCVERSION ?= "4.7%"
> >  SDKBINUVERSION ?= "2.23%"
> >  SDKEGLIBCVERSION ?= "2.17%"
> >  SDKLINUXLIBCVERSION ?= "3.8%"
> > +LINUXLIBCVERSION ?= "3.8%"
> > 
> >  PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"
> >  PREFERRED_VERSION_gcc-crosssdk-initial ?= "${SDKGCCVERSION}"
> > @@ -34,6 +40,7 @@ PREFERRED_VERSION_gcc-crosssdk-intermediate ?=
> > "${SDKGCCVERSION}"
> >  PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
> >  PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
> >  PREFERRED_VERSION_binutils-crosssdk ?= "${SDKBINUVERSION}"
> > +PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
> >  PREFERRED_VERSION_nativesdk-linux-libc-headers ?=
> > "${SDKLINUXLIBCVERSION}"
> >  PREFERRED_VERSION_nativesdk-eglibc ?= "${SDKEGLIBCVERSION}"
> >  PREFERRED_VERSION_nativesdk-eglibc-initial ?= "${SDKEGLIBCVERSION}"
> > diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-
> > toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-
> > toolchain.bbappend
> > index 09f68d8..f8ad2cc 100644
> > --- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
> > +++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbap
> > +++ pend
> > @@ -2,12 +2,20 @@ INSANE_SKIP_libstdc++-dev += "staticdev"
> > 
> >  ALLOW_EMPTY_${PN}-utils = "1"
> > 
> > -PR_append = "-arago3"
> > +PR_append = "-arago4"
> > 
> > +PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}',
> > d)}"
> > +PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
> >  PROVIDES += "virtual/${TARGET_PREFIX}gcc-intermediate"
> > +PROVIDES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-
> > headers', 'external-linaro-toolchain', 'linux-libc-headers linux-libc-headers-dev',
> > '', d)}"
> > 
> > +PACKAGES := "${@oe_filter_out('linux-libc-headers', '${PACKAGES}', d)}"
> > +PACKAGES := "${@oe_filter_out('linux-libc-headers-dev', '${PACKAGES}', d)}"
> >  PACKAGES := "${@oe_filter_out('libsegfault', '${PACKAGES}', d)}"
> >  PACKAGES =+ "libsegfault"
> > +PACKAGES += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-
> > headers', 'external-linaro-toolchain', 'linux-libc-headers-dev', '', d)}"
> > +
> > +DEPENDS += "${@base_conditional('PREFERRED_PROVIDER_linux-libc-
> > headers', 'external-linaro-toolchain', '', 'linux-libc-headers', d)}"
> > 
> >  RDEPENDS_${PN}-utils = ""
> > 
> > @@ -90,6 +98,9 @@ do_install_append() {
> >  	install -d ${D}/include
> >  	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/include/* ${D}/include
> > 
> > +	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
> > 'external-linaro-toolchain', '', 'rm -rf ${D}${includedir}/asm*; rm -rf
> > ${D}${includedir}/drm; rm -rf ${D}${includedir}/linux; rm -rf
> > ${D}${includedir}/mtd; rm -rf ${D}${includedir}/rdma; rm -rf
> > ${D}${includedir}/sound; rm -rf ${D}${includedir}/video', d)}
> > +	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers',
> > +'external-linaro-toolchain', '', 'rm -rf
> > +${D}${includedir}/scsi/.install; rm -rf
> > +${D}${includedir}/scsi/scsi_netlink*; rm -rf
> > +${D}${includedir}/scsi/scsi_bsg*', d)}
> > +
> >  	rm -rf ${D}/lib/libgfortran*
> >  	rm -rf ${D}/lib/ldscripts
> >  	rm -rf ${D}${datadir}/lintian
> > --
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

