Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by arago-project.org (Postfix) with ESMTPS id 70E8852093
	for <meta-arago@arago-project.org>;
	Fri, 19 Jun 2015 07:04:49 +0000 (UTC)
Received: by oigx81 with SMTP id x81so74112129oig.1
	for <meta-arago@arago-project.org>;
	Fri, 19 Jun 2015 00:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=nc8HEn98CAGReJ+N8Tvgqt1ihfd3lEjzphciAS/fvZ8=;
	b=Bp2D8wzzwyg7+xArn20Xm6/zlDztuqrhcIiBaUE2Aq5iNe58mjswWP0C+SKUkPqr09
	z3x2RLJf+DB45SI6DnQyajKvkjvpa3ceE1hMazP/VDTJ9Hl0fepUJaBvR6vjrKxwFZIv
	47q2Uo8ALsGJywYQvmpHhmz6SHolBs4vX7+CWEYBUSQhx9SB0lSI7neQ8vWKT4fmqbPg
	Hka5Hg66bu9WJOibpRcIpl42O3/RVjcjudUf0vqUQYUub/GyXhfPnt+TgUwv/cXCgIAU
	b3dxQFWRwjyUhHHVgKUZ/DjVWlSulI4X9Dyc/fNxgov3P0xbBuRmEYRDkPubIkz27mtV
	YoFA==
X-Received: by 10.60.134.19 with SMTP id pg19mr6950531oeb.12.1434697488475;
	Fri, 19 Jun 2015 00:04:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.106.213 with HTTP; Fri, 19 Jun 2015 00:04:28 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 19 Jun 2015 19:04:28 +1200
Message-ID: <CADySD0Et4JtD7_bZ8yMUkbaBrbrtrt8v8YETaJUHkSm=FbMaTg@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: How to build browser (chrome/firefox) for AM335x using meta-arago
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
X-List-Received-Date: Fri, 19 Jun 2015 07:04:49 -0000
Content-Type: multipart/alternative; boundary=047d7b471dbe292dd60518d98a59

--047d7b471dbe292dd60518d98a59
Content-Type: text/plain; charset=UTF-8

Hi,

I want to build chrome/firefox browser for my AM335x EVM.

I am using "arago-daisy-config.txt" to bitbake tisdk-rootfs-image.

I see there is meta-browser which includes chrome, firefox.

How can I get them build with my tisdk rootfs ?

What all do I need to modify in my bblayer and local conf files ?

thanks

--047d7b471dbe292dd60518d98a59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">Hi,</div><div class=3D"gmail_default" =
style=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div=
><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:=
small;color:#333399">I want to build chrome/firefox browser for my AM335x E=
VM.</div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;fo=
nt-size:small;color:#333399"><br></div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:#333399">I am using &qu=
ot;arago-daisy-config.txt&quot; to bitbake tisdk-rootfs-image.</div><div cl=
ass=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;co=
lor:#333399"><br></div><div class=3D"gmail_default" style=3D"font-family:ge=
orgia,serif;font-size:small;color:#333399">I see there is meta-browser whic=
h includes chrome, firefox.</div><div class=3D"gmail_default" style=3D"font=
-family:georgia,serif;font-size:small;color:#333399"><br></div><div class=
=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;color=
:#333399">How can I get them build with my tisdk rootfs ?</div><div class=
=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;color=
:#333399"><br></div><div class=3D"gmail_default" style=3D"font-family:georg=
ia,serif;font-size:small;color:#333399">What all do I need to modify in my =
bblayer and local conf files ?</div><div class=3D"gmail_default" style=3D"f=
ont-family:georgia,serif;font-size:small;color:#333399"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;colo=
r:#333399">thanks</div>
</div>

--047d7b471dbe292dd60518d98a59--
