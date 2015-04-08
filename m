Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 045A0529C6
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2015 23:16:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t38NGFl2019853
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 18:16:15 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t38NGEKs013862
	for <meta-arago@arago-project.org>; Wed, 8 Apr 2015 18:16:14 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Wed, 8 Apr 2015 18:16:14 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH] qtbase: Add env script for ti33x w/o
	wayland	to rotate touchscreen.
Thread-Index: AQHQZio8AfpJjVc4iUaYFYhs6990up0rnEIigABUkgD//7dcKYAYIOiAgAAOirA=
Date: Wed, 8 Apr 2015 23:16:13 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C86A10B@DFLE08.ent.ti.com>
References: <1427198466-11676-1-git-send-email-j-stiffler@ti.com>
	<63198F42-2FC4-4A51-A3CC-36DF22560F83@ti.com>,
	<4B26FB5A64EBA14C87266869E037F9581411ADE9@DFLE09.ent.ti.com>
	<E952140B-23BA-4DCA-BB29-CEDDF4DDACD9@ti.com>
	<4B26FB5A64EBA14C87266869E037F9581411D8FE@DFLE09.ent.ti.com>
In-Reply-To: <4B26FB5A64EBA14C87266869E037F9581411D8FE@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] qtbase: Add env script for ti33x w/o wayland	to rotate touchscreen.
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
X-List-Received-Date: Wed, 08 Apr 2015 23:16:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Should be good to go then.

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Wednesday, April 08, 2015 12:24 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH] qtbase: Add env script for ti33x w/o
> wayland to rotate touchscreen.
>=20
> Franklin,
>=20
> I have verified that this is also applicable to the SK EVMs along with th=
e GP
> EVMs. The bbb hdmi is not applicable since this is not a touchscreen.
>=20
> - Jake
>=20
> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Tuesday, March 24, 2015 9:56 AM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] qtbase: Add env script for ti33x w/o
> wayland to rotate touchscreen.
>=20
> I would recommend testing those boards first before applying this patch w=
ith
> my below comments.
>=20
> U can end up having something work on one board but break on another
>=20
>=20
> > On Mar 24, 2015, at 8:16 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
> >
> > I only have the am335x EVM to test this. And yes, it does seem very odd=
.
> >
> > I tested the core sdk image with wayland and the issue is not present.
> >
> >
> > -----Original Message-----
> > From: Cooper Jr., Franklin
> > Sent: Tuesday, March 24, 2015 9:13 AM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] qtbase: Add env script for ti33x w/o
> wayland to rotate touchscreen.
> >
> > We should avoid creating more and more init scripts when possible.
> >
> > Any reason you couldn't just add the parameter to the main init script =
and
> use a sed statement to include or not include the rotate command.
> >
> > Also this seems like this is covering up another issue. Do you have any=
 idea
> why this is only happening for am335x? Have u verified that this issue is=
 seen
> for bbb hdmi, GP evm and sk board?
> >
> > There is nothing special about 335x that should make it unique and for
> > this issue not to be seen on am437x
> >
> >
> >> On Mar 24, 2015, at 7:01 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote=
:
> >>
> >> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >> ---
> >> .../recipes-qt/qt5/qtbase/qt_env_ti33x.sh          |    5 +++++
> >> .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |    9 ++++++---
> >> 2 files changed, 11 insertions(+), 3 deletions(-) create mode 100644
> >> meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_ti33x.sh
> >>
> >> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_ti33x.sh
> >> b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_ti33x.sh
> >> new file mode 100644
> >> index 0000000..8f47083
> >> --- /dev/null
> >> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_ti33x.sh
> >> @@ -0,0 +1,5 @@
> >> +#!/bin/sh
> >> +
> >> +### QT Environment Variables ###
> >> +export QT_QPA_GENERIC_PLUGINS=3DAuto
> >> +export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS=3D"rotate=3D180"
> >> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> >> b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> >> index 210d23f..412bf67 100644
> >> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> >> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> >> @@ -5,7 +5,7 @@ GLES_EXTRA_DEPS_omap-a15 =3D "libdrm wayland"
> >>
> >> PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual=
/egl
> ${GLES_EXTRA_DEPS}"
> >>
> >> -PR_append =3D "-arago5"
> >> +PR_append =3D "-arago6"
> >>
> >> QT_CONFIG_FLAGS +=3D "-qpa ${@base_contains('DISTRO_FEATURES',
> 'wayland', 'wayland', 'eglfs', d)}"
> >>
> >> @@ -15,8 +15,11 @@ QT_EGLFS_PATCHES =3D "\
> >>    file://quit.png \
> >> "
> >>
> >> +QT_ENV =3D "qt_env.sh"
> >> +QT_ENV_ti33x =3D "${@base_contains('DISTRO_FEATURES', 'wayland',
> 'qt_env.sh', 'qt_env_ti33x.sh', d)}"
> >> +
> >> SRC_URI +=3D "\
> >> -    file://qt_env.sh \
> >> +    file://${QT_ENV} \
> >>    ${@base_contains('DISTRO_FEATURES', 'wayland', '',
> >> "${QT_EGLFS_PATCHES}", d)}\ "
> >>
> >> @@ -33,7 +36,7 @@ python do_patch_append() { # Add custom Arago Qt
> 5
> >> Environment script file do_install_append () {
> >>    install -d ${D}${sysconfdir}/profile.d
> >> -    install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
> >> +    install -m 0644 ${WORKDIR}/${QT_ENV}
> >> + ${D}${sysconfdir}/profile.d/qt_env.sh
> >> }
> >>
> >> PACKAGES =3D+ "${PN}-conf"
> >> --
> >> 1.7.9.5
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

