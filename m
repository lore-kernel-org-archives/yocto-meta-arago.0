Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id BA5F7520E3
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 19:09:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GJ9gCf006116
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 14:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489691382;
	bh=Wn2s7x2D3gyiMx1EGglXvuIZk0T1CFuSV8rDQ4KM+hg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=GsEbRnhABmut0wGMbpARdogh2cCAFfrJpiPfhVWXdbx59lfgLXnObOChBoPcnNY12
	+UuElDjpaE+e0WyIzTtFQ4ueiadXJFuHLz0JoOkDt6c1v4GgNF354mqm7XF6Ilmdfj
	f8lWbvUOgDqd/pkt92MJfaMtJxaWGKcfyTH4Q9NQ=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GJ9gTU002622
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 14:09:42 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Thu, 16 Mar 2017 14:09:42 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [krogoth][PATCH 1/3] gstreamer1.0-plugins-bad:
	kmssink: remove DCE dependencies
Thread-Index: AQHSnn9x86qO3+C420KAuNwd+TrYEaGYGmyAgAAHyYD//7FNoA==
Date: Thu, 16 Mar 2017 19:09:41 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A25356FB3@DFLE09.ent.ti.com>
References: <1489685377-53666-1-git-send-email-e-ruei1@ti.com>
	<20170316180214.GJ14484@edge>
	<9109234e-00ec-9bf8-37b4-46f8befd8356@ti.com>
	<20170316184658.GM14484@edge>
In-Reply-To: <20170316184658.GM14484@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [krogoth][PATCH 1/3] gstreamer1.0-plugins-bad: kmssink: remove DCE dependencies
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
X-List-Received-Date: Thu, 16 Mar 2017 19:09:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

There were TI-specific changes including kmssink  made on top of Gstreamer =
master branch.
Some minor or major rework is usually required for each gstreamer major upg=
rade and therefore, my changes are not applicable directly.
However, similar enhancements will be added to gstreamer 1.8.3.

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 16, 2017 2:47 PM
To: Ruei, Eric
Cc: Ruei, Eric; meta-arago@arago-project.org
Subject: Re: [meta-arago] [krogoth][PATCH 1/3] gstreamer1.0-plugins-bad: km=
ssink: remove DCE dependencies

On Thu, Mar 16, 2017 at 02:19:07PM -0400, Ruei, Eric wrote:
> On 3/16/2017 2:02 PM, Denys Dmytriyenko wrote:
> >Thanks!
> >Do you plan to support am3?
>=20
> No, the kmssink will not work on AM3 because it requires overlay DRM=20
> plane. And there is no customer requirement for advanced features for=20
> AM3.
>=20
> >Is it applicable to morty? Any patches planned?
> No, it is not applicable to Morty because new version of gstreamer
> (1.9) is for morty.
>=20
> I do plan to submit those patches for review.

morty has 1.8.3 - I meant the change in general, not specific to 1.6.3...


