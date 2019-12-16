Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by arago-project.org (Postfix) with ESMTPS id 123C752993
	for <meta-arago@arago-project.org>;
	Mon, 16 Dec 2019 22:23:20 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id z17so8525150ljk.13
	for <meta-arago@arago-project.org>;
	Mon, 16 Dec 2019 14:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8XFmXjQDuEDXfMw+U9q8Co6qDFOQ/6KbBaone3XoVKY=;
	b=UgRWsqAIYC6K2bdqwl5vUPMquHPyRDhefF143VTAzYL+PiWsnozIpZJA22Pcg0FwXZ
	Z8SpiYe3DnLte3J+QcC19eugBZLW4krTRufSmW5OVgvHUUhW/yzNgtF8UZZB+rZoayYF
	qdz7SOxhAJcmk6DGyO/SYKl6tFSbPlZz2AKqpoXT/kqOj590uZybIthqWCLyL3JLyiw4
	zuokJLsknn4tiEhyNu5owxTL1C05AAmTs5EigWNh1Z4DOLIdfILVMcTffe0OVgvUyW0G
	5CrDmzAGaez6WexgfHqWKM3MHTr6pLxTleLpDTX9ymHPQBftskEzPVsRrEzjlut26R7k
	KgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8XFmXjQDuEDXfMw+U9q8Co6qDFOQ/6KbBaone3XoVKY=;
	b=W2UYV0VZrPDrPs/mD31mDgZ5/ywzClKKMTiwzuao/Fr/bb49A4/bem87Hl8bDs4/68
	zoTd7yj7hWcYNNNEZBe/y9CFytaEBD07wq9ig0ShkGrp4qnY3tkQ1qne4OHJksguyh3U
	GIWu42D1xKDtP/JncnBS76fOLQ5fm0pVINFQCNPvQkKSkoQ5VF/A7n3yIWVLJ63A6lbu
	f++JtVDxt6wsUmg5QJUk9pNoOaKrgFGJ+mIuVfg1BzO4t2fVyDdcsW4TazSdsiIpdFkm
	73PCbFKacrdD4Zgix9oRCePEoSZA8+fd/llVjW8zOHrlkDKdk+obvvDX80KfKkhlJrZc
	nIqA==
X-Gm-Message-State: APjAAAVgZfoZTk5CQS7H5jLqEcpEZnEeC8s+9nsfOnZ27zySF2d6Aelj
	FTH5m5L/yqXsmTFgeg+paGpia2OyhQU60qowSTs=
X-Google-Smtp-Source: APXvYqwip26keCgiP0Zjbmye+h7HT7G+TRqEbTvJwrUUtLCRz6ux6YCuNemsqjdJdySDBWbC/xZH9f0G9nB7Il6BSIg=
X-Received: by 2002:a2e:854c:: with SMTP id u12mr888482ljj.135.1576534902655; 
	Mon, 16 Dec 2019 14:21:42 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HyRLzXfSfcYTrGZmuX2acoCMi2BE+hy=v+-fKPAvF3Mw@mail.gmail.com>
	<CADySD0HKK1MWGXg2qL4PP-SRiyrHGJUpwKgAuCTVsZ0MizCSpg@mail.gmail.com>
	<20190926162746.GC5386@beryl>
	<CADySD0H4jZy5YpHudHyEwhsJLhcCLLt3yJ-nX1sdqik561Qt3g@mail.gmail.com>
	<CADySD0H7NXcvhhV++WNtCu4nsxy=CV7MiH3oMitJS_W5QmBYoA@mail.gmail.com>
	<20191114001943.GF15023@beryl>
	<CADySD0HozPke2v8qAOb5_WYn5mo1Cx_q+HgRdR3TXGRLfNcixw@mail.gmail.com>
	<CADySD0HTaqCNGYwNxdGajBP=gx-RfqpPed+Jzi=-nKZ+BQATeQ@mail.gmail.com>
In-Reply-To: <CADySD0HTaqCNGYwNxdGajBP=gx-RfqpPed+Jzi=-nKZ+BQATeQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 17 Dec 2019 11:21:29 +1300
Message-ID: <CADySD0GiukvX1Wh8WYDgwcDXbSv65e3hb7oGwcUTmO5srFTc_g@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: do_rootfs error for custom image based upon arago thud branch
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
X-List-Received-Date: Mon, 16 Dec 2019 22:23:20 -0000
Content-Type: multipart/alternative; boundary="000000000000d94edf0599d9a271"

