Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by arago-project.org (Postfix) with ESMTPS id 971145298F
	for <meta-arago@arago-project.org>;
	Fri, 12 Jun 2015 22:39:07 +0000 (UTC)
Received: by obcuy5 with SMTP id uy5so7434617obc.0
	for <meta-arago@arago-project.org>;
	Fri, 12 Jun 2015 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=JvvsE1zy99drC6yFBXy7C/sqfjDY8gGIYIZAyFmtJ/w=;
	b=J+WUeEuF4/fFxR7SJzsS/GVGQxxovFuIGEXa9GAICkiNObSKV6JRiy4L1VSkFVIdB3
	0y659Yq4iK5VfVGWqViftcV1lt7kMBX7XfBxS26sM7ApbNrwu7iSCBhoCzU+q/Fu2HWp
	pqO3gSKuko2uxtMp1v3CHZk77COpm7CXh6XO0PaTa0J4g9LRpZJvTc1lkqnMCUhbYo0L
	ayNvDpZFgLJYWbld6ELn17wVZkTtfK16CARAAiicMevWV3o1gTfNpn2ndsf4bjzUryyB
	4G4KCxCB1jKznPY3xTQ+x6w8wGC555maWsQ464yGA2kAob5hDrQnPE/DCNGA4oTDj1xi
	VK2A==
X-Received: by 10.60.33.74 with SMTP id p10mr2154170oei.62.1434148747005; Fri,
	12 Jun 2015 15:39:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.106.213 with HTTP; Fri, 12 Jun 2015 15:38:46 -0700 (PDT)
In-Reply-To: <CADySD0HLdsGyRo3G-GDG7RcS5+pfSQB5Je4-9aNE5W9AX3OidA@mail.gmail.com>
References: <CADySD0HLdsGyRo3G-GDG7RcS5+pfSQB5Je4-9aNE5W9AX3OidA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 13 Jun 2015 10:38:46 +1200
Message-ID: <CADySD0FWxqfprvwCAXSEqyL2Sx08=ZWPxdzKoh5vws=cimeZUA@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Re: bitbake error when using arago-fido-config
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
X-List-Received-Date: Fri, 12 Jun 2015 22:39:07 -0000
Content-Type: multipart/alternative; boundary=089e0115eef89ed5cf051859c681

--089e0115eef89ed5cf051859c681
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

"With typos fixed"

=E2=80=8B
Hi,

I am trying to create tisdk rootfs image for AM335x EVM.

Following are the steps are performed:

git clone git://arago-project.org/git/projects/oe-layersetup.git fido
export
PATH=3D/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$PATH
cd fido
./oe-layersetup.sh -f configs/arago-fido-config.txt
cd build
. conf/setenv
MACHINE=3Dam335x-evm bitbake tisdk-rootfs-image

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
MACHINE=3Dam335x-evm bitbake tisdk-rootfs-image

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




On Sat, Jun 13, 2015 at 10:36 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
wrote:

> =E2=80=8B=E2=80=8B
> Hi,
>
> I am trying to create tisdk rootfs image for AM335x EVM.
>
> Following are the steps are performed:
>
> git clone git://arago-project.org/git/projects/oe-layersetup.git fido
> export
> PATH=3D/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$PA=
TH
> cd fido
> ./oe-layersetup.sh -f configs/arago-fido-conig.txt
> cd build
> . conf/setenv
> MACHINE=3Dam335-evm bitbake tisdk-rootfs-image
>
> This gave following error :
>
> NOTE: Started PRServer with DBfile:
> /home/ankur/fido/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 53096,
> PID: 3653
> ERROR: Layer 'networking-layer' depends on layer 'meta-python', but this
> layer is not enabled in your configuration
>
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> I then added meta-python in bblayers.conf
>
> /home/ankur/fido/sources/meta-openembedded/meta-python \
>
> Again started bitbake
> MACHINE=3Dam335-evm bitbake tisdk-rootfs-image
>
> and got this error
>
> ERROR: ParseError at
> /home/ankur/fido/sources/meta-arago/meta-arago-extras/recipes-core/meta/
> external-arago-toolchain.bb:1: Could not include required file
> recipes-core/eglibc/eglibc-package.inc
>
> Summary: There were 3 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> What wrong am I doing and how to fix it ?
>
> thanks
> Ankur
>

--089e0115eef89ed5cf051859c681
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">&quot;With typos fixed&quot;</d=
iv><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-siz=
e:small;color:rgb(51,51,153)"><br></div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)"><div di=
r=3D"ltr" style=3D"color:rgb(34,34,34);font-family:arial,sans-serif"><div s=
tyle=3D"font-family:georgia,serif;color:rgb(51,51,153)"><div class=3D"gmail=
_default" style=3D"display:inline">=E2=80=8B</div>Hi,</div><div style=3D"fo=
nt-family:georgia,serif;color:rgb(51,51,153)"><br></div><div style=3D"font-=
family:georgia,serif;color:rgb(51,51,153)">I am trying to create tisdk root=
fs image for AM335x EVM.</div><div style=3D"font-family:georgia,serif;color=
:rgb(51,51,153)"><br></div><div style=3D"font-family:georgia,serif;color:rg=
b(51,51,153)">Following are the steps are performed:</div><div style=3D"fon=
t-family:georgia,serif;color:rgb(51,51,153)"><br></div><div><div><font colo=
r=3D"#333399" face=3D"georgia, serif">git clone git://<a href=3D"http://ara=
go-project.org/git/projects/oe-layersetup.git" target=3D"_blank">arago-proj=
ect.org/git/projects/oe-layersetup.git</a>=C2=A0fido</font></div><div><font=
 color=3D"#333399" face=3D"georgia, serif">export PATH=3D/opt/fido/gcc-lina=
