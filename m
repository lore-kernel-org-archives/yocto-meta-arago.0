Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 613EE52986
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 03:35:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s253ZnA8029921
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:35:49 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s253ZnHi028179
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:35:49 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Tue, 4 Mar 2014 21:35:49 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] ti-edma3: Add recipe for EDMA3 user space
	low level driver
Thread-Index: AQHPNmz5nrJRN9woGU6HQOPPjiQgIprSOGmA//+h0cA=
Date: Wed, 5 Mar 2014 03:35:49 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057F4B54F@DLEE11.ent.ti.com>
References: <1393801987-6753-1-git-send-email-sam.nelson@ti.com>
	<20140305030936.GU22125@edge>
In-Reply-To: <20140305030936.GU22125@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 05 Mar 2014 03:35:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is really v2. ( But I did not realize I have sent an earlier one. Chec=
king back  there was no review comments on the previous one.)
It is a new recipe and previous one can be ignored.  Let me know if I need =
to send this as v2.
With regards,
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 04, 2014 10:10 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] ti-edma3: Add recipe for EDMA3 user
> space low level driver
>=20
> Is this a re-submit or v2 of the previous submission?
>=20
>=20
> On Sun, Mar 02, 2014 at 06:13:07PM -0500, Sam Nelson wrote:
> > - Low level user space driver and test code for TI EDMA3
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../recipes-bsp/ti-edma3/ti-edma3_git.bb           |   69
> ++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-bsp/ti-edma3/ti-
> edma3_git.bb
> >
> > diff --git a/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3_git.bb
> b/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3_git.bb
> > new file mode 100755
> > index 0000000..82b980f
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-edma3/ti-edma3_git.bb
> > @@ -0,0 +1,69 @@
> > +DESCRIPTION =3D "TI EDMA3 low level driver and test code"
> > +LICENSE =3D "TI-BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://COPYING.txt;md5=3D5bdceac872dffdec915b819654ee23ea"
> > +
> > +BRANCH=3D"master"
> > +SRC_URI =3D "git://git.ti.com/keystone-rtos/edma3_lld.git"
> > +# The following commit corresponds to tag
> DEV_EDMA3_LLD_02_11_11_15_RC01
> > +SRCREV =3D "b73a262bf6f6d366e3bf83d0c116be2b61a86dde"
> > +
> > +PV=3D"2.11.11"
> > +
> > +COMPATIBLE_MACHINE =3D "keystone-evm"
> > +
> > +PR =3D "r0"
> > +DEPENDS=3D"ti-csl"
> > +
> > +PLATFORMLIST =3D "tci6636k2h-evm \
> > +	tci6638k2k-evm \
> > +	tci6630k2l-evm \
> > +	c66ak2e-evm \
> > +	"
> > +
> > +PACKAGES =3D+ "${PN}-bin"
> > +
> > +FILES_${PN}-bin =3D "${bindir}/*"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_compile () {
> > +	cd ${S}/packages
> > +	for platform in ${PLATFORMLIST}
> > +	do
> > +		ROOTDIR=3D${S} CROSSCC=3D"${TARGET_PREFIX}gcc"
> CROSSAR=3D"${TARGET_PREFIX}ar" \
> > +		CROSSLNK=3D"${TARGET_PREFIX}gcc"
> INTERNAL_SW_ROOT=3D${S} make \
> > +		PLATFORM=3D${platform} TARGET=3Da15 TOOLCHAIN_a15=3DGCC
> FORMAT=3DELF SONAME=3Dlibedma3.so all
> > +	done
> > +}
> > +
> > +do_install () {
> > +	install -d ${D}/${libdir}
> > +
> > +	# Static Libraries
> > +	cp
> ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/edma3_lld_drv.aa15fg
> ${D}/${libdir}/libedma3.a
> > +	cp ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-
> evm/a15/release/edma3_lld_rm.aa15fg ${D}/${libdir}/libedma3rm.a
> > +
> > +	# Shared Libraries
> > +	cp -a ${S}/packages/ti/sdo/edma3/drv/lib/a15/release/libedma*
> ${D}/${libdir}
> > +	cp -a ${S}/packages/ti/sdo/edma3/rm/lib/tci6636k2h-
> evm/a15/release/libedma* ${D}/${libdir}
> > +
> > +	# Copy Headers
> > +	install -d ${D}/${includedir}/ti/sdo/edma3/drv/
> > +	install -d ${D}/${includedir}/ti/sdo/edma3/rm
> > +	cp ${S}/packages/ti/sdo/edma3/drv/*.h
> ${D}/${includedir}/ti/sdo/edma3/drv/
> > +	cp ${S}/packages/ti/sdo/edma3/rm/*.h
> ${D}/${includedir}/ti/sdo/edma3/rm/
> > +
> > +	# Copy Sample Config
> > +	install -d ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
> > +	cp
> ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/evmTCI6636K2H
> Sample.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
> > +	cp
> ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/evmTCI6638K2K
> Sample.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
> > +	cp
> ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/evmTCI6630K2LS
> ample.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
> > +	cp
> ${S}/examples/edma3_user_space_driver/evmC66AK2E/evmC66AK2ESampl
> e.c ${D}/${includedir}/ti/sdo/edma3/drv/sample/src/platforms
> > +
> > +	install -d ${D}/${bindir}
> > +	install -c -m 755
> ${S}/examples/edma3_user_space_driver/evmTCI6636K2H/bin/tci6636k2h-
> evm/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg
> ${D}/${bindir}/edma3_drv_6636k2h_a15_sample_a15host_release.xa15fg
> > +	install -c -m 755
> ${S}/examples/edma3_user_space_driver/evmTCI6638K2K/bin/tci6638k2k-
> evm/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg
> ${D}/${bindir}/edma3_drv_6638k2k_a15_sample_a15host_release.xa15fg
> > +	install -c -m 755
> ${S}/examples/edma3_user_space_driver/evmTCI6630K2L/bin/tci6630k2l-
> evm/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg
> ${D}/${bindir}/edma3_drv_6630k2l_a15_sample_a15host_release.xa15fg
> > +	install -c -m 755
> ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/c66ak2e-
> evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
> ${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
> > +}
> > +
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

