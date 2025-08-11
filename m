Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620BDCA0ED1
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 18:48:28 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.55951.1754938102087447189
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 11:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=glofJ1CJ;
 spf=pass (domain: criticallink.com, ip: 209.85.128.182, mailfrom: jcormier@criticallink.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71a455096e0so33673647b3.0
        for <meta-arago@lists.yoctoproject.org>; Mon, 11 Aug 2025 11:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1754938101; x=1755542901; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lYCMjbUEgt/jc1FwBI3EiifjtDpJZJeHCpZz0fiKVC8=;
        b=glofJ1CJOZ5mJWQkpDkPapTlBixVildeAG3IXsmNe01yjuugntQCcw1+M5HQtZpCf4
         4BmD5NjKNE3K/CmJ4nZR3Wo3+uh4EIdozWFYlz0j41pN3/FAK75bGazMUvGtzvxITw6L
         bDZno5ZHA2aBa5tMh3wIFEQr7mhvb6Ur2DUsaBItna10lg33g3adDBJS/k2Fa3g/GNh2
         bnljrN6j/MfzK6803Sdkz0Fd7EO9Y8lvd2ysWcg1+VzCsjVnT0IPi9+CDpcMfb+QoErm
         +jg9H9k6nFJ/k1BPshEQnGJl6NHwMhhC1sAFAqZSIPvLzZqaoiO3PLXbmkoVs8xu2cDF
         KFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754938101; x=1755542901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYCMjbUEgt/jc1FwBI3EiifjtDpJZJeHCpZz0fiKVC8=;
        b=IKoI6yNHwP3rMranXlTOEWmX8vCkTftUKLcZAMUscH1wR/GyguiWF+7Q7/sF1yRj7I
         BmA/WCmsGp8uOU/OS0OHC1NUfq+W/v4KXnqY1RJvLBtCxCBI0jg5NUfPez4DCUhLa7PT
         HJpjBT8rSOJBS9FGpGtYI3uPBgLffh2lPM1xGJb8ZCbihxB/Gt1A+S1D3qnkyHOWN0l7
         zpuMSrvJpi/xidnmiomSrtKLuv/mSZke8wf8+Nyo0hANV3qci4znjb80l+60pYRxHQsL
         cbbEaDNAsPO6eAB4s3bUEjEJsPHysmYE1pRkEDNCQY/L/hkfQy9mii2uRh0IirgQlCt0
         3PYg==
X-Forwarded-Encrypted: i=1; AJvYcCX1/2KevhjJbeo2vnJk/ZQTa3kIATdlFSNSGYSovaWHvR7Puh/LI4/mPyephoExxLYMF3ZT7bjtm7J9@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy0uFCs3IR6XSvmTNsBx0A/3bQ/6ftSjZBMe/xDN++Up7fy/4ve
	ZEYENI2usZX3TO7M3DGgwnig/iXO6OEl4RccjcpCzaGMC+/0H7DERvyXr7uSgX5dPT2bfe/nWK5
	M+x7pJDgWVNxyd//Z+Yq0bVVBMhCh4Pm/I20jqAQX
X-Gm-Gg: ASbGncu31bmH12VCqiDCIJBdqj/i2sBsdYKCFmN2oebE3c8fmLTCAHeLweQrLYESEiX
	da+4bTgymWguUTW1Dgyix4SzCwMBWgDkkKG55AfsIbeO86YSMeX3n8rFamULVLrw9t9dAkl8Bav
	5ISSiPmpDOnHEbuWbElAnxBjFr4fQp58X0bQEGmAJsBR8VBDWk9RRxH9OtlXNHJ1vGkplWkFZ85
	2dlsQ==
X-Google-Smtp-Source: AGHT+IHq6hjKR5uhI9EMRQLaNmfQky8CJGzVycf8uUVMMRkkMBtCFcEXS2YN8QHBS4pt4SYYkxaRbnKbtadNvvTC9B4=
X-Received: by 2002:a05:690c:d95:b0:70c:c013:f26 with SMTP id
 00721157ae682-71bf0e78fa9mr186469817b3.33.1754938101187; Mon, 11 Aug 2025
 11:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250811173948.19890-1-reatmon@ti.com> <20250811183701.GX24899@denix.org>
In-Reply-To: <20250811183701.GX24899@denix.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 11 Aug 2025 14:48:09 -0400
X-Gm-Features: Ac12FXyMtRVLQyClIn4w4WPTyKIbpKks1uvFC6nDEQodRPZtNxjhBdLmLr0BCjg
Message-ID: <CADL8D3ajmW8csz51VBMv6PWxhE95dq6c3GVjCE0aaca+cpKjkg@mail.gmail.com>
Subject: Re: [meta-arago][master][PATCH] arago: Pull in the Yocto space
 optimization settings
To: denis@denix.org
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>, 
	meta-arago@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000001fd764063c1b5e31"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Aug 2025 18:48:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16360

--0000000000001fd764063c1b5e31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 2:37=E2=80=AFPM Denys Dmytriyenko via lists.yoctopr=
oject.org
<denis=3Ddenix.org@lists.yoctoproject.org> wrote:

> On Mon, Aug 11, 2025 at 12:39:48PM -0500, Ryan Eatmon via
> lists.yoctoproject.org wrote:
> > Turns out there is a .inc file in oe-core that sets some variables to
> > reduce the amount of space that a build takes up based on common
> > criteria.  Poky explicitly includes this file, but it is not included b=
y
> > default.  So we need to include it as well.
>
> Just a note:
>
> It is a bit of a confusing name - it doesn't optimize all target binaries
> for
> space (vs. speed). What this .inc file does - it completely disables
> debugging
> output (which would otherwise be stripped into -dbg packages) during the
> build for a handful of components, such as all versions of clang (used to
> be
> llvm) and qemu. Those do generate a lot of debug data. The point is to
> save
> storage space and a bit of build time on autobuilder, assuming that nobod=
y
> will be trying to debug those tools.
>
Thanks, this is really useful additional info.

On a slight tangent, any idea why arago builds don't enable rm_work by
default?  In our testings, it speeds up builds slightly, greatly reduces
space usage, and more importantly makes deleting the work dir way way
faster. With the only downside being occasionally you need to add
RM_WORK_EXCLUDES when debugging a build failure.

>
>
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/arago.conf | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-arago-distro/conf/distro/arago.conf
> b/meta-arago-distro/conf/distro/arago.conf
> > index 8e45ca53..1ad4b4ce 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -6,6 +6,8 @@ BUILD_VARIANT =3D
> "${@['prod','rt'][int(d.getVar('ARAGO_RT_ENABLE'))]}"
> >  TISDK_VERSION ?=3D "live"
> >  FEEDURIPREFIX ?=3D
> "builds/${DISTRO}-master/${BUILD_VARIANT}/${MACHINE}/latest/packages/"
> >
> > +require conf/distro/include/yocto-space-optimize.inc
> > +
> >  OPKG_ARGS:remove =3D "--prefer-arch-to-version"
> >
> >  TI_MIRROR =3D "http://software-dl.ti.com/processor-sdk-mirror/sources/=
"
> > --
> > 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16359):
> https://lists.yoctoproject.org/g/meta-arago/message/16359
> Mute This Topic: https://lists.yoctoproject.org/mt/114651955/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211
<https://twitter.com/Critical_Link>

