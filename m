Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6E9F352986
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 03:38:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s253clLY028834
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:38:47 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s253cl3i029607
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:38:47 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 21:38:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s253clqX000442;
	Tue, 4 Mar 2014 21:38:47 -0600
Date: Tue, 4 Mar 2014 22:38:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20140305033847.GY22125@edge>
References: <1393801987-6753-1-git-send-email-sam.nelson@ti.com>
	<20140305030936.GU22125@edge>
	<4F9216F96E5DF9428610502835A9F49057F4B54F@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49057F4B54F@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] ti-edma3: Add recipe for EDMA3 user space low level driver
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
X-List-Received-Date: Wed, 05 Mar 2014 03:38:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 04, 2014 at 10:35:49PM -0500, Nelson, Sam wrote:
> This is really v2. ( But I did not realize I have sent an earlier one. 
> Checking back there was no review comments on the previous one.)
> It is a new recipe and previous one can be ignored.  Let me know if I need 
> to send this as v2.

No need to resend, I just found 2 copies and wanted to ask if there were 
differences. I'll just ignore the earlier one.


> With regards,
> Sam
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, March 04, 2014 10:10 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] ti-edma3: Add recipe for EDMA3 user
> > space low level driver
> > 
> > Is this a re-submit or v2 of the previous submission?
> > 
> > 
> > On Sun, Mar 02, 2014 at 06:13:07PM -0500, Sam Nelson wrote:
> > > - Low level user space driver and test code for TI EDMA3
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  .../recipes-bsp/ti-edma3/ti-edma3_git.bb           |   69
> > ++++++++++++++++++++
> > >  1 file changed, 69 insertions(+)
> > >  create mode 100755 meta-arago-extras/recipes-bsp/ti-edma3/ti-
> > edma3_git.bb
> > >
> > > diff --git a/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3_git.bb
> > b/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3_git.bb
> > > new file mode 100755
> > > index 0000000..82b980f
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3_git.bb
> > > @@ -0,0 +1,69 @@
> > > +DESCRIPTION = "TI EDMA3 low level driver and test code"
> > > +LICENSE = "TI-BSD"
> > > +LIC_FILES_CHKSUM =
> > "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
> > > +
> > > +BRANCH="master"
> > > +SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
> > > +# The following commit corresponds to tag
> > DEV_EDMA3_LLD_02_11_11_15_RC01
> > > +SRCREV = "b73a262bf6f6d366e3bf83d0c116be2b61a86dde"
> > > +
> > > +PV="2.11.11"
> > > +
> > > +COMPATIBLE_MACHINE = "keystone-evm"
> > > +
> > > +PR = "r0"
> > > +DEPENDS="ti-csl"
> > > +
> > > +PLATFORMLIST = "tci6636k2h-evm \
> > > +	tci6638k2k-evm \
> > > +	tci6630k2l-evm \
> > > +	c66ak2e-evm \
> > > +	"
> > > +
> > > +PACKAGES =+ "${PN}-bin"
> > > +
> > > +FILES_${PN}-bin = "${bindir}/*"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +do_compile () {
> > > +	cd ${S}/packages
> > > +	for platform in ${PLATFORMLIST}
> > > +	do
> > > +		ROOTDIR=${S} CROSSCC="${TARGET_PREFIX}gcc"
> > CROSSAR="${TARGET_PREFIX}ar" \
> > > +		CROSSLNK="${TARGET_PREFIX}gcc"
> > INTERNAL_SW_ROOT=${S} make \
> > > +		PLATFORM=${platform} TARGET=a15 TOOLCHAIN_a15=GCC
> > FORMAT=ELF SONAME=libedma3.so all
> > > +	done
> > > +}
> > > +
> > > +do_install () {
> > > +	install -d ${D}/${libdir}
> > > +
> > > +	# Static Libraries
> > > +	cp
> > ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/edma3_lld_drv.aa15fg
> > ${D}/${libdir}/libedma3.a
> > > +	cp ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-
> > evm/a15/release/edma3_lld_rm.aa15fg ${D}/${libdir}/libedma3rm.a
> > > +
> > > +	# Shared Libraries
> > > +	cp -a ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/libedma*
> > ${D}/${libdir}
> > > +	cp -a ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-
> > evm/a15/release/libedma* ${D}/${libdir}
> > > +
> > > +	# Copy Headers
> > > +	install -d ${D}/${includedir}/ti/sdo/edma3/drv/
> > > +	install -d ${D}/${includedir}/ti/sdo/edma3/rm
> > > +	cp ${S}/packages/ti/sdo/edma3/drv/*.h
> > ${D}/${includedir}/ti/sdo/edma3/drv/
> > > +	cp ${S}/packages/ti/sdo/edma3/rm/*.h
> > ${D}/${includedir}/ti/sdo/edma3/rm/
> > > +
> > > +	# Copy Sample Config
> > > +	install -d ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
> > > +	cp
> > ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/evmTCI6636K2H
> > Sample.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
> > > +	cp
> > ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/evmTCI6638K2K
> > Sample.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
> > > +	cp
> > ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/evmTCI6630K2LS
> > ample.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
> > > +	cp
> > ${S}/examples/edma3_user_space_driver/evmC66AK2E/evmC66AK2ESampl
> > e.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
> > > +
> > > +	install -d ${D}/${bindir}
> > > +	install -c -m 755
> > ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/bin/tci6636k2h-
> > evm/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg
> > ${D}/${bindir}/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg
> > > +	install -c -m 755
> > ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/bin/tci6638k2k-
> > evm/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg
> > ${D}/${bindir}/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg
> > > +	install -c -m 755
> > ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/bin/tci6630k2l-
> > evm/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg
> > ${D}/${bindir}/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg
> > > +	install -c -m 755
> > ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/c66ak2e-
> > evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
> > ${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
> > > +}
> > > +
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

