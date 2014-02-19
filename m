Return-Path: <aravindbr@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E8D48529B6
	for <meta-arago@arago-project.org>;
	Wed, 19 Feb 2014 15:07:31 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1JF7TqO010066
	for <meta-arago@arago-project.org>; Wed, 19 Feb 2014 09:07:30 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1JF7RrN019323
	for <meta-arago@arago-project.org>; Wed, 19 Feb 2014 20:37:28 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0174.001; Wed, 19 Feb 2014 20:37:26 +0530
From: Aravind Batni <aravindbr@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] ti-rm: provides ti resouce manager recipe
	for	KeyStone devices
Thread-Index: AQHPKMX6ybdzqA293UKK2HYxGYka75q05PGAgAbjSeCAAITBAIAAaQ6w
Date: Wed, 19 Feb 2014 15:07:26 +0000
Message-ID: <941289A393E94C478C153EF5E432FDBB3EA7A941@DBDE04.ent.ti.com>
References: <1392243289-10398-1-git-send-email-aravindbr@ti.com>
	<7D46E86EC0A8354091174257B2FED1015996BEC8@DLEE11.ent.ti.com>
	<20140214211136.GM7138@edge>
	<941289A393E94C478C153EF5E432FDBB3EA797F4@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015CEBED5F@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CEBED5F@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] ti-rm: provides ti resouce manager recipe for	KeyStone devices
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
X-List-Received-Date: Wed, 19 Feb 2014 15:07:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Maupin, Chase
> Sent: Wednesday, February 19, 2014 9:18 AM
> To: Aravind Batni; Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] ti-rm: provides ti resouce manager reci=
pe
> for KeyStone devices
>=20
> >-----Original Message-----
> >From: Aravind Batni
> >Sent: Tuesday, February 18, 2014 7:41 PM
> >To: Dmytriyenko, Denys; Maupin, Chase
> >Cc: meta-arago@arago-project.org
> >Subject: RE: [meta-arago] [PATCH] ti-rm: provides ti resouce manager
> >recipe for KeyStone devices
> >
> >Denys/Chase,
> >Thanks for the inputs - Please find the response in-lined.
> >
> >-Best Regards,
> >Aravind
> >
> >
> >> -----Original Message-----
> >> From: Dmytriyenko, Denys
> >> Sent: Friday, February 14, 2014 4:12 PM
> >> To: Maupin, Chase
> >> Cc: Aravind Batni; meta-arago@arago-project.org
> >> Subject: Re: [meta-arago] [PATCH] ti-rm: provides ti resouce
> >manager recipe
> >> for KeyStone devices
> >>
> >> On Thu, Feb 13, 2014 at 02:14:56PM +0000, Maupin, Chase wrote:
> >> > >-----Original Message-----
> >> > >From: meta-arago-bounces@arago-project.org [mailto:meta-
> >arago-
> >> > >bounces@arago-project.org] On Behalf Of Aravind Batni
> >> > >Sent: Wednesday, February 12, 2014 4:15 PM
> >> > >To: meta-arago@arago-project.org
> >> > >Cc: Aravind Batni
> >> > >Subject: [meta-arago] [PATCH] ti-rm: provides ti resouce
> >manager
> >> > >recipe for KeyStone devices
> >> > >
> >> > >- TI Resource Manager Low Level Driver
> >> > >
> >> > >Signed-off-by: Aravind Batni <aravindbr@ti.com>
> >> > >---
> >> > > meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc    |    7 ++++
> >> > > meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb |   45
> >> > >++++++++++++++++++++++
> >> > > 2 files changed, 52 insertions(+) create mode 100644
> >> > > meta-arago-extras/recipes-bsp/ti-rm/ti-
> >rm.inc
> >> > > create mode 100644 meta-arago-extras/recipes-bsp/ti-rm/ti-
> >> > >rm_git.bb
> >> > >
> >> > >diff --git a/meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc
> >b/meta-
> >> > >arago-extras/recipes-bsp/ti-rm/ti-rm.inc
> >> > >new file mode 100644
> >> > >index 0000000..96da467
> >> > >--- /dev/null
> >> > >+++ b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm.inc
> >> > >@@ -0,0 +1,7 @@
> >> > >+LICENSE =3D "TI BSD"
> >> > >+LIC_FILES_CHKSUM =3D
> >> > >"file://COPYING.txt;md5=3Ddc61631b65360e6beb73b6c337800afc"
> >> > >+
> >> > >+BRANCH=3D"master"
> >> > >+SRC_URI =3D "git://git.ti.com/keystone-rtos/rm-
> >> > >lld.git;protocol=3Dgit;branch=3D${BRANCH}"
> >> > >+# Below commit ID corresponds to DEV.RM_LLD.02.00.00.08
> >SRCREV =3D
> >> > >+"3a73cfe015214ff0401639f85fa5e52ea610e59d"
> >> >
> >> > If you aren't going to have multiple versions of a recipe the
> >.inc is
> >> > not required.  If you do plan for multiple versions then the
> >SRCREV at
> >> > least is probably best left in the version specific recipe and
> >not in the .inc.
> >> > Looking at this I would think it likely that you could/should
> >just
> >> > roll this .inc into the regular .bb recipe.
> >> >
> >
> > [Aravind Batni] Yes, we can roll this to the regular .bb recipe
> >
> >> > >diff --git a/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> >> >
> >> > Looking at the SRCREV below do you want to call this
> >02.00.00.08
> >> > version of the recipe instead of just _git?
> >> >
> >[Aravind Batni]  We would like to call this as _git recipe since we
> >don't plan to provide multiple recipes per RM release.
> >
> >> > >b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> >> > >new file mode 100644
> >> > >index 0000000..7c8dad0
> >> > >--- /dev/null
> >> > >+++ b/meta-arago-extras/recipes-bsp/ti-rm/ti-rm_git.bb
> >> > >@@ -0,0 +1,45 @@
> >> > >+DESCRIPTION =3D "TI Resource Manager Low Level Driver"
> >> > >+
> >> > >+COMPATIBLE_MACHINE =3D "keystone"
> >> > >+
> >> > >+PR =3D "r0"
> >> >
> >> > You should probably set PV here if you are not going to change
> >this
> >> > recipe to a specific version.
> >
> >[Aravind Batni] Yes, I would add PV variable in the recipe
> >> >
> >> > >+DEPENDS=3D"ti-ipc"
> >> > >+LLD-NAME=3D"rm"
> >> > >+
> >> > >+include ti-rm.inc
> >> > >+
> >> > >+S =3D "${WORKDIR}/git"
> >> > >+LLD-BLD-DIR=3D"${S}/ti/drv"
> >> > >+
> >> > >+PACKAGES =3D+ "${PN}-test"
> >> > >+
> >> > >+FILES_${PN}-test =3D "${bindir}/rmDspClientTest_*.out \
> >> > >+                    ${bindir}/rmLinuxClientTest_*.out \
> >> > >+
> >${bindir}/ti/drv/rm/test/dts_files/*.dtb"
> >> > >+
> >> > >+do_configure () {
> >> > >+#   tweak the directory structure to LLD way
> >> > >+    cd ${S}
> >> > >+    mkdir -p ${LLD-BLD-DIR}
> >> > >+    cd ${LLD-BLD-DIR}
> >> > >+    ln -s ${S} ${LLD-NAME}
> >>
> >> Also, please don't use dashes in variable names! Underscores,
> >while not
> >> recommended, are still acceptable:
> >>
> >> LLDBLDDIR - best from Bitbake perspective, not very human-
> >readable
> >> LLD_BLD_DIR - not perfect from Bitbake perspective, but
> >parseable and
> >> readable LLD-BLD-DIR - may cause all kinds of issues
> >>
> > [Aravind Batni] Yes, I would correct the recipe not to use any dashes
> >>
> >> > I'm not sure I understand what you are trying to do here.  It
> >seems
> >> > like you want ${WORKDIR}/git/ti/drv/rm to be pointed to ${S}?
> >Looking
> >> > below it seems like you then want to pass ${S}/ti/drm/rm,
> >which points
> >> > to ${S} to the make commands.  So can't you just point things
> >to ${S}?
> >> >
> >> > Are you trying to work around the Makefile maybe looking for
> >other
> >> > files in the ti/drv directory?  Since you created that
> >directory that
> >> > doesn't seem likely though.  This seems like an issue best
> >handled by
> >> > updating the Makefiles to allow you to set paths and have a
> >set of
> >> > defaults.  i.e. PATHX ?=3D "default path".  That way you can
> >update PATHX as
> >> a parameter you pass.
> >> > But this seems strange to make new direcory structures that
> >then link
> >> > back to the base directory you were already in.
> >[Aravind Batni]  The RM source does not permit to build from ${S}
> >directly. If we had a way to create ${S} (git clone) under ti/drv/rm,
> >then we don't need to create the symbolic links to build RM lld. This
> >is done originally to support DSP builds that are delivered from PDK,
> >which demand this depth in the directory.
>=20
> OK, help me understand here.  You are cloning to ${WORKDIR}/git, but you
> need the clone to really be in ${WORKDIR}/git/ti/drv/rm directory because
> the makefiles/sources demand this directory structure?
>=20
> Denys, are you aware of any option to control where the clone checks out
> to?
>=20
> If the sources were stored in the repo under ti/drm/rm would this work?
>=20
[Aravind Batni] Yes, if we had an option to clone the repo under ${WORKDIR}=
/git/ti/drv/rm everything would work and we don't need to do symbolic links=
 for the builds.=20
>=20
> >> >
> >> > >+}
> >> > >+
> >> > >+do_compile () {
> >> > >+#   Now build the lld in the updated directory
> >> > >+    cd ${LLD-BLD-DIR}/${LLD-NAME}
> >> > >+    make -f makefile_armv7 clean
> >> > >PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3Dk2h
> >> RM_SRC_DIR=3D${LLD-
> >> > >BLD-DIR}/${LLD-NAME}
> >> > >+    make -f makefile_armv7 lib tests
> >> > >PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3Dk2h
> >> RM_SRC_DIR=3D${LLD-
> >> > >BLD-DIR}/${LLD-NAME}
> >> > >+    make -f makefile_armv7 lib tests
> >> > >PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3Dk2h
> >> RM_SRC_DIR=3D${LLD-
> >> > >BLD-DIR}/${LLD-NAME} USEDYNAMIC_LIB=3Dyes
> >> > >+    make -f makefile_armv7 clean
> >> > >PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3Dk2k
> >> RM_SRC_DIR=3D${LLD-
> >> > >BLD-DIR}/${LLD-NAME}
> >> > >+    make -f makefile_armv7 lib tests
> >> > >PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3Dk2k
> >> RM_SRC_DIR=3D${LLD-
> >> > >BLD-DIR}/${LLD-NAME}
> >> > >+    make -f makefile_armv7 lib tests
> >> > >PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3Dk2k
> >> RM_SRC_DIR=3D${LLD-
> >> > >BLD-DIR}/${LLD-NAME} USEDYNAMIC_LIB=3Dyes
> >> >
> >> > Some thoughts:
> >> >
> >> > 1. Would this be better done as a for loop iterated of the
> >different
> >> > DEVICE settings?
> >[Aravind Batni] Yes, thanks for the inputs. I will modify the recipe to
> >have for loops .
> >> > 2. Since you don't seem to be breaking these libraries out per
> >DEVICE
> >> > and I think you are packaging both static and dynamic
> >libraries would an
> >> "all"
> >> > make target be better than calling each individually?
> >> > 	- I actually wonder if you would prefer to split dynamic vs.
> >static
> >> > 	libraries.  Why are both packaged?  Or maybe I don't
> >understand
> >> what
> >> > 	you are doing here?
> >> > 3. Should the libraries be packaged per DEVICE? The root of
> >this
> >> > question is whether this recipe should be machine specific and
> >you
> >> > build the package for k2k and k2h devices.  It seems like you
> >are
> >> > making one package that has support for multiple devices.
> >
> >[Aravind Batni] There is a single library for both K2H and K2K devices,
> >the options are for test applications. I now modified the recipe to
> >build the library only once for both K2H and K2K and build all other
> >variations on the test applications in the next updated patch submit.
> >> >
> >> > >+}
> >> > >+
> >> > >+do_install () {
> >> > >+    install -d ${D}/${includedir}/ti/drv/${LLD-NAME}
> >> > >+    install -d ${D}/${libdir}
> >> > >+    install -d ${D}/${bindir}
> >> > >+    make -f makefile_armv7 install installbin
> >installbin_test
> >> > >INSTALL_INC_BASE_DIR=3D${D}/${includedir}
> >> > >INSTALL_LIB_BASE_DIR=3D${D}/${libdir}
> >> > >INSTALL_BIN_BASE_DIR=3D${D}/${bindir} DEVICE=3Dk2h
> >> > >+    make -f makefile_armv7 install installbin
> >installbin_test
> >> > >INSTALL_INC_BASE_DIR=3D${D}/${includedir}
> >> > >INSTALL_LIB_BASE_DIR=3D${D}/${libdir}
> >> > >INSTALL_BIN_BASE_DIR=3D${D}/${bindir} DEVICE=3Dk2k
> >> > >+}
> >> > >--
> >[Aravind Batni] I would have a for loop based installs for every
> >device.
> >> > >1.7.9.5
> >> > >
> >> > >_______________________________________________
> >> > >meta-arago mailing list
> >> > >meta-arago@arago-project.org
> >> > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >> > _______________________________________________
> >> > meta-arago mailing list
> >> > meta-arago@arago-project.org
> >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

