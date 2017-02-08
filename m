Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 8AEC352A93
	for <meta-arago@arago-project.org>;
	Wed,  8 Feb 2017 20:05:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v18K5dGL008174
	for <meta-arago@arago-project.org>; Wed, 8 Feb 2017 14:05:39 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v18K5dWD029186
	for <meta-arago@arago-project.org>; Wed, 8 Feb 2017 14:05:39 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 14:04:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v18K4nRn001066;
	Wed, 8 Feb 2017 14:04:50 -0600
Date: Wed, 8 Feb 2017 15:04:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20170208200449.GA2612@edge>
References: <1486399437-29605-1-git-send-email-h-gou@ti.com>
	<20170206165135.GE25590@edge>
	<2E957F12D11D904590FA9AF86D366BD926CD32DC@DLEE08.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F4905854E974@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905854E974@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/krogoth][patch] ti-tisdk-makefile: add am572x-idk-pru-excl-uio.dtb to linux-dtbs
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
X-List-Received-Date: Wed, 08 Feb 2017 20:05:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Right, but my point was that the corresponding dtb will not even be installed 
when uio is not enabled with ENABLE_TI_UIO_DEVICES


On Wed, Feb 08, 2017 at 03:00:09PM -0500, Nelson, Sam wrote:
> My understanding is just the device tree source compilation should NOT depend on the UIO enabled in kernel.
> So I don't expect it to fail.
> 
> > -----Original Message-----
> > From: Gou, Hongmei
> > Sent: Monday, February 06, 2017 12:10 PM
> > To: Dmytriyenko, Denys; Nelson, Sam
> > Cc: meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [morty/krogoth][patch] ti-tisdk-makefile: add
> > am572x-idk-pru-excl-uio.dtb to linux-dtbs
> > 
> > Looping in Sam for this question...
> > 
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Monday, February 06, 2017 11:52 AM
> > > To: Gou, Hongmei
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [morty/krogoth][patch] ti-tisdk-makefile:
> > > add am572x-idk-pru-excl-uio.dtb to linux-dtbs
> > >
> > > Will this fail if UIO is not enabled?
> > >
> > >
> > > On Mon, Feb 06, 2017 at 11:43:57AM -0500, Hongmei Gou wrote:
> > > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > > ---
> > > >  .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git
> > > > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefil
> > > > e_
> > > > 1.0.bb
> > > > b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefil
> > > > e_
> > > > 1.0.bb
> > > > index 8cc0758..c27bba6 100644
> > > > ---
> > > > a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefil
> > > > e_
> > > > 1.0.bb
> > > > +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-mak
> > > > +++ ef
> > > > +++ ile_1.0.bb
> > > > @@ -50,7 +50,7 @@ SRC_URI = "\
> > > >      file://Makefile_barcode-roi \
> > > >  "
> > > >
> > > > -PR = "r77"
> > > > +PR = "r78"
> > > >
> > > >  MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
> > > >                          refresh-screen \ @@ -188,7 +188,7 @@
> > > > KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb
> > > > am437x-gp-evm-hd  KERNEL_DEVICETREE_beaglebone = "am335x-
> > > bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
> > > >  KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
> > > >  KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb
> > > dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-revc.dtb dra72-evm-lcd-
> > > lg.dtb dra72-evm-lcd-osd.dtb"
> > > > -KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-
> > > beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-
> > > idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb"
> > > > +KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-
> > > beagle-x15-revb1.dtb am57xx-evm.dtb am57xx-evm-reva3.dtb am571x-
> > > idk.dtb am572x-idk.dtb am571x-idk-lcd-osd.dtb am572x-idk-lcd-osd.dtb
> > > am572x-idk-pru-excl-uio.dtb"
> > > >  KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
> > > >  KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
> > > >  KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb"
> > > > --
> > > > 1.9.1
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