--000000000000d94edf0599d9a271
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

I digged more and found out all issues are because of create_sourceipk task.

I have different UBOOT_MACHINE(custom_config) and MACHINE(am335x-evm)
Similarly I have customisation for linux-ti-staging recipe.

arago-source-ipk.inc set CREATE_SRCIPK for both packages, u-boot-ti-staging
and linux-ti-staging.

Because of override in bbappends, create_sourceipk task somehow creates
weird dependency on u-boot and linux src (as shown in previous emails)

Also gives multi thread (build >8) build failures, sstate-cache reuse
issues.

Is it really necessary by default to create SRC ipk? can it be a soft
assignment to 1 to allow override from local conf?

I will look into the proper fix next year but I think it should be
overridable by user as everyone doesn't need source ipk.

what do you think? should I send a patch for it?

thanks
Ankur

On Thu, 14 Nov 2019, 10:40 p.m. Ankur Tyagi, <ankur.tyagi85@gmail.com>
wrote:

> On Thu, Nov 14, 2019 at 7:31 PM Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> >
> > On Wed, Nov 13, 2019 at 4:19 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > On Sun, Nov 10, 2019 at 09:52:48PM -0800, Ankur Tyagi wrote:
> > > > Hi Denys,
> > > >
> > > > I have again encountered the same problem so there is a fundamental
> issue
> > > > somewhere.
> > > > Let me explain when this problem occurs and what is my setup:
> > > >
> > > > 1) Let's assume current u-boot SRCREV in recipe is
> > > > "4fc3ad1c4d92a32c1e233c524d65836226488912" and linux SRCREV is
> > > > "634579ce9ee01466fd84524602bd0a262a0add00"
> > > > 2) I build my image and preserve sstate-cache
> > > > 3) Change u-boot SRCREV to
> "b31ea1d6069a3634c696d9fbff86373fd5b0f82d" and
> > > > linux SRCREV to "d02acfec3d72606798f498c33728f5a0839e6360"
> > > > 4) Build my image again using the preserved sstate-cache so only
> u-boot and
> > > > linux is rebuilt
> > > >
> > > > Then I get following error
> > > >
> > > > ******************************
> > > > Collected errors:
> > > >  * Solver encountered 2 problem(s):
> > > >  * Problem 1/2:
> > > >  *   - nothing provides u-boot-ti-staging-src >=
> 2019.01+git0+b31ea1d606
> > > > needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos.wsl
> > >
> > > Not really sure why do you even have any dependency between these 2
> -src
> > > packages. They should not and they are not dependent here for us.
> > >
> >
> > I have been debugging this error and did some refactoring in my custom
> > layer which seems
> > to have fixed it but not sure as I am having another issue now. Now I
> > am getting this
> >
> > Collected errors:
> >  * Solver encountered 2 problem(s):
> >  * Problem 1/2:
> >  *   - nothing provides u-boot-ti-staging-src >=
> > 2019.01+git0+4fc3ad1c4d needed by libudev1-3.2.7-r0.3.arago5.wsl
> >  *
> >  * Solution 1:
> >  *   - do not ask to install a package providing
> packagegroup-ggl-wsl-util
> >
> >  * Problem 2/2:
> >  *   - nothing provides u-boot-ti-staging-src >=
> > 2019.01+git0+4fc3ad1c4d needed by eudev-3.2.7-r0.3.arago5.wsl
> >  *
> >  * Solution 1:
> >  *   - do not ask to install a package providing packagegroup-core-boot
> >
> > I think if I can resolve this one then image can be built.
> > Any idea what could be the reason? I am setting ARAGO_SYSVINIT in my
> > local conf to use sysvinit in distro
> >
>
> The same image builds on my virtual machine but when I run it server
> it gives me above error
> So I tried restricting parallel builds to 8 as server can run 42
> threads and after that change the image works.
>
> Sounds weird but this fixed the issue. Does this make sense? I would
> like to understand how
>
> thanks
> Ankur
> > >
> > > >  *
> > > >  * Solution 1:
> > > >  *   - do not ask to install a package providing
> packagegroup-ggl-base
> > > >
> > > >  * Problem 2/2:
> > > >  *   - nothing provides u-boot-ti-staging-src >=
> 2019.01+git0+b31ea1d606
> > > > needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos.wsl
> > > >  *
> > > >  * Solution 1:
> > > >  *   - do not ask to install a package providing packagegroup-ggl-qt
> > > > ******************************
> > > >
> > > > Can you please provide me with some pointers on what could be
> causing it or
> > > > where should I start investigating it?
> > > >
> > > > Thanks
> > > > Ankur
> > > >
> > > >
> > > > On Fri, 27 Sep 2019, 9:00 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com>
> wrote:
> > > >
> > > > > thanks for your response Denys
> > > > >
> > > > > On Fri, 27 Sep 2019, 4:27 a.m. Denys Dmytriyenko, <denys@ti.com>
> wrote:
> > > > >
> > > > >> Thanks for following up with the update!
> > > > >>
> > > > >> Unfortunately, opkg install issues like this are very specific to
> your
> > > > >> build
> > > > >> environment and harder to debug remotely. You'd need to see why
> the
> > > > >> package
> > > > >> gets one version, while a different one being requested. In some
> cases it
> > > > >> can
> > > > >> be due to a stale package, like here. In others it's more
> complicated.
> > > > >>
> > > > >> Denys
> > > > >>
> > > > >>
> > > > >> On Thu, Sep 26, 2019 at 07:17:26AM +1200, Ankur Tyagi wrote:
> > > > >> > It got resolved after removing tmp directory and rebuilding
> > > > >> >
> > > > >> > On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, <
> ankur.tyagi85@gmail.com>
> > > > >> wrote:
> > > > >> >
> > > > >> > > Hi,
> > > > >> > >
> > > > >> > > I was using "thud" branch to create custom image for my board.
> > > > >> > > Recently updated meta-ti, meta-arago "thud" branch and started
> > > > >> > > receiving following error message during do_rootfs task
> > > > >> > >
> > > > >> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install
> > > > >> > > packages. Command
> > > > >> > >
> > > > >> > >
> > > > >>
> '/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
> > > > >> > > --volatile-cache -f
> > > > >> > >
> > > > >> > >
> > > > >>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf
> > > > >> > > -t
> > > > >> > >
> > > > >>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/
> > > > >> > > -o
> > > > >> > >
> > > > >>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs
> > > > >> > >  --force_postinstall    install packagegroup-core-boot
> > > > >> > > packagegroup-ggl-base packagegroup-ggl-connectivity
> > > > >> > > packagegroup-ggl-qt psplash run-postinsts' returned 2:
> > > > >> > > Collected errors:
> > > > >> > >  * Solver encountered 2 problem(s):
> > > > >> > >  * Problem 1/2:
> > > > >> > >  *   - nothing provides u-boot-ti-staging-src >=
> > > > >> > > 2019.01+git0+571bb85860 needed by
> > > > >> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> > > > >> > >  *
> > > > >> > >  * Solution 1:
> > > > >> > >  *   - do not ask to install a package providing
> packagegroup-ggl-base
> > > > >> > >
> > > > >> > >  * Problem 2/2:
> > > > >> > >  *   - nothing provides u-boot-ti-staging-src >=
> > > > >> > > 2019.01+git0+571bb85860 needed by
> > > > >> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> > > > >> > >  *
> > > > >> > >  * Solution 1:
> > > > >> > >  *   - do not ask to install a package providing
> packagegroup-ggl-qt
> > > > >> > >
> > > > >> > >  * opkg_finalize_intercepts: Failed to open dir
> > > > >> > >
> > > > >> > >
> > > > >>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> > > > >> > > No such file or directory.
> > > > >> > >  * rm_r: Failed to open dir
> > > > >> > >
> > > > >> > >
> > > > >>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> > > > >> > > No such file or directory.
> > > > >> > >  * rm_r: Failed to open dir
> > > > >> > >
> > > > >> > >
> > > > >>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:
> > > > >> > > No such file or directory.
> > > > >> > >
> > > > >> > >
> > > > >> > >
> > > > >> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed:
> do_rootfs
> > > > >> > > ERROR: Logfile of failure stored in:
> > > > >> > >
> > > > >> > >
> > > > >>
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554
> > > > >> > > ERROR: Task
> > > > >> > >
> > > > >>
> (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/recipes-core/images/
> > > > >> ggl-wsl-prod-image.bb:
> > > > >> > > do_rootfs)
> > > > >> > > failed with exit code '1'
> > > > >> > >
> > > > >> > > Can you please help:
> > > > >> > > 1) to understand the underlying problem
> > > > >> > > 2) how can I fix it
> > > > >> > >
> > > > >> > > thanks
> > > > >> > > Ankur
> > > > >> > >
> > > > >>
> > > > >> > _______________________________________________
> > > > >> > meta-arago mailing list
> > > > >> > meta-arago@arago-project.org
> > > > >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > >>
> > > > >>
>

