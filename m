Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by arago-project.org (Postfix) with ESMTPS id 0592F52A10
	for <meta-arago@arago-project.org>;
	Fri, 12 Jun 2015 22:36:56 +0000 (UTC)
Received: by obcuy5 with SMTP id uy5so7428421obc.0
	for <meta-arago@arago-project.org>;
	Fri, 12 Jun 2015 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=EcAGB6XgKAyGMcR5vHbbZHjfek7Jy6YohXXh9K7yzQQ=;
	b=rQKJMGW7cM2gbItut76k/ie02EWCKqdV7cnvKGt5yiwSCwHkcv2oXGYasVjsjcmwk+
	l+IliKFJZ4u1jk6Miql1aeUf96FrhPw/kIf1E+rY292JL0m1Mqr1OknB/WudZO39py1x
	UlqenLYBMjmVouDpqWdHiwJNVWjBo/jZyMVvDC5EHe6jEzZzcIQJvdivNLDwYzjv32WM
	GBITAPljm/oi8TedQEL1A65tX2aYwY4SHOhY1HOKKoSbH1E0ot7JHXweQoRfjY0bW1d2
	/6YjIxcc28Lo+27y1u1Ty5RoiUemPsgKxq0anArRbK1c+e+qtvYaI/DZHcItBVHfArq3
	eOpA==
X-Received: by 10.182.70.74 with SMTP id k10mr12210249obu.2.1434148615846;
	Fri, 12 Jun 2015 15:36:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.106.213 with HTTP; Fri, 12 Jun 2015 15:36:35 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 13 Jun 2015 10:36:35 +1200
Message-ID: <CADySD0HLdsGyRo3G-GDG7RcS5+pfSQB5Je4-9aNE5W9AX3OidA@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: bitbake error when using arago-fido-config
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
X-List-Received-Date: Fri, 12 Jun 2015 22:36:57 -0000
Content-Type: multipart/alternative; boundary=089e0149c48ccd8028051859be2c

--089e0149c48ccd8028051859be2c
Content-Type: text/plain; charset=UTF-8

Hi,

I am trying to create tisdk rootfs image for AM335x EVM.

Following are the steps are performed:

git clone git://arago-project.org/git/projects/oe-layersetup.git fido
export
PATH=/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$PATH
cd fido
./oe-layersetup.sh -f configs/arago-fido-conig.txt
cd build
. conf/setenv
MACHINE=am335-evm bitbake tisdk-rootfs-image

This gave following error :

NOTE: Started PRServer with DBfile:
/home/ankur/fido/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 53096,
PID: 3653
ERROR: Layer 'networking-layer' depends on layer 'meta-python', but this
layer is not enabled in your configuration

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

I then added meta-python in bblayers.conf

/home/ankur/fido/sources/meta-openembedded/meta-python \

Again started bitbake
MACHINE=am335-evm bitbake tisdk-rootfs-image

and got this error

ERROR: ParseError at
/home/ankur/fido/sources/meta-arago/meta-arago-extras/recipes-core/meta/
external-arago-toolchain.bb:1: Could not include required file
recipes-core/eglibc/eglibc-package.inc

Summary: There were 3 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

What wrong am I doing and how to fix it ?

thanks
Ankur

--089e0149c48ccd8028051859be2c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">Hi,</div><div class=3D"gmail_de=
fault" style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,1=
53)"><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,se=
rif;font-size:small;color:rgb(51,51,153)">I am trying to create tisdk rootf=
s image for AM335x EVM.</div><div class=3D"gmail_default" style=3D"font-fam=
ily:georgia,serif;font-size:small;color:rgb(51,51,153)"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;colo=
r:rgb(51,51,153)">Following are the steps are performed:</div><div class=3D=
"gmail_default" style=3D"font-family:georgia,serif;font-size:small;color:rg=
b(51,51,153)"><br></div><div class=3D"gmail_default" style><div class=3D"gm=
ail_default" style><font color=3D"#333399" face=3D"georgia, serif">git clon=
e git://<a href=3D"http://arago-project.org/git/projects/oe-layersetup.git"=
>arago-project.org/git/projects/oe-layersetup.git</a> fido</font></div><div=
 class=3D"gmail_default" style><font color=3D"#333399" face=3D"georgia, ser=
