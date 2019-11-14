Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B256052988
	for <meta-arago@arago-project.org>;
	Thu, 14 Nov 2019 00:21:09 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE0JiAD123134;
	Wed, 13 Nov 2019 18:19:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573690784;
	bh=r3BadgVMuPu+6tXxEptGvA0OclVFoHLYV1Wqe4ooHC8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FiF/r27KtaV7M8yyncQOZMbmJ7KkGcn/JbgoqOZ3uqQczJWclGMuhy85o2IvhJl68
	64MwthXnngQjR0zW8eFpkZlgQWyZKeNHH9gmJAlBsrvlgUVRrZ/utb/VAo9k45jHft
	62sM2mp7nigGbSnza6us5qO71YuAW448UK+Wn2EE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAE0JiZ1041065
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Nov 2019 18:19:44 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 13 Nov 2019 18:19:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 13 Nov 2019 18:19:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE0JiqL090508;
	Wed, 13 Nov 2019 18:19:44 -0600
Date: Wed, 13 Nov 2019 19:19:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20191114001943.GF15023@beryl>
References: <CADySD0HyRLzXfSfcYTrGZmuX2acoCMi2BE+hy=v+-fKPAvF3Mw@mail.gmail.com>
	<CADySD0HKK1MWGXg2qL4PP-SRiyrHGJUpwKgAuCTVsZ0MizCSpg@mail.gmail.com>
	<20190926162746.GC5386@beryl>
	<CADySD0H4jZy5YpHudHyEwhsJLhcCLLt3yJ-nX1sdqik561Qt3g@mail.gmail.com>
	<CADySD0H7NXcvhhV++WNtCu4nsxy=CV7MiH3oMitJS_W5QmBYoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0H7NXcvhhV++WNtCu4nsxy=CV7MiH3oMitJS_W5QmBYoA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Thu, 14 Nov 2019 00:21:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Nov 10, 2019 at 09:52:48PM -0800, Ankur Tyagi wrote:
> Hi Denys,
> 
> I have again encountered the same problem so there is a fundamental issue
> somewhere.
> Let me explain when this problem occurs and what is my setup:
> 
> 1) Let's assume current u-boot SRCREV in recipe is
> "4fc3ad1c4d92a32c1e233c524d65836226488912" and linux SRCREV is
> "634579ce9ee01466fd84524602bd0a262a0add00"
> 2) I build my image and preserve sstate-cache
> 3) Change u-boot SRCREV to "b31ea1d6069a3634c696d9fbff86373fd5b0f82d" and
> linux SRCREV to "d02acfec3d72606798f498c33728f5a0839e6360"
> 4) Build my image again using the preserved sstate-cache so only u-boot and
> linux is rebuilt
> 
> Then I get following error
> 
> ******************************
> Collected errors:
>  * Solver encountered 2 problem(s):
>  * Problem 1/2:
>  *   - nothing provides u-boot-ti-staging-src >= 2019.01+git0+b31ea1d606
> needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos.wsl

Not really sure why do you even have any dependency between these 2 -src 
packages. They should not and they are not dependent here for us.


>  *
>  * Solution 1:
>  *   - do not ask to install a package providing packagegroup-ggl-base
> 
>  * Problem 2/2:
>  *   - nothing provides u-boot-ti-staging-src >= 2019.01+git0+b31ea1d606
> needed by linux-ti-staging-src-4.19.73+git0+d02acfec3d-gamos.wsl
>  *
>  * Solution 1:
>  *   - do not ask to install a package providing packagegroup-ggl-qt
> ******************************
> 
> Can you please provide me with some pointers on what could be causing it or
> where should I start investigating it?
> 
> Thanks
> Ankur
> 
> 
> On Fri, 27 Sep 2019, 9:00 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:
> 
> > thanks for your response Denys
> >
> > On Fri, 27 Sep 2019, 4:27 a.m. Denys Dmytriyenko, <denys@ti.com> wrote:
> >
> >> Thanks for following up with the update!
> >>
> >> Unfortunately, opkg install issues like this are very specific to your
> >> build
> >> environment and harder to debug remotely. You'd need to see why the
> >> package
> >> gets one version, while a different one being requested. In some cases it
> >> can
> >> be due to a stale package, like here. In others it's more complicated.
> >>
> >> Denys
> >>
> >>
> >> On Thu, Sep 26, 2019 at 07:17:26AM +1200, Ankur Tyagi wrote:
> >> > It got resolved after removing tmp directory and rebuilding
> >> >
> >> > On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com>
> >> wrote:
> >> >
> >> > > Hi,
> >> > >
> >> > > I was using "thud" branch to create custom image for my board.
> >> > > Recently updated meta-ti, meta-arago "thud" branch and started
> >> > > receiving following error message during do_rootfs task
> >> > >
> >> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install
> >> > > packages. Command
> >> > >
> >> > >
> >> '/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
> >> > > --volatile-cache -f
> >> > >
> >> > >
> >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf
> >> > > -t
> >> > >
> >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/
> >> > > -o
> >> > >
> >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs
> >> > >  --force_postinstall    install packagegroup-core-boot
> >> > > packagegroup-ggl-base packagegroup-ggl-connectivity
> >> > > packagegroup-ggl-qt psplash run-postinsts' returned 2:
> >> > > Collected errors:
> >> > >  * Solver encountered 2 problem(s):
> >> > >  * Problem 1/2:
> >> > >  *   - nothing provides u-boot-ti-staging-src >=
> >> > > 2019.01+git0+571bb85860 needed by
> >> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> >> > >  *
> >> > >  * Solution 1:
> >> > >  *   - do not ask to install a package providing packagegroup-ggl-base
> >> > >
> >> > >  * Problem 2/2:
> >> > >  *   - nothing provides u-boot-ti-staging-src >=
> >> > > 2019.01+git0+571bb85860 needed by
> >> > > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> >> > >  *
> >> > >  * Solution 1:
> >> > >  *   - do not ask to install a package providing packagegroup-ggl-qt
> >> > >
> >> > >  * opkg_finalize_intercepts: Failed to open dir
> >> > >
> >> > >
> >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> >> > > No such file or directory.
> >> > >  * rm_r: Failed to open dir
> >> > >
> >> > >
> >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> >> > > No such file or directory.
> >> > >  * rm_r: Failed to open dir
> >> > >
> >> > >
> >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:
> >> > > No such file or directory.
> >> > >
> >> > >
> >> > >
> >> > > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_rootfs
> >> > > ERROR: Logfile of failure stored in:
> >> > >
> >> > >
> >> /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554
> >> > > ERROR: Task
> >> > >
> >> (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/recipes-core/images/
> >> ggl-wsl-prod-image.bb:
> >> > > do_rootfs)
> >> > > failed with exit code '1'
> >> > >
> >> > > Can you please help:
> >> > > 1) to understand the underlying problem
> >> > > 2) how can I fix it
> >> > >
> >> > > thanks
> >> > > Ankur
> >> > >
> >>
> >> > _______________________________________________
> >> > meta-arago mailing list
> >> > meta-arago@arago-project.org
> >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >>
> >>