--000000000000d94edf0599d9a271
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Denys,<div dir=3D"auto"><br></div><div dir=3D"auto">I =
digged more and found out all issues are because of create_sourceipk task.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">I have different UBOOT_M=
ACHINE(custom_config) and MACHINE(am335x-evm)</div><div dir=3D"auto">Simila=
rly I have customisation for linux-ti-staging recipe.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">arago-source-ipk.inc set CREATE_SRCIPK for bo=
th packages, u-boot-ti-staging and linux-ti-staging.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Because of override in bbappends, create_sourc=
eipk task somehow creates weird dependency on u-boot and linux src (as show=
n in previous emails)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Al=
so gives multi thread (build &gt;8) build failures, sstate-cache reuse issu=
es.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Is it really necessa=
ry by default to create SRC ipk? can it be a soft assignment to 1 to allow =
override from local conf?</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">I will look into the proper fix next year but I think it should be overri=
dable by user as everyone doesn&#39;t need source ipk.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">what do you think? should I send a patch for=
 it?</div><div dir=3D"auto"><br></div><div dir=3D"auto">thanks</div><div di=
r=3D"auto">Ankur</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, 14 Nov 2019, 10:40 p.m. Ankur Tyagi, &lt;<a h=
ref=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Thu, Nov 14, 2019 at 7:31 PM =
Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">ankur.tyagi85@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Nov 13, 2019 at 4:19 PM Denys Dmytriyenko &lt;<a href=3D"mailt=
o:denys@ti.com" target=3D"_blank" rel=3D"noreferrer">denys@ti.com</a>&gt; w=
rote:<br>
&gt; &gt;<br>
&gt; &gt; On Sun, Nov 10, 2019 at 09:52:48PM -0800, Ankur Tyagi wrote:<br>
&gt; &gt; &gt; Hi Denys,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I have again encountered the same problem so there is a fund=
amental issue<br>
&gt; &gt; &gt; somewhere.<br>
&gt; &gt; &gt; Let me explain when this problem occurs and what is my setup=
:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 1) Let&#39;s assume current u-boot SRCREV in recipe is<br>
&gt; &gt; &gt; &quot;4fc3ad1c4d92a32c1e233c524d65836226488912&quot; and lin=
ux SRCREV is<br>
&gt; &gt; &gt; &quot;634579ce9ee01466fd84524602bd0a262a0add00&quot;<br>
&gt; &gt; &gt; 2) I build my image and preserve sstate-cache<br>
&gt; &gt; &gt; 3) Change u-boot SRCREV to &quot;b31ea1d6069a3634c696d9fbff8=
6373fd5b0f82d&quot; and<br>
&gt; &gt; &gt; linux SRCREV to &quot;d02acfec3d72606798f498c33728f5a0839e63=
60&quot;<br>
&gt; &gt; &gt; 4) Build my image again using the preserved sstate-cache so =
only u-boot and<br>
&gt; &gt; &gt; linux is rebuilt<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Then I get following error<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ******************************<br>
&gt; &gt; &gt; Collected errors:<br>
&gt; &gt; &gt;=C2=A0 * Solver encountered 2 problem(s):<br>
&gt; &gt; &gt;=C2=A0 * Problem 1/2:<br>
&gt; &gt; &gt;=C2=A0 *=C2=A0 =C2=A0- nothing provides u-boot-ti-staging-src=
 &gt;=3D 2019.01+git0+b31ea1d606<br>
