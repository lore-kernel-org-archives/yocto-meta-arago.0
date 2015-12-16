Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by arago-project.org (Postfix) with ESMTPS id 813095208B
	for <meta-arago@arago-project.org>;
	Wed, 16 Dec 2015 16:05:44 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id 21so37551801qgx.1
	for <meta-arago@arago-project.org>;
	Wed, 16 Dec 2015 08:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=gmFaQ/8kEoFo62q3uDMnXOaGifuyYXNzO148VnEjkT0=;
	b=bIH/uthyn6h3oQW1ckE/v4+4cikG+jBGS1PYUE79zkJrxHW8/kV0ZoPr33okDdyfqi
	0M33KApOE8rheFjpeOlxxLgHQkZuKfo5/U9QNZ35XKmPXdIUs6PWNistN+avxRDnf1Yo
	A6vx2brIlSQ/9sMjOzpPtpsF5eTzFnH2Bc7hqF0D46/6XzlVnHXUYob52o2cLqRhexSr
	DTRSKFJSc7g8311SLS7ipBUz4m6z2FeTiOWk47omWp9qZEaKTFL01JL36ZvIrFQUMVDR
	MzxeO/BGIDZ3StPK73G9PbLppfKBxPFGXJD8ddqMYaFO/UuRUpNl3A6ZkOHxjNc8zU2o
	I4iw==
MIME-Version: 1.0
X-Received: by 10.140.133.145 with SMTP id 139mr54906000qhf.0.1450281944112;
	Wed, 16 Dec 2015 08:05:44 -0800 (PST)
Received: by 10.55.114.6 with HTTP; Wed, 16 Dec 2015 08:05:44 -0800 (PST)
In-Reply-To: <CADnUhn2v6yOE8JBsoLxpCZaGkO_GZMWme-K2d7SDUbHF-D-Ouw@mail.gmail.com>
References: <CADnUhn2v6yOE8JBsoLxpCZaGkO_GZMWme-K2d7SDUbHF-D-Ouw@mail.gmail.com>
Date: Wed, 16 Dec 2015 18:05:44 +0200
Message-ID: <CADnUhn0tvXObVAai0r9W3Ywr6jmfryBbHSSe2kjPehTPGekKCQ@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: "broken dt data from edma" message while booting linux-ti-staging-rt-4.1
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
X-List-Received-Date: Wed, 16 Dec 2015 16:05:44 -0000
Content-Type: multipart/alternative; boundary=001a1136f7361a64ed052706147b

--001a1136f7361a64ed052706147b
Content-Type: text/plain; charset=UTF-8

Those " broken dt data" lines are not the problem. They seem to exist also
in normal 3.14 boot without problems. Two clear differences are: there is
no nand flash memory mapping and that there is that SIOCGIFFLAGS.

Perhaps I try normal 4.1 kernel also. I used to get it running before.

- Matti

2015-12-16 14:48 GMT+02:00 matti kaasinen <matti.kaasinen@gmail.com>:

> Hi!
>
> I have seen nightly builds of fido RT passing quite consistently. However,
> I got nasty error messages while my am335x booted linux-ti-staging-rt-4.1
> as follows:
>
> [    0.146612] omap_hwmod: tptc0 using broken dt data from edma
> [    0.146751] omap_hwmod: tptc1 using broken dt data from edma
> [    0.146868] omap_hwmod: tptc2 using broken dt data from edma
> [    0.151906] omap_hwmod: debugss: _wait_target_disable failed
>
> Perhaps for this reason I also get:
> Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such device
>
> and
>
> Failed to get index for interface name 'eth0': No such device
>
> - so I don't get Ethernet up and running.
>
> I have used Yocto version of meta-ti (fido).
>
> I found
> https://www.mail-archive.com/linux-omap@vger.kernel.org/msg116472.html
> discussing this problem, but I did not these changes made in am33xx.dtsi.
>
> What patches should I need to get rt-4.1 running properly?
>
> Thanks,
> Matti
>

--001a1136f7361a64ed052706147b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Those &quot; broken dt data&quot; lines are not =
the problem. They seem to exist also in normal 3.14 boot without problems. =
Two clear differences are: there is no nand flash memory mapping and that t=
here is that SIOCGIFFLAGS.<br><br></div>Perhaps I try normal 4.1 kernel als=
o. I used to get it running before.<br><br></div>- Matti<br></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">2015-12-16 14:48 GMT+02:00=
 matti kaasinen <span dir=3D"ltr">&lt;<a href=3D"mailto:matti.kaasinen@gmai=
l.com" target=3D"_blank">matti.kaasinen@gmail.com</a>&gt;</span>:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div dir=3D"ltr"><div><div>Hi!<br><br>I have seen =
nightly builds of fido RT passing quite consistently. However, I got nasty =
error messages while my am335x booted linux-ti-staging-rt-4.1 as follows: <=
br><br>[=C2=A0=C2=A0=C2=A0 0.146612] omap_hwmod: tptc0 using broken dt data=
 from edma<br>[=C2=A0=C2=A0=C2=A0 0.146751] omap_hwmod: tptc1 using broken =
dt data from edma<br>[=C2=A0=C2=A0=C2=A0 0.146868] omap_hwmod: tptc2 using =
broken dt data from edma<br>[=C2=A0=C2=A0=C2=A0 0.151906] omap_hwmod: debug=
ss: _wait_target_disable failed<br><br></div>Perhaps for this reason I also=
 get:<br>Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such =
device<br><br></div>and<br><br><div><div>Failed to get index for interface =
name &#39;eth0&#39;: No such device<br><br></div><div>- so I don&#39;t get =
Ethernet up and running.<br><br></div><div>I have used Yocto version of met=
a-ti (fido).<br><br></div><div>I found <a href=3D"https://www.mail-archive.=
com/linux-omap@vger.kernel.org/msg116472.html" target=3D"_blank">https://ww=
w.mail-archive.com/linux-omap@vger.kernel.org/msg116472.html</a><br></div><=
div>discussing this problem, but I did not these changes made in am33xx.dts=
i.<br><br></div><div>What patches should I need to get rt-4.1 running prope=
rly?<br><br></div><div>Thanks,<br></div><div>Matti<br></div></div></div>
</blockquote></div><br></div>

--001a1136f7361a64ed052706147b--
