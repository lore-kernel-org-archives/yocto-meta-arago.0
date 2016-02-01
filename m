Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by arago-project.org (Postfix) with ESMTPS id ECFC6529C7
	for <meta-arago@arago-project.org>;
	Mon,  1 Feb 2016 22:26:18 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id e6so85737248vkh.2
	for <meta-arago@arago-project.org>;
	Mon, 01 Feb 2016 14:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NP2vh2TGkM6oOH5bRLD3/+FDGwJY3lpoFWjFLsygz7c=;
	b=MdPtcn316Kw3qh+awFyu+UdWdayohQzGHrQfk4OKtWToYUBfKjB6QDuEp8CNu4Ghfx
	2uZHCcTjGsve/E5p+H33JeOqO27oWWCMqLPlt7rMYHy+QHCoUxQ05/ozfP7thh8OQ1kx
	wer8eS1dullxlJm6P44AqGLjyXpryPETQ1tiezeTgCS9j8VxwM/krRMYRzwlqxqpM3RB
	pPs7H/E1D2RKNtn6CWa0AmOYeMNEmArbPoekHxayNM9xlfnnw+5OAOcH8gqUs3m0dszq
	GKcuEYVrnJfnvt4ZxsqMJBhtUoL/CF7DK93KMzYAxcgXtSRp40QQkxYvOiSbrN1JcY27
	JuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NP2vh2TGkM6oOH5bRLD3/+FDGwJY3lpoFWjFLsygz7c=;
	b=eNVd9NNd9l8awx2eWyP+VBjxX2rYuCXjlUKufesi8YpFLZ1LXE4EAqkSm0H1sYep2b
	1FWpQM2inHDyhkgXxOkLYH0+d+RJ69z1d1CbcfRjgEFB2R4yuJpwWip5m15n0srbzs/b
	15Nm0oDShkA2pQ3Qfzaqvh6ZLecCEkdfe5A3btaXATb2s++42lCv4Jl2xAV4Iu6ZFZa5
	0JbN5Exu26hAeY6V0sm/IsKuKC751EKSeuIvp4rPf/OP1X9mzdrhAaZ4wYdjSZU3bqfQ
	mCZrZEYFyaBOEoxRx59SkBWpajrsGSHqpianbOBqPFCDdZ/67y0O8LnkbdHKlHhahWg+
	vJ1A==
X-Gm-Message-State: AG10YOQTkkXLAKdp8VlhGnbyfzuejJ0quUVkucGhNjqBfMNuzqZWNxeleh+5ILka+G3Z58spZiaCfvYw3LB8kg==
X-Received: by 10.31.162.20 with SMTP id l20mr16152695vke.137.1454365578261;
	Mon, 01 Feb 2016 14:26:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Mon, 1 Feb 2016 14:25:58 -0800 (PST)
In-Reply-To: <20160201222242.GW11314@edge>
References: <CADySD0FB8Y_f9SWK+=WDmb8tba=mUZ==PK-spO+_BOhR4QhVsQ@mail.gmail.com>
	<20160201215854.GU11314@edge>
	<CADySD0GthGnaKrt+R=4azdPffVYWWz33hehvQP2gKjzZuUpDEg@mail.gmail.com>
	<20160201222242.GW11314@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 2 Feb 2016 11:25:58 +1300
Message-ID: <CADySD0EuZSbrCROCSp9tQ7hAEhWh4DEJYf5i43+A7fsLsNJLaQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 01 Feb 2016 22:26:19 -0000
Content-Type: multipart/alternative; boundary=001a1143f2acaa79ed052abcdfab

--001a1143f2acaa79ed052abcdfab
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks for the help.


