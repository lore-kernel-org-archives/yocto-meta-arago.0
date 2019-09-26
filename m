Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by arago-project.org (Postfix) with ESMTPS id DBA895299E
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2019 21:01:33 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id d1so292945ljl.13
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2019 14:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rG5j5EhqxQeKMCrfyo2vanECvoAgib7QAAChFNL+TCk=;
	b=iY1kdQTtThBrzE0DCTIDPj/ZjrggkxMo0YFSFm+sxZLE2Jr/Kyzb3Cv4r9rCIx24Hy
	eP21/cR8112YchGSk9qX01smN5OIMGuNeU88/67ASGTBKGKt9P9jHwrOb7h4Lef38Zah
	Evp+D8zAG6iQw/T+eh8mNi8kWspXp52mGOEc6BeFpmL8JXaXRsJOjIxpjZhrbT1iU1xh
	9VXJ9wgzOxfWmjsrh0tivGG8NBr1OFzDegek3Szeq70Vt3EtaZfyK6Mdw9HCuPmAPOMA
	Kmfv7IZkSrkPku3tKIZJQZxDNvCG9nLswQxPKm341ASAeMXcCrwjtIol0MXvAMdJUQdt
	P47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rG5j5EhqxQeKMCrfyo2vanECvoAgib7QAAChFNL+TCk=;
	b=Au4gsBbUjxfu82GPTrrcAfH7R3JFrDPSj0EF2s+9P4yp1/c0SPcr+rYQpcg+fhtaW5
	58XkKWRYwR/MhBASUFsfSUZe0QK7B1lyjCEyNxvceMLgUub+Tbqy9ml4VXBWtxb8C9bo
	09Rq7uytfX4r/XAe4/qlwm2I72pLlzGawf9otuRVBI4BazUT6shK7chKdZ6zkfPpSkh4
	W3jn2fxfBlVp9l+1w0B+BQI9ZomFrvZ5D23HHbxlN+UVi9K58cQME8aoBJqj01xxtvJf
	koeoa7luXupDn1gr199N4nQBodwqG2U6XZhOIxF61l8Es2v7UlvL0lqJucu/hG+p/6Gc
	+rVQ==
X-Gm-Message-State: APjAAAWBDCcakG+T5vyYI/9IBRNaXQH157ODRa3jjnme7ixVcPsrYPV6
	fynWHpRDJui1b0VuXFZeTAov/LTpFzihgxXdGBU=
X-Google-Smtp-Source: APXvYqyCwIgEOZaoh80iJg3Xqom0op+yBUU/wLXB0TTeQngPHgmG9SoonhNfYt71ubg8MAQSMtz+W2f+9FOkf61qTOo=
X-Received: by 2002:a2e:98d2:: with SMTP id s18mr453293ljj.68.1569531622981;
	Thu, 26 Sep 2019 14:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0HyRLzXfSfcYTrGZmuX2acoCMi2BE+hy=v+-fKPAvF3Mw@mail.gmail.com>
	<CADySD0HKK1MWGXg2qL4PP-SRiyrHGJUpwKgAuCTVsZ0MizCSpg@mail.gmail.com>
	<20190926162746.GC5386@beryl>
In-Reply-To: <20190926162746.GC5386@beryl>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 27 Sep 2019 09:00:11 +1200
Message-ID: <CADySD0H4jZy5YpHudHyEwhsJLhcCLLt3yJ-nX1sdqik561Qt3g@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Sep 2019 21:01:34 -0000
Content-Type: multipart/alternative; boundary="000000000000da02eb05937b0e41"

--000000000000da02eb05937b0e41
Content-Type: text/plain; charset="UTF-8"

thanks for your response Denys

On Fri, 27 Sep 2019, 4:27 a.m. Denys Dmytriyenko, <denys@ti.com> wrote:

> Thanks for following up with the update!
>
> Unfortunately, opkg install issues like this are very specific to your
> build
> environment and harder to debug remotely. You'd need to see why the
> package
> gets one version, while a different one being requested. In some cases it
> can
> be due to a stale package, like here. In others it's more complicated.
>
> Denys
>
>
> On Thu, Sep 26, 2019 at 07:17:26AM +1200, Ankur Tyagi wrote:
> > It got resolved after removing tmp directory and rebuilding
> >
> > On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com>
> wrote:
> >
> > > Hi,
> > >
> > > I was using "thud" branch to create custom image for my board.
> > > Recently updated meta-ti, meta-arago "thud" branch and started
> > > receiving following error message during do_rootfs task
> > >
> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install
> > > packages. Command
> > >
> > >
> '/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
> > > --volatile-cache -f
> > >
> > >
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf
> > > -t
> > >
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/
> > > -o
> > >
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs
> > >  --force_postinstall    install packagegroup-core-boot
> > > packagegroup-ggl-base packagegroup-ggl-connectivity
> > > packagegroup-ggl-qt psplash run-postinsts' returned 2:
> > > Collected errors:
> > >  * Solver encountered 2 problem(s):
> > >  * Problem 1/2:
> > >  *   - nothing provides u-boot-ti-staging-src >=
> > > 2019.01+git0+571bb85860 needed by
> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> > >  *
> > >  * Solution 1:
> > >  *   - do not ask to install a package providing packagegroup-ggl-base
> > >
> > >  * Problem 2/2:
> > >  *   - nothing provides u-boot-ti-staging-src >=
> > > 2019.01+git0+571bb85860 needed by
> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> > >  *
> > >  * Solution 1:
> > >  *   - do not ask to install a package providing packagegroup-ggl-qt
> > >
> > >  * opkg_finalize_intercepts: Failed to open dir
> > >
> > >
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> > > No such file or directory.
> > >  * rm_r: Failed to open dir
> > >
> > >
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> > > No such file or directory.
> > >  * rm_r: Failed to open dir
> > >
> > >
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:
> > > No such file or directory.
> > >
> > >
> > >
> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_rootfs
> > > ERROR: Logfile of failure stored in:
> > >
> > >
> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554
> > > ERROR: Task
> > >
> (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/recipes-core/images/
> ggl-wsl-prod-image.bb:
> > > do_rootfs)
> > > failed with exit code '1'
> > >
> > > Can you please help:
> > > 1) to understand the underlying problem
> > > 2) how can I fix it
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

