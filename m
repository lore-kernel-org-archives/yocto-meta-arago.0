Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by arago-project.org (Postfix) with ESMTPS id DA03B529E5
	for <meta-arago@arago-project.org>;
	Sat, 11 Aug 2018 09:50:37 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id b16-v6so19815876oic.9
	for <meta-arago@arago-project.org>;
	Sat, 11 Aug 2018 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=n2zdoEi9korguY8Wse8Oy209tS6MySrcZTOUQJGOT9U=;
	b=ts2Kp+rTKMB7Um/uR+ucDGuzVzzrU1PIC0h4nW0D/FpmVXCEgjy6KmL+eIJ9M4GNFz
	JvYbaWIyNR6spSDCUZxKGOoYM1y6wchF+nPOXwjY9TRUoP05IhsLidOj0sCQuzmqKaDv
	r6Ak+COYqBUkDQPzl3m0iJzotsWw6W/smr9oO0/q/u9/SDukh3O+18jt96ASma1+wNCo
	Xi0Xs331LDFdQsYVuBEntNfdq4NSndjYatn1LTld3YtFFhhw6S6YbCzOufjU2lHNm9eM
	j4pZqGxas+hnPoly2kiBVC3FAfkTEUbhCcYHUb5ch7khE3NUrBcBq88HE2GxymJC7LsP
	rbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=n2zdoEi9korguY8Wse8Oy209tS6MySrcZTOUQJGOT9U=;
	b=qZeDvUn2apR+SOh21MAyuY1BSSguUCLAgX4xpPLvIuUIC7qXr2POAuPxTXLipfSE6b
	+yKvzd9SfV1LidP0SO4S6CqfLS7pBPBgY+Et4KbhVBooZBiV0IMhVP3IwzzRAzs3YOio
	MMX0Q+e+wrQ1i01cD0dkztiDKQ5i/Svzc8N/c8/qlWoPYXowzWDC4dmRdjVNlUhF0im8
	YAxSN176RWLE6bvC0ZvYbi1dBFAYZIekZQIaN9ASEwkV24GRlygmqEVZx9b35w4SgNWC
	FYEevUC8QOCqYVW1nfVsj7arhqPlUQLjhDezs8w/QpoKuM8760/9bYZUdJezB4ZXqWBR
	hnBw==
X-Gm-Message-State: AOUpUlHSicf9EJuDKAkTA8ZnnnfYvcqTcJhVNQu2vrblMPe4wWmYOCe8
	ptbns+Uy44OfEULo9jf6Ez1KSS/UXpFbk4hxvcGeAENc
X-Google-Smtp-Source: AA+uWPzWy26WJ4eSGFJpFLYYYrVW+J8Fq1kE8rPhMqERTiOsD2RkykdWWa4yXZl8Bl37q5whxA4Biuc9EVbaufITFjE=
X-Received: by 2002:aca:171a:: with SMTP id
	j26-v6mr10587204oii.277.1533981030237; 
	Sat, 11 Aug 2018 02:50:30 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 11 Aug 2018 21:50:19 +1200
Message-ID: <CADySD0FbL=3BH03yL_gXH3pqe+R+3ni_BoKT7-6y8mfuoHUZkw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Error when upgrading gcc version for daisy branch
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
X-List-Received-Date: Sat, 11 Aug 2018 09:50:38 -0000
Content-Type: multipart/alternative; boundary="000000000000664d17057325cab3"

--000000000000664d17057325cab3
Content-Type: text/plain; charset="UTF-8"

Hi,

Our product is based upon meta-arago daisy branch which uses gcc-4.7.
I am trying to upgrade gcc to v5.3 (
gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf
<https://releases.linaro.org/components/toolchain/binaries/5.3-2016.05/arm-linux-gnueabihf/gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz.asc>
)

My system is Ubuntu-16.04 64bit and when I issue bitbake command, I get
following error

ERROR: Execution of event handler
'external_linaro_toolchain_version_handler' failed
Traceback (most recent call last):
  File "external_linaro_toolchain_version_handler(e)", line 8, in
external_linaro_toolchain_version_handler(e=<bb.event.ConfigParsed object
at 0x7fcb39c7bc90>)
  File "external-linaro-toolchain-versions.inc", line 4, in
elt_get_main_version(d=<bb.data_smart.DataSmart object at 0x7fcb3a130610>)
IndexError: list index out of range

ERROR: Error parsing configuration files
Traceback (most recent call last):
  File "/home/ankur/arago/daisy/sources/bitbake/lib/bb/event.py", line 163,
