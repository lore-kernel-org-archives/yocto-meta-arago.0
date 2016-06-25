Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by arago-project.org (Postfix) with ESMTPS id 14FA252A82
	for <meta-arago@arago-project.org>;
	Sat, 25 Jun 2016 01:18:05 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id s17so21242667oih.1
	for <meta-arago@arago-project.org>;
	Fri, 24 Jun 2016 18:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BV+hCQpwpGdRd5VP6ov4ld+k8GvtabY2qcQARZH9tvw=;
	b=GuAnF15f/mPWN7mQEFwfJ9h1wyjBkp3MxYIJgzPSRFxjQ5O6pOUMVRJAT3xUZ3zN05
	yq7vcQfim8FtcPIji5i0TsuB+sUiqcwgjGaK+Sk3cM7BdNEW/A1s93IKFOMPBUf/utmp
	VuAycU95L4dlsH3oXgNoulILyTWxKLdSmEfPsCPGWZhJG9M1qylMNUYQNUhQBIcjP3MF
	XoJ8rTUPHgoqUkWdJYd9vPIMJqPyyZURRminUmcKfugW+/rux5RQhaHr6to6e7R0Wb23
	/vUNjDbhXLOXMh4qKpL/puA1k2JgFPsPxP0BVslI2AeShLte38+/AZNdWLU2YpZ7AzuN
	LS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BV+hCQpwpGdRd5VP6ov4ld+k8GvtabY2qcQARZH9tvw=;
	b=OtZ3CFOCG+igLkpVROTdMF86odQ1AgAMmElqVSu/O//w9NUhx98mbaQuUxY9ImI1Kj
	GanNu/MB7Sn9gNYWkZpBQjn4Cm5jZx93dbQIvnHm5emVcsFMW5J39Q5N9s8FPvWBcuXn
	y/g5UioniOyR1EdDzgiQBfpHH3hvA9AbaFR2zfA9R2l1dTDRtXjto7YnHGdFMQQ8F7b2
	SQiCpkk01THCJsMJblNE272nF4hcQwJ7htTWbH7DEQ/NdEE5RBUoyumj1YdGx5mtBDj2
	i/kngovuXvegFxv+HAvVm/CpqeUHMSnXa7gZDp4HQRVnpNslhHq6hlmq6nJc/uLOLWTa
	qnNg==
X-Gm-Message-State: ALyK8tJeoxjL1IOAJqkF/VCcsMGtENHDN8lZ6YFuv4gsvCvydqhtjcTuqWJVlwTp1FyNjfsbWAr1U6EMDuVUgg==
X-Received: by 10.202.229.74 with SMTP id c71mr4753191oih.179.1466817484960;
	Fri, 24 Jun 2016 18:18:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.80.80 with HTTP; Fri, 24 Jun 2016 18:17:45 -0700 (PDT)
In-Reply-To: <20160625001414.GX2177@edge>
References: <CADySD0EGJ7JMswXzHbMGDQeGCHB0yrqq+zNfaS+ck1TzXD4KPw@mail.gmail.com>
	<20160625001414.GX2177@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 25 Jun 2016 13:17:45 +1200
Message-ID: <CADySD0H3hbUkmbombFd1xzgj3604KC5W71hUYNRe+LSjX-c-mw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: ncurses-native compile error when building daisy branch on Ubuntu 16.04 64bit host
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
X-List-Received-Date: Sat, 25 Jun 2016 01:18:05 -0000
Content-Type: multipart/alternative; boundary=001a11409034243a830536100f4d

--001a11409034243a830536100f4d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks, it's working now.

