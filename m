Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by arago-project.org (Postfix) with ESMTPS id A4D8D52A18
	for <meta-arago@arago-project.org>;
	Sat,  4 Jun 2016 10:37:37 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id e72so162959955oib.1
	for <meta-arago@arago-project.org>;
	Sat, 04 Jun 2016 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=W1+RCbG6D6K4vv8/NWNmqtTXSX738qwBysgkGI/ldJE=;
	b=zlEHYG7v7T0nGXOrdq9cC1iSqbFORRIz1/yao43PuGVrOPLaYr/8erfJR1sxr57sH4
	qMthr0Gf2DSkxVzuocSFUcc/lvPKqDX8G63LSgt3OVodMOSOBFuiaE8JowPXJbdnm9Cb
	60a5tF7N3fnj3pqHwt4lAVtJjI6xz4x7FjTZ1VJMz65KAcesSZtXINYrSemXrlDQ1hz5
	kOCMCKHiu5KOGFibkFcyWWbyjD0BrYYkS3D6wfDvFCA/ky1ePSiP80QahCQsk/mrrdw0
	fgZYdCBBduk3hWpzOGKOdsMEQ3/FqHCApXHa3Bi+xKw33oyfSnAVkYXc8rm2nmmw8cwP
	5qvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=W1+RCbG6D6K4vv8/NWNmqtTXSX738qwBysgkGI/ldJE=;
	b=N26SRBJbkIZvy7PsBX9nPWS0Na+tezakTz8lBPfdGM2cM0y8tkr/TtU8gMwxPs4Kxs
	8vBFAHyInNii9R7uTFxqWwuUMLgCapIJQ+1onDVtOh6Go0pxVvuezAe0l5mb0JwyTbBq
	9nLYMsLGCwzQgsc/RFKnsApwRFZzWM0W9OpISSJi0cJQE/6UmQuMcAqIrxp/A+3HNZ0q
	yuoFZy4EwUXXAiDj4DNpVN4a4XqY2PZDnoU97JRQzZCIq7CNKhmMjpQNNtKv6ysOrFrE
	WUxqbgfBE0pBlcOtoKBJ++HzMOCQqP5nEdd6LzqyUQk8jVlbCoNHHwoHCkZ3+ST1P17l
	qn7g==
X-Gm-Message-State: ALyK8tKDOo+11sgx7yzsPpuxp6/IyX2gLhPF24F8ovhErBgBCu8fxW7e9VxAWIsnmo1YjEUmdmGlp6FvjtMJ0g==
X-Received: by 10.202.170.15 with SMTP id t15mr3565074oie.3.1465036657142;
	Sat, 04 Jun 2016 03:37:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.204.129 with HTTP; Sat, 4 Jun 2016 03:37:17 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 4 Jun 2016 22:37:17 +1200
Message-ID: <CADySD0EkXbgZ6MWCv-Dco6g1B0+k4-dxh5BKJ5xqPBYcHQtHrA@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: tisdk-rootfs-image error when using arago-krogoth-config
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
X-List-Received-Date: Sat, 04 Jun 2016 10:37:38 -0000
Content-Type: multipart/alternative; boundary=001a113cff38882fc70534716d8a

--001a113cff38882fc70534716d8a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8BHi,

I am trying to build tisdk-rootfs-image and getting following error:

http://pastebin.com/9SqudXGa

This is my build configuration:

Build Configuration:
BB_VERSION        =3D "1.30.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-16.04"
TARGET_SYS        =3D "arm-linux-gnueabi"
MACHINE           =3D "am335x-evm"
DISTRO            =3D "arago"
DISTRO_VERSION    =3D "2016.05"
TUNE_FEATURES     =3D "arm armv7a vfp thumb neon
callconvention-hard       cortexa8"
TARGET_FPU        =3D "hard"
meta-arago-distro
meta-arago-extras =3D "krogoth:01453ff0c02a472726f6dfe8f949abba55eab935"
meta-qt5          =3D "krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75"
meta-networking
meta-ruby
meta-python
meta-oe           =3D "krogoth:247b1267bbe95719cd4877d2d3cfbaf2a2f4865a"
meta-ti           =3D "krogoth:1ae0cadb1200d0007a779958e852a48379d42c26"
meta-linaro-toolchain =3D "krogoth:0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc=
"
meta              =3D "krogoth:b0b91490e4ede61a302eb547da2cc65aa7da87ff"

Any help is appreciated.

regards
Ankur

--001a113cff38882fc70534716d8a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">=E2=80=8BHi,<br><br></div><div =
class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;=
color:rgb(51,51,153)">I am trying to build tisdk-rootfs-image and getting f=
ollowing error:<br><br><a href=3D"http://pastebin.com/9SqudXGa">http://past=
ebin.com/9SqudXGa</a><br><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:georgia,serif;font-size:small;color:rgb(51,51,153)">This is my bu=
ild configuration:<br><br>Build Configuration:<br>BB_VERSION=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.30.0&quot;<br>BUILD_SYS=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-linux&quot;<br>NATIVE=
LSBSTRING=C2=A0=C2=A0 =3D &quot;Ubuntu-16.04&quot;<br>TARGET_SYS=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arm-linux-gnueabi&quot;<br>MACH=
INE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;a=
m335x-evm&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D &quot;arago&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=C2=
=A0 =3D &quot;2016.05&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0 =3D &q=
uot;arm armv7a vfp thumb neon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 callconve=
ntion-hard=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cortexa8&quot;<br>TARGET_FPU=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;hard&quot;<br>meta-ara=
go-distro <br>meta-arago-extras =3D &quot;krogoth:01453ff0c02a472726f6dfe8f=
949abba55eab935&quot;<br>meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75&quo=
t;<br>meta-networking=C2=A0=C2=A0 <br>meta-ruby=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <br>meta-python=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <=
br>meta-oe=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
&quot;krogoth:247b1267bbe95719cd4877d2d3cfbaf2a2f4865a&quot;<br>meta-ti=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;krogoth=
:1ae0cadb1200d0007a779958e852a48379d42c26&quot;<br>meta-linaro-toolchain =
=3D &quot;krogoth:0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc&quot;<br>meta=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D &quot;krogoth:b0b91490e4ede61a302eb547da2cc65aa7da87ff&quot;<br><br></=
div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-si=
ze:small;color:rgb(51,51,153)">Any help is appreciated.<br><br></div><div c=
lass=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;c=
olor:rgb(51,51,153)">regards<br></div><div class=3D"gmail_default" style=3D=
"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)">Ankur<br><=
/div></div>

--001a113cff38882fc70534716d8a--