in fire(event=<bb.event.ConfigParsed object at 0x7fcb39c7bc90>,
d=<bb.data_smart.DataSmart object at 0x7fcb3a418dd0>):

    >    fire_class_handlers(event, d)
         if worker_fire:
  File "/home/ankur/arago/daisy/sources/bitbake/lib/bb/event.py", line 102,
in fire_class_handlers(event=<bb.event.ConfigParsed object at
0x7fcb39c7bc90>, d=<bb.data_smart.DataSmart object at 0x7fcb3a418dd0>):
                         continue
    >            execute_handler(name, handler, event, d)

  File "/home/ankur/arago/daisy/sources/bitbake/lib/bb/event.py", line 76,
in execute_handler(name='external_linaro_toolchain_version_handler',
handler=<function external_linaro_toolchain_version_handler at
0x7fcb39de12a8>, event=<bb.event.ConfigParsed object at 0x7fcb39c7bc90>,
d=<bb.data_smart.DataSmart object at 0x7fcb3a418dd0>):
         try:
    >        ret = handler(event)
         except (bb.parse.SkipRecipe, bb.BBHandledException):
  File "external_linaro_toolchain_version_handler(e)", line 8, in
external_linaro_toolchain_version_handler(e=<bb.event.ConfigParsed object
at 0x7fcb39c7bc90>)
  File "external-linaro-toolchain-versions.inc", line 4, in
elt_get_main_version(d=<bb.data_smart.DataSmart object at 0x7fcb3a130610>)
IndexError: list index out of range

I have also updated arago-prefs.inc and toolchain-linaro.inc:

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc
b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 8947c7f..fd3bd01 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,9 +1,9 @@
 # Set *target* toolchain preferences at global distro level.
 # Cross and SDK toolchain preferences are set in toolchain-*.inc files
-GCCVERSION ?= "linaro-4.7%"
-BINUVERSION ?= "linaro-2.24%"
-EGLIBCVERSION ?= "2.19%"
-EGLIBCINITVERSION ?= "2.19%"
+GCCVERSION ?= "linaro-5.3%"
+BINUVERSION ?= "linaro-2.25%"
+EGLIBCVERSION ?= "2.23%"
+EGLIBCINITVERSION ?= "2.23%"
 LINUXLIBCVERSION ?= "3.14"

 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
@@ -99,7 +99,7 @@ PREFERRED_VERSION_readline = "5.2"
 PREFERRED_VERSION_readline-native = "5.2"
 PREFERRED_VERSION_readline-nativesdk = "5.2"

-PREFERRED_VERSION_libnl = "3.2.24"
+PREFERRED_VERSION_libnl = "3.2.25"
 PREFERRED_VERSION_crda = "1.1.3"
 PREFERRED_VERSION_obex = "0.34"
 PREFERRED_VERSION_bash = "3.2.48"
diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index cd2d3ce..19de40e 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -28,9 +28,9 @@
PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =
"gdb-cross-can
 PREFERRED_PROVIDER_libgcc = "external-linaro-toolchain"
 PREFERRED_PROVIDER_gcc-runtime = "external-linaro-toolchain"

-SDKGCCVERSION ?= "4.7%"
-SDKBINUVERSION ?= "2.24%"
-SDKEGLIBCVERSION ?= "2.19%"
+SDKGCCVERSION ?= "linaro-5.3%"
+SDKBINUVERSION ?= "linaro-2.25%"
+SDKEGLIBCVERSION ?= "2.23%"
 SDKLINUXLIBCVERSION ?= "3.14%"

 PREFERRED_VERSION_gcc-crosssdk ?= "${SDKGCCVERSION}"

How can I resolve above issue ? Any help is appreciated.

Regards
Ankur

--000000000000664d17057325cab3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif">Our product is based upon meta=
-arago daisy branch which uses gcc-4.7.</div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,helvetica,sans-serif">I am trying to upgrade gcc =
to v5.3 (<a href=3D"https://releases.linaro.org/components/toolchain/binari=
es/5.3-2016.05/arm-linux-gnueabihf/gcc-linaro-5.3.1-2016.05-x86_64_arm-linu=
x-gnueabihf.tar.xz.asc" style=3D"font-size:13px;outline:none;font-family:ve=
rdana;text-decoration-line:none;color:rgb(68,68,68)">gcc-linaro-5.3.1-2016.=
05-x86_64_arm-linux-gnueabihf</a>)</div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif">My system is Ubunt=
u-16.04 64bit and when I issue bitbake command, I get following error</div>=
<div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-seri=
f"><br></div><div class=3D"gmail_default"><div class=3D"gmail_default"><fon=
t face=3D"arial, helvetica, sans-serif">ERROR: Execution of event handler &=
#39;external_linaro_toolchain_version_handler&#39; failed</font></div><div =
class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">Traceba=
ck (most recent call last):</font></div><div class=3D"gmail_default"><font =
face=3D"arial, helvetica, sans-serif">=C2=A0 File &quot;external_linaro_too=
lchain_version_handler(e)&quot;, line 8, in external_linaro_toolchain_versi=
on_handler(e=3D&lt;bb.event.ConfigParsed object at 0x7fcb39c7bc90&gt;)</fon=
t></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-s=
erif">=C2=A0 File &quot;external-linaro-toolchain-versions.inc&quot;, line =
4, in elt_get_main_version(d=3D&lt;bb.data_smart.DataSmart object at 0x7fcb=
3a130610&gt;)</font></div><div class=3D"gmail_default"><font face=3D"arial,=
 helvetica, sans-serif">IndexError: list index out of range</font></div><di=