--000000000000da02eb05937b0e41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">thanks for your response Denys</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 27 Sep 2019, 4:27 a=
.m. Denys Dmytriyenko, &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Thanks for following up=
 with the update!<br>
<br>
Unfortunately, opkg install issues like this are very specific to your buil=
d <br>
environment and harder to debug remotely. You&#39;d need to see why the pac=
kage <br>
gets one version, while a different one being requested. In some cases it c=
an <br>
be due to a stale package, like here. In others it&#39;s more complicated.<=
br>
<br>
Denys<br>
<br>
<br>
On Thu, Sep 26, 2019 at 07:17:26AM +1200, Ankur Tyagi wrote:<br>
&gt; It got resolved after removing tmp directory and rebuilding<br>
&gt; <br>
&gt; On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, &lt;<a href=3D"mailto:anku=
r.tyagi85@gmail.com" target=3D"_blank" rel=3D"noreferrer">ankur.tyagi85@gma=
il.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I was using &quot;thud&quot; branch to create custom image for my=
 board.<br>
&gt; &gt; Recently updated meta-ti, meta-arago &quot;thud&quot; branch and =
started<br>
&gt; &gt; receiving following error message during do_rootfs task<br>
&gt; &gt;<br>
&gt; &gt; ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install<br>
&gt; &gt; packages. Command<br>
&gt; &gt;<br>
&gt; &gt; &#39;/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain=
/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr=
/bin/opkg<br>
&gt; &gt; --volatile-cache -f<br>
&gt; &gt;<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf<br>
&gt; &gt; -t<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/<br>
&gt; &gt; -o<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs<br>
&gt; &gt;=C2=A0 --force_postinstall=C2=A0 =C2=A0 install packagegroup-core-=
boot<br>
&gt; &gt; packagegroup-ggl-base packagegroup-ggl-connectivity<br>
&gt; &gt; packagegroup-ggl-qt psplash run-postinsts&#39; returned 2:<br>
&gt; &gt; Collected errors:<br>
&gt; &gt;=C2=A0 * Solver encountered 2 problem(s):<br>
&gt; &gt;=C2=A0 * Problem 1/2:<br>
&gt; &gt;=C2=A0 *=C2=A0 =C2=A0- nothing provides u-boot-ti-staging-src &gt;=
=3D<br>
&gt; &gt; 2019.01+git0+571bb85860 needed by<br>
&gt; &gt; linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl<br>
&gt; &gt;=C2=A0 *<br>
&gt; &gt;=C2=A0 * Solution 1:<br>
&gt; &gt;=C2=A0 *=C2=A0 =C2=A0- do not ask to install a package providing p=
ackagegroup-ggl-base<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 * Problem 2/2:<br>
&gt; &gt;=C2=A0 *=C2=A0 =C2=A0- nothing provides u-boot-ti-staging-src &gt;=
=3D<br>
&gt; &gt; 2019.01+git0+571bb85860 needed by<br>
&gt; &gt; linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl<br>
&gt; &gt;=C2=A0 *<br>
&gt; &gt;=C2=A0 * Solution 1:<br>
&gt; &gt;=C2=A0 *=C2=A0 =C2=A0- do not ask to install a package providing p=
ackagegroup-ggl-qt<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 * opkg_finalize_intercepts: Failed to open dir<br>
&gt; &gt;<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg=
-intercept-xOvXqH:<br>
&gt; &gt; No such file or directory.<br>
&gt; &gt;=C2=A0 * rm_r: Failed to open dir<br>
&gt; &gt;<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg=
-intercept-xOvXqH:<br>
&gt; &gt; No such file or directory.<br>
&gt; &gt;=C2=A0 * rm_r: Failed to open dir<br>
&gt; &gt;<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:<br>
&gt; &gt; No such file or directory.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_r=
ootfs<br>
&gt; &gt; ERROR: Logfile of failure stored in:<br>
&gt; &gt;<br>
&gt; &gt; /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work=
/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554<br>
&gt; &gt; ERROR: Task<br>
&gt; &gt; (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/rec=
ipes-core/images/<a href=3D"http://ggl-wsl-prod-image.bb" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">ggl-wsl-prod-image.bb</a>:<br>
&gt; &gt; do_rootfs)<br>
&gt; &gt; failed with exit code &#39;1&#39;<br>
&gt; &gt;<br>
&gt; &gt; Can you please help:<br>
&gt; &gt; 1) to understand the underlying problem<br>
&gt; &gt; 2) how can I fix it<br>
&gt; &gt;<br>
&gt; &gt; thanks<br>
&gt; &gt; Ankur<br>
&gt; &gt;<br>
<br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank" rel=
=3D"noreferrer">meta-arago@arago-project.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer noreferrer" target=3D"_blank">http://arago-project.org=
/cgi-bin/mailman/listinfo/meta-arago</a><br>
<br>
</blockquote></div>

--000000000000da02eb05937b0e41--
