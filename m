Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B82165208C
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 03:41:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s253f29u032767
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:41:02 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s253f1ti012100
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:41:02 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 4 Mar 2014 21:41:01 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] ti-hyplnk: Add recipe for ti hyperlink
	low level driver
Thread-Index: AQHPNm5OpyuH6v9UT0CifcjimL6o75rSOJAA//+j4sA=
Date: Wed, 5 Mar 2014 03:41:01 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49057F4B5DB@DLEE11.ent.ti.com>
References: <1393802558-7742-1-git-send-email-sam.nelson@ti.com>
	<20140305031012.GV22125@edge>
In-Reply-To: <20140305031012.GV22125@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] ti-hyplnk: Add recipe for ti hyperlink low level driver
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
X-List-Received-Date: Wed, 05 Mar 2014 03:41:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Previous one can be ignored.=20
Thanks,
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 04, 2014 10:10 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] ti-hyplnk: Add recipe for ti hyperlink =
low
> level driver
>=20
> This one as well - is this a v2 of previously submitted patch, or just
> re-send?
>=20
>=20
> On Sun, Mar 02, 2014 at 06:22:38PM -0500, Sam Nelson wrote:
> > - User space low level driver and test code for hyperlink
> >   peripheral
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb     |   38
> ++++++++++++++++++++
> >  .../recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb     |   21 +++++++++++
> >  .../recipes-bsp/ti-hyplnk/ti-hyplnk.inc            |   10 ++++++
> >  3 files changed, 69 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-
> bin_git.bb
> >  create mode 100755 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-
> lib_git.bb
> >  create mode 100644 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-
> hyplnk.inc
> >
> > diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.=
bb
> b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb
> > new file mode 100755
> > index 0000000..9938b18
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb
> > @@ -0,0 +1,38 @@
> > +DESCRIPTION =3D "TI HYPLNK low level driver test binaries"
> > +LICENSE =3D "TI BSD"
> > +
> > +COMPATIBLE_MACHINE =3D "keystone"
> > +
> > +PR =3D "r0"
> > +DEPENDS=3D"ti-csl ti-hyplnk-lib"
> > +
> > +include ti-hyplnk.inc
> > +
> > +BASEDIR =3D "${WORKDIR}/git"
> > +S =3D "${BASEDIR}/ti/drv/${LLDNAME}"
> > +
> > +DEVICELIST =3D " k2h \
> > +               k2k \
> > +"
> > +
> > +CHOICELIST =3D " yes \
> > +               no  \
> > +"
> > +
> > +do_compile () {
> > +	make -f makefile_armv7 clean
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} HYPLNK_SRC_DIR=3D${PWD}
> > +	for device in ${DEVICELIST}
> > +	do
> > +		for choice in ${CHOICELIST}
> > +		do
> > +			make -f makefile_armv7 tests examples
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"${device}"
> HYPLNK_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D"${choice}"
> > +		done
> > +	done
> > +}
> > +
> > +do_install () {
> > +    for device in ${DEVICELIST}
> > +	do
> > +	    make -f makefile_armv7 installbin
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"${device}"
> HYPLNK_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}/${bindir}
> > +	done
> > +}
> > diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.=
bb
> b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb
> > new file mode 100755
> > index 0000000..03399c6
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb
> > @@ -0,0 +1,21 @@
> > +DESCRIPTION =3D "TI HYPLNK Low Level Driver"
> > +LICENSE =3D "TI BSD"
> > +
> > +COMPATIBLE_MACHINE =3D "keystone"
> > +
> > +PR =3D "r0"
> > +DEPENDS=3D"ti-csl"
> > +
> > +include ti-hyplnk.inc
> > +
> > +BASEDIR =3D "${WORKDIR}/git"
> > +S =3D "${BASEDIR}/ti/drv/${LLDNAME}"
> > +
> > +do_compile () {
> > +#   Now build the lld in the updated directory
> > +    make -f makefile_armv7 clean lib
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> > +}
> > +
> > +do_install () {
> > +    make -f makefile_armv7 install
> PDK_INSTALL_PATH=3D${STAGING_INCDIR}
> INSTALL_INC_BASE_DIR=3D${D}/${includedir}
> INSTALL_LIB_BASE_DIR=3D${D}${libdir}
> > +}
> > diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc b/me=
ta-
> arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc
> > new file mode 100644
> > index 0000000..26f22db
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc
> > @@ -0,0 +1,10 @@
> > +LLDNAME=3D"hyplnk"
> > +
> > +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=3D5bdceac872df
> fdec915b819654ee23ea"
> > +
> > +BRANCH=3D"master"
> > +SRC_URI =3D "git://git.ti.com/keystone-rtos/hyplnk-
> lld.git;destsuffix=3Dgit/ti/drv/${LLDNAME};protocol=3Dgit;branch=3D${BRAN=
CH}"
> > +# Following commit corresponds to tag DEV.HYPLNK_LLD.02.00.00.09
> > +SRCREV =3D "f88e31b60aa2b4d591d5a845361c7e56792eeda1"
> > +
> > +PV =3D "2.0.0"
> > \ No newline at end of file
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

