Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1DB3052A5E
	for <meta-arago@arago-project.org>;
	Thu,  7 Aug 2014 00:00:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7700850031918;
	Wed, 6 Aug 2014 19:00:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77007dI031886;
	Wed, 6 Aug 2014 19:00:07 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 6 Aug 2014 19:00:05 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/4] qtbase: add additional dependencies
	for GLES check on omap-a15 platforms
Thread-Index: AQHPsclcsYMMi1XWlUO6wMckPRhSG5vEOF9QgABVxYD//6zVEIAAWN0A//+s9cA=
Date: Thu, 7 Aug 2014 00:00:04 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6F5F68@DFLE08.ent.ti.com>
References: <1407365627-29059-1-git-send-email-denis@denix.org>
	<1407365627-29059-2-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6F5E80@DFLE08.ent.ti.com>
	<20140806233421.GR23523@edge>
	<8F29D6B095ED194EA1980491A5E029710C6F5F23@DFLE08.ent.ti.com>
	<20140806235441.GU23523@edge>
In-Reply-To: <20140806235441.GU23523@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/4] qtbase: add additional dependencies for GLES check on omap-a15 platforms
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
X-List-Received-Date: Thu, 07 Aug 2014 00:00:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, August 06, 2014 6:55 PM
> To: Cooper Jr., Franklin
> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/4] qtbase: add additional dependencies
> for GLES check on omap-a15 platforms
>=20
> On Wed, Aug 06, 2014 at 07:45:18PM -0400, Cooper Jr., Franklin wrote:
> > Ahh I think I get it now. I was getting confused since I didn't have
> > this issue with AM335x. But it seems like this is a dependency on the
> > Graphics package since libIMGegl needs drm and wayland.
> > Although the omap15 graphics SDK is weird since it's a prebuilt but
> > wouldn't it be better to add that dependency on the Graphics package?
> > We can avoid situations like this for any package that needs egl/gles2.
>=20
> I thought about that at first, but it's rather weird, as graphics SDK doe=
sn't
> have build dependency on those packages, mostly because it's already pre-
> built...
>=20
> I was going to experiment with it a bit to see if it would be possible to=
 use
> this graphics SDK w/o wayland libs, hence I just wanted to unblock qtbase=
 for
> now, as it's configure test fails.
[Franklin] I'm always for unblocking. I'm ok with this as is for now but on=
ce things stabilize it would be good to bring this up again to see what mak=
es sense.
>=20
>=20
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Wednesday, August 06, 2014 6:34 PM
> > > To: Cooper Jr., Franklin
> > > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH 2/4] qtbase: add additional
> > > dependencies for GLES check on omap-a15 platforms
> > >
> > > On Wed, Aug 06, 2014 at 11:30:12PM +0000, Cooper Jr., Franklin wrote:
> > > > If the graphics SDK provides libdrm and libwayland libraries
> > >
> > > Huh? Those libs are not provided by the graphics SDK.
> > >
> > >
> > > > why isn't the
> > > > dependency on virtual/libgles2 and virtual/egl enough? I see that
> > > > omap5-sgx-ddk-um-linux already provides libgles2 and egl.
> > >
> > > Because omap5-sgx-ddk-um-linux does not have libdrm and libwayland.
> > > Those are provided by the corresponding packages I'm adding into the
> > > dependency.
> > >
> > >
> > > > > -----Original Message-----
> > > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > > Sent: Wednesday, August 06, 2014 5:54 PM
> > > > > To: meta-arago@arago-project.org
> > > > > Subject: [meta-arago] [PATCH 2/4] qtbase: add additional
> > > > > dependencies
> > > for
> > > > > GLES check on omap-a15 platforms
> > > > >
> > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > >
> > > > > GLES libraries for omap-a15 platforms come in binary form and
> > > > > are pre-
> > > built
> > > > > against libdrm and libwayland libraries. When qtbase tries to do
> > > > > a check
> > > for
> > > > > GLES support, it fails to link the test app, when libdrm and
> > > > > libwayland are
> > > not
> > > > > yet available in sysroots:
> > > > >
> > > > > | OpenGL ES 2.x auto-detection... () ...-g++ ... -o opengles2.o
> > > > > | .../qtbase-opensource-src-
> > > 5.2.1/config.tests/unix/opengles2/opengles2.
> > > > > | cpp ...-g++ ... -o opengles2 opengles2.o -lsrv_um -lGLESv2
> > > > > | .../bin/ld: warning: libdrm.so.2, needed by
> > > > > | .../usr/lib/libsrv_um.so, not found (try using -rpath or
> > > > > | -rpath-link)
> > > > > | .../bin/ld: warning: libwayland-server.so.0, needed by
> > > > > | .../usr/lib/libIMGegl.so, not found (try using -rpath or
> > > > > | -rpath-link)
> > > > > | .../bin/ld: warning: libdrm_omap.so.1, needed by
> > > > > | .../usr/lib/libIMGegl.so, not found (try using -rpath or -rpath=
-link) ...
> > > > > | collect2: error: ld returned 1 exit status
> > > > > | Makefile:103: recipe for target 'opengles2' failed
> > > > > | make: *** [opengles2] Error 1
> > > > > | OpenGL ES 2.x disabled.
> > > > > | The OpenGL ES 2.0 functionality test failed!
> > > > >
> > > > > Add libdrm and wayland as extra dependencies for qtbase when
> > > > > building
> > > on
> > > > > omap-a15 with gles flag enabled.
> > > > >
> > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > ---
> > > > >  meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend | 6
> > > > > ++++++
> > > > >  1 file changed, 6 insertions(+)  create mode 100644
> > > > > meta-arago-distro/recipes- qt/qt5/qtbase_5.2.1.bbappend
> > > > >
> > > > > diff --git
> > > > > a/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> > > b/meta-
> > > > > arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> > > > > new file mode 100644
> > > > > index 0000000..c879313
> > > > > --- /dev/null
> > > > > +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
> > > > > @@ -0,0 +1,6 @@
> > > > > +GLES_EXTRA_DEPS =3D ""
> > > > > +GLES_EXTRA_DEPS_omap-a15 =3D "libdrm wayland"
> > > > > +
> > > > > +PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2
> > > > > +virtual/egl
> > > > > ${GLES_EXTRA_DEPS}"
> > > > > +
> > > > > +PR_append =3D "-arago0"
> > > > > --
> > > > > 2.0.4
> > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

