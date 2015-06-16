Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by arago-project.org (Postfix) with ESMTPS id 2C3C5529B5
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 23:04:42 +0000 (UTC)
Received: by oiyy130 with SMTP id y130so5383401oiy.0
	for <meta-arago@arago-project.org>;
	Tue, 16 Jun 2015 16:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=k6C3qeko53rbYCKPzRlI+jQL4wV8gqRJVvei/Omxoq8=;
	b=DK8tB+yDk1t9gxKhLklEsCAQ10uP3+D+2WO1lQGcmaERRhjCu4l5dYHyp/71FYuzb/
	5x9PXSK372s3wR0CluKvIxK7m0Ms0xBCbgLHbt2zwBKtUpSsQiLEJkrk0zgfFwAgFEIT
	VonxZu7TfMWWpPuGfNDlICk3gkWvdkzpW5YoH1bSR3O2PWL6wnMFcE15uhTqaCTvE7XZ
	+tuqGenNsycl11eWwmaStcLhAa+geME2YLUCjejVPqDUwiDyAkrkVgvJy4Q381HTCGje
	cQ/GXVH+3p+fXVyq00Ub3dZdt3XRgTAcq6q7/qIQ1lsAVa7dEv4JZQXinhGmvFsPwSAZ
	3OEw==
X-Received: by 10.202.206.214 with SMTP id e205mr2138950oig.132.1434495881137; 
	Tue, 16 Jun 2015 16:04:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.106.213 with HTTP; Tue, 16 Jun 2015 16:04:20 -0700 (PDT)
In-Reply-To: <20150615162226.GO4825@edge>
References: <CADySD0HLdsGyRo3G-GDG7RcS5+pfSQB5Je4-9aNE5W9AX3OidA@mail.gmail.com>
	<CADySD0FWxqfprvwCAXSEqyL2Sx08=ZWPxdzKoh5vws=cimeZUA@mail.gmail.com>
	<20150615162226.GO4825@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 17 Jun 2015 11:04:20 +1200
Message-ID: <CADySD0H4FoHD3S2tZauGrYZmBYNe1EZupPJWckWmRr3wnY+OKg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Tue, 16 Jun 2015 23:04:42 -0000
Content-Type: multipart/alternative; boundary=001a113d32926d531e0518aa9999

--001a113d32926d531e0518aa9999
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

So does that mean meta-arago fido is still nor ready ?

"Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
fruit salad"

