Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 55CFB52972
	for <meta-arago@arago-project.org>;
	Wed,  6 Nov 2013 15:53:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA6FrAZp014573
	for <meta-arago@arago-project.org>; Wed, 6 Nov 2013 09:53:10 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA6FrAEA002913
	for <meta-arago@arago-project.org>; Wed, 6 Nov 2013 09:53:10 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 6 Nov 2013 09:53:10 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Heroor, Siddharth" <heroor@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/1] ti-cmem: New recipes for ti-cmem
Thread-Index: AQHO1aNPRXDJWr0/fkOtkjZigtqK25oOiScAgACdRICAArXmAIAD3UcAgAKqxjA=
Date: Wed, 6 Nov 2013 15:53:08 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49054988496@DLEE11.ent.ti.com>
References: <1383160055-32615-1-git-send-email-sam.nelson@ti.com>
	<5271DA2C.8070401@ti.com>
	<7D46E86EC0A8354091174257B2FED101597EF49C@DLEE11.ent.ti.com>
	<5274A42E.1020405@ti.com> <20131104170604.GT24696@edge>
In-Reply-To: <20131104170604.GT24696@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/1] ti-cmem: New recipes for ti-cmem
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
X-List-Received-Date: Wed, 06 Nov 2013 15:53:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Monday, November 04, 2013 12:06 PM
> To: Heroor, Siddharth
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/1] ti-cmem: New recipes for ti-cmem
>=20
> On Sat, Nov 02, 2013 at 12:35:18PM +0530, Siddharth Heroor wrote:
> > On 10/31/2013 7:11 PM, Maupin, Chase wrote:
> > >>-----Original Message-----
> > >>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >>bounces@arago-project.org] On Behalf Of Heroor, Siddharth
> > >>Sent: Wednesday, October 30, 2013 11:19 PM
> > >>To: meta-arago@arago-project.org
> > >>Subject: Re: [meta-arago] [PATCH 1/1] ti-cmem: New recipes for ti-
> > >>cmem
> > >>
> > >>On 10/31/2013 12:37 AM, Sam Nelson wrote:
> > >>>- Recipes for ti-cmem which provides user space api for
> > >>contigous memory allocaion
> > >>>- ti-cmem_mod provides the kernel module
> > >>>- ti-mem provides the user space library
> > >>Why do we need to create a new recipe? The ti-linuxutils in meta-
> > >>ti
> > >>should be the provider for cmem. Shouldn't that be updated for
> > >>newer
> > >>versions?
> > >>Also, I would suggest that we make it machine compatible with
> > >>omap-a15.
>=20
> > >I don't know that linuxutils is really the right solution.  I think it
> > >mainly comes down to where/how is cmem being released.  So really the
> > >question is whether the SRC_URI used below is the official cmem releas=
e
> > >point or is the SRC_URI from linuxutils right?  We do not need multipl=
e
> > >versions of cmem where everyone has their own fork of the cmem code.
> > >
> > >Another point is shouldn't this be in meta-ti for at least the cmem
> module?
> >
> > ludev in the SRC_URI stands for linuxutils dev.  The SRC_URI in the
> > linuxutils is a tarball release. One option is for us to drop the
> > tarball release from SRC_URI and use the git tree going forward. I'm
> > in favour of this primarily because that's where the development
> > happens and the tree is tagged.
> >
> > On meta-arago vs. meta-ti - I agree that the recipe should be in
> > meta-ti. This patch should update linuxutils accordingly.
>=20
> Sid,
>=20
> I agree with your suggestions as long as this component is common and
> being
> reused by both MCSDK and GLSDK teams, as well as others.
>=20
> What I don't want to happen is to unify on a single recipe and later find=
 out
> that there are so many different requirements and nuances, that none of t=
he
> teams can use the recipe directly and need to override and customize most
> of
> it to their needs...
[Sam] I have discussed with the TISB team who owns the linuxutils.  Moving =
forward it makes sense to use the cmem recipes to be used. (Although it is =
a component of linuxutils). Does it still makes sense to move to meta-ti?
>=20
> So, essentially, what I'm looking for is a confirmation from teams (at le=
ast
> Sam and Sid/Mrinmayee, maybe others) that ipc/ludev.git is _the_ reposito=
ry
> with the latest code for the cmem/linuxutils component that is being used
> from
> a common (master?) branch. Thank you.
[Sam] Yes. ludev.git will be  the place all future releases of cmem will be=
 delivered.
