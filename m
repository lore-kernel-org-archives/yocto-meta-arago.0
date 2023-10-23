Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F57C25B45
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 19:36:44 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.130788.1698089800430997417
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Oct 2023 12:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=CXPeDGOX;
 spf=pass (domain: criticallink.com, ip: 209.85.167.53, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507a29c7eefso5507997e87.1
        for <meta-arago@lists.yoctoproject.org>; Mon, 23 Oct 2023 12:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1698089798; x=1698694598; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4QlyoBkkCDFZF5RJ4iG9elZjEmI7eL87h7UGn5/7xIg=;
        b=CXPeDGOX8P30MwslEPb/tSjTEqPFEI/dQq+pnXa9ejWxFBBcklv3PEKIfww6kaCFan
         psPpW1iDA4W9CgvveNEk7ofAyQrKxMmO9g9klTJfn2lwtImWnUgNj31MMxznExcIC4xL
         MtR7OmbRz3wNwIsQOAKze0ozWYKxigR4FNR6yIFeCbQvP1uZmmlv7BR6EK02njA947Xu
         kySu18uMsLqX5Jl3K0ePYcbFxZM2tV72H5GYI7k+BJqWTApbR1T0x92iI/kvZ7gmfVQH
         Y+kppSIKaDm24BszBntB0O5Kpdw+wBSLruTL9W35/zSv3hLXcQs+BlR1zdVggqityyP7
         /qsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698089798; x=1698694598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QlyoBkkCDFZF5RJ4iG9elZjEmI7eL87h7UGn5/7xIg=;
        b=cRihT+anOdXibM7H7gc8ZRlofcrdkpf96cZGPlu5Pr7Z1XBFe69MM5T7NfAjOIOmnn
         6O5Mh6iSO93F8H+Iprfgdmob16xU7avNfiuko158eIHpAifqVFCuc7iTsxFnI1FhhUMt
         M5akztOZ8woPIOOVeZ3YWeFt+xuK4UP73LgIiKSaO1RORFb5mWWw1/kF6/WgTNNPX8i2
         z8WyWIWurRKf6wP6Li34XhZRb0yAqDAlfONCYSBx+ayrJZCs1CmvEYT2spKAxGk3WvmI
         LfJvvMdHIOxoRCgFw8sDDZElvV86Z0wjZ3EXjNw//Nzofwz2I7U7IKFaucLnLHxekEVL
         NnFQ==
X-Gm-Message-State: AOJu0Yw/IqPoFMr67khPxU8I08ypH5aZqxpDEg3Lb3MWfhDh3oTfdEh6
	rwuMgy75/E4AE8a6ZlI3EeK6EHmo/Iu4GURu7CW8MA==
X-Google-Smtp-Source: AGHT+IF4gqAl+CZTXo547GTYn1k5YDsOJhfO0lzlTXsXSNcJyeN6OTDf8kEg9AdpATDl96Ce1JSeqIkwCFNIm+pq8B4=
X-Received: by 2002:a05:6512:50b:b0:505:7371:ec83 with SMTP id
 o11-20020a056512050b00b005057371ec83mr6738541lfb.48.1698089798217; Mon, 23
 Oct 2023 12:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231022130905.3962948-1-s-adivi@ti.com> <20231023180947.GU2408@denix.org>
In-Reply-To: <20231023180947.GU2408@denix.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 23 Oct 2023 15:36:26 -0400
Message-ID: <CADL8D3YfP+QNEcb0wWb=7S3sF2ZFTOo_SZZrpDTAuWshwoAXEg@mail.gmail.com>
Subject: Re: [meta-arago][kirkstone][PATCH] matrix-gui: move script from
 /etc/init.d to data dir.
To: Denys Dmytriyenko <denis@denix.org>
Cc: Sai Sree Kartheek Adivi <s-adivi@ti.com>, meta-arago@lists.yoctoproject.org, praneeth@ti.com, 
	reatmon@ti.com, c-shilwant@ti.com, a-limaye@ti.com, g-gupta@ti.com, 
	khasim@ti.com, p-bhagat@ti.com
Content-Type: multipart/alternative; boundary="000000000000384d9a06086757a5"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Oct 2023 19:36:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14968

--000000000000384d9a06086757a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 2:10=E2=80=AFPM Denys Dmytriyenko <denis@denix.org>=
 wrote:

> On Sun, Oct 22, 2023 at 06:39:05PM +0530, Sai Sree Kartheek Adivi wrote:
> > since sysvinit is deprecated, avoid installing scripts in sysvinit.
> > Use data dir to install scripts which need to be called by the systemd
> services.
>
> Well, sysvinit is not deprecated - it's still an option. With this change
> nobody would be able to use Matrix with sysvinit-enabled distro anymore?
>
> A better approach would be to have a dedicated and independent systemd
> unit
> file that doesn't call the sysvinit counterpart. And then make the instal=
l
> steps below conditional on INIT_MANAGER variable or corresponding flag in
> the
> DISTRO_FEATURES lsit...
>
Agreed.

Also while you're working on the systemd service file.  It needs to depend
on lighttpd.service, otherwise it's possible for the matrix browser to
launch before the webserver is ready, and you get a 404.
https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1=
246859/am3358-sdk-08_02_00_24-matrix-gui-2-0-service-loads-with-a-404-error

>
>
> > Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> > ---
> >  .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service      | 2 +-
> >  meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb         | 3 +--
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git
> a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> > index 40a8f0f9..84e9195b 100644
> > ---
> a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> > +++
> b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
> > @@ -12,7 +12,7 @@ IgnoreSIGPIPE=3Dno
> >  KillMode=3Dprocess
> >  GuessMainPID=3Dno
> >  RemainAfterExit=3Dyes
> > -ExecStart=3D/etc/init.d/matrix-gui-2.0 start
> > +ExecStart=3D/usr/share/matrix-gui-2.0/matrix-gui-2.0 start
> >
> >  [Install]
> >  WantedBy=3Dmulti-user.target
> > diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
> b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
> > index 9299a929..18ccc0c9 100644
> > --- a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
> > +++ b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
> > @@ -50,8 +50,7 @@ do_install(){
> >       sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/"
> ${WORKDIR}/${MATRIX_INITSCRIPT}
> >
> >       # Install the script
> > -     install -d ${D}${sysconfdir}/init.d
> > -     install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT}
> ${D}${sysconfdir}/init.d/matrix-gui-2.0
> > +     install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT}
> ${D}${MATRIX_BASE_DIR}/matrix-gui-2.0
> >
> >       # Install the systemd unit file
> >       install -d ${D}${systemd_system_unitdir}
> > --
> > 2.34.1
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14967):
> https://lists.yoctoproject.org/g/meta-arago/message/14967
> Mute This Topic: https://lists.yoctoproject.org/mt/102115715/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-arago/leave/12684784/7902621/525442=
147/xyzzy
> [jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

<https://www.linkedin.com/company/critical-link-llc>
<https://twitter.com/Critical_Link>

--000000000000384d9a06086757a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Oct 23, 2023 at 2:10=E2=80=AFPM Denys Dmytriyenko &lt;<a=
 href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Oct 22, 2023 at 06:=
39:05PM +0530, Sai Sree Kartheek Adivi wrote:<br>
&gt; since sysvinit is deprecated, avoid installing scripts in sysvinit.<br=
>
&gt; Use data dir to install scripts which need to be called by the systemd=
 services.<br>
<br>
Well, sysvinit is not deprecated - it&#39;s still an option. With this chan=
ge <br>
nobody would be able to use Matrix with sysvinit-enabled distro anymore?<br=
>
<br>
A better approach would be to have a dedicated and independent systemd unit=
 <br>
file that doesn&#39;t call the sysvinit counterpart. And then make the inst=
all <br>
steps below conditional on INIT_MANAGER variable or corresponding flag in t=
he <br>
DISTRO_FEATURES lsit...<br></blockquote><div>Agreed.</div><div><br></div><d=
iv>Also while you&#39;re working on the systemd service file.=C2=A0 It need=
s to depend on lighttpd.service, otherwise it&#39;s possible for the matrix=
 browser to launch before the webserver is ready, and you get a 404.</div><=
div><a href=3D"https://e2e.ti.com/support/processors-group/processors/f/pro=
cessors-forum/1246859/am3358-sdk-08_02_00_24-matrix-gui-2-0-service-loads-w=
ith-a-404-error">https://e2e.ti.com/support/processors-group/processors/f/p=
rocessors-forum/1246859/am3358-sdk-08_02_00_24-matrix-gui-2-0-service-loads=
-with-a-404-error</a> <br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
<br>
&gt; Signed-off-by: Sai Sree Kartheek Adivi &lt;<a href=3D"mailto:s-adivi@t=
i.com" target=3D"_blank">s-adivi@ti.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service=C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 meta-arago-demos/recipes-core/matrix/<a href=3D"http://matrix-gu=
i_2.0.bb" rel=3D"noreferrer" target=3D"_blank">matrix-gui_2.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +--<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gu=
i-2.0.service b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-=
2.0.service<br>
&gt; index 40a8f0f9..84e9195b 100644<br>
&gt; --- a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.s=
ervice<br>
&gt; +++ b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.s=
ervice<br>
&gt; @@ -12,7 +12,7 @@ IgnoreSIGPIPE=3Dno<br>
&gt;=C2=A0 KillMode=3Dprocess<br>
&gt;=C2=A0 GuessMainPID=3Dno<br>
&gt;=C2=A0 RemainAfterExit=3Dyes<br>
&gt; -ExecStart=3D/etc/init.d/matrix-gui-2.0 start<br>
&gt; +ExecStart=3D/usr/share/matrix-gui-2.0/matrix-gui-2.0 start<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 [Install]<br>
&gt;=C2=A0 WantedBy=3Dmulti-user.target<br>
&gt; diff --git a/meta-arago-demos/recipes-core/matrix/<a href=3D"http://ma=
trix-gui_2.0.bb" rel=3D"noreferrer" target=3D"_blank">matrix-gui_2.0.bb</a>=
 b/meta-arago-demos/recipes-core/matrix/<a href=3D"http://matrix-gui_2.0.bb=
" rel=3D"noreferrer" target=3D"_blank">matrix-gui_2.0.bb</a><br>
&gt; index 9299a929..18ccc0c9 100644<br>
&gt; --- a/meta-arago-demos/recipes-core/matrix/<a href=3D"http://matrix-gu=
i_2.0.bb" rel=3D"noreferrer" target=3D"_blank">matrix-gui_2.0.bb</a><br>
&gt; +++ b/meta-arago-demos/recipes-core/matrix/<a href=3D"http://matrix-gu=
i_2.0.bb" rel=3D"noreferrer" target=3D"_blank">matrix-gui_2.0.bb</a><br>
&gt; @@ -50,8 +50,7 @@ do_install(){<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s/__SWITCH_FOREGROUND_VT__/$=
{SWITCH_FOREGROUND_VT}/&quot; ${WORKDIR}/${MATRIX_INITSCRIPT}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Install the script<br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/init.d<br>
&gt; -=C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} $=
{D}${sysconfdir}/init.d/matrix-gui-2.0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} $=
{D}${MATRIX_BASE_DIR}/matrix-gui-2.0<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Install the systemd unit file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_system_unitdir}<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#14967): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/14967" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-arago/message/14967</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/102115715/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/102115715/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproject.org" t=
arget=3D"_blank">meta-arago+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arago/leave/1=
2684784/7902621/525442147/xyzzy" rel=3D"noreferrer" target=3D"_blank">https=
://lists.yoctoproject.org/g/meta-arago/leave/12684784/7902621/525442147/xyz=
zy</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_blank">jcor=
mier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div><font color=3D"#000000">Voice:=C2=A0=C2=A0<a value=
=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><div><font color=
=3D"#000000"><br></font></div><div><font color=3D"#000000"><img src=3D"http=
s://ci3.googleusercontent.com/mail-sig/AIorK4xml75fJPKYF7M9X5Dux4IrbtzZk0RB=
6jf8iBYuPQKArrkBkOkU4HJ2rP7eH6d2h7_ituMWEBc"><br></font></div></div></div><=
div><div><font color=3D"#1155cc"><br></font></div><div><a href=3D"http://ww=
w.criticallink.com/" target=3D"_blank"><font color=3D"#1155cc">http://www.C=
riticalLink.com</font></a><br></div><div>6712 Brooklawn Parkway,=C2=A0Syrac=
use, NY 13211=C2=A0</div></div></div><div><div><br></div><div><font color=
=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://www.linkedin.com/co=
mpany/critical-link-llc" target=3D"_blank"><img src=3D"https://docs.google.=
com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=3D=
0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>=C2=A0=C2=A0<a hre=
f=3D"https://twitter.com/Critical_Link" target=3D"_blank"><img alt=3D"" src=
=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6cU1y=
WERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9jPQ=
"></a></font></font></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div>

--000000000000384d9a06086757a5--

