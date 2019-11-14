Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by arago-project.org (Postfix) with ESMTPS id E5A9952988
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 09:42:07 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id n21so5882306ljg.12
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 01:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TZcSd6hUeQPf+T3M0ZhTjCnSQc1zIqV84gTjWHBTDoo=;
	b=UHnkuTpoJaHyEHjL2+orgok7TeU8wiK9eOA4aA//nwRQnQmTJTjVDdWTiLImaWfbNd
	tUe1C0/ltB+iszm9suHVJIykkRu2mgTOSGfcfrnX5DEgr6fclwqHXWd0bIMjQTBCn3WS
	Q2PeeNlOeWzVAhNUF6d4wlaCgJMnp2n4N7VScgrcwUuifXlmexPQWwXK0liocCeWqHEv
	rnVBnthx7kdxIa4hnAUTrO+o7uAvlCxjJvL0K1Q41igmdacbS6CwWLSt2GMa0uDX10sG
	CI893LCnYumFVrHpp1VuqeEjeJ2eoUQV1prx1OJsLPJOLfI3MqqoqOikwpv6xBFtDnat
	i5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TZcSd6hUeQPf+T3M0ZhTjCnSQc1zIqV84gTjWHBTDoo=;
	b=JsYUcfSztrNObbpn25dyuBtd1VClbgERU3cE4q7waK5kwsYQg4Ir7pPVBXdWZGHwb4
	KCe5ph05QlDNQg1TabsfJdJo9xJPF99vZGvsCcMxrCEJLQHYot7Vk6vcSIJyRc/AV8J9
	C6w39DoMa/3pGTjX2xTkIsSa7IExgLcdTbKT6Yz7gP6wIHf5mtF29KH5nIyOLHZhqDCY
	1nVCl9baRYZqVkC4DxJGXMcwurWkUjNaCVGTw/PcJDH8+5fpnvKpW+987pDoqBt1EfVv
	cr1UcEf+GeZtXmeLPCDT8lvonJtuncvPDBFkmabWZbIuQgtmuWPQXbQ/+Z74b9EXNFJx
	+rQA==
X-Gm-Message-State: APjAAAVdBXel5oIekzO7tPFbisB3dnRA0G9ZR/GgXIZpy588o4WSwzQu
	qTv33A6ejUzBkAGU2hWXVSTXy198hgrr7T5LVqI=
X-Google-Smtp-Source: APXvYqxSr+4g1UzmtqRXeKrb/P0tt6P/w5F+V2y0kblJkP3RpOzRdGSxkv0qSGlFew0xx4EV4Sa8D56u9PJNUbA0vbM=
X-Received: by 2002:a2e:9449:: with SMTP id o9mr6146786ljh.75.1573724441654;
	Thu, 14 Nov 2019 01:40:41 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HyRLzXfSfcYTrGZmuX2acoCMi2BE+hy=v+-fKPAvF3Mw@mail.gmail.com>
	<CADySD0HKK1MWGXg2qL4PP-SRiyrHGJUpwKgAuCTVsZ0MizCSpg@mail.gmail.com>
	<20190926162746.GC5386@beryl>
	<CADySD0H4jZy5YpHudHyEwhsJLhcCLLt3yJ-nX1sdqik561Qt3g@mail.gmail.com>
	<CADySD0H7NXcvhhV++WNtCu4nsxy=CV7MiH3oMitJS_W5QmBYoA@mail.gmail.com>
	<20191114001943.GF15023@beryl>
	<CADySD0HozPke2v8qAOb5_WYn5mo1Cx_q+HgRdR3TXGRLfNcixw@mail.gmail.com>
In-Reply-To: <CADySD0HozPke2v8qAOb5_WYn5mo1Cx_q+HgRdR3TXGRLfNcixw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 14 Nov 2019 22:40:30 +1300
Message-ID: <CADySD0HTaqCNGYwNxdGajBP=gx-RfqpPed+Jzi=-nKZ+BQATeQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Nov 2019 09:42:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 14, 2019 at 7:31 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
>
> On Wed, Nov 13, 2019 at 4:19 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > On Sun, Nov 10, 2019 at 09:52:48PM -0800, Ankur Tyagi wrote:
> > > Hi Denys,
> > >
> > > I have again encountered the same problem so there is a fundamental issue
> > > somewhere.
> > > Let me explain when this problem occurs and what is my setup:
> > >
> > > 1) Let's assume current u-boot SRCREV in recipe is
> > > "4fc3ad1c4d92a32c1e233c524d65836226488912" and linux SRCREV is
> > > "634579ce9ee01466fd84524602bd0a262a0add00"
> > > 2) I build my image and preserve sstate-cache
> > > 3) Change u-boot SRCREV to "b31ea1d6069a3634c696d9fbff86373fd5b0f82d" and
> > > linux SRCREV to "d02acfec3d72606798f498c33728f5a0839e6360"
> > > 4) Build my image again using the preserved sstate-cache so only u-boot and
> > > linux is rebuilt
> > >
> > > Then I get following error
> > >
> > > ******************************
> > > Collected errors:
> > >  * Solver encountered 2 problem(s):
> > >  * Problem 1/2:
> > >  *   - nothing provides u-boot-ti-staging-src >= 2019.01+git0+b31ea1d606
> > > needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos.wsl
> >
> > Not really sure why do you even have any dependency between these 2 -src
> > packages. They should not and they are not dependent here for us.
> >
>
> I have been debugging this error and did some refactoring in my custom
> layer which seems
> to have fixed it but not sure as I am having another issue now. Now I
> am getting this
>
> Collected errors:
>  * Solver encountered 2 problem(s):
>  * Problem 1/2:
>  *   - nothing provides u-boot-ti-staging-src >=
> 2019.01+git0+4fc3ad1c4d needed by libudev1-3.2.7-r0.3.arago5.wsl
>  *
>  * Solution 1:
>  *   - do not ask to install a package providing packagegroup-ggl-wsl-util
>
>  * Problem 2/2:
>  *   - nothing provides u-boot-ti-staging-src >=
> 2019.01+git0+4fc3ad1c4d needed by eudev-3.2.7-r0.3.arago5.wsl
>  *
>  * Solution 1:
>  *   - do not ask to install a package providing packagegroup-core-boot
>
> I think if I can resolve this one then image can be built.
> Any idea what could be the reason? I am setting ARAGO_SYSVINIT in my
> local conf to use sysvinit in distro
>