v class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif"><br><=
/font></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, sa=
ns-serif">ERROR: Error parsing configuration files</font></div><div class=
=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">Traceback (m=
ost recent call last):</font></div><div class=3D"gmail_default"><font face=
=3D"arial, helvetica, sans-serif">=C2=A0 File &quot;/home/ankur/arago/daisy=
/sources/bitbake/lib/bb/event.py&quot;, line 163, in fire(event=3D&lt;bb.ev=
ent.ConfigParsed object at 0x7fcb39c7bc90&gt;, d=3D&lt;bb.data_smart.DataSm=
art object at 0x7fcb3a418dd0&gt;):</font></div><div class=3D"gmail_default"=
><font face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0</font></d=
iv><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif"=
>=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 fire_class_handlers(event, d)</font></div>=
<div class=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if worker_fire:</font></div><div class=3D=
"gmail_default"><font face=3D"arial, helvetica, sans-serif">=C2=A0 File &qu=
ot;/home/ankur/arago/daisy/sources/bitbake/lib/bb/event.py&quot;, line 102,=
 in fire_class_handlers(event=3D&lt;bb.event.ConfigParsed object at 0x7fcb3=
9c7bc90&gt;, d=3D&lt;bb.data_smart.DataSmart object at 0x7fcb3a418dd0&gt;):=
</font></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, s=
ans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0continue</font></div><div class=3D"gmail_default=
"><font face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 &gt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execute_handler(name, handler, event, d)</f=
ont></div><div class=3D"gmail_default"><font face=3D"arial, helvetica, sans=
-serif">=C2=A0 =C2=A0 =C2=A0</font></div><div class=3D"gmail_default"><font=
 face=3D"arial, helvetica, sans-serif">=C2=A0 File &quot;/home/ankur/arago/=
daisy/sources/bitbake/lib/bb/event.py&quot;, line 76, in execute_handler(na=
me=3D&#39;external_linaro_toolchain_version_handler&#39;, handler=3D&lt;fun=
ction external_linaro_toolchain_version_handler at 0x7fcb39de12a8&gt;, even=
t=3D&lt;bb.event.ConfigParsed object at 0x7fcb39c7bc90&gt;, d=3D&lt;bb.data=
_smart.DataSmart object at 0x7fcb3a418dd0&gt;):</font></div><div class=3D"g=
mail_default"><font face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0try:</font></div><div class=3D"gmail_default"><font face=
=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ret =3D handler(event)</font></div><div class=3D"gmail_default"><fon=
t face=3D"arial, helvetica, sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
xcept (bb.parse.SkipRecipe, bb.BBHandledException):</font></div><div class=
=3D"gmail_default"><font face=3D"arial, helvetica, sans-serif">=C2=A0 File =
&quot;external_linaro_toolchain_version_handler(e)&quot;, line 8, in extern=
al_linaro_toolchain_version_handler(e=3D&lt;bb.event.ConfigParsed object at=
 0x7fcb39c7bc90&gt;)</font></div><div class=3D"gmail_default"><font face=3D=
"arial, helvetica, sans-serif">=C2=A0 File &quot;external-linaro-toolchain-=
versions.inc&quot;, line 4, in elt_get_main_version(d=3D&lt;bb.data_smart.D=
ataSmart object at 0x7fcb3a130610&gt;)</font></div><div class=3D"gmail_defa=
ult"><font face=3D"arial, helvetica, sans-serif">IndexError: list index out=
 of range</font></div><div style=3D"font-family:arial,helvetica,sans-serif"=
