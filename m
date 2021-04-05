Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 0B5EF52BB4
	for <meta-arago@arago-project.org>;
	Mon,  5 Apr 2021 20:22:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135KMjk4130376;
	Mon, 5 Apr 2021 15:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617654165;
	bh=HuOaKfjFNWSlos8MzaGS3t32OLLfkYZifD0y8pwViGY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=KsbBrfIb2bVke0DUAQkyDVgiQi3GJQ+DYLdzlS4qt+6TVcOXIjqcmb/iL3bkLhBwI
	0Q95haG02KwP59LtLUUxry6yEY7uvOftrWIg/91bM8QtV2FHM9NeEKemgt+ebTGfXc
	UQiqB09lwqDME36oOgFvd2WpbffVg4+dJkUeIzmY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135KMjXG071851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 15:22:45 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 5 Apr 2021 15:22:45 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.2176.009; Mon, 5 Apr 2021 15:22:45 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [master][PATCH 09/29]
	gstreamer1.0-plugins-good: upgrade 1.16 -> 1.18
Thread-Index: AQHXKB3qXhX2ci5K9US7wLpMKkYuqqqmYoQg
Date: Mon, 5 Apr 2021 20:22:45 +0000
Message-ID: <09acf6a376b2458a9878f14d767ef8a5@ti.com>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
	<1617408644-2675-10-git-send-email-denis@denix.org>
In-Reply-To: <1617408644-2675-10-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [EXTERNAL] [master][PATCH 09/29] gstreamer1.0-plugins-good: upgrade 1.16 -> 1.18
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
X-List-Received-Date: Mon, 05 Apr 2021 20:22:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-
>project.org> On Behalf Of Denys Dmytriyenko
>Sent: Friday, April 02, 2021 7:10 PM
>To: meta-arago@arago-project.org
>Cc: Denys Dmytriyenko <denys@konsulko.com>
>Subject: [EXTERNAL] [meta-arago] [master][PATCH 09/29] gstreamer1.0-
>plugins-good: upgrade 1.16 -> 1.18
>
>From: Denys Dmytriyenko <denys@konsulko.com>
>
>Drop previously backported patch.
>
>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Reviewed-by: Gowtham Tammana <g-tammana@ti.com>

>---
> ...ix-build-on-EGL-platform-without-X11-head.patch | 36 -----------------
>-----
> ...d =3D> gstreamer1.0-plugins-good_1.18.%.bbappend} |  1 -
> 2 files changed, 37 deletions(-)
> delete mode 100644 meta-arago-extras/recipes-
>multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlglsink-fix-build-
>on-EGL-platform-without-X11-head.patch
> rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-
>plugins-good_1.16.%.bbappend =3D> gstreamer1.0-plugins-good_1.18.%.bbappen=
d}
>(84%)
>
>diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-
>head.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>plugins-good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-
>head.patch
>deleted file mode 100644
>index 79db0e2..0000000
>--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>good/0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch
>+++ /dev/null
>@@ -1,36 +0,0 @@
>-From 85229adbddcd8e7cacd5ebd9467c834352a882d0 Mon Sep 17 00:00:00 2001
>-From: Philipp Zabel <p.zabel@pengutronix.de>
>-Date: Tue, 3 Dec 2019 11:36:07 +0100
>-Subject: [PATCH] qmlglsink: fix build on EGL platform without X11 headers
>-
>-If Mesa is built without X11 headers, building against Mesa EGL headers
>-requires a dependency on egl.pc, to define MESA_EGL_NO_X11_HEADERS.
>-This fixes a build error when compiling ext/qt/gstqtglutility.cc:
>-
>-  In file included from /usr/include/EGL/egl.h:39,
>-                   from /usr/include/gstreamer-
>1.0/gst/gl/egl/gstegl.h:44,
>-                   from ../gst-plugins-good-
>1.16.1/ext/qt/gstqtglutility.cc:43:
>-  /usr/include/EGL/eglplatform.h:124:10: fatal error: X11/Xlib.h: No such
>file or directory
>-
>-Upstream-Status: Backport [c47a585052fba6830a2cddd8caa18e2305596ed0]
>-
>-Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>----
>- ext/qt/meson.build | 2 ++
>- 1 file changed, 2 insertions(+)
>-
>-diff --git a/ext/qt/meson.build b/ext/qt/meson.build
>-index 5f040c844..43ddc6092 100644
>---- a/ext/qt/meson.build
>-+++ b/ext/qt/meson.build
>-@@ -89,6 +89,8 @@ if have_cxx and build_gstgl
>-     if gst_gl_have_platform_egl
>-       # Embedded linux (e.g. i.MX6) with or without windowing support
>-       qt_defines +=3D ['-DHAVE_QT_EGLFS']
>-+      egl_dep =3D dependency('egl', required : false)
>-+      optional_deps +=3D egl_dep
>-       have_qt_windowing =3D true
>-       if have_qpa_include
>-         # Wayland windowing
>---
>-2.17.1
>diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>plugins-good_1.16.%.bbappend b/meta-arago-extras/recipes-
>multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.%.bbappend
>similarity index 84%
>rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>plugins-good_1.16.%.bbappend
>rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-
>plugins-good_1.18.%.bbappend
>index e2ddbc2..4864f4b 100644
>--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>good_1.16.%.bbappend
>+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>good_1.18.%.bbappend
>@@ -7,7 +7,6 @@ SRC_URI +=3D " \
>     file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
>     file://0001-v4l2object-Update-formats-table-to-include-YUV422-
>mu.patch \
>     file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch
>\
>-    file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-
>head.patch \
> "
>
> PR_append =3D ".arago3"
>--
>2.7.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

