Return-Path: <sujith.h@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by arago-project.org (Postfix) with ESMTPS id 36DD5529D3
	for <meta-arago@arago-project.org>;
	Thu, 11 Dec 2014 13:28:03 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id m20so3799629qcx.17
	for <meta-arago@arago-project.org>;
	Thu, 11 Dec 2014 05:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+Q3F6mrBeEG3beI5ixSpJ/eTrsnVODmMweT09kfd25o=;
	b=G5BMgwCaL0jgTBy/3dnBo3/AeIluWjY7O5u4Y0YSHIdVtRq0kecy0wvgIHWuRPRxhe
	GMf6b3oOI1f5cfBGqMueVJ9vM4eoTLKsBQ9ep1sE/bVoMmXU+63X7PE9HGJrOkZaG0pj
	sjysnX3tmNYiniCisOls4JEoaNmQyaKk/jbmJgPbtxhQO94SdY9pQL/DjYawWarMcC6H
	MmRJJk+xpgIhcrF77wPBvt5GCunszErFE4D60quFwJNwDfL5SoeXPtEq81VN0QdwgHld
	uXadBOhA+UhWM88VLeg5YUs1RM57I+wYp+O6Sjalg4d+UlsUAgzJ+3hx/CMJHjHW1jNf
	M6jg==
X-Received: by 10.140.96.101 with SMTP id j92mr18565295qge.87.1418304481934;
	Thu, 11 Dec 2014 05:28:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.91.201 with HTTP; Thu, 11 Dec 2014 05:27:41 -0800 (PST)
In-Reply-To: <20141210204530.GL5113@edge>
References: <CADyYWLnXG+AeQL2OSdrjUQV9W4Q-s4qkBwa+tfRV8KWLhL-E=A@mail.gmail.com>
	<20141204225606.GG5113@edge>
	<CADyYWLkJj7Ft1dUNJkTn6Nf-r_Hgv9+Mcup6H-SdzYcS231w0Q@mail.gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C7AB423@DFLE08.ent.ti.com>
	<20141210204530.GL5113@edge>
From: sujith h <sujith.h@gmail.com>
Date: Thu, 11 Dec 2014 18:57:41 +0530
Message-ID: <CADyYWLk-+yddWHG8AhGvUYw_LbYmcSjykChmWnFhne8MGTcy-g@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
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
X-List-Received-Date: Thu, 11 Dec 2014 13:28:04 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8ad4527c0509f0be6c

--001a113a9d8ad4527c0509f0be6c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2014 at 2:15 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> Yes, it was giving some drm-related build issues with recent kernels. But
> X11
> support wasn't specifically removed, it was just never tested or even use=
d
> lately. That's what I was trying to say in the original email.
>

I was wondering if anyone would have faced the same issue I am facing or if
any solution/work around would have been there
for opengl examples of Qt 5.3.2 working on x11. Because I am able to run
many of Qt examples with libgles-omap3/5.1.1.1.
When it comes to opengl I am facing the issue. I am also able to run the
matchbox on the board successfully.