&gt; &gt; &gt; needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos=
.wsl<br>
&gt; &gt;<br>
&gt; &gt; Not really sure why do you even have any dependency between these=
 2 -src<br>
&gt; &gt; packages. They should not and they are not dependent here for us.=
<br>
&gt; &gt;<br>
&gt;<br>
&gt; I have been debugging this error and did some refactoring in my custom=
<br>
&gt; layer which seems<br>
&gt; to have fixed it but not sure as I am having another issue now. Now I<=
br>
&gt; am getting this<br>
&gt;<br>
&gt; Collected errors:<br>
&gt;=C2=A0 * Solver encountered 2 problem(s):<br>
&gt;=C2=A0 * Problem 1/2:<br>
&gt;=C2=A0 *=C2=A0 =C2=A0- nothing provides u-boot-ti-staging-src &gt;=3D<b=
r>
&gt; 2019.01+git0+4fc3ad1c4d needed by libudev1-3.2.7-r0.3.arago5.wsl<br>
&gt;=C2=A0 *<br>
&gt;=C2=A0 * Solution 1:<br>
&gt;=C2=A0 *=C2=A0 =C2=A0- do not ask to install a package providing packag=
egroup-ggl-wsl-util<br>
&gt;<br>
&gt;=C2=A0 * Problem 2/2:<br>
&gt;=C2=A0 *=C2=A0 =C2=A0- nothing provides u-boot-ti-staging-src &gt;=3D<b=
r>
&gt; 2019.01+git0+4fc3ad1c4d needed by eudev-3.2.7-r0.3.arago5.wsl<br>
&gt;=C2=A0 *<br>
&gt;=C2=A0 * Solution 1:<br>
&gt;=C2=A0 *=C2=A0 =C2=A0- do not ask to install a package providing packag=
egroup-core-boot<br>
&gt;<br>
&gt; I think if I can resolve this one then image can be built.<br>
&gt; Any idea what could be the reason? I am setting ARAGO_SYSVINIT in my<b=
r>
&gt; local conf to use sysvinit in distro<br>
&gt;<br>
<br>
The same image builds on my virtual machine but when I run it server<br>
it gives me above error<br>
So I tried restricting parallel builds to 8 as server can run 42<br>
threads and after that change the image works.<br>
<br>
Sounds weird but this fixed the issue. Does this make sense? I would<br>
like to understand how<br>
<br>
thanks<br>
Ankur<br>
&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 *<br>
&gt; &gt; &gt;=C2=A0 * Solution 1:<br>
&gt; &gt; &gt;=C2=A0 *=C2=A0 =C2=A0- do not ask to install a package provid=
ing packagegroup-ggl-base<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 * Problem 2/2:<br>
&gt; &gt; &gt;=C2=A0 *=C2=A0 =C2=A0- nothing provides u-boot-ti-staging-src=
 &gt;=3D 2019.01+git0+b31ea1d606<br>