--0000000000001fd764063c1b5e31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 11,=
 2025 at 2:37=E2=80=AFPM Denys Dmytriyenko via <a href=3D"http://lists.yoct=
oproject.org">lists.yoctoproject.org</a> &lt;denis=3D<a href=3D"mailto:deni=
x.org@lists.yoctoproject.org">denix.org@lists.yoctoproject.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Aug 1=
1, 2025 at 12:39:48PM -0500, Ryan Eatmon via <a href=3D"http://lists.yoctop=
roject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a>=
 wrote:<br>
&gt; Turns out there is a .inc file in oe-core that sets some variables to<=
br>
&gt; reduce the amount of space that a build takes up based on common<br>
&gt; criteria.=C2=A0 Poky explicitly includes this file, but it is not incl=
uded by<br>
&gt; default.=C2=A0 So we need to include it as well.<br>
<br>
Just a note:<br>
<br>
It is a bit of a confusing name - it doesn&#39;t optimize all target binari=
es for <br>
space (vs. speed). What this .inc file does - it completely disables debugg=
ing <br>
output (which would otherwise be stripped into -dbg packages) during the <b=
r>
build for a handful of components, such as all versions of clang (used to b=
e <br>
llvm) and qemu. Those do generate a lot of debug data. The point is to save=
 <br>