> --
> Denys
>
>
> On Wed, Dec 10, 2014 at 03:22:29PM -0500, Cooper Jr., Franklin wrote:
> >    X11 isn't suppose to be supported in the last Graphics package and
> >    honestly I thought it hasn't been supported for several releases.
> >
> >
> >
> >
> http://processors.wiki.ti.com/index.php/RN_5_01_01_01#What_is_not_support=
ed
> >
> >
> >
> >    I thought it was to the point that trying to build with X11 support
> will
> >    throw errors.
> >
> >
> >
> >    From: meta-arago-bounces@arago-project.org
> >    [mailto:meta-arago-bounces@arago-project.org] On Behalf Of sujith h
> >    Sent: Wednesday, December 10, 2014 3:29 AM
> >    To: Dmytriyenko, Denys
> >    Cc: meta-arago@arago-project.org
> >    Subject: Re: [meta-arago] [meta-ti-amsdk] Query regarding
> >    libgles-omap3/5.01.01.01
> >
> >
> >
> >
> >
> >
> >
> >    On Fri, Dec 5, 2014 at 4:26 AM, Denys Dmytriyenko <denys@ti.com>
> wrote:
> >
> >    On Tue, Dec 02, 2014 at 08:24:44PM +0530, sujith h wrote:
> >    > Hi,
> >    >
> >    > I am using the ligbles-omap3/5.01.01.01 for core-image-sato for th=
e
> >    machine
> >    > Sitara XAM3359AZCZ100 Cortex A8 ARM processor. And I got Qt5 built
> for
> >    the
> >    > machine ( taken from meta-qt5). I am not able to run opengl
> examples of
> >    Qt5
> >    > and hence as a result the examples from qtdeclarative are also
> failing.
> >    The
> >    > error I get here is:
> >    >
> >    > root@mel-am335x-boneblack:/usr/share/qt5/examples#
> >    > ./opengl/hellowindow/hellowindow -platform xcb Qt Warning: Could n=
ot
> >    find a
> >    > location of the system's Compose files. Consider setting the
> QTCOMPOSE
> >    > environment variable. Qt Warning: Could not find a location of the
> >    system's
> >    > Compose files. Consider setting the QTCOMPOSE environment variable=
.
> Cant
> >    > find EGLConfig, returning null config Cant find EGLConfig, returni=
ng
> >    null
> >    > config EGL did not suggest a VisualID (EGL_NATIVE_VISUAL_ID was
> zero)
> >    for
> >    > EGLConfig 0 Unable to find an X11 visual which matches EGL config =
0
> >    Could
> >    > not initialize EGL Aborted
> >    root@mel-am335x-boneblack:/usr/share/qt5/examples#
> >    >
> >    >
> >    > May I know if the libgles-omap3 5.01.01.01 can be used with X11 or
> not?
> >    Or
> >    > any helpers what could be wrong here? If any more inputs are neede=
d
> >    please
> >    > let me know.
> >
> >    X11 is supposed to be supported by 5.1.1.1 graphics stack, but it
> hasn't
> >    been
> >    tested, especially the DRM part. We've switched from Raw framebuffer
> use
> >    case
> >    directly to Wayland one in our SDK products, so no X11 exposure here=
.
> >
> >
> >
> >    If X11 is supported in 5.1.1.1 its a good news. But I am worried if
> opengl
> >    examples from Qt5 ( 5.3.2 version taken from
> >
> >    meta-qt5 layer)  don't work, then QML won't work for the beaglebone
> black
> >    board. Any hint or suggestions?
> >
> >
> >
> >    Thanks & regards,
> >
> >    Sujith H
> >
> >    --
> >
> >    ****************** ************************
> >    Bangalore
> >    <Project>Contributor to KDE project
> >    http://fci.wikia.com/wiki/Anti-DRM-Campaign
> >    <Blog> http://sujithh.info
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a113a9d8ad4527c0509f0be6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Dec 11, 2014 at 2:15 AM, Denys Dmytriyenko <span dir=3D"ltr">&l=
t;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Yes, it was giving some drm-r=
elated build issues with recent kernels. But X11<br>
support wasn&#39;t specifically removed, it was just never tested or even u=
sed<br>
lately. That&#39;s what I was trying to say in the original email.<br></blo=
ckquote><div><br></div><div>I was wondering if anyone would have faced the =
same issue I am facing or if any solution/work around would have been there=
<br></div><div>for opengl examples of Qt 5.3.2 working on x11. Because I am=
 able to run many of Qt examples with libgles-omap3/<a href=3D"http://5.1.1=