On Sat, Jun 25, 2016 at 12:14 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> http://lists.openembedded.org/pipermail/openembedded-core/2015-February/1=
01820.html
>
>
> On Sat, Jun 25, 2016 at 09:57:40AM +1200, Ankur Tyagi wrote:
> > Hi,
> >
> > I am trying to build arago daisy branch on Ubuntu 16.04 64bit host
> machine
> > and I am getting this error:
> >
> > http://pastebin.com/pRaEr2Te
> >
> > Following is my build configuration
> > =E2=80=8B:
> > =E2=80=8B
> >
> > Toolchain: gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux
> > (I have installed libstdc++6:i386 libncurses5:i386 libz1:i386 libc6:i38=
6
> > libc6-dev-i386)
> >
> > Build Configuration:
> > BB_VERSION        =3D "1.26.0"
> > BUILD_SYS         =3D "x86_64-linux"
> > NATIVELSBSTRING   =3D "Ubuntu-16.04"
> > TARGET_SYS        =3D "arm-linux-gnueabi"
> > MACHINE           =3D "am335x-evm"
> > DISTRO            =3D "arago"
> > DISTRO_VERSION    =3D "2015.05"
> > TUNE_FEATURES     =3D "armv7a vfp thumb neon callconvention-hard cortex=
a8"
> > TARGET_FPU        =3D "vfp-neon"
> > meta-ggl          =3D "master:9dbc979b22a14ddadc6359168420d369f5036225"
> > meta-arago-distro
> > meta-arago-extras =3D "daisy:f8c775ae64a26eb1182d515b2beb3544572bd799"
> > meta-qt5          =3D "krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75=
"
> > toolchain-layer
> > meta-networking
> > meta-ruby
> > meta-oe           =3D "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
> > meta-ti           =3D "daisy:090b02a104924886afd0fa79be7b5d08eebf071f"
> > meta-linaro-toolchain =3D "daisy:dbe0db0a1a5c015feb84ef689f48421594cb0b=
51"
> > meta              =3D "daisy:a4e80e831cd13e6418af0d770c5dbd5b9270eaa5"
> >
> > Is there a patch that fixes this problem ?
> >
> > thanks
> > Ankur
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--001a11409034243a830536100f4d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">Thanks, it&#39;s working now.<b=
r></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, J=
un 25, 2016 at 12:14 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D=
"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><a href=3D"http://lists.openembedded.org/=
pipermail/openembedded-core/2015-February/101820.html" rel=3D"noreferrer" t=
arget=3D"_blank">http://lists.openembedded.org/pipermail/openembedded-core/=
2015-February/101820.html</a><br>
<div><div class=3D"h5"><br>
<br>
On Sat, Jun 25, 2016 at 09:57:40AM +1200, Ankur Tyagi wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am trying to build arago daisy branch on Ubuntu 16.04 64bit host mac=
hine<br>
&gt; and I am getting this error:<br>
&gt;<br>
&gt; <a href=3D"http://pastebin.com/pRaEr2Te" rel=3D"noreferrer" target=3D"=
_blank">http://pastebin.com/pRaEr2Te</a><br>
&gt;<br>
&gt; Following is my build configuration<br>
&gt; =E2=80=8B:<br>
&gt; =E2=80=8B<br>
&gt;<br>
&gt; Toolchain: gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux<b=
r>
&gt; (I have installed libstdc++6:i386 libncurses5:i386 libz1:i386 libc6:i3=
86<br>
&gt; libc6-dev-i386)<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.26.0&quot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot=
;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Ubuntu-16.04&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-linux-gnueabi&quot=
;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;am335x-evm&q=
uot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arago&quot;<=
br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2015.05&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;armv7a vfp thumb neon callc=
onvention-hard cortexa8&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;vfp-neon&quot;<br>
&gt; meta-ggl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:9dbc979b22=
a14ddadc6359168420d369f5036225&quot;<br>
&gt; meta-arago-distro<br>
&gt; meta-arago-extras =3D &quot;daisy:f8c775ae64a26eb1182d515b2beb3544572b=
d799&quot;<br>
&gt; meta-qt5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;krogoth:d715f2c1d=
340fa38f8a9860acc73de5e14a38b75&quot;<br>
&gt; toolchain-layer<br>
&gt; meta-networking<br>
&gt; meta-ruby<br>
&gt; meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;daisy:d3d14d=
3fcca7fcde362cf0b31411dc4eea6d20aa&quot;<br>
&gt; meta-ti=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;daisy:090b02=
a104924886afd0fa79be7b5d08eebf071f&quot;<br>
&gt; meta-linaro-toolchain =3D &quot;daisy:dbe0db0a1a5c015feb84ef689f484215=
94cb0b51&quot;<br>
&gt; meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;daisy:a=
4e80e831cd13e6418af0d770c5dbd5b9270eaa5&quot;<br>
&gt;<br>
&gt; Is there a patch that fixes this problem ?<br>
&gt;<br>
&gt; thanks<br>
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

--001a11409034243a830536100f4d--
