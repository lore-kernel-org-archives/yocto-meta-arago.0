Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by arago-project.org (Postfix) with ESMTPS id 00129529DE
	for <meta-arago@arago-project.org>;
	Wed, 10 Dec 2014 09:29:38 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id z107so1806191qgd.15
	for <meta-arago@arago-project.org>;
	Wed, 10 Dec 2014 01:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=blBpQTpwkPVuljXfbsbGDxk1skH5lTw67ylsqpaL1QM=;
	b=NJ+JV9Au0PTC13c8P86Tqsjke0m/4iptL4n81owvj1NtElmT7kLuWMEfgsd7nH1nJt
	UTJgjP+fTMCqzQLS9itdKIlxwwM3y7NOD2CTgrKd0yJ5I3Jg5cqw/6PLuhM2pziZFZY/
	ieiWYR3IJjaJo4L82blIvwu8A4tghEfbfGp42760VXQbKlOWmHZ1bQ/Z/6lBDRpek3DV
	6EkNHzEc53SBwERhbIvBPxeUUBjy+QTsc8dCIEszWFZQ/2dztRKFZTx2x8FMAweyTnFt
	2PLR4HZ+gusnGwRIsu9u8t8RtzDiSCCfU3e4i8GZR6SPTvcsUjiMuJitVivOqlB2RVBb
	ugsg==
X-Received: by 10.140.96.101 with SMTP id j92mr5888341qge.87.1418203777954;
	Wed, 10 Dec 2014 01:29:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.18.114 with HTTP; Wed, 10 Dec 2014 01:29:16 -0800 (PST)
In-Reply-To: <20141204225606.GG5113@edge>
References: <CADyYWLnXG+AeQL2OSdrjUQV9W4Q-s4qkBwa+tfRV8KWLhL-E=A@mail.gmail.com>
	<20141204225606.GG5113@edge>
From: sujith h <sujith.h@gmail.com>
Date: Wed, 10 Dec 2014 14:59:16 +0530
Message-ID: <CADyYWLkJj7Ft1dUNJkTn6Nf-r_Hgv9+Mcup6H-SdzYcS231w0Q@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: [meta-ti-amsdk] Query regarding libgles-omap3/5.01.01.01
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
X-List-Received-Date: Wed, 10 Dec 2014 09:29:39 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8a677bc70509d94c0e

--001a113a9d8a677bc70509d94c0e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2014 at 4:26 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, Dec 02, 2014 at 08:24:44PM +0530, sujith h wrote:
> > Hi,
> >
> > I am using the ligbles-omap3/5.01.01.01 for core-image-sato for the
> machine
> > Sitara XAM3359AZCZ100 Cortex A8 ARM processor. And I got Qt5 built for
> the
> > machine ( taken from meta-qt5). I am not able to run opengl examples of
> Qt5
> > and hence as a result the examples from qtdeclarative are also failing.
> The
> > error I get here is:
> >
> > root@mel-am335x-boneblack:/usr/share/qt5/examples#
> > ./opengl/hellowindow/hellowindow -platform xcb Qt Warning: Could not
> find a
> > location of the system's Compose files. Consider setting the QTCOMPOSE
> > environment variable. Qt Warning: Could not find a location of the
> system's
> > Compose files. Consider setting the QTCOMPOSE environment variable. Can=
t
> > find EGLConfig, returning null config Cant find EGLConfig, returning nu=
ll
> > config EGL did not suggest a VisualID (EGL_NATIVE_VISUAL_ID was zero) f=
or
> > EGLConfig 0 Unable to find an X11 visual which matches EGL config 0 Cou=
ld
> > not initialize EGL Aborted root@mel-am335x-boneblack
> :/usr/share/qt5/examples#
> >
> >
> > May I know if the libgles-omap3 5.01.01.01 can be used with X11 or not?
> Or
> > any helpers what could be wrong here? If any more inputs are needed
> please
> > let me know.
>
> X11 is supposed to be supported by 5.1.1.1 graphics stack, but it hasn't
> been
> tested, especially the DRM part. We've switched from Raw framebuffer use
> case
> directly to Wayland one in our SDK products, so no X11 exposure here.
>

If X11 is supported in 5.1.1.1 its a good news. But I am worried if opengl
examples from Qt5 ( 5.3.2 version taken from
meta-qt5 layer)  don't work, then QML won't work for the beaglebone black
board. Any hint or suggestions?


Thanks & regards,

Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a113a9d8a677bc70509d94c0e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Dec 5, 2014 at 4:26 AM, Denys Dmytriyenko <span dir=3D"ltr">&lt=
;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Dec 0=
2, 2014 at 08:24:44PM +0530, sujith h wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am using the ligbles-omap3/<a href=3D"http://5.01.01.01" target=3D"_=
blank">5.01.01.01</a> for core-image-sato for the machine<br>
&gt; Sitara XAM3359AZCZ100 Cortex A8 ARM processor. And I got Qt5 built for=
 the<br>
&gt; machine ( taken from meta-qt5). I am not able to run opengl examples o=
f Qt5<br>
&gt; and hence as a result the examples from qtdeclarative are also failing=
. The<br>
&gt; error I get here is:<br>
&gt;<br>
&gt; root@mel-am335x-boneblack:/usr/share/qt5/examples#<br>
&gt; ./opengl/hellowindow/hellowindow -platform xcb Qt Warning: Could not f=
ind a<br>
&gt; location of the system&#39;s Compose files. Consider setting the QTCOM=
POSE<br>
&gt; environment variable. Qt Warning: Could not find a location of the sys=
tem&#39;s<br>
&gt; Compose files. Consider setting the QTCOMPOSE environment variable. Ca=
nt<br>
&gt; find EGLConfig, returning null config Cant find EGLConfig, returning n=
ull<br>
&gt; config EGL did not suggest a VisualID (EGL_NATIVE_VISUAL_ID was zero) =
for<br>
&gt; EGLConfig 0 Unable to find an X11 visual which matches EGL config 0 Co=
uld<br>
&gt; not initialize EGL Aborted root@mel-am335x-boneblack:/usr/share/qt5/ex=
amples#<br>
&gt;<br>
&gt;<br>
&gt; May I know if the libgles-omap3 5.01.01.01 can be used with X11 or not=
? Or<br>
&gt; any helpers what could be wrong here? If any more inputs are needed pl=
ease<br>
&gt; let me know.<br>
<br>
</span>X11 is supposed to be supported by 5.1.1.1 graphics stack, but it ha=
sn&#39;t been<br>
tested, especially the DRM part. We&#39;ve switched from Raw framebuffer us=
e case<br>
directly to Wayland one in our SDK products, so no X11 exposure here.<br></=
blockquote><div><br></div><div>If X11 is supported in 5.1.1.1 its a good ne=
ws. But I am worried if opengl examples from Qt5 ( 5.3.2 version taken from=
<br></div><div>meta-qt5 layer)=C2=A0 don&#39;t work, then QML won&#39;t wor=
k for the beaglebone black board. Any hint or suggestions?<br><br></div><di=
v><br></div><div>Thanks &amp; regards,<br><br></div><div>Sujith H<br></div>=
</div><br>-- <br><div class=3D"gmail_signature">=E0=B4=B8=E0=B5=81=E0=B4=9C=
=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=
=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to K=
DE project<br><a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" targe=
t=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt=
; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujithh.info</a>=
<br></div>
</div></div>

--001a113a9d8a677bc70509d94c0e--
