Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by arago-project.org (Postfix) with ESMTPS id 5397152988
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 06:32:48 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id y186so4067023lfa.1
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2019 22:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UAWPOf/FUrmnEUlM2AsvB9cgkuk8ptQ2w9HdSJEEgBo=;
	b=h+uyvxi9QJUVYWyCnDIOWzjk5ApQZhBgwpAch4WRVqJ9SIbuAz519Qayp8VHGRLiBJ
	KuflxIWHeF2Y5M0SC3Vf6n7OBhkVijHT1+v342ui5CNI5B/Iw0gsu7W5TdHO6no1q43g
	Ua6uSnaHWdi0908IkeAxXXpCfpOsOdLxgp31pydraFfPgM5s+Fjzxqrn5wWffrJCALrb
	vVO7p2WuSqkTFF+GNls1u8v5egYSFLxC9DHAaYy5IgZSkdtHCSYmgCD5zEAN0UOVLGMK
	+qjw9CjYY2ylGLlBctLLzsI/6OQQlXyz+PuPz+T3jUMMbeX/Xyq2RulugAxE8OXKswqb
	pXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UAWPOf/FUrmnEUlM2AsvB9cgkuk8ptQ2w9HdSJEEgBo=;
	b=MKNebZtop91c8BmkweRPlIAMMFuLd48TS1FHV4KamTqvzFNc5lptOENz9In8B+hVIG
	wH0VLa4VUgkCeYcrGGC7UrgyXRdpO3uCwRYEES/ieKIF60a0SMlCH1a7Gtd404RfNwZH
	s2MR6Fdjh9EXBxQIRIjKErUwt0XQORYnVhv/MrHwrRCqrdlAnbcttkjwGwFU5Djapsyo
	7+jOd8D9mi/POhlVyQfKmegVmPIQtEOBmjjBqXmImeGgKcqZCwT7vIlueCecyojLt6Y+
	2ZXtoMEpaCfdtNqYua4oC7KhYrqziVYw6z06BKuAwbCOKewZhseDQiOfxR1uqv2bJAQG
	8X/Q==
X-Gm-Message-State: APjAAAWtWWNo1Yn6X6rnV3Vz3Ar+O6Ql10m5url5BCgvWEpkxsGyqw2C
	pbIZ6cEzuhSFhwrlZYJswJ0LBpqZUByPZ+Ziwsg=
X-Google-Smtp-Source: APXvYqwRuTEGjRksfH8ls0G42aq2r+lfLT5bxDU7xt+YAOw6msAIKeGT2q34TL7Sg6Q9zumyPsrsnV1A+6qF/5nYtwI=
X-Received: by 2002:a19:c606:: with SMTP id w6mr5403300lff.71.1573713082118;
	Wed, 13 Nov 2019 22:31:22 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HyRLzXfSfcYTrGZmuX2acoCMi2BE+hy=v+-fKPAvF3Mw@mail.gmail.com>
	<CADySD0HKK1MWGXg2qL4PP-SRiyrHGJUpwKgAuCTVsZ0MizCSpg@mail.gmail.com>
	<20190926162746.GC5386@beryl>
	<CADySD0H4jZy5YpHudHyEwhsJLhcCLLt3yJ-nX1sdqik561Qt3g@mail.gmail.com>
	<CADySD0H7NXcvhhV++WNtCu4nsxy=CV7MiH3oMitJS_W5QmBYoA@mail.gmail.com>
	<20191114001943.GF15023@beryl>
In-Reply-To: <20191114001943.GF15023@beryl>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 13 Nov 2019 22:31:21 -0800
Message-ID: <CADySD0HozPke2v8qAOb5_WYn5mo1Cx_q+HgRdR3TXGRLfNcixw@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Nov 2019 06:32:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 13, 2019 at 4:19 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Sun, Nov 10, 2019 at 09:52:48PM -0800, Ankur Tyagi wrote:
> > Hi Denys,
> >
> > I have again encountered the same problem so there is a fundamental issue
> > somewhere.
> > Let me explain when this problem occurs and what is my setup:
> >
> > 1) Let's assume current u-boot SRCREV in recipe is
> > "4fc3ad1c4d92a32c1e233c524d65836226488912" and linux SRCREV is
> > "634579ce9ee01466fd84524602bd0a262a0add00"
> > 2) I build my image and preserve sstate-cache
> > 3) Change u-boot SRCREV to "b31ea1d6069a3634c696d9fbff86373fd5b0f82d" and
> > linux SRCREV to "d02acfec3d72606798f498c33728f5a0839e6360"
> > 4) Build my image again using the preserved sstate-cache so only u-boot and
> > linux is rebuilt
> >
> > Then I get following error
> >
> > ******************************
> > Collected errors:
> >  * Solver encountered 2 problem(s):
> >  * Problem 1/2:
> >  *   - nothing provides u-boot-ti-staging-src >= 2019.01+git0+b31ea1d606
> > needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos.wsl
>
> Not really sure why do you even have any dependency between these 2 -src
> packages. They should not and they are not dependent here for us.
>

I have been debugging this error and did some refactoring in my custom
layer which seems
to have fixed it but not sure as I am having another issue now. Now I
am getting this

