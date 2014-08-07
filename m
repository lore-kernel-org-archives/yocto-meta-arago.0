Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A0B0152996
	for <meta-arago@arago-project.org>;
	Thu,  7 Aug 2014 12:50:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s77CoSjt017550;
	Thu, 7 Aug 2014 07:50:28 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77CoSYY005548;
	Thu, 7 Aug 2014 07:50:28 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 7 Aug 2014 07:50:28 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/4] qtbase: add additional dependencies
	for GLES check on omap-a15 platforms
Thread-Index: AQHPsclcIvk2+mQv4UKxMUjmGYPVk5vFGLqQ
Date: Thu, 7 Aug 2014 12:50:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D1AD00C@DLEE11.ent.ti.com>
References: <1407365627-29059-1-git-send-email-denis@denix.org>
	<1407365627-29059-2-git-send-email-denis@denix.org>
In-Reply-To: <1407365627-29059-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 07 Aug 2014 12:50:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, August 06, 2014 5:54 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 2/4] qtbase: add additional
>dependencies for GLES check on omap-a15 platforms
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>GLES libraries for omap-a15 platforms come in binary form and are
>pre-built
>against libdrm and libwayland libraries. When qtbase tries to do a
>check
>for GLES support, it fails to link the test app, when libdrm and
>libwayland
>are not yet available in sysroots:
>
>| OpenGL ES 2.x auto-detection... ()
>| ...-g++ ... -o opengles2.o .../qtbase-opensource-src-
>5.2.1/config.tests/unix/opengles2/opengles2.cpp
>| ...-g++ ... -o opengles2 opengles2.o -lsrv_um -lGLESv2
>| .../bin/ld: warning: libdrm.so.2, needed by
>.../usr/lib/libsrv_um.so, not found (try using -rpath or -rpath-
>link)
>| .../bin/ld: warning: libwayland-server.so.0, needed by
>.../usr/lib/libIMGegl.so, not found (try using -rpath or -rpath-
>link)
>| .../bin/ld: warning: libdrm_omap.so.1, needed by
>.../usr/lib/libIMGegl.so, not found (try using -rpath or -rpath-
>link)
>| ...
>| collect2: error: ld returned 1 exit status
>| Makefile:103: recipe for target 'opengles2' failed
>| make: *** [opengles2] Error 1
>| OpenGL ES 2.x disabled.
>| The OpenGL ES 2.0 functionality test failed!
>
>Add libdrm and wayland as extra dependencies for qtbase when
>building on
>omap-a15 with gles flag enabled.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend | 6 ++++++
> 1 file changed, 6 insertions(+)
> create mode 100644 meta-arago-distro/recipes-
>qt/qt5/qtbase_5.2.1.bbappend
>
>diff --git a/meta-arago-distro/recipes-
>qt/qt5/qtbase_5.2.1.bbappend b/meta-arago-distro/recipes-
>qt/qt5/qtbase_5.2.1.bbappend
>new file mode 100644
>index 0000000..c879313
>--- /dev/null
>+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.1.bbappend
>@@ -0,0 +1,6 @@
>+GLES_EXTRA_DEPS =3D ""
>+GLES_EXTRA_DEPS_omap-a15 =3D "libdrm wayland"
>+
>+PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2
>virtual/egl ${GLES_EXTRA_DEPS}"
>+
>+PR_append =3D "-arago0"
>--
>2.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

