Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by arago-project.org (Postfix) with ESMTPS id 431C7529E4
	for <meta-arago@arago-project.org>;
	Mon,  8 Feb 2016 22:26:23 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id e6so105315044vkh.2
	for <meta-arago@arago-project.org>;
	Mon, 08 Feb 2016 14:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Cbp4QQkodQXNV8UyoJpAp+XdYsgbCeYP+O09X4zxUZU=;
	b=bUn1rvwKAR/FPjvKcS5/mh7PXRjj5tmgWOAhNl6wokQOhpbPnDt9lRPpgTcpCISznp
	UMWqP/jOY8y+iMDop/F/8/WK1R5FtYBc50vZyuzbr+ZGthB0ArVVee23YA8QcPaZ64Nr
	jPscw3tiAUMjDnW5Qgce8bdm5AHhNZoGscItiQPEsNEFw76jnv8z/kwLGgClmYvN+3HH
	x7seEybmdRNKp7v56B3dUcSBjJ3t4qHSVhZZwpzBvDVfik2QjSbnAhQ7+i1ZTab65oyT
	YYihmVempuWWFVkKAcCeRYZ+p2WGuKfosyY+yoq+yh7xSVkveeuRyU2MTrISbL2ud8jJ
	uv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=Cbp4QQkodQXNV8UyoJpAp+XdYsgbCeYP+O09X4zxUZU=;
	b=AVPGQ12IH5MhOkLX7Iwref6fTEr3ULDygIOKf5jxlwqsAIScDIG6/tWrPqIvcytObU
	s63CbbarWjG1OGVwbUzkPVgcFNThRypCY6R8L9aOpEPes3GgJhnuKLjopYPi99L/gJVt
	pEJXcXPBTOKfZ8vGR7n+xXKYX/wK11gkJBV9Yst/Rt7yCWqV1Wkmx03GgtQ839YMx6jr
	DR9dlXvRWVJ549gkXAiSLnYAaHLCkkK8G2j+w5pAMvjRPN/ugItjp944Ayz+kQAzA1Z9
	KfQlmQSUFQUQ5Xh6/ia5Y8Kuab3P82DxW5S2oWWQUljwt/7/kpdrLD1KyMh4cV/CYEb1
	69ng==
X-Gm-Message-State: AG10YOTMlFo8xTHTDzqhDMOonKYn2c0y0MRed0cz4ukfWghWldmHyQahkuTBimGyv51FlII1UNWa+6/LuHQwqA==
X-Received: by 10.31.151.75 with SMTP id z72mr21059258vkd.104.1454970382390;
	Mon, 08 Feb 2016 14:26:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Mon, 8 Feb 2016 14:26:03 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 9 Feb 2016 11:26:03 +1300
Message-ID: <CADySD0FSMLuSdS9md45bLrvmxKCkKGEqUkbOVghVH8Ds_tOtGA@mail.gmail.com>
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
X-List-Received-Date: Mon, 08 Feb 2016 22:26:25 -0000
Content-Type: multipart/alternative; boundary=001a1140f582cd1a3d052b49b0c6

--001a1140f582cd1a3d052b49b0c6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch fixes the compilation error of bluetooth.h on fido branch

regards
Ankur

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
=E2=80=8BUpstream-Status: Backported=E2=80=8B

---
 .../0001-strict-C-compilation-error-fix.patch      | 41
++++++++++++++++++++++
 .../bluez/bluez4_4.101.bbappend                    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644
meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilati=
on-error-fix.patch

diff --git
a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compila=
tion-error-fix.patch
b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compila=
tion-error-fix.patch
new file mode 100644
index 0000000..c2cac24
--- /dev/null
+++
b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compila=
tion-error-fix.patch
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
+-    } *__p =3D (typeof(__p)) (ptr);        \
++        __typeof__(*(ptr)) __v;        \
++    } *__p =3D (__typeof__(__p)) (ptr);    \
+    __p->__v;                \
+ })
+
+ #define bt_put_unaligned(val, ptr)        \
+ do {                        \
+    struct __attribute__((packed)) {    \
+-        typeof(*(ptr)) __v;        \
+-    } *__p =3D (typeof(__p)) (ptr);        \
++        __typeof__(*(ptr)) __v;        \
++    } *__p =3D (__typeof__(__p)) (ptr);    \
+    __p->__v =3D (val);            \
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
@@ -5,6 +5,7 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
 SRC_URI +=3D
"file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
             file://0001-socket-enable-for-bluez-4_98.patch \
             file://0001-bluez-enable-source-interface.patch \
+            file://0001-strict-C-compilation-error-fix.patch \
 "
 # udev 150-170 provide its on hid2hci tool and udev rules for it.
Therefore,
 # disabling hid2hci from bluez4.
--

--001a1140f582cd1a3d052b49b0c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)"><span style=3D"font-family:aria=
l,sans-serif;color:rgb(34,34,34)">This patch fixes the compilation error of=
 bluetooth.h on fido branch</span><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr"><br>regards<br>Ankur<br><br>Signed-off-by: Ankur Tyagi &lt;<a =
