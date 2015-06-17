Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 10E35529B1
	for <meta-arago@arago-project.org>;
	Wed, 17 Jun 2015 02:33:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5H2XIdo029837;
	Tue, 16 Jun 2015 21:33:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5H2XH0X009025;
	Tue, 16 Jun 2015 21:33:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 16 Jun 2015 21:33:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5H2XHug018839;
	Tue, 16 Jun 2015 21:33:17 -0500
Date: Tue, 16 Jun 2015 22:33:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20150617023316.GE16167@edge>
References: <CADySD0HLdsGyRo3G-GDG7RcS5+pfSQB5Je4-9aNE5W9AX3OidA@mail.gmail.com>
	<CADySD0FWxqfprvwCAXSEqyL2Sx08=ZWPxdzKoh5vws=cimeZUA@mail.gmail.com>
	<20150615162226.GO4825@edge>
	<CADySD0H4FoHD3S2tZauGrYZmBYNe1EZupPJWckWmRr3wnY+OKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0H4FoHD3S2tZauGrYZmBYNe1EZupPJWckWmRr3wnY+OKg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Wed, 17 Jun 2015 02:33:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Correct, it got branched off couple weeks ago and so far I've been working on 
it locally, but haven't pushed anything significant yet.


On Wed, Jun 17, 2015 at 11:04:20AM +1200, Ankur Tyagi wrote:
> So does that mean meta-arago fido is still nor ready ?
> 
> "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
> fruit salad"
> 
> On Tue, Jun 16, 2015 at 4:22 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > http://arago-project.org/pipermail/meta-arago/2015-May/005666.html
> >
> >
> > On Sat, Jun 13, 2015 at 10:38:46AM +1200, Ankur Tyagi wrote:
> > > "With typos fixed"
> > >
> > > ​
> > > Hi,
> > >
> > > I am trying to create tisdk rootfs image for AM335x EVM.
> > >
> > > Following are the steps are performed:
> > >
> > > git clone git://arago-project.org/git/projects/oe-layersetup.git fido
> > > export
> > > PATH=/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$PATH
> > > cd fido
> > > ./oe-layersetup.sh -f configs/arago-fido-config.txt
> > > cd build
> > > . conf/setenv
> > > MACHINE=am335x-evm bitbake tisdk-rootfs-image
> > >
> > > This gave following error :
> > >
> > > NOTE: Started PRServer with DBfile:
> > > /home/ankur/fido/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 53096,
> > > PID: 3653
> > > ERROR: Layer 'networking-layer' depends on layer 'meta-python', but this
> > > layer is not enabled in your configuration
> > >
> > > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> > >
> > > I then added meta-python in bblayers.conf
> > >
> > > /home/ankur/fido/sources/meta-openembedded/meta-python \
> > >
> > > Again started bitbake
> > > MACHINE=am335x-evm bitbake tisdk-rootfs-image
> > >
> > > and got this error
> > >
> > > ERROR: ParseError at
> > > /home/ankur/fido/sources/meta-arago/meta-arago-extras/recipes-core/meta/
> > > external-arago-toolchain.bb:1: Could not include required file
> > > recipes-core/eglibc/eglibc-package.inc
> > >
> > > Summary: There were 3 WARNING messages shown.
> > > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> > >
> > > What wrong am I doing and how to fix it ?
> > >
> > > thanks
> > > Ankur
> > >
> > >
> > >
> > >
> > > On Sat, Jun 13, 2015 at 10:36 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > wrote:
> > >
> > > > ​​
> > > > Hi,
> > > >
> > > > I am trying to create tisdk rootfs image for AM335x EVM.
> > > >
> > > > Following are the steps are performed:
> > > >
> > > > git clone git://arago-project.org/git/projects/oe-layersetup.git fido
> > > > export
> > > >
> > PATH=/opt/fido/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin:$PATH
> > > > cd fido
> > > > ./oe-layersetup.sh -f configs/arago-fido-conig.txt
> > > > cd build
> > > > . conf/setenv
> > > > MACHINE=am335-evm bitbake tisdk-rootfs-image
> > > >
> > > > This gave following error :
> > > >
> > > > NOTE: Started PRServer with DBfile:
> > > > /home/ankur/fido/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
> > 53096,
> > > > PID: 3653
> > > > ERROR: Layer 'networking-layer' depends on layer 'meta-python', but
> > this
> > > > layer is not enabled in your configuration
> > > >
> > > > Summary: There was 1 ERROR message shown, returning a non-zero exit
> > code.
> > > >
> > > > I then added meta-python in bblayers.conf
> > > >
> > > > /home/ankur/fido/sources/meta-openembedded/meta-python \
> > > >
> > > > Again started bitbake
> > > > MACHINE=am335-evm bitbake tisdk-rootfs-image
> > > >
> > > > and got this error
> > > >
> > > > ERROR: ParseError at
> > > >
> > /home/ankur/fido/sources/meta-arago/meta-arago-extras/recipes-core/meta/
> > > > external-arago-toolchain.bb:1: Could not include required file
> > > > recipes-core/eglibc/eglibc-package.inc
> > > >
> > > > Summary: There were 3 WARNING messages shown.
> > > > Summary: There was 1 ERROR message shown, returning a non-zero exit
> > code.
> > > >
> > > > What wrong am I doing and how to fix it ?
> > > >
> > > > thanks
> > > > Ankur
> > > >
> >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >
> >

