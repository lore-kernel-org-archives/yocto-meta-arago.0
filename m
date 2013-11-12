Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 65E0F5299E
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 21:01:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rACL1F4l029526
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2013 15:01:15 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rACL1E3Z009940
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2013 15:01:15 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 12 Nov 2013 15:01:14 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
Thread-Index: AQHO23a8hPYNfzr1mEOnMtA2IqI7ZZoZxXcA///eZzCAAVRpgIAHJDWw
Date: Tue, 12 Nov 2013 21:01:14 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F4905498E688@DLEE11.ent.ti.com>
References: <1383800614-31915-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED101597FEDD2@DLEE11.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49054988C24@DLEE11.ent.ti.com>
	<20131108015325.GV4510@edge>
In-Reply-To: <20131108015325.GV4510@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Ring,
	Chris" <cring@ti.com>
Subject: Re: [PATCH v2] cmem: Adding New recipe for cmem
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
X-List-Received-Date: Tue, 12 Nov 2013 21:01:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, November 07, 2013 8:53 PM
> To: Nelson, Sam
> Cc: Maupin, Chase; meta-arago@arago-project.org; Ring, Chris; Tivy, Rober=
t
> Subject: Re: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
>=20
> On Thu, Nov 07, 2013 at 11:49:42AM +0000, Nelson, Sam wrote:
> >
> >
> > > -----Original Message-----
> > > From: Maupin, Chase
> > > Sent: Thursday, November 07, 2013 2:35 AM
> > > To: Nelson, Sam; meta-arago@arago-project.org
> > > Subject: RE: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
> > >
> > > >-----Original Message-----
> > > >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > >bounces@arago-project.org] On Behalf Of Nelson, Sam
> > > >Sent: Thursday, November 07, 2013 10:34 AM
> > > >To: meta-arago@arago-project.org; Nelson, Sam
> > > >Subject: [meta-arago] [PATCH v2] cmem: Adding New recipe for cmem
> > > >
> > > >- Cmem module is used for user space contiguous memory alloation
> > > >
> > > >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > >---
> > > > recipes-bsp/cmem/cmem-mod_git.bb |   26
> > > >++++++++++++++++++++++++++
> > > > recipes-bsp/cmem/cmem.inc        |   12 ++++++++++++
> > > > recipes-bsp/cmem/cmem_git.bb     |   16 ++++++++++++++++
> > > > 3 files changed, 54 insertions(+)
> > > > create mode 100644 recipes-bsp/cmem/cmem-mod_git.bb
> > > > create mode 100644 recipes-bsp/cmem/cmem.inc
> > > > create mode 100644 recipes-bsp/cmem/cmem_git.bb
> > >
> > > This patch should be submitted to meta-ti@yoctoproject.org which is t=
he
> > > meta-ti mailing list.
> > [Sam] Ok. I will do that.
> > >
> > > >
> > > >diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-
> > > >bsp/cmem/cmem-mod_git.bb
> > > >new file mode 100644
> > > >index 0000000..c402b72
> > > >--- /dev/null
> > > >+++ b/recipes-bsp/cmem/cmem-mod_git.bb
> > > >@@ -0,0 +1,26 @@
> > > >+DESCRIPTION=3D"Contiguous memory allocation kernel module for
> > > >contiguous memory allocation from userspace "
> > > >+
> > > >+include cmem.inc
> > > >+
> > > >+NAME=3D"cmem"
> > >
> > > Not sure what the NAME variable is for
> > [Sam] I am not sure either. This is probably because of initial templat=
e
> > used for creation of the recipe. I can remove it if this really not nee=
ded.
>=20
> This is not a variable used by bitbake, so assigning it and not using lat=
er is
> rather redundant.
>=20
>=20
> > > >+# This package builds a kernel module, use kernel PR as base and
> > > >append a local
> > > >+PR =3D "${MACHINE_KERNEL_PR}"
> > > >+PR_append =3D "a"
> > > >+
> > > >+PKG_${PN} =3D "kernel-module-${PN}"
> > >
> > > I think what you are trying to do here is already handled by the
> > > package.bbclass.  I assume you are trying to set the package name to
> kernel-
> > > module-cmem-mod?
> > >
> > > This raises the question of whether you want this to be cmem-mod for
> the
> > > recipe and PN or if you want cmem for the module and cmem-xyz for the
> > > libraries.
> > >
> > [Sam] I guess the alternative you are suggesting is cmem for the module
> and
> > cmem-lib for the libraries. I am not seeing a compelling reason to chan=
ge.
>=20
> You can keep cmem-mod as the name of the recipe. And even if you keep it
> as the name of the package (i.e. not set PKG_${PN} above), it will still =
work
> just fine.
>=20
> So, if your recipe is called cmem-mod, but PKG_${PN} =3D "kernel-module-
> ${PN}"
> then the resulting package will be called kernel-module-cmem-mod.ipk
>=20
> If you don't set PKG_${PN}, then the package will be called cmem-mod.ipk,
> but
> there will be an empty package kernel-module-cmem-mod.ipk that
> automatically
> depend on cmem-mod.ipk :) At the end of the day, it will work just fine, =
as
> long as you don't mess the FILES_${PN} variable...
>=20
>=20
> > > >+S =3D "${WORKDIR}/git"
> > > >+
> > > >+inherit module
> > > >+
> > > >+do_compile () {
> > > >+    cd ${S}
> > > >+    make -f lu.mak module_clean
> > > >+    make -f lu.mak module
> > > >KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR}
> > > >TOOLCHAIN_PREFIX=3D${CROSS_COMPILE}
> > >
> > > You should use the default do_compile in the module.bbclass I think.
> You
> > > should be able to pass this with MAKE_TARGETS variable.
> >
> > [Sam] Probably Chris and Rob on the CC list can comment on this. This w=
ill
> > need change of the module.
>=20
> Well, it is rather "nice to have" - I won't require this as a mandatory
> change. After all, components may come from different environments and
> it's
> unrealistic to demand them to come with a comformant Makefile...
>=20
> But, in case it would be possible and easy to change the Makefile, here's=
 how