On Tue, Feb 2, 2016 at 11:22 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> I would recommend starting from arago-fido-config.txt and pin down all
> layers
> later, once your own development stabilizes and you are ready to make you=
r
> release. You can also start with one of the latest coresdk or processor-s=
dk
> configs as well, but you maybe missing some of the important bugfixes fro=
m
> different layers that could be made during your development cycle...
>
> --
> Denys
>
>
> On Tue, Feb 02, 2016 at 11:16:26AM +1300, Ankur Tyagi wrote:
> > Thanks for explaining it.
> >
> > I am using am335x-evm as reference platform, so as per the link, I shou=
ld
> > be using amsdk-08.00.00.00-config.txt but it is based on daisy branch.
> > Whereas processor-sdk-02.00.01.07-config.txt looks updated one.
> >
> > So is it ok to refer to processor-sdk to create my own ?
> >
> > =E2=80=8Bthanks=E2=80=8B
> >
> >
> > On Tue, Feb 2, 2016 at 10:58 AM, Denys Dmytriyenko <denys@ti.com> wrote=
:
> >
> > > On Tue, Feb 02, 2016 at 10:45:43AM +1300, Ankur Tyagi wrote:
> > > > Hi,
> > > >
> > > > oe-layersetup has different set of configs. I couldn't find any
> > > > documentation explaining "when to use which config".
> > > >
> > > > Can someone help me understand the rationale behind these configs ?
> They
> > > > all refer to different commits of same repo, so I am sure there mus=
t
> a
> > > > reason behind it.
> > >
> > > http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> > >
> > > Available Layer Configurations section explains what those configs ar=
e.
> > >
> > > To summarize - config files in the main configs/ directory are all
> > > "rolling",
> > > i.e. they pull latest from corresponding branches of all the layers.
> Useful
> > > for development. On the other hand, configs in coresdk, amsdk, glsdk,
> mcsdk
> > > and processor-sdk directories are the release configs, i.e. they pin
> down
> > > all
> > > the layers to a specific commit ID at the time of release. That way a
> given
> > > release can be reproduced later on. And those SDK names are just
> product
> > > names
> > > to support corresponding TI embedded processor platforms.
> > >
> > >
> > > > For a commercial product, which config should be used to create bsp=
,
> > > kernel
> > > > and rootfs
> > >
> > > For your own commercial product, you should create your own config,
> using
> > > one
> > > of the existing ones as an example.
> > >
> > > --
> > > Denys
> > >
>

--001a1143f2acaa79ed052abcdfab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">Thanks for the help.=C2=A0</div><div c=
lass=3D"gmail_extra"><br>
<br><div class=3D"gmail_quote">On Tue, Feb 2, 2016 at 11:22 AM, Denys Dmytr=
iyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_bla=
nk">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I =
would recommend starting from arago-fido-config.txt and pin down all layers=
<br>
later, once your own development stabilizes and you are ready to make your<=
br>
release. You can also start with one of the latest coresdk or processor-sdk=
<br>
configs as well, but you maybe missing some of the important bugfixes from<=
br>
different layers that could be made during your development cycle...<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Tue, Feb 02, 2016 at 11:16:26AM +1300, Ankur Tyagi wrote:<br>
&gt; Thanks for explaining it.<br>
&gt;<br>
&gt; I am using am335x-evm as reference platform, so as per the link, I sho=
uld<br>
&gt; be using amsdk-08.00.00.00-config.txt but it is based on daisy branch.=
<br>
&gt; Whereas processor-sdk-02.00.01.07-config.txt looks updated one.<br>
&gt;<br>
&gt; So is it ok to refer to processor-sdk to create my own ?<br>
&gt;<br>
&gt; =E2=80=8Bthanks=E2=80=8B<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Feb 2, 2016 at 10:58 AM, Denys Dmytriyenko &lt;<a href=3D"mail=
to:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Tue, Feb 02, 2016 at 10:45:43AM +1300, Ankur Tyagi wrote:<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; oe-layersetup has different set of configs. I couldn&#39;t f=
ind any<br>
&gt; &gt; &gt; documentation explaining &quot;when to use which config&quot=
;.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Can someone help me understand the rationale behind these co=
nfigs ? They<br>
&gt; &gt; &gt; all refer to different commits of same repo, so I am sure th=
ere must a<br>
&gt; &gt; &gt; reason behind it.<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"http://arago-project.org/wiki/index.php/Setting_Up_Bui=
ld_Environment" rel=3D"noreferrer" target=3D"_blank">http://arago-project.o=
rg/wiki/index.php/Setting_Up_Build_Environment</a><br>
&gt; &gt;<br>
&gt; &gt; Available Layer Configurations section explains what those config=
s are.<br>
&gt; &gt;<br>
&gt; &gt; To summarize - config files in the main configs/ directory are al=
l<br>
&gt; &gt; &quot;rolling&quot;,<br>
&gt; &gt; i.e. they pull latest from corresponding branches of all the laye=
rs. Useful<br>
&gt; &gt; for development. On the other hand, configs in coresdk, amsdk, gl=
sdk, mcsdk<br>
&gt; &gt; and processor-sdk directories are the release configs, i.e. they =
pin down<br>
&gt; &gt; all<br>
&gt; &gt; the layers to a specific commit ID at the time of release. That w=
ay a given<br>
&gt; &gt; release can be reproduced later on. And those SDK names are just =
product<br>
&gt; &gt; names<br>
&gt; &gt; to support corresponding TI embedded processor platforms.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; For a commercial product, which config should be used to cre=
ate bsp,<br>
&gt; &gt; kernel<br>
&gt; &gt; &gt; and rootfs<br>
&gt; &gt;<br>
&gt; &gt; For your own commercial product, you should create your own confi=
g, using<br>
&gt; &gt; one<br>
&gt; &gt; of the existing ones as an example.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Denys<br>
&gt; &gt;<br>
</div></div></blockquote></div><br></div></div>

--001a1143f2acaa79ed052abcdfab--
