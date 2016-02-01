Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by arago-project.org (Postfix) with ESMTPS id 1446F52961
	for <meta-arago@arago-project.org>;
	Mon,  1 Feb 2016 22:16:47 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id e185so85629521vkb.1
	for <meta-arago@arago-project.org>;
	Mon, 01 Feb 2016 14:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+3epWrPc87fZbOYTdtRtqpIyK067p+JhcDGTYRTWgdI=;
	b=E7UWrRPCWtlCJkyyglMLEVnLx3hDY6eFz7qC2P2LQFdBVlyEhjP58bUPPsrZZZKyRe
	Drm429Uq10kAy4KZML8MVOS42NwuDsd1QdUh/vl7XDFIVEqvxSM4kVvNf8vGfmOpN8CC
	2aWEydVBTtWC/FiChoUtnVmqKEU5Q582sELp3b+RV1kEau/W14vbTsDyznKjbmonCNt4
	5Xm78xXN554Z1Ee49/e8YpS5p+kgYbH17jGaS3UHc1tDa0LU0BecOy4INi0l9h9Btqn+
	qChybIgSXnfblfdAPSqhRYlUAIqDxhMRKKXYoREgjxrtJaqa41NstbKO3nQrix5L4q59
	smuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+3epWrPc87fZbOYTdtRtqpIyK067p+JhcDGTYRTWgdI=;
	b=Kcv5BqTM/L6yIgTH0PLHHSLr7bzyHRbTQG6+T+DirLPDoQnPHdNAQlaS5/U66Qc/me
	+/BAchZ5PCrN9HJIvlTpSsUPEtHI1o7IMYIHgpOj7wAy4RCtHgcSOkgj7jVOgcsYuyTP
	saEDjgZAiASIHI/pVx+ENAQnHfDuYA6KYqqDT1g+c+1VIif20/80T/aiSG1HKz6BvQYk
	KXH1aZFvcdj/DY+iEmvVFEM6Gee/QlD81jHUGjXvsoeTdem0zGASFq9qQQ4fPNKudxY+
	rGI70ZLUvX3xtAf33FRw6ds0HYAruqFwdEtEGEbKK7ZjWuDBI5ziQds0xbErzi2foSm6
	eb+Q==
X-Gm-Message-State: AG10YOTSMC+h/M67ugTE/CeoZTA9g8vuvyvgUhlgE1LjkfezVoBlvst5hZ+8idByRnplowEIdJMNcdV9Y9dBZg==
X-Received: by 10.31.147.82 with SMTP id v79mr16366276vkd.58.1454365006760;
	Mon, 01 Feb 2016 14:16:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Mon, 1 Feb 2016 14:16:26 -0800 (PST)
In-Reply-To: <20160201215854.GU11314@edge>
References: <CADySD0FB8Y_f9SWK+=WDmb8tba=mUZ==PK-spO+_BOhR4QhVsQ@mail.gmail.com>
	<20160201215854.GU11314@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 2 Feb 2016 11:16:26 +1300
Message-ID: <CADySD0GthGnaKrt+R=4azdPffVYWWz33hehvQP2gKjzZuUpDEg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: What's the reason behind different config file in oe-layersetup
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
X-List-Received-Date: Mon, 01 Feb 2016 22:16:47 -0000
Content-Type: multipart/alternative; boundary=001a1141dca29a1397052abcbdb5

--001a1141dca29a1397052abcbdb5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks for explaining it.

I am using am335x-evm as reference platform, so as per the link, I should
be using amsdk-08.00.00.00-config.txt but it is based on daisy branch.
Whereas processor-sdk-02.00.01.07-config.txt looks updated one.

So is it ok to refer to processor-sdk to create my own ?

=E2=80=8Bthanks=E2=80=8B