>=20
> --
> Denys
>=20
>=20
> > >>>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > >>>---
> > >>>   .../recipes-bsp/ti-cmem/ti-cmem-mod.bb             |   40
> > >>++++++++++++++++++++
> > >>>   meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb   |   20
> > >>++++++++++
> > >>>   meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc  |   10
> > >>+++++
> > >>>   3 files changed, 70 insertions(+)
> > >>>   create mode 100755 meta-arago-extras/recipes-bsp/ti-cmem/ti-
> > >>cmem-mod.bb
> > >>>   create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-
> > >>cmem.bb
> > >>>   create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-
> > >>cmem.inc
> > >>>diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-
> > >>mod.bb b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> > >>>new file mode 100755
> > >>>index 0000000..0839c20
> > >>>--- /dev/null
> > >>>+++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> > >>>@@ -0,0 +1,40 @@
> > >>>+DESCRIPTION=3D"The cmem component module for contiguous memory
> > >>allocation from userspace "
> > >>>+
> > >>>
> >
> >>+HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> > >>>+
> > >>>+LICENSE =3D "GPLv2"
> > >>>+
> > >>>+include ti-cmem.inc
> > >>>+
> > >>>+RDEPENDS_${PN} +=3D "kernel (=3D${KERNEL_VERSION})"
> > >>>+
> > >>>+DEPENDS +=3D "virtual/kernel"
> > >>>+
> > >>>+NAME=3D"cmem"
> > >>>+MODULE_BUILD_DIR =3D"src/cmem/module"
> > >>>+
> > >>>+# This package builds a kernel module, use kernel PR as base
> > >>and append a local
> > >>>+PR =3D "${MACHINE_KERNEL_PR}"
> > >>>+PR_append =3D "a"
> > >>>+
> > >>>+PKG_${PN} =3D "kernel-module-${PN}"
> > >>>+
> > >>>+KERNEL_VERSION =3D
> > >>"${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
> > >>>+
> > >>>+S =3D "${WORKDIR}/git"
> > >>>+
> > >>>+inherit module
> > >>>+
> > >>>+do_compile () {
> > >>>+    cd ${S}
> > >>>+    make -f lu.mak module_clean
> > >>>+    make -f lu.mak module
> > >>KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR}
> > >>TOOLCHAIN_PREFIX=3D${CROSS_COMPILE}
> > >>>+}
> > >>>+
> > >>>+do_install () {
> > >>>+    cd ${S}
> > >>>+    make -f lu.mak module_install
> > >>KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}"
> > >>EXEC_DIR=3D"${D}/lib/modules/${KERNEL_VERSION}/extra"
> > >>INSTALL_MOD_PATH=3D"${D}"
> > >>>+}
> > >>>+
> > >>>+PACKAGE_STRIP =3D "no"
> > >>>+
> > >>>diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> > >>b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> > >>>new file mode 100644
> > >>>index 0000000..a106aa0
> > >>>--- /dev/null
> > >>>+++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> > >>>@@ -0,0 +1,20 @@
> > >>>+DESCRIPTION=3D"The cmem component supports contiguous memory
> > >>allocation from userspace "
> > >>>+
> > >>>
> >
> >>+HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> > >>>+
> > >>>+LICENSE =3D "GPLv2"
> > >>>+
> > >>>+include ti-cmem.inc
> > >>>+
> > >>>+DEPENDS =3D "ti-cmem-mod"
> > >>>+
> > >>>+S =3D "${WORKDIR}/git"
> > >>>+
> > >>>+PR =3D "r1"
> > >>>+
> > >>>+PACKAGES =3D+ "${PN}-test"
> > >>>+
> > >>>+FILES_${PN}-test =3D "${bindir}/*"
> > >>>+
> > >>>+inherit autotools
> > >>>+
> > >>>diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> > >>b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> > >>>new file mode 100644
> > >>>index 0000000..9308b2d
> > >>>--- /dev/null
> > >>>+++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> > >>>@@ -0,0 +1,10 @@
> > >>>
> >
> >>+HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> > >>>+
> > >>>+LIC_FILES_CHKSUM =3D
> > >>"file://products.mak;beginline=3D2;endline=3D30;md5=3D195feadf798bb41=
65b
> > >>cb1a23ffd50dbb"
> > >>>+
> > >>>+COMPATIBLE_MACHINE =3D "keystone-evm"
> > >>>+
> > >>>+BRANCH ?=3D "master"
> > >>>+SRCREV =3D "4.00.00.06"
> > >>>+
> > >>>+SRC_URI =3D
> > >>"git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${BRANCH}"
> > >>
> > >>_______________________________________________
> > >>meta-arago mailing list
> > >>meta-arago@arago-project.org
> > >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

