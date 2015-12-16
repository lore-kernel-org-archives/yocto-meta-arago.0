Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by arago-project.org (Postfix) with ESMTPS id 9B33052975
	for <meta-arago@arago-project.org>;
	Wed, 16 Dec 2015 12:48:49 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id k189so61165719qkc.0
	for <meta-arago@arago-project.org>;
	Wed, 16 Dec 2015 04:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=H8/OKDlm5DXgnAtpQmWid9T9IiqCfQQVBplItnhjzqw=;
	b=YraAbRB0igdAeKnE2dOGxDC3lv5Uj1KltpVyq4KKbIqUM5FvjanEoUC08dAAQz728J
	q8NvlBKwz8u0l0P8xekssRqIHL5Kvh7eSuURKKusEVjSeWNR8TJ6abonHkl9Emh6YXZa
	vA6uShbBdIlgvDMgVxISdWv0S2aFR/DgtpKGxZNMYl2Iog8kO7MnFjqxiLB1tXSrjU/3
	Ha/B96d0Tc5p5wDxGzZHDM3ec9C2M3TZo7JuegvtogrYbWgIhvzeGf1Ts1/z4YSJFl1i
	ku3ie95nbXLZzzPbULlNxz06jq1Psr2wVwt1JngNK1vKeft+6A2tjoe6qOJShb4U3D7F
	FMgg==
MIME-Version: 1.0
X-Received: by 10.55.20.1 with SMTP id e1mr15760469qkh.60.1450270128834; Wed,
	16 Dec 2015 04:48:48 -0800 (PST)
Received: by 10.55.114.6 with HTTP; Wed, 16 Dec 2015 04:48:48 -0800 (PST)
Date: Wed, 16 Dec 2015 14:48:48 +0200
Message-ID: <CADnUhn2v6yOE8JBsoLxpCZaGkO_GZMWme-K2d7SDUbHF-D-Ouw@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: "broken dt data from edma" message while booting linux-ti-staging-rt-4.1
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
X-List-Received-Date: Wed, 16 Dec 2015 12:48:50 -0000
Content-Type: multipart/alternative; boundary=001a1144bf90db93fc0527035339

--001a1144bf90db93fc0527035339
Content-Type: text/plain; charset=UTF-8

Hi!

I have seen nightly builds of fido RT passing quite consistently. However,
I got nasty error messages while my am335x booted linux-ti-staging-rt-4.1
as follows:

[    0.146612] omap_hwmod: tptc0 using broken dt data from edma
[    0.146751] omap_hwmod: tptc1 using broken dt data from edma
[    0.146868] omap_hwmod: tptc2 using broken dt data from edma
[    0.151906] omap_hwmod: debugss: _wait_target_disable failed

Perhaps for this reason I also get:
Configuring network interfaces... ifconfig: SIOCGIFFLAGS: No such device

and

Failed to get index for interface name 'eth0': No such device

- so I don't get Ethernet up and running.

I have used Yocto version of meta-ti (fido).

I found
https://www.mail-archive.com/linux-omap@vger.kernel.org/msg116472.html
discussing this problem, but I did not these changes made in am33xx.dtsi.

What patches should I need to get rt-4.1 running properly?

Thanks,
Matti

--001a1144bf90db93fc0527035339
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi!<br><br>I have seen nightly builds of fido RT=
 passing quite consistently. However, I got nasty error messages while my a=
m335x booted linux-ti-staging-rt-4.1 as follows: <br><br>[=C2=A0=C2=A0=C2=
=A0 0.146612] omap_hwmod: tptc0 using broken dt data from edma<br>[=C2=A0=
=C2=A0=C2=A0 0.146751] omap_hwmod: tptc1 using broken dt data from edma<br>=
[=C2=A0=C2=A0=C2=A0 0.146868] omap_hwmod: tptc2 using broken dt data from e=
dma<br>[=C2=A0=C2=A0=C2=A0 0.151906] omap_hwmod: debugss: _wait_target_disa=
ble failed<br><br></div>Perhaps for this reason I also get:<br>Configuring =
network interfaces... ifconfig: SIOCGIFFLAGS: No such device<br><br></div>a=
nd<br><br><div><div>Failed to get index for interface name &#39;eth0&#39;: =
No such device<br><br></div><div>- so I don&#39;t get Ethernet up and runni=
ng.<br><br></div><div>I have used Yocto version of meta-ti (fido).<br><br><=
/div><div>I found <a href=3D"https://www.mail-archive.com/linux-omap@vger.k=
ernel.org/msg116472.html">https://www.mail-archive.com/linux-omap@vger.kern=
el.org/msg116472.html</a><br></div><div>discussing this problem, but I did =
not these changes made in am33xx.dtsi.<br><br></div><div>What patches shoul=
d I need to get rt-4.1 running properly?<br><br></div><div>Thanks,<br></div=
><div>Matti<br></div></div></div>

--001a1144bf90db93fc0527035339--
