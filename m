Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4BBC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 16:01:08 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.2651.1698768061845865962
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 09:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=d4XfqeMP;
 spf=pass (domain: criticallink.com, ip: 209.85.167.48, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-507bd64814fso8018311e87.1
        for <meta-arago@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1698768060; x=1699372860; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rvd5JEEzhZqQRFiTi4Ax52hhIgeoWTgU0K7stMtPI+w=;
        b=d4XfqeMPqpVj3v4S83rVyniwFEAtC5309eJuPVz9fdCj7ClOTD4b90WYx0ceboYeLP
         4S6F9iBKIeUN+uR89bnw5eDSMBr+EmtXjJ07BlMjQkcHsAOxaM3Qwix0+xZIXX6pwxTk
         lvEGI7O+KKgf4ZrPx7mwYoFWF2qXozGbPfzDsRcvOqg06GMmxeAVSkgRHQRvenf8LZma
         AkTef/qarWhOYog6oeIdMh9IPe/SkpuHi8fDrWJWSVCAkrhm9/8neW4guMJDoaoKKL+G
         L85uEWmnv15hn714NpaFmkcCe3S0eD8EaOhEsfgvkiQ/QKHduRUCU6ZfLVqEWFToHE05
         KUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698768060; x=1699372860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvd5JEEzhZqQRFiTi4Ax52hhIgeoWTgU0K7stMtPI+w=;
        b=lPVE8QAx/61hKmKqMI1fa1QbfwL5SRZJoLPEI58nqozMTCKGzAXvtF89oG5UjaJRn+
         NaEJTVvOWfeRpUJp8sJSMoIq9MIVjUyhJyXbJK5yqfL98FZKT7OW1RuDa8KGAffa5AUj
         aKXbOYgAWFhWnRshSa0SFdldCFzTEQLZMyYkPfgfsbslQvmBHF4ngr+QjH3pvw4HI2Q6
         03eYdvS45uKTnO6MmbVqEQD8I3ALyxlg+G8f/K4jTK0uhqHxKey+5D0UzL71EcF0iJgm
         UynAiNEP34QmaCYJsMBNxBVfpWF5p3i1gUJtz3PVntyW7j7630eTMErk2fBmC7TxlZQ1
         EAkw==
X-Gm-Message-State: AOJu0Yy7p8LyKoFqaqcArn8hFA9rUeaiw9DA+yibnkoThdX8zavcCXMo
	XGDTZT9XPCt00JBSzP7KFrx3UU9P0T5plwGsi4QM5Q==
X-Google-Smtp-Source: AGHT+IG9Ami4/iFRKSPtR0dL00K43HTuc8cjfIm+Zo3H3ScZAbzddWd0J8plsQ7N9gT2uXY9Ij0uJsf3fbaR2rImNgg=
X-Received: by 2002:a05:6512:3053:b0:507:aaa9:b07f with SMTP id
 b19-20020a056512305300b00507aaa9b07fmr11089955lfb.3.1698768059800; Tue, 31
 Oct 2023 09:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231031090703.2510347-1-c-shilwant@ti.com> <20231031091311.vqev25qgaqt443ut@SHIELD01>
In-Reply-To: <20231031091311.vqev25qgaqt443ut@SHIELD01>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 31 Oct 2023 12:00:48 -0400
Message-ID: <CADL8D3a5pGUyYqagHk=wK32g3ujYhQca9r7KJerbtMAH83vRyQ@mail.gmail.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk: Add
 new config for AM33x, AM43x
To: s-adivi@ti.com
Cc: Chirag Shilwant <c-shilwant@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, 
	Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org, 
	Paresh Bhagat <p-bhagat@ti.com>, Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Content-Type: multipart/alternative; boundary="000000000000c2b8fa060905429a"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 31 Oct 2023 16:01:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14981

--000000000000c2b8fa060905429a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why is it labeled -legacy?

On Tue, Oct 31, 2023 at 5:13=E2=80=AFAM Sai Sree Kartheek Adivi via
lists.yoctoproject.org <s-adivi=3Dti.com@lists.yoctoproject.org> wrote:

> On 14:37-20231031, Chirag Shilwant wrote:
> > - Add processor-sdk-09.01.00-legacy-config.txt used for building AM33x,
> AM43x.
> >
> > Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>
> Acked-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> > ---
> >  .../processor-sdk-09.01.00-legacy-config.txt      | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644
> configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt
> >
> > diff --git
> a/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt
> b/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt
> > new file mode 100644
> > index 0000000..66a47e3
> > --- /dev/null
> > +++ b/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt
> > @@ -0,0 +1,15 @@
> > +# This file takes repo entries in the format
> > +# repo name,repo uri,repo branch,repo
> commit[,layers=3Dlayer1:layer2...:layern]
> > +
> > +bitbake,
> https://git.openembedded.org/bitbake,2.0,9993a89e5b97dda5f3657e5a7cc3a4fa=
94ff7111
> > +meta-processor-sdk,
> https://git.ti.com/git/processor-sdk/meta-processor-sdk.git,kirkstone,09.=
01.00.001,layers=3D
> > +meta-arago,
> https://git.yoctoproject.org/meta-arago,kirkstone,09.01.00.001,layers=3Dm=
eta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
> > +meta-qt5,
> https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f79364bed1abc297=
636f7933d0e35f22be,layers=3D
> > +meta-virtualization,
> https://git.yoctoproject.org/meta-virtualization,kirkstone,2d8b3cba8ff27c=
9ec2187a52b6a551fe1dcfaa07,layers=3D
> > +meta-openembedded,
> https://git.openembedded.org/meta-openembedded,kirkstone,9c5541f7e18a1fac=
3b8dea71e1ebb8398d58e6ff,layers=3Dmeta-networking:meta-python:meta-oe:meta-=
gnome:meta-filesystems:meta-multimedia
> > +meta-ti,
> https://git.yoctoproject.org/meta-ti,kirkstone,09.01.00.001,layers=3Dmeta=
-ti-extras:meta-ti-bsp
> > +meta-arm,
> https://git.yoctoproject.org/meta-arm,kirkstone,b187fb9232ca0a6b5f8f90b47=
15958546fc41d73,layers=3Dmeta-arm:meta-arm-toolchain
> > +oe-core,
> https://git.openembedded.org/openembedded-core,kirkstone,2572b32e72983176=
2790ebfbf930a1140657faea,layers=3Dmeta
> > +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> > +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> > +BITBAKE_INCLUSIVE_VARS=3Dyes
> > --
> > 2.34.1
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14976):
> https://lists.yoctoproject.org/g/meta-arago/message/14976
> Mute This Topic: https://lists.yoctoproject.org/mt/102293660/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
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