On Tue, Jun 16, 2015 at 4:22 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> http://arago-project.org/pipermail/meta-arago/2015-May/005666.html
>
>
> On Sat, Jun 13, 2015 at 10:38:46AM +1200, Ankur Tyagi wrote:
> > "With typos fixed"
> >
> > =E2=80=8B
> > Hi,
> >
> > I am trying to create tisdk rootfs image for AM335x EVM.
> >
> > Following are the steps are performed:
> >
> > git clone git://arago-project.org/git/projects/oe-layersetup.git fido
> > export
> > PATH=3D/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$=
PATH
> > cd fido
> > ./oe-layersetup.sh -f configs/arago-fido-config.txt
> > cd build
> > . conf/setenv
> > MACHINE=3Dam335x-evm bitbake tisdk-rootfs-image
> >
> > This gave following error :
> >
> > NOTE: Started PRServer with DBfile:
> > /home/ankur/fido/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 53096=
,
> > PID: 3653
> > ERROR: Layer 'networking-layer' depends on layer 'meta-python', but thi=
s
> > layer is not enabled in your configuration
> >
> > Summary: There was 1 ERROR message shown, returning a non-zero exit cod=
e.
> >
> > I then added meta-python in bblayers.conf
> >
> > /home/ankur/fido/sources/meta-openembedded/meta-python \
> >
> > Again started bitbake
> > MACHINE=3Dam335x-evm bitbake tisdk-rootfs-image
> >
> > and got this error
> >
> > ERROR: ParseError at
> > /home/ankur/fido/sources/meta-arago/meta-arago-extras/recipes-core/meta=
/
> > external-arago-toolchain.bb:1: Could not include required file
> > recipes-core/eglibc/eglibc-package.inc
> >
> > Summary: There were 3 WARNING messages shown.
> > Summary: There was 1 ERROR message shown, returning a non-zero exit cod=
e.
> >
> > What wrong am I doing and how to fix it ?
> >
> > thanks
> > Ankur
> >
> >
> >
> >
> > On Sat, Jun 13, 2015 at 10:36 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> > wrote:
> >
> > > =E2=80=8B=E2=80=8B
> > > Hi,
> > >
> > > I am trying to create tisdk rootfs image for AM335x EVM.
> > >
> > > Following are the steps are performed:
> > >
> > > git clone git://arago-project.org/git/projects/oe-layersetup.git fido
> > > export
> > >
> PATH=3D/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$PA=
TH
> > > cd fido
> > > ./oe-layersetup.sh -f configs/arago-fido-conig.txt
> > > cd build
> > > . conf/setenv
> > > MACHINE=3Dam335-evm bitbake tisdk-rootfs-image
> > >
> > > This gave following error :
> > >
> > > NOTE: Started PRServer with DBfile:
> > > /home/ankur/fido/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
> 53096,
> > > PID: 3653
> > > ERROR: Layer 'networking-layer' depends on layer 'meta-python', but
> this
> > > layer is not enabled in your configuration
> > >
> > > Summary: There was 1 ERROR message shown, returning a non-zero exit
> code.
> > >
> > > I then added meta-python in bblayers.conf
> > >
> > > /home/ankur/fido/sources/meta-openembedded/meta-python \
> > >
> > > Again started bitbake
> > > MACHINE=3Dam335-evm bitbake tisdk-rootfs-image
> > >
> > > and got this error
> > >
> > > ERROR: ParseError at
> > >
> /home/ankur/fido/sources/meta-arago/meta-arago-extras/recipes-core/meta/
> > > external-arago-toolchain.bb:1: Could not include required file
> > > recipes-core/eglibc/eglibc-package.inc
> > >
> > > Summary: There were 3 WARNING messages shown.
> > > Summary: There was 1 ERROR message shown, returning a non-zero exit
> code.
> > >
> > > What wrong am I doing and how to fix it ?
> > >
> > > thanks
> > > Ankur
> > >
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--001a113d32926d531e0518aa9999
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">So does that mean meta-arago fido is s=
till nor ready ?</div></div><div class=3D"gmail_extra"><br clear=3D"all"><d=
iv><div class=3D"gmail_signature"><div dir=3D"ltr">&quot;Knowledge is knowi=
ng tomato is a fruit, wisdom is not putting it in a fruit salad&quot;</div>=
</div></div>
<br><div class=3D"gmail_quote">On Tue, Jun 16, 2015 at 4:22 AM, Denys Dmytr=
iyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_bla=
nk">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><a=
 href=3D"http://arago-project.org/pipermail/meta-arago/2015-May/005666.html=
