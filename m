Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by arago-project.org (Postfix) with ESMTPS id A2A7B52A1B
	for <meta-arago@arago-project.org>;
	Mon,  6 Nov 2017 14:38:00 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id w2so7950902ywa.9
	for <meta-arago@arago-project.org>;
	Mon, 06 Nov 2017 06:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jprqgDnNH/mOfoSJpYlnl3xKnIych+ZheaN2r7xiSNA=;
	b=BI4qAivl0yqVj1RWhdEaYqJ7f77VjN4MdPEsMLq0CtuT/zjV7P3O209ImHAlyffHKe
	ac2EWp1JneJIVf0XHrOfXDV2wxH8Iq6gDpUzeqPHUzLilo7b7FvpQvlR/XLp3i9sTVBj
	l/80lF50g3dZMoN6OoPAUJhBLYcrEGXTLGCxwGUmYSFm1to3fL0lnvZZ5GPXrlvwwtnQ
	qjr49XNOx5Q834yIqiXFRgR+4SnBI4gVTRXL8+pJ6Fp+z5lePzsGwCE816br9utoQDL6
	QoN2VYMUx/ULFTAM26jGEal0xaUmKBW4AdLgvFGY997y3m1S5Gtatsl9GCjdbViGkH1d
	B4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jprqgDnNH/mOfoSJpYlnl3xKnIych+ZheaN2r7xiSNA=;
	b=cF0vTxUBbTWqoVb/IgGqkJQK3ITRjfJkPxwUAP6ECjxeGhFXLxcDoYZSdlQ932Xym3
	lBl+ZbHGYDMkJSMSDD+hpnSIwPZOkQcAQOFHyLTTbFenb4R1kwmfgNM6sHD7Aq076LGe
	PnSgOZWyzb6m+PbeQZhJVASPoedX+EdiIOks657QXN7gOU8hShQmMyXBxm0dO80sDckl
	4y7dq2k7s2GYKbKgYli5sFUqDQaS/nvF56whmsfdx6jv+uJy0HQdiZQkG0oi1WTbCP22
	OCP25iJBD5OlRfDoxs9VW43fT/4Eq+gayZ5Rjan5kptvbp/Ehavux6y99R+pG+yDo6Kl
	gCPg==
X-Gm-Message-State: AMCzsaVuwx9aFeV+2WVcFBFE+80QS1BqcY71+ls1wCBhWNUzOjmekHOS
	2KcVutFDHx8ZfR5yC2MDZhx0Q1oR2APpHLLp8oI=
X-Google-Smtp-Source: ABhQp+Qj7jr1OqDARt8G+y+aTrbh06YarMDlpXixA0xIfyXtJS4TYv9gg/IZPA3iec68ulwN45D44iqbTrQdRf5KmyY=
X-Received: by 10.129.175.39 with SMTP id n39mr10343247ywh.231.1509979080603; 
	Mon, 06 Nov 2017 06:38:00 -0800 (PST)
MIME-Version: 1.0
References: <CAFeBWL7qNnVC9ryX7bNt_JgYkrd11iJBZ_5Y3HRF+no4EwVBhQ@mail.gmail.com>
	<CAFeBWL4qYcEreMk48swwrkEuc9pOhfQZDetqp3QzbKd_T1gGYQ@mail.gmail.com>
	<CAFeBWL74qVQmQ9oOqPvzLxnbBdx_Eb+esJPwHBg3NLtYyZd2RQ@mail.gmail.com>
	<20171103182445.GQ12918@edge>
In-Reply-To: <20171103182445.GQ12918@edge>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Mon, 06 Nov 2017 14:37:50 +0000
Message-ID: <CAFeBWL6fwsiS9ONCwV_YW=74hbdsnddGePh4d-9rxFcdeCyU7Q@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: Building Xwayland
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
X-List-Received-Date: Mon, 06 Nov 2017 14:38:02 -0000
Content-Type: multipart/alternative; boundary="f403045eb726b7bbd7055d5166f9"

--f403045eb726b7bbd7055d5166f9
Content-Type: text/plain; charset="UTF-8"

Thank you Denys, looks like I have done much of the right things.


On Fri, Nov 3, 2017 at 2:25 PM Denys Dmytriyenko <denys@ti.com> wrote:

> You may want to check this discussion on mesa, libgbm and weston that we've
> had some time back, as it seems still relevant to your case:
>
>
> http://lists.openembedded.org/pipermail/openembedded-core/2016-April/120526.html
>
> --
> Denys
>
>
> On Fri, Nov 03, 2017 at 02:51:20PM +0000, Adam Lee wrote:
> > Ok with a bit of dance with mesa / mesa-gl, I got xclock to run on
> Xwayland.
> > Demo apps such as kmscube still runs fine. Weston comes up too.
> >
> > I removed virtual/libgles1 virtual/libgles2 virtual/egl and virtual/libgl
> > from mesa's PROVIDES list. These components are provided by ti-sgx-ddk-um
> > already.
> > I likewise removed libgbm and libgbm-dev from mesa-gl. Package libgbm
> > provides these.
> >
> >
> > Adam
> >
> > On Thu, Nov 2, 2017 at 11:15 AM Adam Lee <adam.yh.lee@gmail.com> wrote:
> >
> > > Perhaps this is the crux of my original question:
> > >
> > > build@6e35408e8fa5:~/tisdk/build$ bitbake mesa
> > > NOTE: Started PRServer with DBfile:
> > > /home/build/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
> 46116,
> > > PID: 16487
> > > Parsing recipes: 100%
> > >
> |########################################################################################################################|
> > > Time: 0:00:18
> > > Parsing of 2538 .bb files complete (0 cached, 2538 parsed). 3286
> targets,
> > > 275 skipped, 0 masked, 0 errors.
> > > WARNING: No recipes available for:
> > >
> > >
> /home/build/tisdk/sources/meta-openamp/recipes-bsp/device-tree/device-tree-generation_%.bbappend
> > > *ERROR: Nothing PROVIDES 'mesa'*
> > > *ERROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to
> > > ti-sgx-ddk-um, not mesa*
> > > *ERROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to
> > > ti-sgx-ddk-um, not mesa*
> > >
> > > Is it possible to separate mesa into separate components (libgles1,
> > > libgles2 etc)?
> > > I wrote mesa_%.bbappend with "PROVIDES_remove" for libgles1 and
> libgles2,
> > > but seems to have no effect.
> > >
> > >
> > > On Thu, Nov 2, 2017 at 9:49 AM Adam Lee <adam.yh.lee@gmail.com> wrote:
> > >
> > >> Has anyone built Xwayland for Beagleboard X15 or AM57xx-EVM?
> > >>
> > >> There is no "official" support for X11 in the TI SDK. Only Wayland is
> > >> present. I am hoping to run my X11 applications with Xwayland. I have
> > >> included x11 and wayland in DISTRO_FEATURES, but weston-xwayland /
> > >> xserver-xorg are refusing to build.
> > >>
> > >> OE/meta has core-image-weston [0] which should build Xwayland as well
> but
> > >> it also fails at weston-xwayland / xserver-xorg.
> > >>
> > >> I notice there is an experimental branch [1] but it removes Wayland
> > >> altogether and appears to be very experimental, so that is a no-go
> for me.
> > >>
> > >> [0]
> > >>
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphics/images/core-image-weston.bb?h=master
> > >> [1]
> > >>
> http://arago-project.org/git/projects/?p=meta-processor-sdk.git;a=shortlog;h=refs/heads/morty-x11-experimental
> > >>
> > >>
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--f403045eb726b7bbd7055d5166f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Denys, looks like I have done much of the right =
things.<div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Fri, Nov 3, 2017 at 2:25 PM Denys Dmytriyenko &lt;<a href=3D"mailto:den=
ys@ti.com">denys@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">You may want to check this discussion on mesa, libgbm and weston that w=
e&#39;ve<br>
had some time back, as it seems still relevant to your case:<br>
<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2016-A=
pril/120526.html" rel=3D"noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/pipermail/openembedded-core/2016-April/120526.html</a><br>
<br>
--<br>
Denys<br>
<br>
<br>
On Fri, Nov 03, 2017 at 02:51:20PM +0000, Adam Lee wrote:<br>
&gt; Ok with a bit of dance with mesa / mesa-gl, I got xclock to run on Xwa=
yland.<br>
&gt; Demo apps such as kmscube still runs fine. Weston comes up too.<br>
&gt;<br>
&gt; I removed virtual/libgles1 virtual/libgles2 virtual/egl and virtual/li=
bgl<br>
&gt; from mesa&#39;s PROVIDES list. These components are provided by ti-sgx=
-ddk-um<br>
&gt; already.<br>
&gt; I likewise removed libgbm and libgbm-dev from mesa-gl. Package libgbm<=
br>
&gt; provides these.<br>
&gt;<br>
&gt;<br>
&gt; Adam<br>
&gt;<br>
&gt; On Thu, Nov 2, 2017 at 11:15 AM Adam Lee &lt;<a href=3D"mailto:adam.yh=
.lee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Perhaps this is the crux of my original question:<br>
&gt; &gt;<br>
&gt; &gt; build@6e35408e8fa5:~/tisdk/build$ bitbake mesa<br>
&gt; &gt; NOTE: Started PRServer with DBfile:<br>
&gt; &gt; /home/build/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT=
: 46116,<br>
&gt; &gt; PID: 16487<br>
&gt; &gt; Parsing recipes: 100%<br>
&gt; &gt; |################################################################=
########################################################|<br>
&gt; &gt; Time: 0:00:18<br>
&gt; &gt; Parsing of 2538 .bb files complete (0 cached, 2538 parsed). 3286 =
targets,<br>
&gt; &gt; 275 skipped, 0 masked, 0 errors.<br>
&gt; &gt; WARNING: No recipes available for:<br>
&gt; &gt;<br>
&gt; &gt; /home/build/tisdk/sources/meta-openamp/recipes-bsp/device-tree/de=
vice-tree-generation_%.bbappend<br>
&gt; &gt; *ERROR: Nothing PROVIDES &#39;mesa&#39;*<br>
&gt; &gt; *ERROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set=
 to<br>