> default do_compile and do_install functions look like for a module:
>=20
> module_do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         oe_runmake KERNEL_PATH=3D${STAGING_KERNEL_DIR}   \
>                    KERNEL_SRC=3D${STAGING_KERNEL_DIR}    \
>                    KERNEL_VERSION=3D${KERNEL_VERSION}    \
>                    CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>                    AR=3D"${KERNEL_AR}" \
>                    ${MAKE_TARGETS}
> }
>=20
> module_do_install() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         oe_runmake DEPMOD=3Decho INSTALL_MOD_PATH=3D"${D}" \
>                    KERNEL_SRC=3D${STAGING_KERNEL_DIR} \
>                    CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>                    modules_install
> }
>=20
> You are only supposed to set MAKE_TARGETS variable, which in your case
> would
> be "module_clean module"...
[Sam] we will add the unset FLAGS. Am I supposed to also rename do_install =
to module_do_install, do_compile --> module_do_install. And also will add m=
odule_do_clean? Please confirm.
Currently we have to still use non-standard makefile.
>=20
>=20
> > > >+}
> > > >+
> > > >+do_install () {
> > > >+    cd ${S}
> > > >+    make -f lu.mak module_install
> > > >KERNEL_INSTALL_DIR=3D"${STAGING_KERNEL_DIR}"
> > > >EXEC_DIR=3D"${D}/lib/modules/${KERNEL_VERSION}/extra"
> > > >INSTALL_MOD_PATH=3D"${D}"
> > >
> > > Hmmm.  The default do_install for the module.bbclass uses
> > > "modules_install" instead of "module_install".  If you can get the lu=
.mak
> file
> > > updated that would be ideal.  If not then you should at least copy th=
e
> base
> > > function which unsets some variables.
> > >
> > [Sam] Probably Chris and Rob on the CC list can comment on this. This w=
ill
> > need change of the module.
>=20
> Again, if changing the component is not really possible at this time, jus=
t
> unset all those *FLAGS variables above.
>=20
>=20
> > > >+}
> > > >diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> > > >new file mode 100644
> > > >index 0000000..5d17d8e
> > > >--- /dev/null
> > > >+++ b/recipes-bsp/cmem/cmem.inc
> > > >@@ -0,0 +1,12 @@
> > >
> >+HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> > > >+
> > > >+LICENSE =3D "GPLv2"
> > > >+LIC_FILES_CHKSUM =3D
> > > >"file://include/ti/cmem.h;beginline=3D1;endline=3D30;md5=3Db86138d40=
28fb
> > > >8310b3b983024edc620"
> > > >+
> > > >+COMPATIBLE_MACHINE =3D "keystone-evm"
> > >
> > > As Sidd pointed out is there any reason not to add the other devices =
like
> > > omap-a15 as compatible machines?
> >
> > [Sam] I am fine with remove the compatible machine. Although this is no=
t
> > tested with other machines.
>=20
> So, Chris and Rob should comment on which platforms this version of cmem
> is
> supposed to be compatible with, even if it's not tested yet.
>=20
>=20
> > > >+BRANCH ?=3D "master"
> > > >+#SRCREV =3D "4.00.00.06"
> > >
> > > Remove this comment but add one that the commit id below corresponds
> to
> > > release 4.00.00.06.
> > >
> > [Sam] I will fix this.
> > > Is there perhaps a value to having the version in the package name
> instead of
> > > using _git versions?  Will all SDKs be in step with using the same ve=
rsion?
> > >
> > [Sam] Chris or Rob, can you comment on this.  I am not sure of when the
> > other verticals pick up CMEM.
> >
> > > >+SRCREV =3D "c2cf2406702bcb889c10d0e6e7d298ba7b84ae7d"
> > > >+
> > > >+SRC_URI =3D
> > > >"git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${BRANCH}"
> > > >diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-
> > > >bsp/cmem/cmem_git.bb
> > > >new file mode 100644
> > > >index 0000000..f415630
> > > >--- /dev/null
> > > >+++ b/recipes-bsp/cmem/cmem_git.bb
> > > >@@ -0,0 +1,16 @@
> > > >+DESCRIPTION=3D"The cmem component supports contiguous memory
> > > >allocation from userspace "
> > > >+
> > > >+include cmem.inc
> > > >+
> > > >+RDEPENDS_${PN} =3D "cmem-mod"
> > > >+
> > > >+S =3D "${WORKDIR}/git"
> > > >+
> > > >+PR =3D "r0"
> > > >+
> > > >+PACKAGES =3D+ "${PN}-test"
> > > >+
> > > >+FILES_${PN}-test =3D "${bindir}/*"
> > >
> > > As Denys pointed out last time, if everything goes into cmem-test the=
n
> why
> > > not just call this whole recipe cmem-test since the base cmem package=
 is
> > > empty.
> >
> > [Sam] The cmem package has the library that goes into cmem-dev. And
> hence
> > the name cmem. cmem-test will have the example/unit test code binaries.
> > Only thing is there is no binary files associated with the cmem package
> > itself.
>=20
> Right, we discussed some of this before and yesterday as well. It is not
> obvious, but a correct use case nevertheless. So, let's keep the name.
>=20
> But, now I have one question - you do mention a library that goes to cmem=
-
> dev.
> Is is a dynamic library? If so, it should rather go into the main package=
. I
> suspect it lacks the correect extension and hence ends up in the -dev
> package.
>=20
>=20
> > > >+inherit autotools
> > > >+
> > > >--
> > > >1.7.9.5
> > > >
> > > >_______________________________________________
> > > >meta-arago mailing list
> > > >meta-arago@arago-project.org
> > > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

