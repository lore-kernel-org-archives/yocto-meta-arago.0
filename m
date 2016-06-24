Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 231A552A5B
	for <meta-arago@arago-project.org>;
	Fri, 24 Jun 2016 18:09:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5OI8PDb028236;
	Fri, 24 Jun 2016 13:08:25 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5OI9Gnu020763;
	Fri, 24 Jun 2016 13:09:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Jun 2016 13:09:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5OI9EbO002928;
	Fri, 24 Jun 2016 13:09:15 -0500
Date: Fri, 24 Jun 2016 14:09:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20160624180912.GU2177@edge>
References: <20160624171350.18507-1-denis@denix.org>
	<20160624171350.18507-2-denis@denix.org>
	<4B26FB5A64EBA14C87266869E037F958142BE0E4@DFLE09.ent.ti.com>
	<20160624175516.GT2177@edge>
	<4B26FB5A64EBA14C87266869E037F958142BE193@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958142BE193@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/3] k2-initramfs: update to latest with fresh	FW images
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
X-List-Received-Date: Fri, 24 Jun 2016 18:09:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 24, 2016 at 01:58:09PM -0400, Stiffler, Jacob wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, June 24, 2016 1:55 PM
> > To: Stiffler, Jacob
> > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 2/3] k2-initramfs: update to latest with
> > fresh FW images
> > 
> > On Fri, Jun 24, 2016 at 05:17:05PM +0000, Stiffler, Jacob wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > Sent: Friday, June 24, 2016 1:14 PM
> > > > To: meta-arago@arago-project.org
> > > > Subject: [meta-arago] [PATCH 2/3] k2-initramfs: update to latest
> > > > with fresh FW images
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb | 6
> > > > +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git
> > > > a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
> > > > b/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
> > > > index e61edbd..46325aa 100644
> > > > --- a/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
> > > > +++ b/meta-arago-distro/recipes-bsp/k2-initramfs/k2-initramfs_git.bb
> > > > @@ -3,7 +3,7 @@ DESCRIPTION = "Prebuilt Keystone2 initramfs with
> > > > SerDes, QMSS and NETCP PA firmw  LICENSE = "TI-TFL"
> > > >  LIC_FILES_CHKSUM =
> > > > "file://LICENSE;md5=3a86335d32864b0bef996bee26cc0f2c"
> > > >
> > > > -PV = "0.0.4"
> > > > +PV = "0.0.5"
> > > >  PR = "r0"
> > > >
> > > >  CLEANBROKEN = "1"
> > > > @@ -14,8 +14,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > >
> > > >  SRC_URI = "http://arago-project.org/files/releases/k2-fw/${P}.tar.gz"
> > >
> > > This file is updated in place? This will break recreating all past
> > > releases and our upcoming release.
> > 
> > No, it's a new version.
> > 
> 
> OK. Thank you for the confirmation.
> 
> Are there any plans to create this image as part of the builds?

Yes.


> > > > -SRC_URI[md5sum] = "ba1fe7a7f9279ea7ed0d26fbba30e4d5"
> > > > -SRC_URI[sha256sum] =
> > > >
> > "c76c0899cbe9b5dde45febf4be48175142dc49ddcfe759596090c183743e8b3b"
> > > > +SRC_URI[md5sum] = "7c1ffa2ef565532aee07c28ea56b748f"
> > > > +SRC_URI[sha256sum] =
> > > >
> > "7816722c319fd83f5538649003158616481ded5f6a8361f66d38f738f93c0022"
> > > >
> > > >  S = "${WORKDIR}"
> > > >  TARGET = "k2-fw-initrd.cpio.gz"
> > > > --
> > > > 2.9.0
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

