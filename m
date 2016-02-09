Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by arago-project.org (Postfix) with ESMTPS id A9E5A52A86
	for <meta-arago@arago-project.org>;
	Tue,  9 Feb 2016 01:06:48 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id e185so107476599vkb.1
	for <meta-arago@arago-project.org>;
	Mon, 08 Feb 2016 17:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=G30Idxt3cFGAfnftlZoEkexmUk4We08rPz7J6cv1GGE=;
	b=Kz5Gc+9ymTA07vqgRSAIWtDx1lXKmuq4BZ9YJVNJaD/Iwr8iL7+5bOeiwvyzLJc55r
	Gt/oy8aUou3BXuq1Wfait6nUi2AznQXWR2vtLevOA3CS6e7IUDyfbiJRy5HS5QWXV/Zk
	uf/v1CZKvH0Y01Jw1+ddcW95XmCgF8V+hksFjyA5/dTrlqZzuNhbA/YIgn0HeeIzsg65
	GpTKoXZl9zMFEwlyy4IkcxhVUseA9752CiFLbgqOId2a0EWT9v+VGDh/8U4GA/7Iuw0m
	BmCRS+wNy8bTI+z80w0VPR+H2n8odlEMdv0YmROF67RyHCerzLsmeyzqpCLPNKUnvX9c
	b7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=G30Idxt3cFGAfnftlZoEkexmUk4We08rPz7J6cv1GGE=;
	b=fPrP7ZvchZTw3AxZA4GEJqt77K8PDfYlOtvykHrQnGqVGVjrdCK6HVy1C0MO/sHxPz
	CS4L7V6VHMZ0swxLZVDYUuwRvJs9EVBQUy3Lget6wiMFJuJEwfOXCi492+I+TZkyRvZj
	U/a0jYi7ERPFSVTQlGUJ+SiwvoWJZGIPFlQEgpb/UaCDnfCN8ONeGakFWteSOX3Vg2Xn
	i22trxSzIIvx+K6zBuWlFeYv1fByxHDEIiNDAOadAdi/64tneoDNd2yPgNAyA3N6fKjJ
	1bmmHxldnBXcysb8soxsH4r5fC8HTpdXJQZxfe1Yz2Ecu/GlewBk0jKKcMbqBlMKwyKW
	GMgQ==
X-Gm-Message-State: AG10YOTHMJykV1WG/ux3/LSDlGEh3yMozPFPHXBjtnEgOx50htu8iLgtqKoGNDVKCTbEVc8c1PGGReyKNBiZyQ==
X-Received: by 10.31.168.135 with SMTP id r129mr23235782vke.7.1454980008037;
	Mon, 08 Feb 2016 17:06:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Mon, 8 Feb 2016 17:06:28 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 9 Feb 2016 14:06:28 +1300
Message-ID: <CADySD0Gb+_xd3tWTY5SM36VTTmc4NPsbhwcVOqG0HPZwDTu-kQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: [PATCH] Fix bluetooth.h compilation error with strict C
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
X-List-Received-Date: Tue, 09 Feb 2016 01:06:48 -0000
Content-Type: multipart/alternative; boundary=001a11414f9488d681052b4bee4f

--001a11414f9488d681052b4bee4f
Content-Type: text/plain; charset=UTF-8

Please discard the previous patch.

This patch fixes the compilation error of bluetooth.h on fido branch

regards
Ankur

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 .../0001-strict-C-compilation-error-fix.patch      | 42
++++++++++++++++++++++
 .../bluez/bluez4_4.101.bbappend                    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644
meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch

