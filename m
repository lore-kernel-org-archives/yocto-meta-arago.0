Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 3B0DF52960
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2019 16:28:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QGRljC103211;
	Thu, 26 Sep 2019 11:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569515267;
	bh=PcsrPLGCYWNkrLVy3Rl58MADl1y13t7Mq5wfbtTkt7Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=inVpRPiyjvrnl/sJxGcLPh7C3NYXHsZLly1TTeN/cLVcLM6hGwdDpxDKIjRqsAGgf
	Z0I4CAk4IdedqLCTFC+3HLTux2Cx5XWZhQ8PGA1xmOdwkNz2cuN3eLub/UAke1JlDD
	XezDfa3lozFZLmMBDV7j6+dnkt//9RYdtsOhOBXY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QGRlDq001700;
	Thu, 26 Sep 2019 11:27:47 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 26 Sep 2019 11:27:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 26 Sep 2019 11:27:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QGRkvd046232;
	Thu, 26 Sep 2019 11:27:46 -0500
Date: Thu, 26 Sep 2019 12:27:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20190926162746.GC5386@beryl>
References: <CADySD0HyRLzXfSfcYTrGZmuX2acoCMi2BE+hy=v+-fKPAvF3Mw@mail.gmail.com>
	<CADySD0HKK1MWGXg2qL4PP-SRiyrHGJUpwKgAuCTVsZ0MizCSpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0HKK1MWGXg2qL4PP-SRiyrHGJUpwKgAuCTVsZ0MizCSpg@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Sep 2019 16:28:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks for following up with the update!

Unfortunately, opkg install issues like this are very specific to your build 
environment and harder to debug remotely. You'd need to see why the package 
gets one version, while a different one being requested. In some cases it can 
be due to a stale package, like here. In others it's more complicated.

Denys


On Thu, Sep 26, 2019 at 07:17:26AM +1200, Ankur Tyagi wrote:
> It got resolved after removing tmp directory and rebuilding
> 
> On Wed, 25 Sep 2019, 1:23 a.m. Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:
> 
> > Hi,
> >
> > I was using "thud" branch to create custom image for my board.
> > Recently updated meta-ti, meta-arago "thud" branch and started
> > receiving following error message during do_rootfs task
> >
> > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Unable to install
> > packages. Command
> >
> > '/home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
> > --volatile-cache -f
> >
> > /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/opkg.conf
> > -t
> > /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp/
> > -o
> > /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/rootfs
> >  --force_postinstall    install packagegroup-core-boot
> > packagegroup-ggl-base packagegroup-ggl-connectivity
> > packagegroup-ggl-qt psplash run-postinsts' returned 2:
> > Collected errors:
> >  * Solver encountered 2 problem(s):
> >  * Problem 1/2:
> >  *   - nothing provides u-boot-ti-staging-src >=
> > 2019.01+git0+571bb85860 needed by
> > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> >  *
> >  * Solution 1:
> >  *   - do not ask to install a package providing packagegroup-ggl-base
> >
> >  * Problem 2/2:
> >  *   - nothing provides u-boot-ti-staging-src >=
> > 2019.01+git0+571bb85860 needed by
> > linux-ti-staging-src-4.19.73+git0+761ba629e9-gamos.wsl
> >  *
> >  * Solution 1:
> >  *   - do not ask to install a package providing packagegroup-ggl-qt
> >
> >  * opkg_finalize_intercepts: Failed to open dir
> >
> > /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> > No such file or directory.
> >  * rm_r: Failed to open dir
> >
> > /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910/opkg-intercept-xOvXqH:
> > No such file or directory.
> >  * rm_r: Failed to open dir
> >
> > /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/ipktemp//opkg-JLB910:
> > No such file or directory.
> >
> >
> >
> > ERROR: ggl-wsl-prod-image-1.0-r0 do_rootfs: Function failed: do_rootfs
> > ERROR: Logfile of failure stored in:
> >
> > /home/yocto/ggl-yocto-tools/build/tmp-external-arm-toolchain/work/wsl-linux-gnueabi/ggl-wsl-prod-image/1.0-r0/temp/log.do_rootfs.107554
> > ERROR: Task
> > (/home/yocto/ggl-yocto-tools/sources/ggl-yocto/meta-ggl-image/recipes-core/images/ggl-wsl-prod-image.bb:
> > do_rootfs)
> > failed with exit code '1'
> >
> > Can you please help:
> > 1) to understand the underlying problem
> > 2) how can I fix it
> >
> > thanks
> > Ankur
> >

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