href=3D"mailto:ankur.tyagi@gallagher.com" target=3D"_blank">ankur.tyagi@gal=
lagher.com</a>&gt;</div><div dir=3D"ltr"><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)">=E2=80=
=8B<span style=3D"font-size:12.8px;font-family:arial,sans-serif;color:rgb(3=
4,34,34)">Upstream-Status: Backported</span>=E2=80=8B</div><br>---<br>=C2=
=A0.../0001-strict-C-compilation-error-fix.patch =C2=A0 =C2=A0 =C2=A0| 41 +=
+++++++++++++++++++++<br>=C2=A0.../bluez/bluez4_4.101.bbappend =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>=
=C2=A02 files changed, 42 insertions(+)<br>=C2=A0create mode 100644 meta-ar=
ago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-erro=
r-fix.patch<br><br>diff --git a/meta-arago-distro/recipes-connectivity/blue=
z/bluez4/0001-strict-C-compilation-error-fix.patch b/meta-arago-distro/reci=
pes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch<br>=
new file mode 100644<br>index 0000000..c2cac24<br>--- /dev/null<br>+++ b/me=
ta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation=
-error-fix.patch<br>@@ -0,0 +1,41 @@<br>+From d7fab1e161c2344875b1b0a2363f1=
f62efdd6cd4 Mon Sep 17 00:00:00 2001<br>+From: Ankur Tyagi &lt;<a href=3D"m=
ailto:ankur.tyagi@gallagher.com" target=3D"_blank">ankur.tyagi@gallagher.co=
m</a>&gt;<br>+Date: Thu, 14 Jan 2016 18:12:23 +1300<br>+Subject: [PATCH 1/1=
] strict C compilation error fix<br>+<br>+Signed-off-by: Ankur Tyagi &lt;<a=
 href=3D"mailto:ankur.tyagi@gallagher.com" target=3D"_blank">ankur.tyagi@ga=
llagher.com</a>&gt;<br>+---<br>+ lib/bluetooth.h | 10 +++++-----<br>+ 1 fil=
e changed, 5 insertions(+), 5 deletions(-)<br>+<br>+diff --git a/lib/blueto=
oth.h b/lib/bluetooth.h<br>+index 0fc4508..449431d 100644<br>+--- a/lib/blu=
etooth.h<br>++++ b/lib/bluetooth.h<br>+@@ -138,18 +138,18 @@ enum {<br>+<br=
>+ /* Bluetooth unaligned access */<br>+ #define bt_get_unaligned(ptr) =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+-({ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>++__extension_=
_ ({ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ =C2=A0 =
=C2=A0struct __attribute__((packed)) { =C2=A0 =C2=A0\<br>+- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0typeof(*(ptr)) __v; =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+- =C2=A0 =
=C2=A0} *__p =3D (typeof(__p)) (ptr); =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>++ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0__typeof__(*(ptr)) __v; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>++ =C2=A0 =C2=A0} *__p =3D (__typeof__(__p)) (ptr); =C2=A0 =C2=A0\<=
br>+ =C2=A0 =C2=A0__p-&gt;__v; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>+ })<br>+<br>+ #define bt_put_unaligned(val, ptr) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>+ do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0struct __attri=
bute__((packed)) { =C2=A0 =C2=A0\<br>+- =C2=A0 =C2=A0 =C2=A0 =C2=A0typeof(*=
(ptr)) __v; =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+- =C2=A0 =C2=A0} *__p =3D (typ=
eof(__p)) (ptr); =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>++ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__typeof__(*(ptr)) __v; =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>++ =C2=A0 =C2=
=A0} *__p =3D (__typeof__(__p)) (ptr); =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0__p=
-&gt;__v =3D (val); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ } while=
(0)<br>+<br>+--<br>+1.9.1<br>+<br>diff --git a/meta-arago-distro/recipes-co=
nnectivity/bluez/bluez4_4.101.bbappend b/meta-arago-distro/recipes-connecti=
vity/bluez/bluez4_4.101.bbappend<br>index d111425..acda4ee 100644<br>--- a/=
meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend<br>+++ b=
/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend<br>@@ -=
5,6 +5,7 @@ FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>=
=C2=A0SRC_URI +=3D &quot;file://bluez4-fix-synchronization-between-bluetoot=
hd-and-dr.patch \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:/=
/0001-socket-enable-for-bluez-4_98.patch \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0file://0001-bluez-enable-source-interface.patch \<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-strict-C-compilation-e=
rror-fix.patch \<br>=C2=A0&quot;<br>=C2=A0# udev 150-170 provide its on hid=
2hci tool and udev rules for it. Therefore,<br>=C2=A0# disabling hid2hci fr=
om bluez4.<br>--<br></div>
</div><br></div>

--001a1140f582cd1a3d052b49b0c6--