On Tue, Feb 2, 2016 at 10:58 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, Feb 02, 2016 at 10:45:43AM +1300, Ankur Tyagi wrote:
> > Hi,
> >
> > oe-layersetup has different set of configs. I couldn't find any
> > documentation explaining "when to use which config".
> >
> > Can someone help me understand the rationale behind these configs ? The=
y
> > all refer to different commits of same repo, so I am sure there must a
> > reason behind it.
>
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
>
> Available Layer Configurations section explains what those configs are.
>
> To summarize - config files in the main configs/ directory are all
> "rolling",
> i.e. they pull latest from corresponding branches of all the layers. Usef=
ul
> for development. On the other hand, configs in coresdk, amsdk, glsdk, mcs=
dk
> and processor-sdk directories are the release configs, i.e. they pin down
> all
> the layers to a specific commit ID at the time of release. That way a giv=
en
> release can be reproduced later on. And those SDK names are just product
> names
> to support corresponding TI embedded processor platforms.
>
>
> > For a commercial product, which config should be used to create bsp,
> kernel
> > and rootfs
>
> For your own commercial product, you should create your own config, using
> one
> of the existing ones as an example.
>
> --
> Denys
>

--001a1141dca29a1397052abcbdb5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">Thanks for explaining it.</div>=
<div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:s=
mall;color:rgb(51,51,153)"><br></div><div class=3D"gmail_default" style=3D"=
font-family:georgia,serif;font-size:small;color:rgb(51,51,153)">I am using =
am335x-evm as reference platform, so as per the link, I should be using=C2=
=A0amsdk-08.00.00.00-config.txt but it is based on daisy branch.</div><div =
class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;=
color:rgb(51,51,153)">Whereas processor-sdk-02.00.01.07-config.txt looks up=
dated one.</div><div class=3D"gmail_default" style=3D"font-family:georgia,s=
erif;font-size:small;color:rgb(51,51,153)"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,1=
53)">So is it ok to refer to processor-sdk to create my own ?</div><div cla=
ss=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;col=
or:rgb(51,51,153)"><br></div><div class=3D"gmail_extra"><div class=3D"gmail=
_default" style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,5=
1,153)">=E2=80=8Bthanks=E2=80=8B</div><br>
<br><div class=3D"gmail_quote">On Tue, Feb 2, 2016 at 10:58 AM, Denys Dmytr=
iyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_bla=
nk">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D"">On Tue, Feb 02, 2016 at 10:45:43AM +1300, Ankur Tyagi wrote:=
<br>
&gt; Hi,<br>
&gt;<br>
&gt; oe-layersetup has different set of configs. I couldn&#39;t find any<br=
>
&gt; documentation explaining &quot;when to use which config&quot;.<br>
&gt;<br>
&gt; Can someone help me understand the rationale behind these configs ? Th=
ey<br>
&gt; all refer to different commits of same repo, so I am sure there must a=
<br>
&gt; reason behind it.<br>
<br>
</span><a href=3D"http://arago-project.org/wiki/index.php/Setting_Up_Build_=
Environment" rel=3D"noreferrer" target=3D"_blank">http://arago-project.org/=
wiki/index.php/Setting_Up_Build_Environment</a><br>
<br>
Available Layer Configurations section explains what those configs are.<br>
<br>
To summarize - config files in the main configs/ directory are all &quot;ro=
lling&quot;,<br>
i.e. they pull latest from corresponding branches of all the layers. Useful=
<br>
for development. On the other hand, configs in coresdk, amsdk, glsdk, mcsdk=
<br>
and processor-sdk directories are the release configs, i.e. they pin down a=
ll<br>
the layers to a specific commit ID at the time of release. That way a given=
<br>
release can be reproduced later on. And those SDK names are just product na=
mes<br>
to support corresponding TI embedded processor platforms.<br>
<span class=3D""><br>
<br>
&gt; For a commercial product, which config should be used to create bsp, k=
ernel<br>
&gt; and rootfs<br>
<br>
</span>For your own commercial product, you should create your own config, =
using one<br>
of the existing ones as an example.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span></blockquote></div><br></div></div>

--001a1141dca29a1397052abcbdb5--
