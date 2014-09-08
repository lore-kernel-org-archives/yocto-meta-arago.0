Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6764352A84
	for <meta-arago@arago-project.org>;
	Mon,  8 Sep 2014 22:08:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s88M837X017520;
	Mon, 8 Sep 2014 17:08:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s88M83MQ028677;
	Mon, 8 Sep 2014 17:08:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 8 Sep 2014 17:08:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s88M826H009851;
	Mon, 8 Sep 2014 17:08:02 -0500
Date: Mon, 8 Sep 2014 18:08:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140908220801.GM18620@edge>
References: <1410205737-7590-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C72C4DB@DFLE08.ent.ti.com>
	<20140908214245.GK18620@edge>
	<8F29D6B095ED194EA1980491A5E029710C72C5EB@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C72C5EB@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH 1/2] run-opentest: only pass u-boot and spl/uart when enabled in config
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
X-List-Received-Date: Mon, 08 Sep 2014 22:08:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 08, 2014 at 06:05:02PM -0400, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, September 08, 2014 4:43 PM
> > To: Cooper Jr., Franklin
> > Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 1/2] run-opentest: only
> > pass u-boot and spl/uart when enabled in config
> > 
> > On Mon, Sep 08, 2014 at 09:39:29PM +0000, Cooper Jr., Franklin wrote:
> > > Should we make this variable specific to am335x some how then?
> > 
> > I don't think there's easy way to control a config variable based on
> > machine...
> [Franklin] Maybe for now just check against the "machine" or some regexp am335x*?
> 
> Also can we update all the configs to use true for now? This way it doesn't 
> change the current behavior. With my above suggestion we can set things to 
> true and take advantage of it when it makes sense.

Actually, I was going to disable it for all my configs, as it makes things 
worse if enabled - don't know why, but systest is not yet explaining this 
behaviour. You can keep it enabled, if you want, in your configs, though.


> > > > -----Original Message-----
> > > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > > Sent: Monday, September 08, 2014 2:49 PM
> > > > To: meta-arago@arago-project.org
> > > > Subject: [meta-arago] [tisdk-build-scripts][PATCH 1/2] run-opentest: only
> > > > pass u-boot and spl/uart when enabled in config
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Introduce new variable OPENTEST_BOOTLOADERS to control it, but
> > defaults
> > > > to false.
> > > > This never worked as expected, since SPL/UART is only supported by
> > am335x
> > > > and on other platforms it causes OpenTest to miss the escape window
> > and it
> > > > can't stop boot sequence to configure the necessary parameters.
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  configs/arago-core-tisdk-daisy-puget.txt |  4 ++++
> > > >  lib/run-opentest                         | 17 ++++++++++-------
> > > >  2 files changed, 14 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago-
> > core-
> > > > tisdk-daisy-puget.txt
> > > > index c132baf..f8bfb7a 100644
> > > > --- a/configs/arago-core-tisdk-daisy-puget.txt
> > > > +++ b/configs/arago-core-tisdk-daisy-puget.txt
> > > > @@ -177,6 +177,10 @@ OPENTEST_TEE_IP="none"
> > > >  # Limit the board selection to official TI GT farm, avoiding personal
> > boards
> > > > OPENTEST_HW_CAP="linux_tigt_farm"
> > > >
> > > > +# Determine whether SPL/UART and U-boot binaries are passed to
> > > > OpenTest
> > > > +for # testing. Otherwise uses existing bootloaders on the board (SD,
> > > > +NAND, etc) OPENTEST_BOOTLOADERS="false"
> > > > +
> > > >  # This variable will allow control over whether to perform build testing or
> > #
> > > > skip it.  This should usually be set to true but may be changed for  #
> > > > prototyping.
> > > > diff --git a/lib/run-opentest b/lib/run-opentest index a64e4cc..1a71ae8
> > > > 100644
> > > > --- a/lib/run-opentest
> > > > +++ b/lib/run-opentest
> > > > @@ -206,15 +206,18 @@ run_target_side_test() {
> > > >      fi
> > > >
> > > >      uboot=""
> > > > -    if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-$m.* ]
> > > > -    then
> > > > -        uboot="~secondary_bootloader=$(ls $test_dir/temp/board-
> > > > support/prebuilt-images/u-boot-$m.*)"
> > > > -    fi
> > > > -
> > > >      spluart=""
> > > > -    if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-spl.bin-
> > $m ]
> > > > +    if [ "$OPENTEST_BOOTLOADERS" == "true" ]
> > > >      then
> > > > -        spluart="~primary_bootloader=$(ls $test_dir/temp/board-
> > > > support/prebuilt-images/u-boot-spl.bin-$m)"
> > > > +        if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-$m.* ]
> > > > +        then
> > > > +            uboot="~secondary_bootloader=$(ls $test_dir/temp/board-
> > > > support/prebuilt-images/u-boot-$m.*)"
> > > > +        fi
> > > > +
> > > > +        if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-
> > spl.bin-$m
> > > > ]
> > > > +        then
> > > > +            spluart="~primary_bootloader=$(ls $test_dir/temp/board-
> > > > support/prebuilt-images/u-boot-spl.bin-$m)"
> > > > +        fi
> > > >      fi
> > > >
> > > >      # Start the STAF process if not already started
> > > > --
> > > > 2.0.4
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

