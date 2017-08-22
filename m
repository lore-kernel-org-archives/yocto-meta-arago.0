Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by arago-project.org (Postfix) with ESMTPS id 3A5E95299D
	for <meta-arago@arago-project.org>;
	Tue, 22 Aug 2017 10:16:48 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id p14so52421694wrg.1
	for <meta-arago@arago-project.org>;
	Tue, 22 Aug 2017 03:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=0pPZMHi66cif3VEwxrs2zRR0wmzR3YrcK9SWmja78Wo=;
	b=J0QVFBS1BFy9eTyTbP6s6mX2rE6vZdgKzCrCTvEgOv5Ecx0lvxGCR3gEBPYjV6Nu7Q
	3yF09/NnkLXDM4Ae4/9VmOMIo0jlfGfwc3e+MlHRj3k+Q+M4ZYr1qw05da/QSqfeaZMW
	cz5QA+P6C0PkEy2GVE94Kb1jK17nXzrYkZ4Kr4286hvbgzVnNpqCaPSuf2T+xrczKQyB
	lx4aXraEbuenKsfJpLM6hjlYPuNe975BLxOSM3MLKZYWS86N0SLYft38+69SUXTQBccZ
	wqGOp50fihMdYSi/+MEWmQLi+UfTWHi0ITLNj4ECgWdGjbDifd7A74h8GOZ3kgD316gL
	CO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=0pPZMHi66cif3VEwxrs2zRR0wmzR3YrcK9SWmja78Wo=;
	b=DK8P5r0Eh4XsB3x3LC8gqR+GYpMCKNHlAmIhpj7TyUtuPL1x9lmCiTzQn3iukDvP1r
	J4LK8i7sb3A8SkWLmuJlYXmi6c88WPJAQ2DavNMupQKBsD6ciZ6BdauEoKfcsfrAPbvl
	HWCA+kpEFMYHSiA2Lmoz+Wi2JmYe66OVYtAAxw3xP2b4nmT3YwD6SEtaVymTBhutCxwZ
	qey1snGdSdFinIPB5EcearzzvCJPJ0uoaWKNKSqgihPj3yxfp0ELk2LRx/gn4rP4oEb/
	+A5h1Dr5krhhMw7vD7X7DPUER/ZTuRCFIMlcE4vFdVbv6C4KCyLAp1rS4Cp4vBJLAmCQ
	lWmw==
X-Gm-Message-State: AHYfb5ivi3GKAEsZn2G9zikHcXToy7BY+RdN2aNDs/P6C8iiTJD/oLU6
	XD6iJxLmNp5Xl24Uc/fuUiDf4sr/Pv+4
X-Received: by 10.80.171.74 with SMTP id t10mr124351edc.242.1503397007520;
	Tue, 22 Aug 2017 03:16:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.240.134 with HTTP; Tue, 22 Aug 2017 03:16:26 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 22 Aug 2017 22:16:26 +1200
Message-ID: <CADySD0F8_ScZKfuJes3SJcpZAELxjSb0SRuddjHa=raoJDAZ5A@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Regarding custom Qt5 image sdk recipe
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
X-List-Received-Date: Tue, 22 Aug 2017 10:16:49 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ed80096f80b055754e422"

--94eb2c0ed80096f80b055754e422
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a custom qt5 image recipe based upon arago distro.

In order to create an sdk based upon my image, I added following in
my-image.bb file
inherit populate_sdk populate_sdk_qt5

So now I can generate custom Qt5 sdk via bitbake my-image -c populate_sdk

However, I see a downside in this approach that it increases the build time
for my image.
Toolchain creation is usually one time task while customizing rootfs image
will be an on-going thing.

I wanted to know what is the best practice here ?
Ideal would be to have a separate recipe like meta-toolchain-my-image-sdk.bb
which creates a sdk based upon my image.

I don't want to use meta-toolchain-arago-tisdk as it creates a toolchain
with everything which might not be available in my custom image. This
allows to develop and cross-compile an application which might fail to run
on target (e.g application can be compiled using boost library but my
custom image lacks boost)

So basically I want to create trimmed version of meta-toolchain-arago-tisdk
based upon my custom image installs but not sure how.

thanks
Ankur

--94eb2c0ed80096f80b055754e422
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif">I have a custom qt5 image reci=
pe based upon arago distro.</div><div class=3D"gmail_default" style=3D"font=
-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" =
style=3D"font-family:arial,helvetica,sans-serif">In order to create an sdk =
based upon my image, I added following in <a href=3D"http://my-image.bb">my=
-image.bb</a> file</div><div class=3D"gmail_default" style=3D"font-family:a=
rial,helvetica,sans-serif">inherit populate_sdk populate_sdk_qt5</div><div =
class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><b=
r></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,s=
ans-serif">So now I can generate custom Qt5 sdk via bitbake my-image -c pop=
ulate_sdk</div><div class=3D"gmail_default" style=3D"font-family:arial,helv=
etica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,helvetica,sans-serif">However, I see a downside in this approach t=
hat it increases the build time for my image.</div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,helvetica,sans-serif">Toolchain creation is=
 usually one time task while customizing rootfs image will be an on-going t=
hing.</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetic=
a,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:a=
rial,helvetica,sans-serif">I wanted to know what is the best practice here =
? <br></div><div class=3D"gmail_default" style=3D"font-family:arial,helveti=
ca,sans-serif">Ideal would be to have a separate recipe like <a href=3D"htt=
p://meta-toolchain-my-image-sdk.bb">meta-toolchain-my-image-sdk.bb</a> whic=
h creates a sdk based upon my image.</div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_=
default" style=3D"font-family:arial,helvetica,sans-serif">I don&#39;t want =
to use meta-toolchain-arago-tisdk as it creates a toolchain with everything=
 which might not be available in my custom image. This allows to develop an=
d cross-compile an application which might fail to run on target (e.g appli=
cation can be compiled using boost library but my custom image lacks boost)=
</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,san=
s-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,=
helvetica,sans-serif">So basically I want to create trimmed version of meta=
-toolchain-arago-tisdk based upon my custom image installs but not sure how=
.</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sa=
ns-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:arial=
,helvetica,sans-serif">thanks</div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif">Ankur<br></div></div>

--94eb2c0ed80096f80b055754e422--
