Return-Path: <h-gou@TI.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id EE8C65208C
	for <meta-arago@arago-project.org>;
	Tue, 16 Aug 2016 21:13:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7GLDO3i002754
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 16:13:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7GLDOgT021412
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 16:13:24 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Tue, 16 Aug 2016 16:13:24 -0500
From: "Gou, Hongmei" <h-gou@TI.com>
To: "Dmytriyenko, Denys" <denys@TI.com>
Thread-Topic: [meta-arago] [PATCH] glfw3: add version 3.1.2
Thread-Index: AQHR9/ysosFK5VL/8UaDqBHA7RwxDaBMEJTw
Date: Tue, 16 Aug 2016 21:13:23 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926C490DB@DLEE08.ent.ti.com>
References: <1470673008-28768-1-git-send-email-h-gou@ti.com>
	<20160811023601.GU8521@denix.org> <20160816202755.GQ18333@edge>
In-Reply-To: <20160816202755.GQ18333@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Senicic,
	Djordje" <d-senicic1@TI.com>
Subject: Re: [PATCH] glfw3: add version 3.1.2
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
X-List-Received-Date: Tue, 16 Aug 2016 21:13:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

We have just upgraded glfw3 to version 3.2 (released in June 2016). I will =
submit the recipe for glfw3 version 3.2 soon.