storage space and a bit of build time on autobuilder, assuming that nobody =
<br>
will be trying to debug those tools.<br></blockquote><div>Thanks, this is r=
eally useful additional info.=C2=A0 =C2=A0</div><div><br></div><div>On a sl=
ight tangent, any idea why arago builds don&#39;t enable rm_work by default=
?=C2=A0 In our testings, it speeds up builds slightly, greatly reduces spac=
e usage, and more importantly makes deleting the work dir way way faster. W=
ith the only downside being occasionally you need to add RM_WORK_EXCLUDES w=
hen debugging a build failure.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
&gt; Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" targe=
t=3D"_blank">reatmon@ti.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-arago-distro/conf/distro/arago.conf | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-dis=
tro/conf/distro/arago.conf<br>
&gt; index 8e45ca53..1ad4b4ce 100644<br>
&gt; --- a/meta-arago-distro/conf/distro/arago.conf<br>
&gt; +++ b/meta-arago-distro/conf/distro/arago.conf<br>
&gt; @@ -6,6 +6,8 @@ BUILD_VARIANT =3D &quot;${@[&#39;prod&#39;,&#39;rt&#39=
;][int(d.getVar(&#39;ARAGO_RT_ENABLE&#39;))]}&quot;<br>
&gt;=C2=A0 TISDK_VERSION ?=3D &quot;live&quot;<br>
&gt;=C2=A0 FEEDURIPREFIX ?=3D &quot;builds/${DISTRO}-master/${BUILD_VARIANT=
}/${MACHINE}/latest/packages/&quot;<br>
&gt;=C2=A0 <br>
&gt; +require conf/distro/include/yocto-space-optimize.inc<br>
&gt; +<br>
&gt;=C2=A0 OPKG_ARGS:remove =3D &quot;--prefer-arch-to-version&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 TI_MIRROR =3D &quot;<a href=3D"http://software-dl.ti.com/process=
or-sdk-mirror/sources/" rel=3D"noreferrer" target=3D"_blank">http://softwar=
e-dl.ti.com/processor-sdk-mirror/sources/</a>&quot;<br>
&gt; -- <br>
&gt; 2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#16359): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/16359" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-arago/message/16359</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/114651955/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/114651955/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproject.org" t=
arget=3D"_blank">meta-arago+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arago/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-=
arago/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_bl=
ank">jcormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D=
"ltr"><div><div dir=3D"ltr"><div>Jonathan Cormier<br>Senior Software Engine=
er<div><div><div><div><br></div><div><div><font color=3D"#000000">Voice:=C2=
=A0=C2=A0<a value=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><=
div><div><div style=3D"color:rgb(32,33,36)"><div><div><img src=3D"https://c=
i3.googleusercontent.com/mail-sig/AIorK4yQnmPDndAobohgnFohw9o8lcMLmEVCOkbl-=
k9wp4xfgM_Qz53XJlRK_dxYVNdYFLq8DCe6bY4Zl_a0"><br></div><div><div><a href=3D=
"http://www.criticallink.com/" target=3D"_blank">http://www.CriticalLink.co=
m</a></div></div></div><div>6712 Brooklawn Parkway,=C2=A0Syracuse, NY 13211=
 <font color=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://twitter=
.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=3D"https://docs.goo=
gle.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1yWERrLXE0SnM&amp;revi=
d=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ"></a></font></font>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div>

--0000000000001fd764063c1b5e31--

