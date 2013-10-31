Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0E1B6529A7
	for <meta-arago@arago-project.org>;
	Thu, 31 Oct 2013 02:59:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9V2xPcn013621
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2013 21:59:25 -0500
Received: from DLEE71.ent.ti.com ([157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9V2xO0T020963
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2013 21:59:25 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 30 Oct 2013 21:59:24 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/1] ti-cmem: New recipes for ti-cmem
Thread-Index: AQHO1aNPRXDJWr0/fkOtkjZigtqK25oN866A///BiPCAAIVxAP//4y/Q
Date: Thu, 31 Oct 2013 02:59:23 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49054980CA7@DLEE11.ent.ti.com>
References: <1383160055-32615-1-git-send-email-sam.nelson@ti.com>
	<20131030192353.GA23669@edge>
	<4F9216F96E5DF9428610502835A9F49054980A88@DLEE11.ent.ti.com>
	<20131030233754.GE24696@edge>
In-Reply-To: <20131030233754.GE24696@edge>
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
X-List-Received-Date: Thu, 31 Oct 2013 02:59:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

See comments inline.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, October 30, 2013 7:38 PM
To: Nelson, Sam
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 1/1] ti-cmem: New recipes for ti-cmem

On Wed, Oct 30, 2013 at 06:22:34PM -0400, Nelson, Sam wrote:
> Thanks Denys for the detailed feedback. See comments  inline.
>=20
> First, thanks for the submission!
>=20
> Second, please drop "ti-" prefix from the recipes - it's redundant.=20
> Plus, everywhere else it is called just "cmem":

> [Sam] Ok. I will fix this.

Thanks! And if you need any support or backing for this change, please let =
me know - I had a past agreement on this topic with Bill and Jack...


> For the rest of the comments, please see inline. But mostly everything lo=
oks=20
> fine, just a few minor questions/concerns.
>=20
> On Wed, Oct 30, 2013 at 03:07:35PM -0400, Sam Nelson wrote:
> > - Recipes for ti-cmem which provides user space api for contigous memor=
y allocaion
> > - ti-cmem_mod provides the kernel module
> > - ti-mem provides the user space library
> >=20
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../recipes-bsp/ti-cmem/ti-cmem-mod.bb             |   40 ++++++++++++=
++++++++
> >  meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb   |   20 ++++++++++
> >  meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc  |   10 +++++
> >  3 files changed, 70 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.b=
b
> >  create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> >  create mode 100644 meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> >=20
> > diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb b/met=
a-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> > new file mode 100755
> > index 0000000..0839c20
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem-mod.bb
> > @@ -0,0 +1,40 @@
> > +DESCRIPTION=3D"The cmem component module for contiguous memory allocat=
ion from userspace "
> > +
> > +HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
>=20
> You duplicate HOMEPAGE in all recipes and .inc file...
>=20
> [Sam] I will fix this.
>=20
> > +LICENSE =3D "GPLv2"
>=20
> Can you move LICENSE field in the .inc file, since you already have=20
> LIC_FILES_CHKSUM there...
> [Sam] Ok. I will fix this.
>=20
> > +include ti-cmem.inc
> > +
> > +RDEPENDS_${PN} +=3D "kernel (=3D${KERNEL_VERSION})"
>=20
> Is it really tied to a specific kernel version? What if it's slightly=20
> different, i.e. with a minor update? Would using ">=3D" be better here?

> [Sam] I am not clear on this. I thought the kernel module is compiled for=
=20
> the particular version of kernel and may not work with a different versio=
n=20
> of kernel.  Appreciate any explanation on this.

Ah, if that's the only reason, then you don't need to do anything -=20
module.bbclass will do it for you.
[Sam] Ok. I will remove this as well.


> > +DEPENDS +=3D "virtual/kernel"
>=20
> module.bbclass already does it for you.
> [Sam] I guess I will remove this?

Yes, please.


