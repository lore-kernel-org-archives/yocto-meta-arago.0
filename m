Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by arago-project.org (Postfix) with ESMTPS id 3B14F52AAD
	for <meta-arago@arago-project.org>;
	Wed,  8 Feb 2017 07:50:17 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id w75so81543028ywg.1
	for <meta-arago@arago-project.org>;
	Tue, 07 Feb 2017 23:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HBt6eNg5AapHt9xMNo0I6Fv86n8ozC9z7VdnAElZ9+M=;
	b=t2guHnCpUPJQfbeCFKaGA6zKXlMbiLas9XRrLO1vvsMbql/WPosXCLyGtXw16nD2IW
	ftjEOaED4aPTZpsJyCB+Kr/USymb3aylyeB4pGRQlFo35VMMyZYoex8KGUceC/9lvQGQ
	Zi+bu1w4iKeWU/kXx7OrsDKnmVHj9ZFakwQ+m7pkhj0lwMV76V6obIx139uD8OweAir+
	XCur/ohw60KgK8pa8EhWCyeJYq/cTJbWiwFOi3wGsjUnEjeRRn4PfRG7D70ypbhQfDQ/
	6Qv+stlCKFeiVMVl4KMYFEqZZ6SoOK6HjLeZ0vM2PztyBgxmLar6NANkiDNaPPtKu2Fm
	7XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HBt6eNg5AapHt9xMNo0I6Fv86n8ozC9z7VdnAElZ9+M=;
	b=irdW56lgZYje2UcngpPkpl+XjmLFJjcDpI5F8vJZ6cCtvPEEuYQf8+YNQnroF1BwzQ
	lSFr5WrFVdaX171qJAA00tK8UNfdd/HoyC3dIu4oa9qTpQAkrWtFPx3TXWb+Nqlaupv9
	JnnbTjJACr6a3Tf2yEFxQRct8kGXA5LkoZA+uxchQnNc5zf2XuByJBdX4bHK37PGwfMQ
	IDldJkBmOutUF+laM96KYXMU2Tlr653fgcPq0cCfXpb0l3yCOAl0XAFpKo1NXrSu6QiN
	RYSWP0cvako42RmBIzF65Qm2SzrfY8lB0ErbZ/qD5V1y0wkARauSD36bbtNUlHKGqZtT
	kZgg==
X-Gm-Message-State: AIkVDXLLfSMrE9IdeGaURrGCELq3vG2pTSXEWZFUuqeUqaynkVZNefjfaTuE6HGjr7h7qi6PZyEDHM1734AZSQ==
X-Received: by 10.129.116.136 with SMTP id p130mr14918961ywc.151.1486540217229;
	Tue, 07 Feb 2017 23:50:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.80.215 with HTTP; Tue, 7 Feb 2017 23:50:16 -0800 (PST)
Received: by 10.129.80.215 with HTTP; Tue, 7 Feb 2017 23:50:16 -0800 (PST)
In-Reply-To: <20170207210020.GA32691@edge>
References: <CADySD0FEFTwomoxgH9hhP97vxkW5aH5EJqh4h1+_thpS5cPsFQ@mail.gmail.com>
	<20170203003337.GA19545@edge>
	<CADySD0Hr2rmA8Eu6bdngmEMri67Fc7_2JiFhJmQWTYhAb0CO1w@mail.gmail.com>
	<CADySD0Ht7tH=QC6C6r2f-PgTX1P192x5o0jry8yo-Fe6OVk3mQ@mail.gmail.com>
	<CADySD0Huh=wkgE8wNtp0b3Hv5_2c9D3ZYvmx9=UWK6A8zJpLpA@mail.gmail.com>
	<20170207210020.GA32691@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 8 Feb 2017 20:50:16 +1300
Message-ID: <CADySD0HJXPWchgGd6a0xnRKOhWQrY95woAyEWz6pUw4LYCke1Q@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: How to remove linux headers from rootfs
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
X-List-Received-Date: Wed, 08 Feb 2017 07:50:17 -0000
Content-Type: multipart/alternative; boundary=001a1147edaa97a95d0548001dbf

--001a1147edaa97a95d0548001dbf
Content-Type: text/plain; charset=UTF-8

Ok thanks, I will try to look for that

Regards
Ankur

On 08-Feb-2017 10:00 AM, "Denys Dmytriyenko" <denys@ti.com> wrote:

> Something is depending on those dev packages as dependencies - you need to
> figure out what that is. Do you have packagegroup-core-buildessential
> pulled
> into your rootfs by any chance? Otherwise, you can run bitbake with -g flag
> and examine resulting *.dot files for dependencies.
>
> --
> Denys
>
>
> On Tue, Feb 07, 2017 at 05:26:56PM +1300, Ankur Tyagi wrote:
> > Hi,
> >
> > Any suggestions on how to remove these packages from my rootfs ?
> >
> > I know daisy is old but my current sdk is based upon it. I am in
> > process of evaluating morty but it will take time.
> > Until then, I would like to tune my current rootfs.
> >
> > thanks
> > Ankur
> >
> > On Sun, Feb 5, 2017 at 11:02 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> > > To add more, linux-libc-headers  indeed produce linux-libc-headers-dev
> > >
> > > bitbake -e linux-libc-headers | grep "^PACKAGES="
> > > PACKAGES="linux-libc-headers-dbg linux-libc-headers-staticdev
> > > linux-libc-headers-dev linux-libc-headers-doc
> > > linux-libc-headers-locale  linux-libc-headers"
> > >
> > > And forgot to mention that I am using *daisy* branch..
> > >
> > > On Sun, Feb 5, 2017 at 10:42 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> > >> Hi Denys,
> > >>
> > >> I have following dev packages installed in my rootfs which I don't
> want
> > >>
> > >> - linux-libc-headers-dev
> > >> - libgcc-s-dev
> > >> - libc6-dev
> > >>
> > >> I haven't explicitly added any -dev package.
> > >> How can I remove them ?
> > >>
> > >> Thanks
> > >> Ankur
> > >>
> > >> On Fri, Feb 3, 2017 at 1:33 PM, Denys Dmytriyenko <denys@ti.com>
> wrote:
> > >>> On Fri, Feb 03, 2017 at 01:26:38PM +1300, Ankur Tyagi wrote:
> > >>>> Hi,
> > >>>>
> > >>>> I have an image recipe which include packagegroup-core-boot which
> > >>>> brings in external-linaro-toolchain which in turn adds
> > >>>> linux-libc-headers.
> > >>>>
> > >>>> How can I remove linux-libc-headers from my end root FS ?
> > >>>
> > >>> linux-libc-headers is an empty package. linux-libc-headers-dev is
> the one that
> > >>> contains all the standard headers required for development. Which
> one you have?
> > >>>
> > >>> --
> > >>> Denys
>

--001a1147edaa97a95d0548001dbf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok thanks, I will try to look for that<div dir=3D"auto"><=
br></div><div dir=3D"auto">Regards</div><div dir=3D"auto">Ankur</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 08-Feb-2017 10=
:00 AM, &quot;Denys Dmytriyenko&quot; &lt;<a href=3D"mailto:denys@ti.com">d=
enys@ti.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Something is depending on those dev packages as dependencies - you n=
eed to<br>
figure out what that is. Do you have packagegroup-core-<wbr>buildessential =
pulled<br>
into your rootfs by any chance? Otherwise, you can run bitbake with -g flag=
<br>
and examine resulting *.dot files for dependencies.<br>
<br>
--<br>
Denys<br>
<br>
<br>
On Tue, Feb 07, 2017 at 05:26:56PM +1300, Ankur Tyagi wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Any suggestions on how to remove these packages from my rootfs ?<br>
&gt;<br>
&gt; I know daisy is old but my current sdk is based upon it. I am in<br>
&gt; process of evaluating morty but it will take time.<br>
&gt; Until then, I would like to tune my current rootfs.<br>
&gt;<br>
&gt; thanks<br>
&gt; Ankur<br>
&gt;<br>
&gt; On Sun, Feb 5, 2017 at 11:02 AM, Ankur Tyagi &lt;<a href=3D"mailto:ank=
ur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br>
&gt; &gt; To add more, linux-libc-headers=C2=A0 indeed produce linux-libc-h=
eaders-dev<br>
&gt; &gt;<br>
&gt; &gt; bitbake -e linux-libc-headers | grep &quot;^PACKAGES=3D&quot;<br>
&gt; &gt; PACKAGES=3D&quot;linux-libc-headers-<wbr>dbg linux-libc-headers-s=
taticdev<br>
&gt; &gt; linux-libc-headers-dev linux-libc-headers-doc<br>
&gt; &gt; linux-libc-headers-locale=C2=A0 linux-libc-headers&quot;<br>
&gt; &gt;<br>
&gt; &gt; And forgot to mention that I am using *daisy* branch..<br>
&gt; &gt;<br>
&gt; &gt; On Sun, Feb 5, 2017 at 10:42 AM, Ankur Tyagi &lt;<a href=3D"mailt=
o:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; Hi Denys,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I have following dev packages installed in my rootfs which I =
don&#39;t want<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; - linux-libc-headers-dev<br>
&gt; &gt;&gt; - libgcc-s-dev<br>
&gt; &gt;&gt; - libc6-dev<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I haven&#39;t explicitly added any -dev package.<br>
&gt; &gt;&gt; How can I remove them ?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thanks<br>
&gt; &gt;&gt; Ankur<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Fri, Feb 3, 2017 at 1:33 PM, Denys Dmytriyenko &lt;<a href=
=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt; On Fri, Feb 03, 2017 at 01:26:38PM +1300, Ankur Tyagi wro=
te:<br>
&gt; &gt;&gt;&gt;&gt; Hi,<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; I have an image recipe which include packagegroup-cor=
e-boot which<br>
&gt; &gt;&gt;&gt;&gt; brings in external-linaro-toolchain which in turn add=
s<br>
&gt; &gt;&gt;&gt;&gt; linux-libc-headers.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; How can I remove linux-libc-headers from my end root =
FS ?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; linux-libc-headers is an empty package. linux-libc-header=
s-dev is the one that<br>
&gt; &gt;&gt;&gt; contains all the standard headers required for developmen=
t. Which one you have?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt; Denys<br>
</blockquote></div></div>

--001a1147edaa97a95d0548001dbf--