ro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$PATH</font></div><div><font c=
olor=3D"#333399" face=3D"georgia, serif">cd fido</font></div><div><font col=
or=3D"#333399" face=3D"georgia, serif">./oe-layersetup.sh -f configs/arago-=
fido-config.txt</font></div><div><font color=3D"#333399" face=3D"georgia, s=
erif">cd build</font></div><div><font color=3D"#333399" face=3D"georgia, se=
rif">. conf/setenv</font></div><div><font color=3D"#333399" face=3D"georgia=
, serif">MACHINE=3Dam335x-evm bitbake tisdk-rootfs-image</font></div><div><=
font color=3D"#333399" face=3D"georgia, serif"><br></font></div><div><font =
color=3D"#333399" face=3D"georgia, serif">This gave following error :</font=
></div><div><font color=3D"#333399" face=3D"georgia, serif"><br></font></di=
v><div><font color=3D"#333399" face=3D"georgia, serif">NOTE: Started PRServ=
er with DBfile: /home/ankur/fido/build/cache/prserv.sqlite3, IP: 127.0.0.1,=
 PORT: 53096, PID: 3653</font></div><div><font color=3D"#333399" face=3D"ge=
orgia, serif">ERROR: Layer &#39;networking-layer&#39; depends on layer &#39=
;meta-python&#39;, but this layer is not enabled in your configuration</fon=
t></div><div><font color=3D"#333399" face=3D"georgia, serif"><br></font></d=
iv><div><font color=3D"#333399" face=3D"georgia, serif">Summary: There was =
1 ERROR message shown, returning a non-zero exit code.</font></div><div><fo=
nt color=3D"#333399" face=3D"georgia, serif"><br></font></div><div><font co=
lor=3D"#333399" face=3D"georgia, serif">I then added meta-python in bblayer=
s.conf</font></div><div><br></div><div><font color=3D"#333399" face=3D"geor=
gia, serif">/home/ankur/fido/sources/meta-openembedded/meta-python \</font>=
</div><div><font color=3D"#333399" face=3D"georgia, serif"><br></font></div=
><div><font color=3D"#333399" face=3D"georgia, serif">Again started bitbake=
</font></div><div><font color=3D"#333399" face=3D"georgia, serif">MACHINE=
=3Dam335x-evm bitbake tisdk-rootfs-image</font></div><div><font color=3D"#3=
33399" face=3D"georgia, serif"><br></font></div><div><font color=3D"#333399=
" face=3D"georgia, serif">and got this error</font></div><div><font color=
=3D"#333399" face=3D"georgia, serif"><br></font></div><div><font color=3D"#=
333399" face=3D"georgia, serif">ERROR: ParseError at /home/ankur/fido/sourc=
es/meta-arago/meta-arago-extras/recipes-core/meta/<a href=3D"http://externa=
l-arago-toolchain.bb:1/" target=3D"_blank">external-arago-toolchain.bb:1</a=
>: Could not include required file recipes-core/eglibc/eglibc-package.inc</=
font></div><div><font color=3D"#333399" face=3D"georgia, serif"><br></font>=
</div><div><font color=3D"#333399" face=3D"georgia, serif">Summary: There w=
ere 3 WARNING messages shown.</font></div><div><font color=3D"#333399" face=
=3D"georgia, serif">Summary: There was 1 ERROR message shown, returning a n=
on-zero exit code.</font></div><div><font color=3D"#333399" face=3D"georgia=
, serif"><br></font></div><div><font color=3D"#333399" face=3D"georgia, ser=
if">What wrong am I doing and how to fix it ?</font></div><div><font color=
=3D"#333399" face=3D"georgia, serif"><br></font></div><div><font color=3D"#=
333399" face=3D"georgia, serif">thanks</font></div><span class=3D""><font c=
olor=3D"#888888"><font color=3D"#333399" face=3D"georgia, serif">Ankur</fon=
t></font></span></div><div><span class=3D""><font color=3D"#888888"><font c=
olor=3D"#333399" face=3D"georgia, serif"><br></font></font></span></div></d=
iv></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gm=
ail_signature"><div dir=3D"ltr"><br></div></div></div>
<br><div class=3D"gmail_quote">On Sat, Jun 13, 2015 at 10:36 AM, Ankur Tyag=
i <span dir=3D"ltr">&lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=
=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1e=
x"><div dir=3D"ltr"><div style=3D"font-family:georgia,serif;font-size:small=
;color:rgb(51,51,153)"><div class=3D"gmail_default" style=3D"font-family:ge=
orgia,serif;font-size:small;color:rgb(51,51,153);display:inline">=E2=80=8B=
=E2=80=8B</div>Hi,</div><div style=3D"font-family:georgia,serif;font-size:s=
mall;color:rgb(51,51,153)"><br></div><div style=3D"font-family:georgia,seri=
f;font-size:small;color:rgb(51,51,153)">I am trying to create tisdk rootfs =
image for AM335x EVM.</div><div style=3D"font-family:georgia,serif;font-siz=
e:small;color:rgb(51,51,153)"><br></div><div style=3D"font-family:georgia,s=
erif;font-size:small;color:rgb(51,51,153)">Following are the steps are perf=
ormed:</div><div style=3D"font-family:georgia,serif;font-size:small;color:r=
gb(51,51,153)"><br></div><div><div><font color=3D"#333399" face=3D"georgia,=
 serif">git clone git://<a href=3D"http://arago-project.org/git/projects/oe=
