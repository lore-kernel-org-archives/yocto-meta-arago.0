Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id CD9255298A
	for <meta-arago@arago-project.org>;
	Thu, 30 Mar 2017 20:55:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2UKtDAr010078
	for <meta-arago@arago-project.org>; Thu, 30 Mar 2017 15:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490907313;
	bh=CGNha7xNBfGn9Sl4DJx9uB5xzH5q0mzZnf+rpyzmlnY=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=FXEkoYkZZ64YR9t6zqidWc8jJoNjrum1L/u3QjBojEOUdi/ZNaR8d8twBnzkaJNdu
	O1QXj8jOyBNzhRSrst+4Ft5pEShfdWL+LgWGNLP4RF42l4EM+3Pgj9YkVhE5eLFggu
	VCoyB3rsdeNZ+neTFwbcrKNg3EIZOe95BTDkw/9s=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2UKt8fd010446
	for <meta-arago@arago-project.org>; Thu, 30 Mar 2017 15:55:08 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Thu, 30 Mar 2017 15:55:08 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Prajod, Pooja" <poojaprajod@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [morty] Update gst-bad for bug fix and bump PR
Thread-Index: AQHSpvxOZp7pdjrFnU6AzknDCBF0qKGt4Qbw
Date: Thu, 30 Mar 2017 20:55:07 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A2535CE64@DFLE09.ent.ti.com>
References: <1490620558-142842-1-git-send-email-a0132412@ti.com>
In-Reply-To: <1490620558-142842-1-git-send-email-a0132412@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [morty] Update gst-bad for bug fix and bump PR
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
X-List-Received-Date: Thu, 30 Mar 2017 20:55:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Pooja:

This patch is applicable to both AM3 and AM4 and should be upstreamed as we=
ll.
I am not sure whether the exact patch can be applied to AM3, but, the same =
functional changes are required.

Best regards,

Eric

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Prajod, Pooja
Sent: Monday, March 27, 2017 9:16 AM
To: meta-arago@arago-project.org
Cc: Prajod, Pooja
Subject: [meta-arago] [morty] Update gst-bad for bug fix and bump PR

Pick the patch:-
   0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 ...ink-Implement-callbacks-for-version-5-of-.patch | 65 ++++++++++++++++++=
++++
 .../gstreamer1.0-plugins-bad_1.8.3.bbappend        |  3 +-
 2 files changed, 67 insertions(+), 1 deletion(-)  create mode 100644 meta-=
arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-gst=
waylandsink-Implement-callbacks-for-version-5-of-.patch

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad/0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch b=
/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/00=
05-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch
new file mode 100644
index 0000000..d2091db
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin
+++ s-bad/0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patc
+++ h
@@ -0,0 +1,65 @@
+From adfc38273882a102d25fc420adc82b3f225588f9 Mon Sep 17 00:00:00 2001
+From: Pooja Prajod <a0132412@ti.com>
+Date: Mon, 27 Mar 2017 18:27:06 +0530
+Subject: [gst-bad] gstwaylandsink: Implement callbacks for version 5 of =20
+wl_pointer
+
+Few extra callbacks are required for wl_pointer listener with the newer=20
+weston. Without the extra dummy callbacks the pipelines results in=20
+segfault.
+
+Signed-off-by: Pooja Prajod <a0132412@ti.com>
+---
+ ext/wayland/wldisplay.c | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/ext/wayland/wldisplay.c b/ext/wayland/wldisplay.c index=20
+2f58fd2..54acfdb 100644
+--- a/ext/wayland/wldisplay.c
++++ b/ext/wayland/wldisplay.c
+@@ -326,12 +326,25 @@ pointer_handle_axis (void *data, struct=20
+wl_pointer *pointer,  {  }
+=20
++static void pointer_frame(void *data, struct wl_pointer *wl_pointer) {=20
++} static void pointer_axis_source(void *data, struct wl_pointer=20
++*wl_pointer, uint32_t axis_source) { } void pointer_axis_stop(void=20
++*data, struct wl_pointer *wl_pointer, uint32_t time, uint32_t axis) {=20
++}
++
+ static const struct wl_pointer_listener pointer_listener =3D {
+   pointer_handle_enter,
+   pointer_handle_leave,
+   pointer_handle_motion,
+   pointer_handle_button,
+   pointer_handle_axis,
++  pointer_frame,
++  pointer_axis_source,
++  pointer_axis_stop
+ };
+=20
+ static void
+@@ -508,8 +521,15 @@ registry_handle_global (void *data, struct wl_registr=
y *registry,
+   }
+ }
+=20
++static void
++registry_handle_global_remove(void *data, struct wl_registry *registry,
++                uint32_t name)
++{
++}
++
+ static const struct wl_registry_listener registry_listener =3D {
+-  registry_handle_global
++  registry_handle_global,
++  registry_handle_global_remove
+ };
+=20
+ static gpointer
+--
+1.9.1
+
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-bad_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/g=
streamer1.0-plugins-bad_1.8.3.bbappend
index 5e099d5..3b61d2f 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-b=
ad_1.8.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugin
+++ s-bad_1.8.3.bbappend
@@ -33,8 +33,9 @@ SRC_URI_append_omap-a15 =3D " \
     file://0002-parsers-Pick-previos-bug-fixes-on-different-parsers.patch =
\
     file://0003-gstkmssink-Add-support-for-KMS-based-sink.patch \
     file://0004-gstwaylandsink-Add-DRM-support-on-waylandsink.patch \
+   =20
+ file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch=20
+ \
 "
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-PR =3D "r3"
+PR =3D "r4"
--
1.9.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