><br></div><div style=3D"font-family:arial,helvetica,sans-serif">I have als=
o updated arago-prefs.inc and toolchain-linaro.inc:</div><div style=3D"font=
-family:arial,helvetica,sans-serif"><br></div><div style=3D"font-family:ari=
al,helvetica,sans-serif"><div>diff --git a/meta-arago-distro/conf/distro/in=
clude/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.i=
nc</div><div>index 8947c7f..fd3bd01 100644</div><div>--- a/meta-arago-distr=
o/conf/distro/include/arago-prefs.inc</div><div>+++ b/meta-arago-distro/con=
f/distro/include/arago-prefs.inc</div><div>@@ -1,9 +1,9 @@</div><div>=C2=A0=
# Set *target* toolchain preferences at global distro level.</div><div>=C2=
=A0# Cross and SDK toolchain preferences are set in toolchain-*.inc files</=
div><div>-GCCVERSION ?=3D &quot;linaro-4.7%&quot;</div><div>-BINUVERSION ?=
=3D &quot;linaro-2.24%&quot;</div><div>-EGLIBCVERSION ?=3D &quot;2.19%&quot=
;</div><div>-EGLIBCINITVERSION ?=3D &quot;2.19%&quot;</div><div>+GCCVERSION=
 ?=3D &quot;linaro-5.3%&quot;</div><div>+BINUVERSION ?=3D &quot;linaro-2.25=
%&quot;</div><div>+EGLIBCVERSION ?=3D &quot;2.23%&quot;</div><div>+EGLIBCIN=
ITVERSION ?=3D &quot;2.23%&quot;</div><div>=C2=A0LINUXLIBCVERSION ?=3D &quo=
t;3.14&quot;</div><div>=C2=A0</div><div>=C2=A0PREFERRED_VERSION_gcc ?=3D &q=
uot;${GCCVERSION}&quot;</div><div>@@ -99,7 +99,7 @@ PREFERRED_VERSION_readl=
ine =3D &quot;5.2&quot;</div><div>=C2=A0PREFERRED_VERSION_readline-native =
=3D &quot;5.2&quot;</div><div>=C2=A0PREFERRED_VERSION_readline-nativesdk =
=3D &quot;5.2&quot;</div><div>=C2=A0</div><div>-PREFERRED_VERSION_libnl =3D=
 &quot;3.2.24&quot;</div><div>+PREFERRED_VERSION_libnl =3D &quot;3.2.25&quo=
t;</div><div>=C2=A0PREFERRED_VERSION_crda =3D &quot;1.1.3&quot;</div><div>=
=C2=A0PREFERRED_VERSION_obex =3D &quot;0.34&quot;</div><div>=C2=A0PREFERRED=
_VERSION_bash =3D &quot;3.2.48&quot;</div><div>diff --git a/meta-arago-dist=
ro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro=
/include/toolchain-linaro.inc</div><div>index cd2d3ce..19de40e 100644</div>=
<div>--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc</div>=
<div>+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc</div>=
<div>@@ -28,9 +28,9 @@ PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_T=
ARGET_ARCH} =3D &quot;gdb-cross-can</div><div>=C2=A0PREFERRED_PROVIDER_libg=
cc =3D &quot;external-linaro-toolchain&quot;</div><div>=C2=A0PREFERRED_PROV=
IDER_gcc-runtime =3D &quot;external-linaro-toolchain&quot;</div><div>=C2=A0=
</div><div>-SDKGCCVERSION ?=3D &quot;4.7%&quot;</div><div>-SDKBINUVERSION ?=
=3D &quot;2.24%&quot;</div><div>-SDKEGLIBCVERSION ?=3D &quot;2.19%&quot;</d=
iv><div>+SDKGCCVERSION ?=3D &quot;linaro-5.3%&quot;</div><div>+SDKBINUVERSI=
ON ?=3D &quot;linaro-2.25%&quot;</div><div>+SDKEGLIBCVERSION ?=3D &quot;2.2=
3%&quot;</div><div>=C2=A0SDKLINUXLIBCVERSION ?=3D &quot;3.14%&quot;</div><d=
iv>=C2=A0</div><div>=C2=A0PREFERRED_VERSION_gcc-crosssdk ?=3D &quot;${SDKGC=
CVERSION}&quot;</div><div><br></div></div><div style=3D"font-family:arial,h=
elvetica,sans-serif">How can I resolve above issue ? Any help is appreciate=
d.</div><div style=3D"font-family:arial,helvetica,sans-serif"><br></div><di=
v style=3D"font-family:arial,helvetica,sans-serif">Regards</div><div style=
=3D"font-family:arial,helvetica,sans-serif">Ankur</div><div style=3D"font-f=
amily:arial,helvetica,sans-serif"><br></div></div></div>

--000000000000664d17057325cab3--
