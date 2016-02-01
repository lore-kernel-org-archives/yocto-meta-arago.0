Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by arago-project.org (Postfix) with ESMTPS id 661D5529C7
	for <meta-arago@arago-project.org>;
	Mon,  1 Feb 2016 22:38:53 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id e6so85892379vkh.2
	for <meta-arago@arago-project.org>;
	Mon, 01 Feb 2016 14:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=IUNMp9NnETUWr6V1QMg/kWFxiQ6BkIhoIrzm5b4VXOE=;
	b=uwrqNp8swG3y9oAlHXBiqiiVPpV1UrkE1Li0IVU1NvU3CfIngnut8xgUl4s/IVZmNB
	0o1xX5u2BViACqTfeMJxUNwOmKPuloj8b3fZl7yjm3l+xD85Bicm673b8PJVOKVkc1QV
	KEiyM5Rbm4XvgZvVsQJwka/+m0P5u4s9FkSHNrWKTuNx0RMzhbyDSp3DIhm8yqV3EHr8
	dJA2Omb4iC9DlPPF3DIemowHpsmczVySVFBuAUqwdFVCb741v8Nv8gQ5Hb3LHD86n+S4
	pghTkHRqJFwO4DgtRKZkCUoIHr9QWs/+aoQeQzy+2hSBRQS6lgpTgHZp/5C2YgIQivFH
	cUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IUNMp9NnETUWr6V1QMg/kWFxiQ6BkIhoIrzm5b4VXOE=;
	b=VPLDJ+CusFUT3AXTVm9e7as2lJkhpNl5+9gWuCG83WowiEuZFLHO3mjkb2uO30ixZK
	3XNrFI4u92+6bHaUOA6ubpPGtFLuwzuibMrATqN48q+Hut4npVhdHMRZcFos+Wn2Li+k
	1IX4JE4GA8fEJTDmD/Zopa7wMJtvmjgK88Hu+Ws0MMRFasBRgYzteLerdMK5zNhVu1oU
	MTOvIVQ0DNKLuRqTGAjR978clCK7YSrumbCEpiCwkDKWgSIpMIMNWmPiXIcieMdsV728
	C0VJ2s2vFez/cy0QL4lLieWA2OpOX3uQUhv6rCC6gxNkq7CuH18xCQwGHgVtnVlgZH/H
	8vLw==
X-Gm-Message-State: AG10YOSiL9DaDOyeDvk/FXmLin+o1a0Vf8cqI5jL+YPE9czraaauynpgsbPnMUyS8SHN1Hivyc/et2titb5HkQ==
X-Received: by 10.31.107.1 with SMTP id g1mr17813570vkc.15.1454366332912; Mon,
	01 Feb 2016 14:38:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Mon, 1 Feb 2016 14:38:33 -0800 (PST)
In-Reply-To: <20160201220304.GV11314@edge>
References: <CADySD0G_Sy+0JasUQ=R7Du-iwwLH4OKZ4UBp7v4srHvzDPK50A@mail.gmail.com>
	<20160201220304.GV11314@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 2 Feb 2016 11:38:33 +1300
Message-ID: <CADySD0GpTH726emZj0CEp4ifJMG2sSBd1gSBK-i8rQJPwonFpQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Fix bluetooth.h compilation error with strict C
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
X-List-Received-Date: Mon, 01 Feb 2016 22:38:53 -0000
Content-Type: multipart/alternative; boundary=001a114790a8a58c32052abd0c9d

--001a114790a8a58c32052abd0c9d
Content-Type: text/plain; charset=UTF-8

I am using Ubuntu 14.04 x86_64,arago-fido-config,toolchain
gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf

Patch is available here :
http://git.kernel.org/cgit/bluetooth/bluez.git/commit/?id=cf52a40302d0d20ccca22a7a1f53e46ef8abfca8

I'll update Upstream-Status: Backported

thanks
Ankur