--000000000000c2b8fa060905429a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why is it labeled -legacy?<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023 at 5:13=
=E2=80=AFAM Sai Sree Kartheek Adivi via <a href=3D"http://lists.yoctoprojec=
t.org">lists.yoctoproject.org</a> &lt;s-adivi=3D<a href=3D"mailto:ti.com@li=
sts.yoctoproject.org">ti.com@lists.yoctoproject.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On 14:37-20231031, Chira=
g Shilwant wrote:<br>
&gt; - Add processor-sdk-09.01.00-legacy-config.txt used for building AM33x=
, AM43x.<br>
&gt; <br>
&gt; Signed-off-by: Chirag Shilwant &lt;<a href=3D"mailto:c-shilwant@ti.com=
" target=3D"_blank">c-shilwant@ti.com</a>&gt;<br>
<br>
Acked-by: Sai Sree Kartheek Adivi &lt;<a href=3D"mailto:s-adivi@ti.com" tar=
get=3D"_blank">s-adivi@ti.com</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 .../processor-sdk-09.01.00-legacy-config.txt=C2=A0 =C2=A0 =C2=A0=
 | 15 +++++++++++++++<br>
&gt;=C2=A0 1 file changed, 15 insertions(+)<br>
&gt;=C2=A0 create mode 100644 configs/processor-sdk/processor-sdk-09.01.00-=
legacy-config.txt<br>
&gt; <br>
&gt; diff --git a/configs/processor-sdk/processor-sdk-09.01.00-legacy-confi=
g.txt b/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..66a47e3<br>
&gt; --- /dev/null<br>
&gt; +++ b/configs/processor-sdk/processor-sdk-09.01.00-legacy-config.txt<b=
r>
&gt; @@ -0,0 +1,15 @@<br>
&gt; +# This file takes repo entries in the format<br>
&gt; +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2.=
..:layern]<br>
&gt; +<br>
&gt; +bitbake,<a href=3D"https://git.openembedded.org/bitbake,2.0,9993a89e5=
b97dda5f3657e5a7cc3a4fa94ff7111" rel=3D"noreferrer" target=3D"_blank">https=
://git.openembedded.org/bitbake,2.0,9993a89e5b97dda5f3657e5a7cc3a4fa94ff711=
1</a><br>
&gt; +meta-processor-sdk,<a href=3D"https://git.ti.com/git/processor-sdk/me=
ta-processor-sdk.git,kirkstone,09.01.00.001,layers=3D" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.ti.com/git/processor-sdk/meta-processor-sdk.gi=
t,kirkstone,09.01.00.001,layers=3D</a><br>
&gt; +meta-arago,<a href=3D"https://git.yoctoproject.org/meta-arago,kirksto=
ne,09.01.00.001,layers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-dem=
os:meta-arago-test" rel=3D"noreferrer" target=3D"_blank">https://git.yoctop=
roject.org/meta-arago,kirkstone,09.01.00.001,layers=3Dmeta-arago-distro:met=
a-arago-extras:meta-arago-demos:meta-arago-test</a><br>
&gt; +meta-qt5,<a href=3D"https://github.com/meta-qt5/meta-qt5.git,kirkston=
e,ae8a97f79364bed1abc297636f7933d0e35f22be,layers=3D" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/meta-qt5/meta-qt5.git,kirkstone,ae8a97f7=
9364bed1abc297636f7933d0e35f22be,layers=3D</a><br>
&gt; +meta-virtualization,<a href=3D"https://git.yoctoproject.org/meta-virt=
ualization,kirkstone,2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07,layers=3D" re=
l=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-virtua=
lization,kirkstone,2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07,layers=3D</a><b=
r>
&gt; +meta-openembedded,<a href=3D"https://git.openembedded.org/meta-openem=
bedded,kirkstone,9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff,layers=3Dmeta-net=
working:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia" re=
l=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openem=
bedded,kirkstone,9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff,layers=3Dmeta-net=
working:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia</a>=
<br>
&gt; +meta-ti,<a href=3D"https://git.yoctoproject.org/meta-ti,kirkstone,09.=
01.00.001,layers=3Dmeta-ti-extras:meta-ti-bsp" rel=3D"noreferrer" target=3D=
"_blank">https://git.yoctoproject.org/meta-ti,kirkstone,09.01.00.001,layers=
=3Dmeta-ti-extras:meta-ti-bsp</a><br>
&gt; +meta-arm,<a href=3D"https://git.yoctoproject.org/meta-arm,kirkstone,b=
187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=3Dmeta-arm:meta-arm-toolchai=
n" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-a=
rm,kirkstone,b187fb9232ca0a6b5f8f90b4715958546fc41d73,layers=3Dmeta-arm:met=
a-arm-toolchain</a><br>
&gt; +oe-core,<a href=3D"https://git.openembedded.org/openembedded-core,kir=
kstone,2572b32e729831762790ebfbf930a1140657faea,layers=3Dmeta" rel=3D"noref=
errer" target=3D"_blank">https://git.openembedded.org/openembedded-core,kir=
kstone,2572b32e729831762790ebfbf930a1140657faea,layers=3Dmeta</a><br>
&gt; +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample<br>
&gt; +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample<br>
&gt; +BITBAKE_INCLUSIVE_VARS=3Dyes<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#14976): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/14976" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-arago/message/14976</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/102293660/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/102293660/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproject.org" t=
arget=3D"_blank">meta-arago+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arago/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-=
arago/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_bl=
ank">jcormier@criticallink.com</a>]<br>
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
/div></div></div></div></div>

--000000000000c2b8fa060905429a--