&gt; &gt; &gt; needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos=
.wsl<br>
&gt; &gt; &gt;=C2=A0 *<br>
&gt; &gt; &gt;=C2=A0 * Solution 1:<br>
&gt; &gt; &gt;=C2=A0 *=C2=A0 =C2=A0- do not ask to install a package provid=
ing packagegroup-ggl-qt<br>
&gt; &gt; &gt; ******************************<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Can you please provide me with some pointers on what could b=
e causing it or<br>
&gt; &gt; &gt; where should I start investigating it?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks<br>
&gt; &gt; &gt; Ankur<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, 27 Sep 2019, 9:00 a.m. Ankur Tyagi, &lt;<a href=3D"m=
ailto:ankur.tyagi85@gmail.com" target=3D"_blank" rel=3D"noreferrer">ankur.t=
yagi85@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; thanks for your response Denys<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Fri, 27 Sep 2019, 4:27 a.m. Denys Dmytriyenko, &lt;<=
a href=3D"mailto:denys@ti.com" target=3D"_blank" rel=3D"noreferrer">denys@t=
i.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; Thanks for following up with the update!<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Unfortunately, opkg install issues like this are ve=
ry specific to your<br>
&gt; &gt; &gt; &gt;&gt; build<br>
&gt; &gt; &gt; &gt;&gt; environment and harder to debug remotely. You&#39;d=
 need to see why the<br>