Thanks,
Hongmei

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, August 16, 2016 4:28 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org; Senicic, Djordje
> Subject: Re: [meta-arago] [PATCH] glfw3: add version 3.1.2
>=20
> Ping
>=20
>=20
> On Wed, Aug 10, 2016 at 10:36:01PM -0400, Denys Dmytriyenko wrote:
> > Can you please provide more info in the description about what this is
> > and where it's coming from (i.e. what about that patch?)
> >
> > --
> > Denys
> >
> >
> > On Mon, Aug 08, 2016 at 12:16:48PM -0400, Hongmei Gou wrote:
> > > Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
> > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > ---
> > >  .../glfw3/files/0001_xkb_unicode.patch             | 52
> ++++++++++++++++++++++
> > >  .../recipes-graphics/glfw3/glfw3_git.bb            | 24 ++++++++++
> > >  2 files changed, 76 insertions(+)
> > >  create mode 100644
> > > meta-arago-extras/recipes-graphics/glfw3/files/0001_xkb_unicode.patc
> > > h  create mode 100644
> > > meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
> > >
> > > diff --git
> > > a/meta-arago-extras/recipes-graphics/glfw3/files/0001_xkb_unicode.pa
> > > tch
> > > b/meta-arago-extras/recipes-graphics/glfw3/files/0001_xkb_unicode.pa
> > > tch
> > > new file mode 100644
> > > index 0000000..7c9b9d3
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-graphics/glfw3/files/0001_xkb_unicod
> > > +++ e.patch
> > > @@ -0,0 +1,52 @@
> > > +--- a/src/xkb_unicode.c	2015-10-12 15:09:07.000000000 -0400
> > > ++++ b/src/xkb_unicode.c	2016-04-08 08:20:23.229370629 -0400
> > > +@@ -1,5 +1,5 @@
> > > +
> > >
> +//=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +=3D=3D=3D=3D=3D=3D=3D
> > > +-// GLFW 3.1 X11 - www.glfw.org
> > > ++// GLFW 3.1patched X11 - www.glfw.org
> > > +
> > > +//-----------------------------------------------------------------
> > > +-------  // Copyright (c) 2002-2006 Marcus Geelnard  // Copyright
> > > +(c) 2006-2010 Camilla Berglund <elmindreda@elmindreda.org> @@
> > > +-827,24 +827,24 @@
> > > +   { 0x13be, 0x0178 },
> > > +   { 0x20ac, 0x20ac },
> > > +   // Numeric keypad with numlock on
> > > +-  { XK_KP_Space, ' ' },
> > > +-  { XK_KP_Equal, '=3D' },
> > > +-  { XK_KP_Multiply, '*' },
> > > +-  { XK_KP_Add, '+' },
> > > +-  { XK_KP_Separator, ',' },
> > > +-  { XK_KP_Subtract, '-' },
> > > +-  { XK_KP_Decimal, '.' },
> > > +-  { XK_KP_Divide, '/' },
> > > +-  { XK_KP_0, 0x0030 },
> > > +-  { XK_KP_1, 0x0031 },
> > > +-  { XK_KP_2, 0x0032 },
> > > +-  { XK_KP_3, 0x0033 },
> > > +-  { XK_KP_4, 0x0034 },
> > > +-  { XK_KP_5, 0x0035 },
> > > +-  { XK_KP_6, 0x0036 },
> > > +-  { XK_KP_7, 0x0037 },
> > > +-  { XK_KP_8, 0x0038 },
> > > +-  { XK_KP_9, 0x0039 }
> > > ++  { 0xff80 /*XKB_KEY_KP_Space*/,     ' ' },
> > > ++  { 0xffbd /*XKB_KEY_KP_Equal*/,     '=3D' },
> > > ++  { 0xffaa /*XKB_KEY_KP_Multiply*/,  '*' },
> > > ++  { 0xffab /*XKB_KEY_KP_Add*/,       '+' },
> > > ++  { 0xffac /*XKB_KEY_KP_Separator*/, ',' },  { 0xffad
> > > ++ /*XKB_KEY_KP_Subtract*/,  '-' },
> > > ++  { 0xffae /*XKB_KEY_KP_Decimal*/,   '.' },
> > > ++  { 0xffaf /*XKB_KEY_KP_Divide*/,    '/' },
> > > ++  { 0xffb0 /*XKB_KEY_KP_0*/, 0x0030 },  { 0xffb1 /*XKB_KEY_KP_1*/,
> > > ++ 0x0031 },  { 0xffb2 /*XKB_KEY_KP_2*/, 0x0032 },  { 0xffb3
> > > ++ /*XKB_KEY_KP_3*/, 0x0033 },  { 0xffb4 /*XKB_KEY_KP_4*/, 0x0034 },
> > > ++ { 0xffb5 /*XKB_KEY_KP_5*/, 0x0035 },  { 0xffb6 /*XKB_KEY_KP_6*/,
> > > ++ 0x0036 },  { 0xffb7 /*XKB_KEY_KP_7*/, 0x0037 },  { 0xffb8
> > > ++ /*XKB_KEY_KP_8*/, 0x0038 },  { 0xffb9 /*XKB_KEY_KP_9*/, 0x0039 }
> > > + };
> > > +
> > > +
> > > diff --git a/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
> > > b/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
> > > new file mode 100644
> > > index 0000000..aa1abe9
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-graphics/glfw3/glfw3_git.bb
> > > @@ -0,0 +1,24 @@
> > > +SUMMARY =3D "GLFW cross platform graphics framework"
> > > +DESCRIPTION =3D "A multi-platform library for OpenGL and OpenGLES,
> window and input"
> > > +HOMEPAGE =3D "http://glfw.org/"
> > > +LICENSE =3D "Zlib & Libpng"
> > > +LIC_FILES_CHKSUM =3D
> "file://COPYING.txt;md5=3Df543d41f3829a608a406b713e4e72731"
> > > +
> > > +PV =3D "3.1.2"
> > > +PR =3D "r0"
> > > +
> > > +BRANCH =3D "master"
> > > +SRC_URI =3D "git://github.com/glfw/glfw.git;branch=3D${BRANCH}"
> > > +SRCREV =3D "30306e54705c3adae9fe082c816a3be71963485c"
> > > +
> > > +SRC_URI +=3D "file://0001_xkb_unicode.patch"
> > > +
> > > +DEPENDS =3D "glib-2.0 virtual/libgles2 virtual/egl weston wayland wa=
yland-
> native"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit cmake pkgconfig
> > > +
> > > +EXTRA_OECMAKE +=3D "-DGLFW_USE_WAYLAND=3DON -
> DGLFW_CLIENT_LIBRARY=3Dglesv2 -DGLFW_BUILD_EXAMPLES=3DON -
> DGFLW_BUILD_TESTS=3DON"
> > > +
> > > +FILES_${PN} +=3D "/usr/lib/cmake/*"
> > > --
> > > 1.9.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