if">export PATH=3D/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linu=
x/bin:$PATH</font></div><div class=3D"gmail_default" style><font color=3D"#=
333399" face=3D"georgia, serif">cd fido</font></div><div class=3D"gmail_def=
ault" style><font color=3D"#333399" face=3D"georgia, serif">./oe-layersetup=
.sh -f configs/arago-fido-conig.txt</font></div><div class=3D"gmail_default=
" style><font color=3D"#333399" face=3D"georgia, serif">cd build</font></di=
v><div class=3D"gmail_default" style><font color=3D"#333399" face=3D"georgi=
a, serif">. conf/setenv</font></div><div class=3D"gmail_default" style><fon=
t color=3D"#333399" face=3D"georgia, serif">MACHINE=3Dam335-evm bitbake tis=
dk-rootfs-image</font></div><div class=3D"gmail_default" style><font color=
=3D"#333399" face=3D"georgia, serif"><br></font></div><div class=3D"gmail_d=
efault" style><font color=3D"#333399" face=3D"georgia, serif">This gave fol=
lowing error :</font></div><div class=3D"gmail_default" style><font color=
=3D"#333399" face=3D"georgia, serif"><br></font></div><div class=3D"gmail_d=
efault" style><font color=3D"#333399" face=3D"georgia, serif">NOTE: Started=
 PRServer with DBfile: /home/ankur/fido/build/cache/prserv.sqlite3, IP: 127=
.0.0.1, PORT: 53096, PID: 3653</font></div><div class=3D"gmail_default" sty=
le><font color=3D"#333399" face=3D"georgia, serif">ERROR: Layer &#39;networ=
king-layer&#39; depends on layer &#39;meta-python&#39;, but this layer is n=
ot enabled in your configuration</font></div><div class=3D"gmail_default" s=
tyle><font color=3D"#333399" face=3D"georgia, serif"><br></font></div><div =
class=3D"gmail_default" style><font color=3D"#333399" face=3D"georgia, seri=
f">Summary: There was 1 ERROR message shown, returning a non-zero exit code=
.</font></div><div class=3D"gmail_default" style><font color=3D"#333399" fa=
ce=3D"georgia, serif"><br></font></div><div class=3D"gmail_default" style><=
font color=3D"#333399" face=3D"georgia, serif">I then added meta-python in =
bblayers.conf</font></div><div class=3D"gmail_default" style><br></div><div=
 class=3D"gmail_default" style><font color=3D"#333399" face=3D"georgia, ser=
if">/home/ankur/fido/sources/meta-openembedded/meta-python \</font></div><d=
iv class=3D"gmail_default" style><font color=3D"#333399" face=3D"georgia, s=
erif"><br></font></div><div class=3D"gmail_default" style><font color=3D"#3=
33399" face=3D"georgia, serif">Again started bitbake</font></div><div class=
=3D"gmail_default" style><font color=3D"#333399" face=3D"georgia, serif">MA=
CHINE=3Dam335-evm bitbake tisdk-rootfs-image</font></div><div class=3D"gmai=
l_default" style><font color=3D"#333399" face=3D"georgia, serif"><br></font=
></div><div class=3D"gmail_default" style><font color=3D"#333399" face=3D"g=
eorgia, serif">and got this error</font></div><div class=3D"gmail_default" =
style><font color=3D"#333399" face=3D"georgia, serif"><br></font></div><div=
 class=3D"gmail_default" style><font color=3D"#333399" face=3D"georgia, ser=
if">ERROR: ParseError at /home/ankur/fido/sources/meta-arago/meta-arago-ext=
ras/recipes-core/meta/<a href=3D"http://external-arago-toolchain.bb:1">exte=
rnal-arago-toolchain.bb:1</a>: Could not include required file recipes-core=
/eglibc/eglibc-package.inc</font></div><div class=3D"gmail_default" style><=
font color=3D"#333399" face=3D"georgia, serif"><br></font></div><div class=
=3D"gmail_default" style><font color=3D"#333399" face=3D"georgia, serif">Su=
mmary: There were 3 WARNING messages shown.</font></div><div class=3D"gmail=
_default" style><font color=3D"#333399" face=3D"georgia, serif">Summary: Th=
ere was 1 ERROR message shown, returning a non-zero exit code.</font></div>=
<div class=3D"gmail_default" style><font color=3D"#333399" face=3D"georgia,=
 serif"><br></font></div><div class=3D"gmail_default" style><font color=3D"=
#333399" face=3D"georgia, serif">What wrong am I doing and how to fix it ?<=
/font></div><div class=3D"gmail_default" style><font color=3D"#333399" face=
=3D"georgia, serif"><br></font></div><div class=3D"gmail_default" style><fo=
nt color=3D"#333399" face=3D"georgia, serif">thanks</font></div><div class=
=3D"gmail_default" style><font color=3D"#333399" face=3D"georgia, serif">An=
kur</font></div></div>
</div>

--089e0149c48ccd8028051859be2c--