Collected errors:
 * Solver encountered 2 problem(s):
 * Problem 1/2:
 *   - nothing provides u-boot-ti-staging-src >=
2019.01+git0+4fc3ad1c4d needed by libudev1-3.2.7-r0.3.arago5.wsl
 *
 * Solution 1:
 *   - do not ask to install a package providing packagegroup-ggl-wsl-util

 * Problem 2/2:
 *   - nothing provides u-boot-ti-staging-src >=
2019.01+git0+4fc3ad1c4d needed by eudev-3.2.7-r0.3.arago5.wsl
 *
 * Solution 1:
 *   - do not ask to install a package providing packagegroup-core-boot

I think if I can resolve this one then image can be built.
Any idea what could be the reason? I am setting ARAGO_SYSVINIT in my
local conf to use sysvinit in distro

>
> >  *
> >  * Solution 1:
> >  *   - do not ask to install a package providing packagegroup-ggl-base
> >
> >  * Problem 2/2:
> >  *   - nothing provides u-boot-ti-staging-src >= 2019.01+git0+b31ea1d606
> > needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos.wsl
> >  *
> >  * Solution 1:
> >  *   - do not ask to install a package providing packagegroup-ggl-qt
> > ******************************
> >
> > Can you please provide me with some pointers on what could be causing it or
> > where should I start investigating it?
> >
> > Thanks
> > Ankur
> >
> >
> > On Fri, 27 Sep 2019, 9:00 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:
> >
> > > thanks for your response Denys
> > >
> > > On Fri, 27 Sep 2019, 4:27 a.m. Denys Dmytriyenko, <denys@ti.com> wrote:
> > >
> > >> Thanks for following up with the update!
> > >>
> > >> Unfortunately, opkg install issues like this are very specific to your
> > >> build
> > >> environment and harder to debug remotely. You'd need to see why the
> > >> package
> > >> gets one version, while a different one being requested. In some cases it
> > >> can
> > >> be due to a stale package, like here. In others it's more complicated.
> > >>
> > >> Denys
> > >>
> > >>
> > >> On Thu, Sep 26, 2019 at 07:17:26AM +1200, Ankur Tyagi wrote:
> > >> > It got resolved after removing tmp directory and rebuilding
> > >> >
> > >> > On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com>
> > >> wrote:
> > >> >
> > >> > > Hi,
> > >> > >
> > >> > > I was using "thud" branch to create custom image for my board.
> > >> > > Recently updated meta-ti, meta-arago "thud" branch and started
> > >> > > receiving following error message during do_rootfs task
> > >> > >
> > >> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install
> > >> > > packages. Command
> > >> > >
> > >> > >
> > >> '/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
> > >> > > --volatile-cache -f
> > >> > >
> > >> > >
> > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf
> > >> > > -t
> > >> > >
> > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/
> > >> > > -o
> > >> > >
> > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs
> > >> > >  --force_postinstall    install packagegroup-core-boot
> > >> > > packagegroup-ggl-base packagegroup-ggl-connectivity
> > >> > > packagegroup-ggl-qt psplash run-postinsts' returned 2:
> > >> > > Collected errors:
> > >> > >  * Solver encountered 2 problem(s):
> > >> > >  * Problem 1/2:
> > >> > >  *   - nothing provides u-boot-ti-staging-src >=
> > >> > > 2019.01+git0+571bb85860 needed by
> > >> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> > >> > >  *
> > >> > >  * Solution 1:
> > >> > >  *   - do not ask to install a package providing packagegroup-ggl-base
> > >> > >
> > >> > >  * Problem 2/2:
> > >> > >  *   - nothing provides u-boot-ti-staging-src >=
> > >> > > 2019.01+git0+571bb85860 needed by
> > >> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> > >> > >  *
> > >> > >  * Solution 1:
> > >> > >  *   - do not ask to install a package providing packagegroup-ggl-qt
> > >> > >
> > >> > >  * opkg_finalize_intercepts: Failed to open dir
> > >> > >
> > >> > >
> > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> > >> > > No such file or directory.
> > >> > >  * rm_r: Failed to open dir
> > >> > >
> > >> > >
> > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> > >> > > No such file or directory.
> > >> > >  * rm_r: Failed to open dir
> > >> > >
> > >> > >
> > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:
> > >> > > No such file or directory.
> > >> > >
> > >> > >
> > >> > >
> > >> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_rootfs
> > >> > > ERROR: Logfile of failure stored in:
> > >> > >
> > >> > >
> > >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554
> > >> > > ERROR: Task
> > >> > >
> > >> (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/recipes-core/images/
> > >> ggl-wsl-prod-image.bb:
> > >> > > do_rootfs)
> > >> > > failed with exit code '1'
> > >> > >
> > >> > > Can you please help:
> > >> > > 1) to understand the underlying problem
> > >> > > 2) how can I fix it
> > >> > >
> > >> > > thanks
> > >> > > Ankur
> > >> > >
> > >>
> > >> > _______________________________________________
> > >> > meta-arago mailing list
> > >> > meta-arago@arago-project.org
> > >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >>
> > >>

