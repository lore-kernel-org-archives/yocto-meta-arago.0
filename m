Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by arago-project.org (Postfix) with ESMTPS id BED2452987
	for <meta-arago@arago-project.org>;
	Wed, 16 Sep 2015 04:34:26 +0000 (UTC)
Received: by vkgd64 with SMTP id d64so93793373vkg.0
	for <meta-arago@arago-project.org>;
	Tue, 15 Sep 2015 21:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=czWzQsXqPqoWuYntIOqHlgLExaHWjvMGON6v9MLOO9Y=;
	b=XhU2aBBapUJIBABoK15462Ot/pY6RvRcLUxRyW+3oM4yB9rkZ70aWOmSjXmWOq/wiL
	Thq4avg3TRR6uEmQjbRX6zt8mp2FelbLoJPdhVSqrWm/pTMx4MNf5dfwCYbdoIm1MSbb
	QqX9W602GF8TOVhvnsJtel5fCe7zaJZs0PP/WMN+H4R+bjXdbqz75kATVphHW20aFS+l
	FpWfPZs978ndBbyL/h1UBMMbGfJbYfb+RgXstXFyCxxcGL8/YU7t97lUAmMX0uEwK4rF
	MPwbgJln4u2x2gFGfllQ+et9t0ohW2u42Uc2igscuRuGzBat4nLpqcBSp7rQ+lW/Ppk3
	1h5w==
X-Received: by 10.31.178.8 with SMTP id b8mr26517566vkf.15.1442378065939; Tue,
	15 Sep 2015 21:34:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.201.130 with HTTP; Tue, 15 Sep 2015 21:34:06 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 16 Sep 2015 16:34:06 +1200
Message-ID: <CADySD0FHY6MXnOWdAavtPvVi=UzAeQ9bPc2SPJ2h6V6FeKhqqw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Missing kernel module file for module-init-tools utitlity
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
X-List-Received-Date: Wed, 16 Sep 2015 04:34:28 -0000
Content-Type: multipart/alternative; boundary=001a1143f330409130051fd5d024

--001a1143f330409130051fd5d024
Content-Type: text/plain; charset=UTF-8

Hi,

I have a machine in which yocto environment is configured and working.

I copied everything onto a different machine (without Internet access).
Without modifying anything, tried to re-build image to check sanity of
setup.

The image created was missing following files:

/lib/modules/<kernel-version/
modules.alias
modules.alias.bin
modules.builtin
modules.builtin.bin
modules.dep
modules.dep.bin
modules.devname
modules.order
modules.softdep
modules.symbols
modules.symbols.bin

I want to understand in which stage and from where are above file created
and how can I create them if they are not created automatically

thanks
Ankur

--001a1143f330409130051fd5d024
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">Hi,</div><div class=3D"gmail_de=
fault" style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,1=
53)"><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,se=
rif;font-size:small;color:rgb(51,51,153)">I have a machine in which yocto e=
nvironment is configured and working.</div><div class=3D"gmail_default" sty=
le=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)"><br><=
/div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-s=
ize:small;color:rgb(51,51,153)">I copied everything onto a different machin=
e (without Internet access). Without modifying anything, tried to re-build =
image to check sanity of setup.</div><div class=3D"gmail_default" style=3D"=
font-family:georgia,serif;font-size:small;color:rgb(51,51,153)"><br></div><=
div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:sm=
all;color:rgb(51,51,153)">The image created was missing following files:</d=
iv><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-siz=
e:small;color:rgb(51,51,153)">=C2=A0</div><div class=3D"gmail_default" styl=
e=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)"><div c=
lass=3D"gmail_default">/lib/modules/&lt;kernel-version/</div><div class=3D"=
gmail_default">modules.alias</div><div class=3D"gmail_default">modules.alia=
s.bin</div><div class=3D"gmail_default">modules.builtin</div><div class=3D"=
gmail_default">modules.builtin.bin</div><div class=3D"gmail_default">module=
s.dep</div><div class=3D"gmail_default">modules.dep.bin</div><div class=3D"=
gmail_default">modules.devname</div><div class=3D"gmail_default">modules.or=
der</div><div class=3D"gmail_default">modules.softdep</div><div class=3D"gm=
ail_default">modules.symbols</div><div class=3D"gmail_default">modules.symb=
ols.bin</div></div><div class=3D"gmail_default" style=3D"font-family:georgi=
a,serif;font-size:small;color:rgb(51,51,153)"><br></div><div class=3D"gmail=
_default" style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,5=
1,153)">I want to understand in which stage and from where are above file c=
reated and how can I create them if they are not created automatically</div=
><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:=
small;color:rgb(51,51,153)"><br></div><div class=3D"gmail_default" style=3D=
"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)">thanks</di=
v><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size=
:small;color:rgb(51,51,153)">Ankur</div>
</div>

--001a1143f330409130051fd5d024--