&gt; &gt; &gt; &gt;&gt; package<br>
&gt; &gt; &gt; &gt;&gt; gets one version, while a different one being reque=
sted. In some cases it<br>
&gt; &gt; &gt; &gt;&gt; can<br>
&gt; &gt; &gt; &gt;&gt; be due to a stale package, like here. In others it&=
#39;s more complicated.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Denys<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; On Thu, Sep 26, 2019 at 07:17:26AM +1200, Ankur Tya=
gi wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt; It got resolved after removing tmp directory a=
nd rebuilding<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, &l=
t;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank" rel=3D"noref=
errer">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt;&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; I was using &quot;thud&quot; branch to cr=
eate custom image for my board.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; Recently updated meta-ti, meta-arago &quo=
t;thud&quot; branch and started<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; receiving following error message during =
do_rootfs task<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; ERROR: ggl-wsl-prod-image-1.0-r0 do_rootf=
s: Unable to install<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; packages. Command<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &#39;/home/yocto/ggl-yocto-tools/build/tmp-external=
-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysr=
oot-native/usr/bin/opkg<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; --volatile-cache -f<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-=
toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; -t<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-=
toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/<br=
>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; -o<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-=
toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 --force_postinstall=C2=A0 =C2=A0 in=
stall packagegroup-core-boot<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; packagegroup-ggl-base packagegroup-ggl-co=
nnectivity<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; packagegroup-ggl-qt psplash run-postinsts=
&#39; returned 2:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; Collected errors:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 * Solver encountered 2 problem(s):<=
br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 * Problem 1/2:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 *=C2=A0 =C2=A0- nothing provides u-=
boot-ti-staging-src &gt;=3D<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; 2019.01+git0+571bb85860 needed by<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; linux-ti-staging-src-4.19.73+git0+761ba62=
9e9-gamos.wsl<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 *<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 * Solution 1:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 *=C2=A0 =C2=A0- do not ask to insta=
ll a package providing packagegroup-ggl-base<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 * Problem 2/2:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 *=C2=A0 =C2=A0- nothing provides u-=
boot-ti-staging-src &gt;=3D<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; 2019.01+git0+571bb85860 needed by<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; linux-ti-staging-src-4.19.73+git0+761ba62=
9e9-gamos.wsl<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 *<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 * Solution 1:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 *=C2=A0 =C2=A0- do not ask to insta=
ll a package providing packagegroup-ggl-qt<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 * opkg_finalize_intercepts: Failed =
to open dir<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-=
toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//op=
kg-JLB910/opkg-intercept-xOvXqH:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; No such file or directory.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 * rm_r: Failed to open dir<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-=
toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//op=
kg-JLB910/opkg-intercept-xOvXqH:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; No such file or directory.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 * rm_r: Failed to open dir<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-=
toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//op=
kg-JLB910:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; No such file or directory.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; ERROR: ggl-wsl-prod-image-1.0-r0 do_rootf=
s: Function failed: do_rootfs<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; ERROR: Logfile of failure stored in:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-=
toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_root=
fs.107554<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; ERROR: Task<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta=
-ggl-image/recipes-core/images/<br>
&gt; &gt; &gt; &gt;&gt; <a href=3D"http://ggl-wsl-prod-image.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">ggl-wsl-prod-image.bb</a>:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; do_rootfs)<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; failed with exit code &#39;1&#39;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; Can you please help:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; 1) to understand the underlying problem<b=
r>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; 2) how can I fix it<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; thanks<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; Ankur<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; ______________________________________________=
_<br>
&gt; &gt; &gt; &gt;&gt; &gt; meta-arago mailing list<br>
&gt; &gt; &gt; &gt;&gt; &gt; <a href=3D"mailto:meta-arago@arago-project.org=
" target=3D"_blank" rel=3D"noreferrer">meta-arago@arago-project.org</a><br>
&gt; &gt; &gt; &gt;&gt; &gt; <a href=3D"http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago" rel=3D"noreferrer noreferrer" target=3D"_blank">=
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt;<br>
</blockquote></div>

--000000000000d94edf0599d9a271--
