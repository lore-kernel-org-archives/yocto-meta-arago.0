Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4C4BA529D5
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:54:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84Hsbjs004272
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:54:37 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84Hsb4r013032
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:54:37 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 4 Sep 2014 12:54:36 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/3] qtwayland: Fix windows margin issue
	when using touch events.
Thread-Index: AQHPyGao/OVeIGnFu0WwYsKZFngaBZvxky8A//+tX5A=
Date: Thu, 4 Sep 2014 17:54:35 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C728A89@DFLE08.ent.ti.com>
References: <1409852140-13616-1-git-send-email-fcooper@ti.com>
	<20140904174558.GN18620@edge>
In-Reply-To: <20140904174558.GN18620@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/3] qtwayland: Fix windows margin issue when using touch events.
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
X-List-Received-Date: Thu, 04 Sep 2014 17:54:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, September 04, 2014 12:46 PM
> To: Cooper Jr., Franklin
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/3] qtwayland: Fix windows margin issue
> when using touch events.
>=20
> Franklin,
>=20
> Thanks! Have you tested these patches? Are there any other
> touch/qt5/weston issues remaining? What about that Weston restart one?
[Franklin] Yep tested for the initial issue which was touch not working wit=
h Qt 5.

What is still broken is that you can interact with the window's decoration.=
 So you can use the title bar to move a window around, you can't interact w=
ith the menu bar and you can't minimize, maximize, and close a window via t=
he icons on the top right. Some might consider this a new bug but I plan on=
 updating the current Qt bug report.

This is different than the restart Weston via init script issue and I haven=
't looked into that one.


>=20
>=20
> On Thu, Sep 04, 2014 at 12:35:38PM -0500, Franklin S. Cooper Jr wrote:
> > From: "Franklin S. Cooper Jr" <fcooper@ti.com>
> >
> > * This is another QtWayland bug that was discussed in the Qt bug report=
:
> >   https://bugreports.qt-project.org/browse/QTBUG-36602
> > * Patch link:
> >     https://codereview.qt-project.org/#/c/93664/
> >
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  .../0001-Wayland-correct-touch-location.patch      |   31
> ++++++++++++++++++++
> >  .../recipes-qt/qt5/qtwayland_git.bbappend          |    5 ++--
> >  2 files changed, 34 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-arago-extras/recipes-qt/qt5/qtwayland/0001-
> Wayland-correct-touch-location.patch
> >
> > diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-
> correct-touch-location.patch b/meta-arago-extras/recipes-
> qt/qt5/qtwayland/0001-Wayland-correct-touch-location.patch
> > new file mode 100644
> > index 0000000..caa6dff
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-qt/qt5/qtwayland/0001-Wayland-
> correct-touch-location.patch
> > @@ -0,0 +1,31 @@
> > +From ae54be549e6ebeef829d5c1089d5307d00d0b791 Mon Sep 17
> 00:00:00 2001
> > +From: Shawn Rutledge <shawn.rutledge@digia.com>
> > +Date: Mon, 1 Sep 2014 15:30:42 +0200
> > +Subject: [PATCH] Wayland: correct touch location
> > +
> > +The window margins were offsetting the touch point in the wrong
> > +direction.
> > +
> > +Task-number: QTBUG-36602
> > +Change-Id: Id8b31d2de4051f36d3ff4e088bbc9bd7cc84ca13
> > +Reviewed-by: Laszlo Agocs <laszlo.agocs@digia.com>
> > +---
> > + src/client/qwaylandinputdevice.cpp |    2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/client/qwaylandinputdevice.cpp
> b/src/client/qwaylandinputdevice.cpp
> > +index 4a100f7..014303f 100644
> > +--- a/src/client/qwaylandinputdevice.cpp
> > ++++ b/src/client/qwaylandinputdevice.cpp
> > +@@ -921,7 +921,7 @@ void QWaylandInputDevice::handleTouchPoint(int
> id, double x, double y, Qt::Touch
> > +
> > +         tp.area =3D QRectF(0, 0, 8, 8);
> > +         QMargins margins =3D win->frameMargins();
> > +-        tp.area.moveCenter(win->window()-
> >mapToGlobal(QPoint(x+margins.left(), y+margins.top())));
> > ++        tp.area.moveCenter(win->window()->mapToGlobal(QPoint(x -
> margins.left(), y - margins.top())));
> > +     }
> > +
> > +     tp.state =3D state;
> > +--
> > +1.7.9.5
> > +
> > diff --git a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> > index dca1710..336484b 100644
> > --- a/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> > +++ b/meta-arago-extras/recipes-qt/qt5/qtwayland_git.bbappend
> > @@ -1,8 +1,9 @@
> > -PR_append =3D "-arago2"
> > +PR_append =3D "-arago3"
> >
> >  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >
> > -SRC_URI +=3D "file://0001-Fix-touch-with-Weston.patch"
> > +SRC_URI +=3D "file://0001-Fix-touch-with-Weston.patch \
> > +            file://0001-Wayland-correct-touch-location.patch"
> >
> >
> >  QT_MODULE_BRANCH =3D "5.4"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