&gt; &gt; ti-sgx-ddk-um, not mesa*<br>
&gt; &gt; *ERROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set=
 to<br>
&gt; &gt; ti-sgx-ddk-um, not mesa*<br>
&gt; &gt;<br>
&gt; &gt; Is it possible to separate mesa into separate components (libgles=
1,<br>
&gt; &gt; libgles2 etc)?<br>
&gt; &gt; I wrote mesa_%.bbappend with &quot;PROVIDES_remove&quot; for libg=
les1 and libgles2,<br>
&gt; &gt; but seems to have no effect.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Nov 2, 2017 at 9:49 AM Adam Lee &lt;<a href=3D"mailto:ada=
m.yh.lee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt;&gt; Has anyone built Xwayland for Beagleboard X15 or AM57xx-EVM?<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; There is no &quot;official&quot; support for X11 in the TI SD=
K. Only Wayland is<br>
&gt; &gt;&gt; present. I am hoping to run my X11 applications with Xwayland=
. I have<br>
&gt; &gt;&gt; included x11 and wayland in DISTRO_FEATURES, but weston-xwayl=
and /<br>
&gt; &gt;&gt; xserver-xorg are refusing to build.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; OE/meta has core-image-weston [0] which should build Xwayland=
 as well but<br>
&gt; &gt;&gt; it also fails at weston-xwayland / xserver-xorg.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I notice there is an experimental branch [1] but it removes W=
ayland<br>
&gt; &gt;&gt; altogether and appears to be very experimental, so that is a =
no-go for me.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; [0]<br>
&gt; &gt;&gt; <a href=3D"http://cgit.openembedded.org/openembedded-core/tre=
e/meta/recipes-graphics/images/core-image-weston.bb?h=3Dmaster" rel=3D"nore=
ferrer" target=3D"_blank">http://cgit.openembedded.org/openembedded-core/tr=
ee/meta/recipes-graphics/images/core-image-weston.bb?h=3Dmaster</a><br>
&gt; &gt;&gt; [1]<br>
&gt; &gt;&gt; <a href=3D"http://arago-project.org/git/projects/?p=3Dmeta-pr=
ocessor-sdk.git;a=3Dshortlog;h=3Drefs/heads/morty-x11-experimental" rel=3D"=
noreferrer" target=3D"_blank">http://arago-project.org/git/projects/?p=3Dme=
ta-processor-sdk.git;a=3Dshortlog;h=3Drefs/heads/morty-x11-experimental</a>=
<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
<br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank">meta=
-arago@arago-project.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer" target=3D"_blank">http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago</a><br>
<br>
</blockquote></div>

--f403045eb726b7bbd7055d5166f9--