The same image builds on my virtual machine but when I run it server
it gives me above error
So I tried restricting parallel builds to 8 as server can run 42
threads and after that change the image works.

Sounds weird but this fixed the issue. Does this make sense? I would
like to understand how

thanks
Ankur
> >
> > >  *
> > >  * Solution 1:
> > >  *   - do not ask to install a package providing packagegroup-ggl-base
> > >
> > >  * Problem 2/2:
> > >  *   - nothing provides u-boot-ti-staging-src >= 2019.01+git0+b31ea1d606
> > > needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos.wsl
> > >  *
> > >  * Solution 1:
> > >  *   - do not ask to install a package providing packagegroup-ggl-qt
> > > ******************************
> > >
> > > Can you please provide me with some pointers on what could be causing it or
> > > where should I start investigating it?
> > >
> > > Thanks
> > > Ankur
> > >
> > >
> > > On Fri, 27 Sep 2019, 9:00 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:
> > >
> > > > thanks for your response Denys
> > > >
> > > > On Fri, 27 Sep 2019, 4:27 a.m. Denys Dmytriyenko, <denys@ti.com> wrote:
> > > >
> > > >> Thanks for following up with the update!
> > > >>
> > > >> Unfortunately, opkg install issues like this are very specific to your
> > > >> build
> > > >> environment and harder to debug remotely. You'd need to see why the
> > > >> package
> > > >> gets one version, while a different one being requested. In some cases it
> > > >> can
> > > >> be due to a stale package, like here. In others it's more complicated.
> > > >>
> > > >> Denys
> > > >>
> > > >>
> > > >> On Thu, Sep 26, 2019 at 07:17:26AM +1200, Ankur Tyagi wrote:
> > > >> > It got resolved after removing tmp directory and rebuilding
> > > >> >
> > > >> > On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com>
> > > >> wrote:
> > > >> >
> > > >> > > Hi,
> > > >> > >
> > > >> > > I was using "thud" branch to create custom image for my board.
> > > >> > > Recently updated meta-ti, meta-arago "thud" branch and started
> > > >> > > receiving following error message during do_rootfs task
> > > >> > >
> > > >> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install
> > > >> > > packages. Command
> > > >> > >
> > > >> > >
> > > >> '/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
> > > >> > > --volatile-cache -f
> > > >> > >
> > > >> > >
> > > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf
> > > >> > > -t
> > > >> > >
> > > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/
> > > >> > > -o
> > > >> > >
> > > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs
> > > >> > >  --force_postinstall    install packagegroup-core-boot
> > > >> > > packagegroup-ggl-base packagegroup-ggl-connectivity
> > > >> > > packagegroup-ggl-qt psplash run-postinsts' returned 2:
> > > >> > > Collected errors:
> > > >> > >  * Solver encountered 2 problem(s):
> > > >> > >  * Problem 1/2:
> > > >> > >  *   - nothing provides u-boot-ti-staging-src >=
> > > >> > > 2019.01+git0+571bb85860 needed by
> > > >> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> > > >> > >  *
> > > >> > >  * Solution 1:
> > > >> > >  *   - do not ask to install a package providing packagegroup-ggl-base
> > > >> > >
> > > >> > >  * Problem 2/2:
> > > >> > >  *   - nothing provides u-boot-ti-staging-src >=
> > > >> > > 2019.01+git0+571bb85860 needed by
> > > >> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> > > >> > >  *
> > > >> > >  * Solution 1:
> > > >> > >  *   - do not ask to install a package providing packagegroup-ggl-qt
> > > >> > >
> > > >> > >  * opkg_finalize_intercepts: Failed to open dir
> > > >> > >
> > > >> > >
> > > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> > > >> > > No such file or directory.
> > > >> > >  * rm_r: Failed to open dir
> > > >> > >
> > > >> > >
> > > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> > > >> > > No such file or directory.
> > > >> > >  * rm_r: Failed to open dir
> > > >> > >
> > > >> > >
> > > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:
> > > >> > > No such file or directory.
> > > >> > >
> > > >> > >
> > > >> > >
> > > >> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_rootfs
> > > >> > > ERROR: Logfile of failure stored in:
> > > >> > >
> > > >> > >
> > > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554
> > > >> > > ERROR: Task
> > > >> > >
> > > >> (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/recipes-core/images/
> > > >> ggl-wsl-prod-image.bb:
> > > >> > > do_rootfs)
> > > >> > > failed with exit code '1'
> > > >> > >
> > > >> > > Can you please help:
> > > >> > > 1) to understand the underlying problem
> > > >> > > 2) how can I fix it
> > > >> > >
> > > >> > > thanks
> > > >> > > Ankur
> > > >> > >
> > > >>
> > > >> > _______________________________________________
> > > >> > meta-arago mailing list
> > > >> > meta-arago@arago-project.org
> > > >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > >>
> > > >>

