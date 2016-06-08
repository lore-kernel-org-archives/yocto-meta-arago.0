Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by arago-project.org (Postfix) with ESMTPS id CFF9152007
	for <meta-arago@arago-project.org>;
	Wed,  8 Jun 2016 06:14:32 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id p204so117043455oih.3
	for <meta-arago@arago-project.org>;
	Tue, 07 Jun 2016 23:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sZxFvLy87+oXHsLJCxA9HB4YR7ttknGXv0GQWd/gU0s=;
	b=w5gZv8E6+EFq0ooZQ65mPbW4XGiuuJrxlGBvw4/mrtrHPIjIStahQoktgjDzNqn1Ip
	Bc9aq5/8+A4ZwX2uxBu9gSaWPBpO6exg7riffIUB+KZ3fXJAImBLXb3G2AmlyJmJI4jk
	+dno4hR/pYoXi6UIauVgApn3/a/aVF08ahrreC36xZYAcC77rB6HLjkzX6WbD6u13SHv
	F3IwJxjxlnBKwvKfpNG+p8+cFQ17m/euWvOZsajvnDRnqlQPhem5koNxlnBdJyKjQJYC
	hW9bSjaK+jUgJGVPrqLvx3CdITI2NfXG3TaWMLzu9x3FPUORYkNHarDOHG6Ft6LeOKYL
	8B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sZxFvLy87+oXHsLJCxA9HB4YR7ttknGXv0GQWd/gU0s=;
	b=bSZTSekRVMlc8eBQAAKuZi5sZsaTX36Tx4TOv0y8bKce/otUudg2nUU1G7T7LcXbpO
	qB3MgOwyIfbD0aCLJzpXDd4aqqBE3U7rQ5U4XQBHM31J5hZdQrd+9zvwGIhpkutdfvc4
	y6Fc/M8TIFUGxqmn0Ux4HX7jUz6e415dZD43z/RNDTZBqYat7w4BCX6L52c5ORBDJ0T3
	rVq6IRYRfld0VQmM2q0H8/rXVcugLqk8Z3zkTShfsrpZZxAQSYaninguSmxfKFHgqQbL
	eikz3mdQrYm7GdQ8/5P899D+by9jpv6m0ogMqVQwiHUbyEqefNmM1Ul3Se37jJuq1QqR
	efqg==
X-Gm-Message-State: ALyK8tKL4kGPPoDfp9NC/K1PvrHmfknopeT/uAq6Ds1i09zr0FlMadnZU5Wg6+XHdQvNiPyabM7nv42dT5FHgA==
X-Received: by 10.157.6.132 with SMTP id 4mr1698358otx.100.1465366472494; Tue,
	07 Jun 2016 23:14:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.204.129 with HTTP; Tue, 7 Jun 2016 23:14:13 -0700 (PDT)
In-Reply-To: <20160606163804.GF13268@edge>
References: <CADySD0EkXbgZ6MWCv-Dco6g1B0+k4-dxh5BKJ5xqPBYcHQtHrA@mail.gmail.com>
	<20160606163804.GF13268@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 8 Jun 2016 18:14:13 +1200
Message-ID: <CADySD0Emy1HpzVVktTwQ8hNLm9C=wnF4pC+zRD5CKGjBDW6ZFQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: tisdk-rootfs-image error when using arago-krogoth-config
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
X-List-Received-Date: Wed, 08 Jun 2016 06:14:33 -0000
Content-Type: multipart/alternative; boundary=94eb2c04d22e0f139e0534be385d

--94eb2c04d22e0f139e0534be385d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thanks for the response.
I have successfully built the image using the mentioned toolchain.