On Tue, Feb 2, 2016 at 11:03 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> Can you please specify:
> * what combination of setup and toolchain causes the error (not seen here)
> * where this patch comes from
> * update Upstream-Status: field accordingly[1]
>
> [1]
> http://openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations
>
> --
> Denys
>
>
> On Sat, Jan 30, 2016 at 09:30:22AM +1300, Ankur Tyagi wrote:
> > This patch fixes the compilation error of bluetooth.h on fido branch
> >
> > regards
> > Ankur
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > ---
> >  .../0001-strict-C-compilation-error-fix.patch      | 41
> > ++++++++++++++++++++++
> >  .../bluez/bluez4_4.101.bbappend                    |  1 +
> >  2 files changed, 42 insertions(+)
> >  create mode 100644
> >
> meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
> >
> > diff --git
> >
> a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
> >
> b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
> > new file mode 100644
> > index 0000000..c2cac24
> > --- /dev/null
> > +++
> >
> b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-compilation-error-fix.patch
> > @@ -0,0 +1,41 @@
> > +From d7fab1e161c2344875b1b0a2363f1f62efdd6cd4 Mon Sep 17 00:00:00 2001
> > +From: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > +Date: Thu, 14 Jan 2016 18:12:23 +1300
> > +Subject: [PATCH 1/1] strict C compilation error fix
> > +
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > +---
> > + lib/bluetooth.h | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/lib/bluetooth.h b/lib/bluetooth.h
> > +index 0fc4508..449431d 100644
> > +--- a/lib/bluetooth.h
> > ++++ b/lib/bluetooth.h
> > +@@ -138,18 +138,18 @@ enum {
> > +
> > + /* Bluetooth unaligned access */
> > + #define bt_get_unaligned(ptr)            \
> > +-({                        \
> > ++__extension__ ({                \
> > +    struct __attribute__((packed)) {    \
> > +-        typeof(*(ptr)) __v;        \
> > +-    } *__p = (typeof(__p)) (ptr);        \
> > ++        __typeof__(*(ptr)) __v;        \
> > ++    } *__p = (__typeof__(__p)) (ptr);    \
> > +    __p->__v;                \
> > + })
> > +
> > + #define bt_put_unaligned(val, ptr)        \
> > + do {                        \
> > +    struct __attribute__((packed)) {    \
> > +-        typeof(*(ptr)) __v;        \
> > +-    } *__p = (typeof(__p)) (ptr);        \
> > ++        __typeof__(*(ptr)) __v;        \
> > ++    } *__p = (__typeof__(__p)) (ptr);    \
> > +    __p->__v = (val);            \
> > + } while(0)
> > +
> > +--
> > +1.9.1
> > +
> > diff --git
> > a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> > b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> > index d111425..acda4ee 100644
> > --- a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> > +++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
> > @@ -5,6 +5,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >  SRC_URI +=
> > "file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patch \
> >              file://0001-socket-enable-for-bluez-4_98.patch \
> >              file://0001-bluez-enable-source-interface.patch \
> > +            file://0001-strict-C-compilation-error-fix.patch \
> >  "
> >  # udev 150-170 provide its on hid2hci tool and udev rules for it.
> > Therefore,
> >  # disabling hid2hci from bluez4.
> > --
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--001a114790a8a58c32052abd0c9d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am using Ubuntu 14.04 x86_64,arago-fido-config,toolchain=
 gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf<br><br>Patch is availabl=
e here :<br><a href=3D"http://git.kernel.org/cgit/bluetooth/bluez.git/commi=
t/?id=3Dcf52a40302d0d20ccca22a7a1f53e46ef8abfca8">http://git.kernel.org/cgi=
t/bluetooth/bluez.git/commit/?id=3Dcf52a40302d0d20ccca22a7a1f53e46ef8abfca8=
</a><div class=3D"gmail_extra"><br clear=3D"all">I&#39;ll update Upstream-S=
tatus: Backported</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">thanks<br>Ankur</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, Feb 2, 2016 at 11:03 AM, Denys Dmytriyenko <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex">Can you please specify:<br>
* what combination of setup and toolchain causes the error (not seen here)<=
br>
* where this patch comes from<br>
* update Upstream-Status: field accordingly[1]<br>
<br>
[1] <a href=3D"http://openembedded.org/wiki/Commit_Patch_Message_Guidelines=
#Patch_Header_Recommendations" rel=3D"noreferrer" target=3D"_blank">http://=
openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommen=
dations</a><br>
<br>
--<br>
Denys<br>
<div><div class=3D"h5"><br>
<br>
On Sat, Jan 30, 2016 at 09:30:22AM +1300, Ankur Tyagi wrote:<br>
&gt; This patch fixes the compilation error of bluetooth.h on fido branch<b=
r>
&gt;<br>
&gt; regards<br>
&gt; Ankur<br>
&gt;<br>
&gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi@gallagher=
.com">ankur.tyagi@gallagher.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-strict-C-compilation-error-fix.patch=C2=A0 =C2=A0 =C2=
=A0 | 41<br>
&gt; ++++++++++++++++++++++<br>
&gt;=C2=A0 .../bluez/bluez4_4.101.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 42 insertions(+)<br>
&gt;=C2=A0 create mode 100644<br>
&gt; meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-comp=
ilation-error-fix.patch<br>
&gt;<br>
&gt; diff --git<br>
&gt; a/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-co=
mpilation-error-fix.patch<br>
&gt; b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-co=
mpilation-error-fix.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c2cac24<br>
&gt; --- /dev/null<br>
&gt; +++<br>
&gt; b/meta-arago-distro/recipes-connectivity/bluez/bluez4/0001-strict-C-co=
mpilation-error-fix.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +From d7fab1e161c2344875b1b0a2363f1f62efdd6cd4 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi@gallagher.com">an=
kur.tyagi@gallagher.com</a>&gt;<br>
&gt; +Date: Thu, 14 Jan 2016 18:12:23 +1300<br>
&gt; +Subject: [PATCH 1/1] strict C compilation error fix<br>
&gt; +<br>
&gt; +Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi@gallaghe=
r.com">ankur.tyagi@gallagher.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/bluetooth.h | 10 +++++-----<br>
&gt; + 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/bluetooth.h b/lib/bluetooth.h<br>
&gt; +index 0fc4508..449431d 100644<br>
&gt; +--- a/lib/bluetooth.h<br>
&gt; ++++ b/lib/bluetooth.h<br>
&gt; +@@ -138,18 +138,18 @@ enum {<br>
&gt; +<br>
&gt; + /* Bluetooth unaligned access */<br>
&gt; + #define bt_get_unaligned(ptr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt; +-({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt; ++__extension__ ({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt; +=C2=A0 =C2=A0 struct __attribute__((packed)) {=C2=A0 =C2=A0 \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 typeof(*(ptr)) __v;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt; +-=C2=A0 =C2=A0 } *__p =3D (typeof(__p)) (ptr);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 __typeof__(*(ptr)) __v;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; ++=C2=A0 =C2=A0 } *__p =3D (__typeof__(__p)) (ptr);=C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 __p-&gt;__v;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt; + })<br>
&gt; +<br>
&gt; + #define bt_put_unaligned(val, ptr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; + do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 struct __attribute__((packed)) {=C2=A0 =C2=A0 \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 typeof(*(ptr)) __v;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt; +-=C2=A0 =C2=A0 } *__p =3D (typeof(__p)) (ptr);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 __typeof__(*(ptr)) __v;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; ++=C2=A0 =C2=A0 } *__p =3D (__typeof__(__p)) (ptr);=C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 __p-&gt;__v =3D (val);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; + } while(0)<br>
&gt; +<br>
&gt; +--<br>
&gt; +1.9.1<br>
&gt; +<br>
&gt; diff --git<br>
&gt; a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend<b=
r>
&gt; b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend<b=
r>
&gt; index d111425..acda4ee 100644<br>
&gt; --- a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappe=
nd<br>
&gt; +++ b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappe=
nd<br>
&gt; @@ -5,6 +5,7 @@ FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&q=
uot;<br>
&gt;=C2=A0 SRC_URI +=3D<br>
&gt; &quot;file://bluez4-fix-synchronization-between-bluetoothd-and-dr.patc=
h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-socket-ena=
ble-for-bluez-4_98.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-bluez-enab=
le-source-interface.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-strict-C-compil=
ation-error-fix.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 # udev 150-170 provide its on hid2hci tool and udev rules for it=
.<br>
&gt; Therefore,<br>
&gt;=C2=A0 # disabling hid2hci from bluez4.<br>
&gt; --<br>
<br>
</div></div>&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-proje=
ct.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer" target=3D"_blank">http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago</a><br>
<br>
</blockquote></div><br></div></div>

--001a114790a8a58c32052abd0c9d--