.1">5.1.1.1</a>. <br></div><div>When it comes to opengl I am facing the iss=
ue. I am also able to run the matchbox on the board successfully.<br><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span><div><div class=3D"h5"><br>
<br>
On Wed, Dec 10, 2014 at 03:22:29PM -0500, Cooper Jr., Franklin wrote:<br>
&gt;=C2=A0 =C2=A0 X11 isn&#39;t suppose to be supported in the last Graphic=
s package and<br>
&gt;=C2=A0 =C2=A0 honestly I thought it hasn&#39;t been supported for sever=
al releases.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 <a href=3D"http://processors.wiki.ti.com/index.php/RN_5_0=
1_01_01#What_is_not_supported" target=3D"_blank">http://processors.wiki.ti.=
com/index.php/RN_5_01_01_01#What_is_not_supported</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 I thought it was to the point that trying to build with X=
11 support will<br>
&gt;=C2=A0 =C2=A0 throw errors.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 From: <a href=3D"mailto:meta-arago-bounces@arago-project.=
org">meta-arago-bounces@arago-project.org</a><br>
&gt;=C2=A0 =C2=A0 [mailto:<a href=3D"mailto:meta-arago-bounces@arago-projec=
t.org">meta-arago-bounces@arago-project.org</a>] On Behalf Of sujith h<br>
&gt;=C2=A0 =C2=A0 Sent: Wednesday, December 10, 2014 3:29 AM<br>
&gt;=C2=A0 =C2=A0 To: Dmytriyenko, Denys<br>
&gt;=C2=A0 =C2=A0 Cc: <a href=3D"mailto:meta-arago@arago-project.org">meta-=
arago@arago-project.org</a><br>
&gt;=C2=A0 =C2=A0 Subject: Re: [meta-arago] [meta-ti-amsdk] Query regarding=
<br>
&gt;=C2=A0 =C2=A0 libgles-omap3/<a href=3D"http://5.01.01.01" target=3D"_bl=
ank">5.01.01.01</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 On Fri, Dec 5, 2014 at 4:26 AM, Denys Dmytriyenko &lt;<a =
href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 On Tue, Dec 02, 2014 at 08:24:44PM +0530, sujith h wrote:=
<br>
&gt;=C2=A0 =C2=A0 &gt; Hi,<br>
&gt;=C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 &gt; I am using the ligbles-omap3/<a href=3D"http://5.01.=
01.01" target=3D"_blank">5.01.01.01</a> for core-image-sato for the<br>
&gt;=C2=A0 =C2=A0 machine<br>
&gt;=C2=A0 =C2=A0 &gt; Sitara XAM3359AZCZ100 Cortex A8 ARM processor. And I=
 got Qt5 built for<br>
&gt;=C2=A0 =C2=A0 the<br>
&gt;=C2=A0 =C2=A0 &gt; machine ( taken from meta-qt5). I am not able to run=
 opengl examples of<br>
&gt;=C2=A0 =C2=A0 Qt5<br>
&gt;=C2=A0 =C2=A0 &gt; and hence as a result the examples from qtdeclarativ=
e are also failing.<br>
&gt;=C2=A0 =C2=A0 The<br>
&gt;=C2=A0 =C2=A0 &gt; error I get here is:<br>
&gt;=C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 &gt; root@mel-am335x-boneblack:/usr/share/qt5/examples#<b=
r>
&gt;=C2=A0 =C2=A0 &gt; ./opengl/hellowindow/hellowindow -platform xcb Qt Wa=
rning: Could not<br>
&gt;=C2=A0 =C2=A0 find a<br>
&gt;=C2=A0 =C2=A0 &gt; location of the system&#39;s Compose files. Consider=
 setting the QTCOMPOSE<br>
&gt;=C2=A0 =C2=A0 &gt; environment variable. Qt Warning: Could not find a l=
ocation of the<br>
&gt;=C2=A0 =C2=A0 system&#39;s<br>
&gt;=C2=A0 =C2=A0 &gt; Compose files. Consider setting the QTCOMPOSE enviro=
nment variable. Cant<br>
&gt;=C2=A0 =C2=A0 &gt; find EGLConfig, returning null config Cant find EGLC=
onfig, returning<br>
&gt;=C2=A0 =C2=A0 null<br>
&gt;=C2=A0 =C2=A0 &gt; config EGL did not suggest a VisualID (EGL_NATIVE_VI=
SUAL_ID was zero)<br>
&gt;=C2=A0 =C2=A0 for<br>
&gt;=C2=A0 =C2=A0 &gt; EGLConfig 0 Unable to find an X11 visual which match=
es EGL config 0<br>
&gt;=C2=A0 =C2=A0 Could<br>
&gt;=C2=A0 =C2=A0 &gt; not initialize EGL Aborted<br>
&gt;=C2=A0 =C2=A0 root@mel-am335x-boneblack:/usr/share/qt5/examples#<br>
&gt;=C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 &gt; May I know if the libgles-omap3 5.01.01.01 can be us=
ed with X11 or not?<br>
&gt;=C2=A0 =C2=A0 Or<br>
&gt;=C2=A0 =C2=A0 &gt; any helpers what could be wrong here? If any more in=
puts are needed<br>
&gt;=C2=A0 =C2=A0 please<br>
&gt;=C2=A0 =C2=A0 &gt; let me know.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 X11 is supposed to be supported by 5.1.1.1 graphics stack=
, but it hasn&#39;t<br>
&gt;=C2=A0 =C2=A0 been<br>
&gt;=C2=A0 =C2=A0 tested, especially the DRM part. We&#39;ve switched from =
Raw framebuffer use<br>
&gt;=C2=A0 =C2=A0 case<br>
&gt;=C2=A0 =C2=A0 directly to Wayland one in our SDK products, so no X11 ex=
posure here.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 If X11 is supported in 5.1.1.1 its a good news. But I am =
worried if opengl<br>
&gt;=C2=A0 =C2=A0 examples from Qt5 ( 5.3.2 version taken from<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 meta-qt5 layer)=C2=A0 don&#39;t work, then QML won&#39;t =
work for the beaglebone black<br>
&gt;=C2=A0 =C2=A0 board. Any hint or suggestions?<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Thanks &amp; regards,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Sujith H<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 --<br>
&gt;<br>
</div></div>&gt;=C2=A0 =C2=A0 ****************** ************************<b=
r>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;=C2=A0 =C2=A0 Bangalore<br>
&gt;=C2=A0 =C2=A0 &lt;Project&gt;Contributor to KDE project<br>
&gt;=C2=A0 =C2=A0 <a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" t=
arget=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>
&gt;=C2=A0 =C2=A0 &lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_b=
lank">http://sujithh.info</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature">=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D=
 =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<b=
r>Bangalore<br>&lt;Project&gt;Contributor to KDE project<br><a href=3D"http=
://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wikia=
.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh.i=
nfo" target=3D"_blank">http://sujithh.info</a><br></div>
</div></div>

--001a113a9d8ad4527c0509f0be6c--