> >Also, see inline below.
> >
> >
> >On Thu, Mar 16, 2017 at 01:29:35PM -0400, Eric Ruei wrote:
> >>- remove DCE dependencies from kmssink
> >>- AM4(ti43x) shares the same branch as of AM5(omap-a15)
> >>
> >>Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> >>---
> >> .../0001-kmssink-remove-DCE-dependencies.patch     | 96 ++++++++++++++=
++++++++
> >> .../gstreamer1.0-plugins-bad_1.6.3.bbappend        |  8 +-
> >> 2 files changed, 102 insertions(+), 2 deletions(-)  create mode=20
> >>100644=20
> >>meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
> >>bad/0001-kmssink-remove-DCE-dependencies.patch
> >>
> >>diff --git=20
> >>a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin
> >>s-bad/0001-kmssink-remove-DCE-dependencies.patch=20
> >>b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin
> >>s-bad/0001-kmssink-remove-DCE-dependencies.patch
> >>new file mode 100644
> >>index 0000000..e050e08
> >>--- /dev/null
> >>+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl
> >>+++ ugins-bad/0001-kmssink-remove-DCE-dependencies.patch
> >>@@ -0,0 +1,96 @@
> >>+From 6b04eb39296caec717d310872c1f0acfa85c5ae7 Mon Sep 17 00:00:00=20
> >>+2001
> >>+From: Eric Ruei <e-ruei1@ti.com>
> >>+Date: Wed, 15 Mar 2017 09:08:13 -0400
> >>+Subject: [PATCH 1/2] kmssink: remove DCE dependencies
> >>+
> >>+Replace DCE related API calls to libdrm and omapdrm API calls to=20
> >>+decouple DCE from kmssink
> >>+
> >>+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> >>+---
> >>+ configure.ac         |  1 -
> >>+ sys/kms/Makefile.am  |  2 --
> >>+ sys/kms/gstkmssink.c | 17 +++++++++++++----
> >>+ 3 files changed, 13 insertions(+), 7 deletions(-)
> >>+
> >>+diff --git a/configure.ac b/configure.ac index 2e0d1f3..2b1ecaa=20
> >>+100644
> >>+--- a/configure.ac
> >>++++ b/configure.ac
> >>+@@ -2119,7 +2119,6 @@ dnl *** kms ***  translit(dnm, m, l)=20
> >>+AM_CONDITIONAL(USE_KMS, true)  AG_GST_CHECK_FEATURE(KMS, [kmssink],=20
> >>+kms, [
> >>+   PKG_CHECK_MODULES([DRM], [libdrm libdrm_omap], HAVE_KMS=3Dyes,=20
> >>+HAVE_KMS=3Dno)
> >>+-  PKG_CHECK_MODULES(LIBDCE, [libdce >=3D 1.0.0], HAVE_KMS=3Dyes, HAVE=
_KMS=3Dno)
> >>+   AC_SUBST(DRM_CFLAGS)
> >>+   AC_SUBST(DRM_LIBS)
> >>+ ])
> >>+diff --git a/sys/kms/Makefile.am b/sys/kms/Makefile.am index=20
> >>+6d56073..cc7353e 100644
> >>+--- a/sys/kms/Makefile.am
> >>++++ b/sys/kms/Makefile.am
> >>+@@ -9,7 +9,6 @@ libgstkmssink_la_CFLAGS =3D \
> >>+ 	$(GST_PLUGINS_BAD_CFLAGS) \
> >>+ 	$(GST_PLUGINS_BASE_CFLAGS) \
> >>+ 	$(GST_BASE_CFLAGS) \
> >>+-	$(LIBDCE_CFLAGS) \
> >>+ 	$(GST_CFLAGS) \
> >>+ 	$(DRM_CFLAGS)
> >>+
> >>+@@ -17,7 +16,6 @@ libgstkmssink_la_LIBADD =3D \
> >>+ 	$(GST_PLUGINS_BASE_LIBS) \
> >>+ 	$(GST_BASE_LIBS) \
> >>+ 	$(GST_LIBS) \
> >>+-	$(LIBDCE_LIBS) \
> >>+ 	$(DRM_LIBS) \
> >>+ 	-lgstvideo-$(GST_API_VERSION) \
> >>+ 	$(top_builddir)/gst-libs/gst/drm/libgstdrm-$(GST_API_VERSION).la
> >>+diff --git a/sys/kms/gstkmssink.c b/sys/kms/gstkmssink.c index=20
> >>+17e6407..9795bdf 100644
> >>+--- a/sys/kms/gstkmssink.c
> >>++++ b/sys/kms/gstkmssink.c
> >>+@@ -31,7 +31,6 @@
> >>+ #include "gstkmssink.h"
> >>+ #include "gstkmsbufferpriv.h"
> >>+
> >>+-#include <libdce.h>
> >>+ #include <omap_drm.h>
> >>+ #include <omap_drmif.h>
> >>+ #include <xf86drmMode.h>
> >>+@@ -516,13 +515,18 @@ gst_kms_sink_start (GstBaseSink * bsink)
> >>+
> >>+   sink =3D GST_KMS_SINK (bsink);
> >>+
> >>+-  drm_dev =3D dce_init ();
> >>++  drm_fd =3D open("/dev/dri/card0", O_RDWR | O_CLOEXEC);  if(drm_fd=20
> >>++ =3D=3D NULL)
> >>++    goto drm_failed;
> >>++  else {
> >>++    drm_dev =3D omap_device_new(drm_fd);  }
> >>++
> >>+   if (drm_dev =3D=3D NULL)
> >>+     goto device_failed;
> >>+   else {
> >>++    sink->fd =3D drm_fd;
> >>+     sink->dev =3D drm_dev;
> >>+-    sink->fd =3D dce_get_fd ();
> >>+-    drm_fd =3D dce_get_fd ();
> >>+   }
> >>+
> >>+   sink->resources =3D drmModeGetResources (sink->fd); @@ -539,6=20
> >>++543,11 @@ fail:
> >>+   gst_kms_sink_reset (sink);
> >>+   return FALSE;
> >>+
> >>++drm_failed:
> >>++  GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
> >>++      (NULL), ("drmOpen failed"));
> >>++  goto fail;
> >>++
> >>+ device_failed:
> >>+   GST_ELEMENT_ERROR (sink, RESOURCE, FAILED,
> >>+       (NULL), ("omap_device_new failed"));
> >>+--
> >>+1.9.1
> >>+
> >>diff --git=20
> >>a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin
> >>s-bad_1.6.3.bbappend=20
> >>b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin
> >>s-bad_1.6.3.bbappend
> >>index b5ccebf..2c903d4 100644
> >>---=20
> >>a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin
> >>s-bad_1.6.3.bbappend
> >>+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl
> >>+++ ugins-bad_1.6.3.bbappend
> >>@@ -8,7 +8,6 @@ PACKAGECONFIG_append_ti43x =3D "=20
> >>${@bb.utils.contains('DISTRO_FEATURES','wayland',
> >> PACKAGECONFIG_append_ti33x =3D " ${@bb.utils.contains('DISTRO_FEATURES=
','wayland','wayland','',d)}"
> >>
> >> DEPENDS_append_omap-a15 =3D " \
> >>-    libdce \
> >>     libdrm \
> >> "
> >>
> >>@@ -18,10 +17,14 @@ DEPENDS_append_ti43x =3D " \
> >>
> >> DEPENDS_append_ti33x =3D " \
> >>     libdrm \
> >>+"
> >>+
> >>+SRC_URI_append_omap-a15 =3D " \
> >>+    file://0001-kmssink-remove-DCE-dependencies.patch \
> >> "
> >>
> >> SRC_URI_append_ti43x =3D " \
> >>-    file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
> >
> >This patch got dropped ^
> >If it was intentional, should mention that in the commit message.
> >
> >
>=20
> Yes, it was intentional, a similar patch was covered by the commit ID=20
> update. Do you want me to resubmit this patch?

Yes, please. Just a short one-liner should be good enough. Thanks.


> >>+    file://0001-kmssink-remove-DCE-dependencies.patch \
> >> "
> >>
> >> SRC_URI_append_ti33x =3D " \
> >>@@ -38,6 +41,7 @@ SRC_URI =3D=20
> >>"git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=3Dgit;br
> >>an
> >> S =3D "${WORKDIR}/git"
> >>
> >> SRCREV_omap-a15 =3D "eb41f1c8fde05f87587c83d157835e3b2d19a298"
> >>+SRCREV_ti43x =3D "eb41f1c8fde05f87587c83d157835e3b2d19a298"
> >> SRCREV =3D "d0160ca810be30bf2b2e7681f5047933402efb52"
> >>
> >> PR =3D "r25"
> >>--
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

