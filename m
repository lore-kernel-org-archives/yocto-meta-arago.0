Return-Path: <aravindbr@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 10F8152A20
	for <meta-arago@arago-project.org>;
	Wed, 26 Feb 2014 22:53:04 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1QMr26x017556
	for <meta-arago@arago-project.org>; Wed, 26 Feb 2014 16:53:02 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1QMqxtx003899
	for <meta-arago@arago-project.org>; Thu, 27 Feb 2014 04:23:01 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0174.001; Thu, 27 Feb 2014 04:22:59 +0530
From: Aravind Batni <aravindbr@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH v2] ti-rm: provides ti resouce manager
	recipe for KeyStone devices
Thread-Index: AQHPL2qAocfeUu2zWEuhJfNjZBgMlZrHxHmAgABnd3A=
Date: Wed, 26 Feb 2014 22:52:58 +0000
Message-ID: <941289A393E94C478C153EF5E432FDBB3EA97181@DBDE04.ent.ti.com>
References: <1393031261-5360-1-git-send-email-aravindbr@ti.com>
	<20140226221153.GU22125@edge>
In-Reply-To: <20140226221153.GU22125@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] ti-rm: provides ti resouce manager recipe for KeyStone devices
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
X-List-Received-Date: Wed, 26 Feb 2014 22:53:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Denys, I implemented all of your minor comments and sent the next pa=
tch for review.

-Best Regards,
Aravind

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 26, 2014 5:12 PM
> To: Aravind Batni
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH v2] ti-rm: provides ti resouce manager
> recipe for KeyStone devices
>=20
> On Fri, Feb 21, 2014 at 08:07:41PM -0500, Aravind Batni wrote:
> > - TI Resource Manager Low Level Driver
> >
> > Signed-off-by: Aravind Batni <aravindbr@ti.com>
> >
> > ---
> > Changes from last patch:
> > * Removed ti-rm.inc file
> > * Added destsuffix in the SRCURI to clone RM git under git/ti/drv/rm
> > folder
> > * Removed the symbolic link workaround
> > * Added PV
> > * Added for loop for multiple devices and choices for the test
> > binaries
>=20
> Thanks! That's a good list of fixes and the patch now looks much better a=
nd
> cleaner. Please see few minor comments inline.
>=20
>=20
> > ---
> > ---
> >  meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb |   53
> ++++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> >
> > diff --git a/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb b/meta-
> arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> > new file mode 100755
> > index 0000000..761a722
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> > @@ -0,0 +1,53 @@
> > +DESCRIPTION =3D "TI Resource Manager Low Level Driver"
> > +LICENSE =3D "TI BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/git/ti/drv/rm/COPYING.txt;md5=3Ddc61631b65360e6beb73
> b6c337800afc"
> > +
> > +BRANCH=3D"master"
> > +SRC_URI =3D "git://git.ti.com/keystone-rtos/rm-
> lld.git;destsuffix=3Dgit/ti/drv/rm;protocol=3Dgit;branch=3D${BRANCH}"
> > +# Below commit ID corresponds to DEV.RM_LLD.02.00.00.08
> > +SRCREV =3D "3a73cfe015214ff0401639f85fa5e52ea610e59d"
> > +PR =3D "r0"
> > +PV =3D "02.00.00.08"
> > +
> > +COMPATIBLE_MACHINE =3D "keystone"
> > +
> > +DEPENDS=3D"ti-ipc"
>=20
> 1. It depends on ti-ipc, so will have to wait for that one to get merged
> first.
> 2. Not critical at all, but would be nice to have a single space before a=
nd
> after =3D sign... :)
>=20
>=20
> > +PACKAGES =3D+ "${PN}-test"
> > +
> > +FILES_${PN}-test =3D "${bindir}/rmDspClientTest_*.out \
> > +                    ${bindir}/rmLinuxClientTest_*.out \
> > +                    ${bindir}/ti/drv/rm/test/dts_files/*.dtb"
> > +
> > +DEVICELIST =3D " k2h \
> > +               k2k \
> > +"
> > +
> > +CHOICELIST =3D " yes \
> > +               no  \
> > +"
>=20
> Since you are using above 2 vars in a "for" loop, they can be simple one-=
line
> strings like "k2h k2k" and "yes no". But it's Ok to split them in multipl=
e
> lines too - it's up to you.
>=20
>=20
> > +BASEDIR =3D "${WORKDIR}/git"
> > +S =3D "${BASEDIR}/ti/drv/rm"
> > +
> > +do_compile () {
> > +#   Now build the lld in the updated directory
> > +    make -f makefile_armv7 clean lib
> PDK_INSTALL_PATH=3D${STAGING_INCDIR} RM_SRC_DIR=3D${S}
> > +    for device in ${DEVICELIST}
> > +    do
> > +      for choice in ${CHOICELIST}
> > +      do
> > +        make -f makefile_armv7 tests
> IPC_DEVKIT_INSTALL_PATH=3D${STAGING_INCDIR}
> PDK_INSTALL_PATH=3D${BASEDIR} DEVICE=3D"$device"
> USEDYNAMIC_LIB=3D"$choice"
> > +      done
> > +    done
> > +}
> > +
> > +do_install () {
> > +	install -d ${D}/${includedir}/ti/drv/rm
>=20
> There seems to be an inconsistent indentation here - the above line uses
> tab,
> while other lines use spaces. Either way is fine, as long as they are
> consistent.
>=20
>=20
> > +    install -d ${D}/${libdir}
> > +    install -d ${D}/${bindir}
>=20
> There shouldn't be / between ${D} and ${libdir}. All the ${*dir} variable=
s are
> defined from root, i.e. starting with / and hence you'd end up with doubl=
e-/
> in the code...
>=20
>=20
> > +    for device in ${DEVICELIST}
> > +    do
> > +      make -f makefile_armv7 install installbin installbin_test
> INSTALL_INC_BASE_DIR=3D${D}/${includedir}
> INSTALL_LIB_BASE_DIR=3D${D}/${libdir}
> INSTALL_BIN_BASE_DIR=3D${D}/${bindir} DEVICE=3D"$device"
>=20
> Same comment about ${D}/${*dir} as above.
>=20
>=20
> > +    done
> > +}
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