diff --git
a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
new file mode 100644
index 0000000..e8109a0
--- /dev/null
+++
b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
@@ -0,0 +1,42 @@
+From d7fab1e161c2344875b1b0a2363f1f62efdd6cd4 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi@gallagher.com>
+Date: Thu, 14 Jan 2016 18:12:23 +1300
+Subject: [PATCH 1/1] strict C compilation error fix
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
+Upstream-Status: Backported
+---
+ lib/bluetooth.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/bluetooth.h b/lib/bluetooth.h
+index 0fc4508..449431d 100644
+--- a/lib/bluetooth.h
++++ b/lib/bluetooth.h
+@@ -138,18 +138,18 @@ enum {
+
+ /* Bluetooth unaligned access */
+ #define bt_get_unaligned(ptr) \
+-({ \
++__extension__ ({ \
+ struct __attribute__((packed)) { \
+- typeof(*(ptr)) __v; \
+- } *__p = (typeof(__p)) (ptr); \
++ __typeof__(*(ptr)) __v; \
++ } *__p = (__typeof__(__p)) (ptr); \
+ __p->__v; \
+ })
+
+ #define bt_put_unaligned(val, ptr) \
+ do { \
+ struct __attribute__((packed)) { \
+- typeof(*(ptr)) __v; \
+- } *__p = (typeof(__p)) (ptr); \
++ __typeof__(*(ptr)) __v; \
++ } *__p = (__typeof__(__p)) (ptr); \
+ __p->__v = (val); \
+ } while(0)
+
+--
+1.9.1
+
diff --git
a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
index d111425..acda4ee 100644
--- a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
+++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
@@ -5,6 +5,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI +=
"file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
             file://0001-socket-enable-for-bluez-4_98.patch \
             file://0001-bluez-enable-source-interface.patch \
+            file://0001-strict-C-compilation-error-fix.patch \
 "
 # udev 150-170 provide its on hid2hci tool and udev rules for it.
Therefore,
 # disabling hid2hci from bluez4.
--

--001a11414f9488d681052b4bee4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please discard the previous patch.<div><div><div dir=3D"lt=
r"><br></div></div></div><div class=3D"gmail_quote"><div dir=3D"ltr"><span>=
<div style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153=
)"><span style=3D"font-family:arial,sans-serif;color:rgb(34,34,34)">This pa=
tch fixes the compilation error of bluetooth.h on fido branch</span><br></d=
iv></span><div class=3D"gmail_quote"><span><div dir=3D"ltr"><br>regards<br>=
Ankur<br><br>Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi@g=
allagher.com">ankur.tyagi@gallagher.com</a>&gt;<br>---<br>=C2=A0.../0001-st=
rict-C-compilation-error-fix.patch =C2=A0 =C2=A0 =C2=A0| 42 +++++++++++++++=
+++++++<br>=C2=A0.../bluez/bluez4_4.101.bbappend =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>=C2=A02 files c=
hanged, 43 insertions(+)<br>=C2=A0create mode 100644 meta-arago-distro/reci=
pes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch<br>=
<br>diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-s=
trict-C-compilation-error-fix.patch b/meta-arago-distro/recipes-connectivit=
y/bluez/bluez4/0001-strict-C-compilation-error-fix.patch<br>new file mode 1=
00644<br>index 0000000..e8109a0<br>--- /dev/null<br>+++ b/meta-arago-distro=
/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patc=
h<br>@@ -0,0 +1,42 @@<br>+From d7fab1e161c2344875b1b0a2363f1f62efdd6cd4 Mon=
 Sep 17 00:00:00 2001<br>+From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tya=
gi@gallagher.com">ankur.tyagi@gallagher.com</a>&gt;<br>+Date: Thu, 14 Jan 2=
016 18:12:23 +1300<br>+Subject: [PATCH 1/1] strict C compilation error fix<=
br>+<br>+Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi@galla=
gher.com">ankur.tyagi@gallagher.com</a>&gt;<br>+Upstream-Status: Backported=
<br>+---<br>+ lib/bluetooth.h | 10 +++++-----<br>+ 1 file changed, 5 insert=
ions(+), 5 deletions(-)<br>+<br>+diff --git a/lib/bluetooth.h b/lib/bluetoo=
th.h<br>+index 0fc4508..449431d 100644<br>+--- a/lib/bluetooth.h<br>++++ b/=
lib/bluetooth.h<br>+@@ -138,18 +138,18 @@ enum {<br>+<br>+ /* Bluetooth una=
ligned access */<br>+ #define bt_get_unaligned(ptr) \<br>+-({ \<br>++__exte=
nsion__ ({ \<br>+ struct __attribute__((packed)) { \<br>+- typeof(*(ptr)) _=
_v; \<br>+- } *__p =3D (typeof(__p)) (ptr); \<br>++ __typeof__(*(ptr)) __v;=
 \<br>++ } *__p =3D (__typeof__(__p)) (ptr); \<br>+ __p-&gt;__v; \<br>+ })<=
br>+<br>+ #define bt_put_unaligned(val, ptr) \<br>+ do { \<br>+ struct __at=
tribute__((packed)) { \<br>+- typeof(*(ptr)) __v; \<br>+- } *__p =3D (typeo=
f(__p)) (ptr); \<br>++ __typeof__(*(ptr)) __v; \<br>++ } *__p =3D (__typeof=
__(__p)) (ptr); \<br>+ __p-&gt;__v =3D (val); \<br>+ } while(0)<br>+<br>+--=
<br>+1.9.1<br>+<br>diff --git a/meta-arago-distro/recipes-connectivity/blue=
z/bluez4_4.101.bbappend b/meta-arago-distro/recipes-connectivity/bluez/blue=
z4_4.101.bbappend<br>index d111425..acda4ee 100644<br>--- a/meta-arago-dist=
ro/recipes-connectivity/bluez/bluez4_4.101.bbappend<br>+++ b/meta-arago-dis=
tro/recipes-connectivity/bluez/bluez4_4.101.bbappend<br>@@ -5,6 +5,7 @@ FIL=
ESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>=C2=A0SRC_URI +=
=3D &quot;file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch=
 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-socket-en=
able-for-bluez-4_98.patch \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://0001-bluez-enable-source-interface.patch \<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-strict-C-compilation-error-fix.patch=
 \<br>=C2=A0&quot;<br>=C2=A0# udev 150-170 provide its on hid2hci tool and =
udev rules for it. Therefore,<br>=C2=A0# disabling hid2hci from bluez4.<br>=
-- <br></div></span>
</div><br></div>
</div><br></div>

--001a11414f9488d681052b4bee4f--