" rel=3D"noreferrer" target=3D"_blank">http://arago-project.org/pipermail/m=
eta-arago/2015-May/005666.html</a><br>
<div><div class=3D"h5"><br>
<br>
On Sat, Jun 13, 2015 at 10:38:46AM +1200, Ankur Tyagi wrote:<br>
&gt; &quot;With typos fixed&quot;<br>
&gt;<br>
&gt; =E2=80=8B<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am trying to create tisdk rootfs image for AM335x EVM.<br>
&gt;<br>
&gt; Following are the steps are performed:<br>
&gt;<br>
&gt; git clone git://<a href=3D"http://arago-project.org/git/projects/oe-la=
yersetup.git" rel=3D"noreferrer" target=3D"_blank">arago-project.org/git/pr=
ojects/oe-layersetup.git</a> fido<br>
&gt; export<br>
&gt; PATH=3D/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:=
$PATH<br>
&gt; cd fido<br>
&gt; ./oe-layersetup.sh -f configs/arago-fido-config.txt<br>
&gt; cd build<br>
&gt; . conf/setenv<br>
&gt; MACHINE=3Dam335x-evm bitbake tisdk-rootfs-image<br>
&gt;<br>
&gt; This gave following error :<br>
&gt;<br>
&gt; NOTE: Started PRServer with DBfile:<br>
&gt; /home/ankur/fido/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 5309=
6,<br>
&gt; PID: 3653<br>
&gt; ERROR: Layer &#39;networking-layer&#39; depends on layer &#39;meta-pyt=
hon&#39;, but this<br>
&gt; layer is not enabled in your configuration<br>
&gt;<br>
&gt; Summary: There was 1 ERROR message shown, returning a non-zero exit co=
de.<br>
&gt;<br>
&gt; I then added meta-python in bblayers.conf<br>
&gt;<br>
&gt; /home/ankur/fido/sources/meta-openembedded/meta-python \<br>
&gt;<br>
&gt; Again started bitbake<br>
&gt; MACHINE=3Dam335x-evm bitbake tisdk-rootfs-image<br>
&gt;<br>
&gt; and got this error<br>
&gt;<br>
&gt; ERROR: ParseError at<br>
&gt; /home/ankur/fido/sources/meta-arago/meta-arago-extras/recipes-core/met=
a/<br>
&gt; <a href=3D"http://external-arago-toolchain.bb:1" rel=3D"noreferrer" ta=
rget=3D"_blank">external-arago-toolchain.bb:1</a>: Could not include requir=
ed file<br>
&gt; recipes-core/eglibc/eglibc-package.inc<br>
&gt;<br>
&gt; Summary: There were 3 WARNING messages shown.<br>
&gt; Summary: There was 1 ERROR message shown, returning a non-zero exit co=
de.<br>
&gt;<br>
&gt; What wrong am I doing and how to fix it ?<br>
&gt;<br>
&gt; thanks<br>
&gt; Ankur<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Sat, Jun 13, 2015 at 10:36 AM, Ankur Tyagi &lt;<a href=3D"mailto:an=
kur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; =E2=80=8B=E2=80=8B<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I am trying to create tisdk rootfs image for AM335x EVM.<br>
&gt; &gt;<br>
&gt; &gt; Following are the steps are performed:<br>
&gt; &gt;<br>
&gt; &gt; git clone git://<a href=3D"http://arago-project.org/git/projects/=
oe-layersetup.git" rel=3D"noreferrer" target=3D"_blank">arago-project.org/g=
it/projects/oe-layersetup.git</a> fido<br>
&gt; &gt; export<br>
&gt; &gt; PATH=3D/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux=
/bin:$PATH<br>
&gt; &gt; cd fido<br>
&gt; &gt; ./oe-layersetup.sh -f configs/arago-fido-conig.txt<br>
&gt; &gt; cd build<br>
&gt; &gt; . conf/setenv<br>
&gt; &gt; MACHINE=3Dam335-evm bitbake tisdk-rootfs-image<br>
&gt; &gt;<br>
&gt; &gt; This gave following error :<br>
&gt; &gt;<br>
&gt; &gt; NOTE: Started PRServer with DBfile:<br>
&gt; &gt; /home/ankur/fido/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:=
 53096,<br>
&gt; &gt; PID: 3653<br>
&gt; &gt; ERROR: Layer &#39;networking-layer&#39; depends on layer &#39;met=
a-python&#39;, but this<br>
&gt; &gt; layer is not enabled in your configuration<br>
&gt; &gt;<br>
&gt; &gt; Summary: There was 1 ERROR message shown, returning a non-zero ex=
it code.<br>
&gt; &gt;<br>
&gt; &gt; I then added meta-python in bblayers.conf<br>
&gt; &gt;<br>
&gt; &gt; /home/ankur/fido/sources/meta-openembedded/meta-python \<br>
&gt; &gt;<br>
&gt; &gt; Again started bitbake<br>
&gt; &gt; MACHINE=3Dam335-evm bitbake tisdk-rootfs-image<br>
&gt; &gt;<br>
&gt; &gt; and got this error<br>
&gt; &gt;<br>
&gt; &gt; ERROR: ParseError at<br>
&gt; &gt; /home/ankur/fido/sources/meta-arago/meta-arago-extras/recipes-cor=
e/meta/<br>
&gt; &gt; <a href=3D"http://external-arago-toolchain.bb:1" rel=3D"noreferre=
r" target=3D"_blank">external-arago-toolchain.bb:1</a>: Could not include r=
equired file<br>
&gt; &gt; recipes-core/eglibc/eglibc-package.inc<br>
&gt; &gt;<br>
&gt; &gt; Summary: There were 3 WARNING messages shown.<br>
&gt; &gt; Summary: There was 1 ERROR message shown, returning a non-zero ex=
it code.<br>
&gt; &gt;<br>
&gt; &gt; What wrong am I doing and how to fix it ?<br>
&gt; &gt;<br>
&gt; &gt; thanks<br>
&gt; &gt; Ankur<br>
&gt; &gt;<br>
<br>
</div></div>&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-proje=
ct.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer" target=3D"_blank">http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago</a><br>
<br>
</blockquote></div><br></div>

--001a113d32926d531e0518aa9999--