-layersetup.git" target=3D"_blank">arago-project.org/git/projects/oe-layers=
etup.git</a> fido</font></div><div><font color=3D"#333399" face=3D"georgia,=
 serif">export PATH=3D/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_=
linux/bin:$PATH</font></div><div><font color=3D"#333399" face=3D"georgia, s=
erif">cd fido</font></div><div><font color=3D"#333399" face=3D"georgia, ser=
if">./oe-layersetup.sh -f configs/arago-fido-conig.txt</font></div><div><fo=
nt color=3D"#333399" face=3D"georgia, serif">cd build</font></div><div><fon=
t color=3D"#333399" face=3D"georgia, serif">. conf/setenv</font></div><div>=
<font color=3D"#333399" face=3D"georgia, serif">MACHINE=3Dam335-evm bitbake=
 tisdk-rootfs-image</font></div><div><font color=3D"#333399" face=3D"georgi=
a, serif"><br></font></div><div><font color=3D"#333399" face=3D"georgia, se=
rif">This gave following error :</font></div><div><font color=3D"#333399" f=
ace=3D"georgia, serif"><br></font></div><div><font color=3D"#333399" face=
=3D"georgia, serif">NOTE: Started PRServer with DBfile: /home/ankur/fido/bu=
ild/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 53096, PID: 3653</font></div=
><div><font color=3D"#333399" face=3D"georgia, serif">ERROR: Layer &#39;net=
working-layer&#39; depends on layer &#39;meta-python&#39;, but this layer i=
s not enabled in your configuration</font></div><div><font color=3D"#333399=
" face=3D"georgia, serif"><br></font></div><div><font color=3D"#333399" fac=
e=3D"georgia, serif">Summary: There was 1 ERROR message shown, returning a =
non-zero exit code.</font></div><div><font color=3D"#333399" face=3D"georgi=
a, serif"><br></font></div><div><font color=3D"#333399" face=3D"georgia, se=
rif">I then added meta-python in bblayers.conf</font></div><div><br></div><=
div><font color=3D"#333399" face=3D"georgia, serif">/home/ankur/fido/source=
s/meta-openembedded/meta-python \</font></div><div><font color=3D"#333399" =
face=3D"georgia, serif"><br></font></div><div><font color=3D"#333399" face=
=3D"georgia, serif">Again started bitbake</font></div><div><font color=3D"#=
333399" face=3D"georgia, serif">MACHINE=3Dam335-evm bitbake tisdk-rootfs-im=
age</font></div><div><font color=3D"#333399" face=3D"georgia, serif"><br></=
font></div><div><font color=3D"#333399" face=3D"georgia, serif">and got thi=
s error</font></div><div><font color=3D"#333399" face=3D"georgia, serif"><b=
r></font></div><div><font color=3D"#333399" face=3D"georgia, serif">ERROR: =
ParseError at /home/ankur/fido/sources/meta-arago/meta-arago-extras/recipes=
-core/meta/<a href=3D"http://external-arago-toolchain.bb:1" target=3D"_blan=
k">external-arago-toolchain.bb:1</a>: Could not include required file recip=
es-core/eglibc/eglibc-package.inc</font></div><div><font color=3D"#333399" =
face=3D"georgia, serif"><br></font></div><div><font color=3D"#333399" face=
=3D"georgia, serif">Summary: There were 3 WARNING messages shown.</font></d=
iv><div><font color=3D"#333399" face=3D"georgia, serif">Summary: There was =
1 ERROR message shown, returning a non-zero exit code.</font></div><div><fo=
nt color=3D"#333399" face=3D"georgia, serif"><br></font></div><div><font co=
lor=3D"#333399" face=3D"georgia, serif">What wrong am I doing and how to fi=
x it ?</font></div><div><font color=3D"#333399" face=3D"georgia, serif"><br=
></font></div><div><font color=3D"#333399" face=3D"georgia, serif">thanks</=
font></div><span class=3D""><font color=3D"#888888"><div><font color=3D"#33=
3399" face=3D"georgia, serif">Ankur</font></div></font></span></div>
</div>
</blockquote></div><br></div></div>

--089e0115eef89ed5cf051859c681--
