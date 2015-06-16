Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by arago-project.org (Postfix) with ESMTPS id 05882529B1
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 11:24:23 +0000 (UTC)
Received: by igbiq7 with SMTP id iq7so40059375igb.1
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 04:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YlKXq8nmRLvkTecuyy5QBHroBWxCpBvxrQDVRK8Gxl0=;
	b=08j21+qcdblM6SmxML48AzqTjvzHznOZRT0RL9nh5o70nhRHagpyRpwyuJP/JA8QeG
	rkq7jTo8OLGtXbO+Ty0za67N75GKWlqe46ZHCrSjdsgdjzFNzJ/fGL0fYu12te9Pkots
	zS4SoCfTmNlqCoFI2AaMQN6qOa/RAy2e+j+RCaIdc3PkDcdOxESi5jADv1Lqp6QDr9qJ
	vC1YZ0rlrYDUkH8MaVitbJ2wHmzqnKRGaDfgREKTSSHLdOPuJhFSJvqfZ4zlff0aAF3N
	YJcZdW6MlrJregH6Ol0jhUWLtWgX1XKqsVs5u/ffBRqYhwoGS9UMiGRtkeEsxDNpGrV8
	7N6w==
MIME-Version: 1.0
X-Received: by 10.50.17.104 with SMTP id n8mr26727715igd.21.1434453860152;
	Tue, 16 Jun 2015 04:24:20 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Tue, 16 Jun 2015 04:24:20 -0700 (PDT)
In-Reply-To: <CADnUhn3FrWPH_yUKzX-Tf9Q9vz5GYmDHrVTOQxk_CefMgKvT1A@mail.gmail.com>
References: <CADnUhn3FrWPH_yUKzX-Tf9Q9vz5GYmDHrVTOQxk_CefMgKvT1A@mail.gmail.com>
Date: Tue, 16 Jun 2015 14:24:20 +0300
Message-ID: <CADnUhn1obcbd+OwzAYhDVQzU8eGMh_wt7JapOZH1agPBfFpyaQ@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: overriding arago.conf settings
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
X-List-Received-Date: Tue, 16 Jun 2015 11:24:27 -0000
Content-Type: multipart/alternative; boundary=089e0118398ac7ffce0518a0d09d

--089e0118398ac7ffce0518a0d09d
Content-Type: text/plain; charset=UTF-8

I found how to do it in layer.conf:
PREFERRED_VERSION_u-boot_forcevariable                = "2013.10"
PREFERRED_VERSION_u-boot-ti-staging_forcevariable     = "2013.10%"


2015-06-16 12:08 GMT+03:00 matti kaasinen <matti.kaasinen@gmail.com>:

> Hi!
> Do anyone know how to overriding variables set in arago.conf using
> layer.conf or local.conf settings (or anything else that touching Arago
> layer). I try to set something else on my own layer
> (PREFERRED_VERSION_u-boot). I have tried changing layer orders in
> bblayers.conf and priority in layer.conf. In fact if I got it right from
> Yocto documentation distro.conf is just parsed first and that is what rules.
> Thanks,
> Matti
>

--089e0118398ac7ffce0518a0d09d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I found how to do it in layer.conf:<br>PREFERRED_VERSION_u=
-boot_forcevariable=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;2013.10&quot;<br>PREFERRED_V=
ERSION_u-boot-ti-staging_forcevariable=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;20=
13.10%&quot;<br><br></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">2015-06-16 12:08 GMT+03:00 matti kaasinen <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:matti.kaasinen@gmail.com" target=3D"_blank">matti.kaasinen@=
gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
"><div><div><div>Hi!<br></div>Do anyone know how to overriding variables se=
t in arago.conf using layer.conf or local.conf settings (or anything else t=
hat touching Arago layer). I try to set something else on my own layer (PRE=
FERRED_VERSION_u-boot). I have tried changing layer orders in bblayers.conf=
 and priority in layer.conf. In fact if I got it right from Yocto documenta=
tion distro.conf is just parsed first and that is what rules.<br></div>Than=
ks,<br></div>Matti<br></div>
</blockquote></div><br></div>

--089e0118398ac7ffce0518a0d09d--