> > +NAME=3D"cmem"
> > +MODULE_BUILD_DIR =3D"src/cmem/module"
> > +
> > +# This package builds a kernel module, use kernel PR as base and appen=
d a local
> > +PR =3D "${MACHINE_KERNEL_PR}"
> > +PR_append =3D "a"
> > +
> > +PKG_${PN} =3D "kernel-module-${PN}"
> > +
> > +KERNEL_VERSION =3D "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ab=
iversion')}"
>=20
> This one is also defined by module.bbclass
> [Sam] I will remove this as well.
>=20
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit module
> > +
> > +do_compile () {
> > +    cd ${S}
> > +    make -f lu.mak module_clean
> > +    make -f lu.mak module KERNEL_INSTALL_DIR=3D${STAGING_KERNEL_DIR} T=
OOLCHAIN_PREFIX=3D${CROSS_COMPILE}=20
> > +}
> > +
> > +do_install () {
> > +    cd ${S}
> > +    make -f lu.mak module_install KERNEL_INSTALL_DIR=3D"${STAGING_KERN=
EL_DIR}" EXEC_DIR=3D"${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_=
PATH=3D"${D}"
> > +}
> > +
> > +PACKAGE_STRIP =3D "no"
>=20
> Why this?
>=20
> [Sam] Not sure may be there was some issue earlier. Looks like I can remo=
ve=20
> this.
>=20
> > diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb b/meta-ar=
ago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> > new file mode 100644
> > index 0000000..a106aa0
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.bb
> > @@ -0,0 +1,20 @@
> > +DESCRIPTION=3D"The cmem component supports contiguous memory allocatio=
n from userspace "
> > +
> > +HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> > +
> > +LICENSE =3D "GPLv2"
> > +
> > +include ti-cmem.inc
> > +
> > +DEPENDS =3D "ti-cmem-mod"=20
>=20
> Do you mean RDEPENDS here? I don't think you have a build-time dependency=
=20
> here...
> [Sam] RDEPENDS makes sense. I will fix this.
>=20
>=20
> > +S =3D "${WORKDIR}/git"
> > +
> > +PR =3D "r1"
> > +
> > +PACKAGES =3D+ "${PN}-test"
> > +
> > +FILES_${PN}-test =3D "${bindir}/*"
>=20
> So, all the binaries will go into cmem-test, what would remain in the mai=
n=20
> cmem package?
> [Sam] Actually nothing remains in the cmem package itself. Is this an iss=
ue?

Not an issue, but then why not call the recipe cmem-test if that's its only=
=20
purpose?
[Sam] The main contents are in cmem-dev, cmem-staticdev.

> > +inherit autotools
> > +
> > diff --git a/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc b/meta-a=
rago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> > new file mode 100644
> > index 0000000..9308b2d
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-cmem/ti-cmem.inc
> > @@ -0,0 +1,10 @@
> > +HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:CMEM"
> > +
> > +LIC_FILES_CHKSUM =3D "file://products.mak;beginline=3D2;endline=3D30;m=
d5=3D195feadf798bb4165bcb1a23ffd50dbb"
>=20
> I haven't checked yet, but is the Makefile the only and proper place to d=
efine=20
> licenses for the component?
> [Sam] It was used as the file was in the root directory. Do you prefer us=
ing=20
> the API header file instead?

It doesn't need to be in the root directory, but it does need to specify th=
e=20
license that is being used.

[Sam] products.mak does have the license used. I will try to switch to a AP=
I header file .

> > +COMPATIBLE_MACHINE =3D "keystone-evm"
> > +
> > +BRANCH ?=3D "master"
> > +SRCREV =3D "4.00.00.06"
>=20
> Any chance you can use a commit ID here?
> [Sam] I can switch to commit ID.=20

Thanks. The reason for this request is to reduce the number of network=20
connections required during parsing.


> > +SRC_URI =3D "git://git.ti.com/ipc/ludev.git;protocol=3Dgit;branch=3D${=
BRANCH}"
> > --=20
> > 1.7.9.5
> >=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

