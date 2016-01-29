Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by arago-project.org (Postfix) with ESMTPS id E60C65296D
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 20:30:44 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id e6so48352734vkh.2
	for <meta-arago@arago-project.org>;
	Fri, 29 Jan 2016 12:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=jglBTLLjEeumTptd+19jzHZ0Clz3aOScZQeP0+nd56I=;
	b=b7vwUTLIyl/vTAO4KqR4sqVLl0Auv7QMRj9TPZIkCf3fJ+z+CaMXwzU2HA6j4iB9yU
	baJdaS/omofoETcXeUMMX/Y1FeANDi+LZ45Jo294hcW2a+MigPaV4l66WQtEoFH6Ujoa
	n40zpTX04DzTzOyj6tu8ChJRkbUlhEB1Fa1phWtVz3y86Bd6hxXkXxwCljbRudhvEiJV
	Gug6D4JcxXRxluXOLTNG9j1/2nztncFlsC0UYAnZmweXy2gnx0eIInmF1tgnNQG6gfGR
	VVf0V8epJ1t10S9DfkIUkpQpbIKPxb8lx1niXH1nOZZBcUiDxN8pKJ1lvllvgcTmq5OQ
	UOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=jglBTLLjEeumTptd+19jzHZ0Clz3aOScZQeP0+nd56I=;
	b=ipRz+jTzJz4s5yHIp//tUvXEA0vd3wM93ZxtgNpX4lcWFo0uasZqxPAC5oTSsTvpZv
	ZKYt6AUvqjlvk3YOZC3bzuQEGAPfMRAylfS3LdiokAmJCzBdiy6Q0AjZEx8N0wXio3qE
	MqkESQXwmSCE4TUUkvmIQ3R70ZqYz6vyXbjvI/RwPQA4B7XvVc7xqyBqqT4fbDw3H1LT
	iisqYkBEfhN4AGHnjmcTRSVP2thUGbupOpPXIZb2b12SnsTwyGXBWGmNg/iIVLNtdJhW
	A/UjfPxJNbB80BeLO9bvWOX8olsA1E5CH0GfQAEsTObGINvkrBj+9bqLmbviFivLmKGK
	ax6Q==
X-Gm-Message-State: AG10YOQuWzaxNKXWL9JLk3SjOPiOYo43Lm4lvQvW6K2gnzQ2tM2twLqJrf/ikyq282/+QmWraZuGCPVskJzsWQ==
X-Received: by 10.31.48.132 with SMTP id w126mr7621773vkw.5.1454099442012;
	Fri, 29 Jan 2016 12:30:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Fri, 29 Jan 2016 12:30:22 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 30 Jan 2016 09:30:22 +1300
Message-ID: <CADySD0G_Sy+0JasUQ=R7Du-iwwLH4OKZ4UBp7v4srHvzDPK50A@mail.gmail.com>
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
X-List-Received-Date: Fri, 29 Jan 2016 20:30:49 -0000
Content-Type: multipart/alternative; boundary=001a11430e0eb59660052a7ee8dc

--001a11430e0eb59660052a7ee8dc
Content-Type: text/plain; charset=UTF-8

This patch fixes the compilation error of bluetooth.h on fido branch

regards
Ankur

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 .../0001-strict-C-compilation-error-fix.patch      | 41
++++++++++++++++++++++
 .../bluez/bluez4_4.101.bbappend                    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644
meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch

diff --git
a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
new file mode 100644
index 0000000..c2cac24
--- /dev/null
+++
b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
@@ -0,0 +1,41 @@
+From d7fab1e161c2344875b1b0a2363f1f62efdd6cd4 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi@gallagher.com>
+Date: Thu, 14 Jan 2016 18:12:23 +1300
+Subject: [PATCH 1/1] strict C compilation error fix
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
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
+ #define bt_get_unaligned(ptr)            \
+-({                        \
++__extension__ ({                \
+    struct __attribute__((packed)) {    \
+-        typeof(*(ptr)) __v;        \
+-    } *__p = (typeof(__p)) (ptr);        \
++        __typeof__(*(ptr)) __v;        \
++    } *__p = (__typeof__(__p)) (ptr);    \
+    __p->__v;                \
+ })
+
+ #define bt_put_unaligned(val, ptr)        \
+ do {                        \
+    struct __attribute__((packed)) {    \
+-        typeof(*(ptr)) __v;        \
+-    } *__p = (typeof(__p)) (ptr);        \
++        __typeof__(*(ptr)) __v;        \
++    } *__p = (__typeof__(__p)) (ptr);    \
+    __p->__v = (val);            \
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

--001a11430e0eb59660052a7ee8dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch fixes the compilation error of bluetooth.h on f=
ido branch<br><br>regards<br>Ankur<br><br>Signed-off-by: Ankur Tyagi &lt;<a=
 href=3D"mailto:ankur.tyagi@gallagher.com">ankur.tyagi@gallagher.com</a>&gt=
;<br>---<br>=C2=A0.../0001-strict-C-compilation-error-fix.patch =C2=A0 =C2=
=A0 =C2=A0| 41 ++++++++++++++++++++++<br>=C2=A0.../bluez/bluez4_4.101.bbapp=
end =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A01 +<br>=C2=A02 files changed, 42 insertions(+)<br>=C2=A0create mode 1=
00644 meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-com=
pilation-error-fix.patch<br><br>diff --git a/meta-arago-distro/recipes-conn=
ectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch b/meta-arag=
o-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-=
fix.patch<br>new file mode 100644<br>index 0000000..c2cac24<br>--- /dev/nul=
l<br>+++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-=
C-compilation-error-fix.patch<br>@@ -0,0 +1,41 @@<br>+From d7fab1e161c23448=
75b1b0a2363f1f62efdd6cd4 Mon Sep 17 00:00:00 2001<br>+From: Ankur Tyagi &lt=
;<a href=3D"mailto:ankur.tyagi@gallagher.com">ankur.tyagi@gallagher.com</a>=
&gt;<br>+Date: Thu, 14 Jan 2016 18:12:23 +1300<br>+Subject: [PATCH 1/1] str=
ict C compilation error fix<br>+<br>+Signed-off-by: Ankur Tyagi &lt;<a href=
=3D"mailto:ankur.tyagi@gallagher.com">ankur.tyagi@gallagher.com</a>&gt;<br>=
+---<br>+ lib/bluetooth.h | 10 +++++-----<br>+ 1 file changed, 5 insertions=
(+), 5 deletions(-)<br>+<br>+diff --git a/lib/bluetooth.h b/lib/bluetooth.h=
<br>+index 0fc4508..449431d 100644<br>+--- a/lib/bluetooth.h<br>++++ b/lib/=
bluetooth.h<br>+@@ -138,18 +138,18 @@ enum {<br>+<br>+ /* Bluetooth unalign=
ed access */<br>+ #define bt_get_unaligned(ptr) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0\<br>+-({ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>++__extension__ ({ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0struct __attribut=
e__((packed)) { =C2=A0 =C2=A0\<br>+- =C2=A0 =C2=A0 =C2=A0 =C2=A0typeof(*(pt=
r)) __v; =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+- =C2=A0 =C2=A0} *__p =3D (typeof=
(__p)) (ptr); =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>++ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0__typeof__(*(ptr)) __v; =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>++ =C2=A0 =C2=A0=
} *__p =3D (__typeof__(__p)) (ptr); =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0__p-&g=
t;__v; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ })<br>=
+<br>+ #define bt_put_unaligned(val, ptr) =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+=
 do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0struct __attribute__((packed)) { =C2=A0 =
=C2=A0\<br>+- =C2=A0 =C2=A0 =C2=A0 =C2=A0typeof(*(ptr)) __v; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>+- =C2=A0 =C2=A0} *__p =3D (typeof(__p)) (ptr); =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>++ =C2=A0 =C2=A0 =C2=A0 =C2=A0__typeof__(*(ptr)) _=
_v; =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>++ =C2=A0 =C2=A0} *__p =3D (__typeof__(=
__p)) (ptr); =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0__p-&gt;__v =3D (val); =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ } while(0)<br>+<br>+--<br>+1.9.1<=
br>+<br>diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.=
101.bbappend b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bb=
append<br>index d111425..acda4ee 100644<br>--- a/meta-arago-distro/recipes-=
connectivity/bluez/bluez4_4.101.bbappend<br>+++ b/meta-arago-distro/recipes=
-connectivity/bluez/bluez4_4.101.bbappend<br>@@ -5,6 +5,7 @@ FILESEXTRAPATH=
S_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>=C2=A0SRC_URI +=3D &quot;fi=
le://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-socket-enable-for-blu=
ez-4_98.patch \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0=
001-bluez-enable-source-interface.patch \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0file://0001-strict-C-compilation-error-fix.patch \<br>=C2=A0&q=
uot;<br>=C2=A0# udev 150-170 provide its on hid2hci tool and udev rules for=
 it. Therefore,<br>=C2=A0# disabling hid2hci from bluez4.<br>--<br></div>

--001a11430e0eb59660052a7ee8dc--