regards
Ankur
On Tue, Jun 7, 2016 at 4:38 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Sat, Jun 04, 2016 at 10:37:17PM +1200, Ankur Tyagi wrote:
> > =E2=80=8BHi,
> >
> > I am trying to build tisdk-rootfs-image and getting following error:
> >
> > http://pastebin.com/9SqudXGa
>
> After looking at the log, I see that you are using Linaro 4.9 toolchain.
> That
> particular version of the toolchain had some packaging issues, which I
> worked
> with Linaro team to resolve in the next versions. Still, in order to use
> 4.9,
> I had to put some workarounds in corresponding recipes in Fido branch.
> Those
> were rather ugly and version specific, so I didn't cary them over to
> Krogoth.
> And on Krogoth we use Linaro 5.3 toolchain:
>
> https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/
>
> https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/arm=
-linux-gnueabihf/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz
>
> --
> Denys
>
>
> > This is my build configuration:
> >
> > Build Configuration:
> > BB_VERSION        =3D "1.30.0"
> > BUILD_SYS         =3D "x86_64-linux"
> > NATIVELSBSTRING   =3D "Ubuntu-16.04"
> > TARGET_SYS        =3D "arm-linux-gnueabi"
> > MACHINE           =3D "am335x-evm"
> > DISTRO            =3D "arago"
> > DISTRO_VERSION    =3D "2016.05"
> > TUNE_FEATURES     =3D "arm armv7a vfp thumb neon
> > callconvention-hard       cortexa8"
> > TARGET_FPU        =3D "hard"
> > meta-arago-distro
> > meta-arago-extras =3D "krogoth:01453ff0c02a472726f6dfe8f949abba55eab935=
"
> > meta-qt5          =3D "krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75=
"
> > meta-networking
> > meta-ruby
> > meta-python
> > meta-oe           =3D "krogoth:247b1267bbe95719cd4877d2d3cfbaf2a2f4865a=
"
> > meta-ti           =3D "krogoth:1ae0cadb1200d0007a779958e852a48379d42c26=
"
> > meta-linaro-toolchain =3D
> "krogoth:0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc"
> > meta              =3D "krogoth:b0b91490e4ede61a302eb547da2cc65aa7da87ff=
"
> >
> > Any help is appreciated.
> >
> > regards
> > Ankur
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--94eb2c04d22e0f139e0534be385d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Denis,<br><br>Thanks for the response.<br>I have succes=
sfully built the image using the mentioned toolchain.<br><br>regards<br>Ank=
ur<div class=3D"gmail_extra"><div class=3D"gmail_quote">On Tue, Jun 7, 2016=
 at 4:38 AM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:deny=
s@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><span class=3D"">On Sat, Jun 04, 2016 at 10:37:17PM +=
1200, Ankur Tyagi wrote:<br>
&gt; =E2=80=8BHi,<br>
&gt;<br>
&gt; I am trying to build tisdk-rootfs-image and getting following error:<b=
r>
&gt;<br>
&gt; <a href=3D"http://pastebin.com/9SqudXGa" rel=3D"noreferrer" target=3D"=
_blank">http://pastebin.com/9SqudXGa</a><br>
<br>
</span>After looking at the log, I see that you are using Linaro 4.9 toolch=
ain. That<br>
particular version of the toolchain had some packaging issues, which I work=
ed<br>
with Linaro team to resolve in the next versions. Still, in order to use 4.=
9,<br>
I had to put some workarounds in corresponding recipes in Fido branch. Thos=
e<br>
were rather ugly and version specific, so I didn&#39;t cary them over to Kr=
ogoth.<br>
And on Krogoth we use Linaro 5.3 toolchain:<br>
<br>
<a href=3D"https://releases.linaro.org/components/toolchain/binaries/5.3-20=
16.02/" rel=3D"noreferrer" target=3D"_blank">https://releases.linaro.org/co=
mponents/toolchain/binaries/5.3-2016.02/</a><br>
<a href=3D"https://releases.linaro.org/components/toolchain/binaries/5.3-20=
16.02/arm-linux-gnueabihf/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf=
.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://releases.linaro.org/c=
omponents/toolchain/binaries/5.3-2016.02/arm-linux-gnueabihf/gcc-linaro-5.3=
-2016.02-x86_64_arm-linux-gnueabihf.tar.xz</a><br>
<br>
--<br>
Denys<br>
<div><div class=3D"h5"><br>
<br>
&gt; This is my build configuration:<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.30.0&quot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot=
;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Ubuntu-16.04&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-linux-gnueabi&quot=
;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;am335x-evm&q=
uot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arago&quot;<=
br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2016.05&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv7a vfp thumb neon<b=
r>
&gt; callconvention-hard=C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa8&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;hard&quot;<br>
&gt; meta-arago-distro<br>
&gt; meta-arago-extras =3D &quot;krogoth:01453ff0c02a472726f6dfe8f949abba55=
eab935&quot;<br>
&gt; meta-qt5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;krogoth:d715f2c1d=
340fa38f8a9860acc73de5e14a38b75&quot;<br>
&gt; meta-networking<br>
&gt; meta-ruby<br>
&gt; meta-python<br>
&gt; meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;krogoth:247b=
1267bbe95719cd4877d2d3cfbaf2a2f4865a&quot;<br>
&gt; meta-ti=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;krogoth:1ae0=
cadb1200d0007a779958e852a48379d42c26&quot;<br>
&gt; meta-linaro-toolchain =3D &quot;krogoth:0f2a4dd08ab06768cc998fe3f7236e=
3942f4a2cc&quot;<br>
&gt; meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;krogoth=
:b0b91490e4ede61a302eb547da2cc65aa7da87ff&quot;<br>
&gt;<br>
&gt; Any help is appreciated.<br>
&gt;<br>
&gt; regards<br>
&gt; Ankur<br>
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

--94eb2c04d22e0f139e0534be385d--
