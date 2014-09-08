Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3A31C52A84
	for <meta-arago@arago-project.org>;
	Mon,  8 Sep 2014 22:05:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s88M53ao017275;
	Mon, 8 Sep 2014 17:05:03 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s88M53C8026408;
	Mon, 8 Sep 2014 17:05:03 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Mon, 8 Sep 2014 17:05:03 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 1/2] run-opentest:
	only pass u-boot and spl/uart when enabled in config
Thread-Index: AQHPy55Zl/yqFRpxmUKILCVjVA4Z4Zv3wz2AgABU/wD//7ELUA==
Date: Mon, 8 Sep 2014 22:05:02 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72C5EB@DFLE08.ent.ti.com>
References: <1410205737-7590-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C72C4DB@DFLE08.ent.ti.com>
	<20140908214245.GK18620@edge>
In-Reply-To: <20140908214245.GK18620@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 08 Sep 2014 22:05:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, September 08, 2014 4:43 PM
> To: Cooper Jr., Franklin
> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 1/2] run-opentest: =
only
> pass u-boot and spl/uart when enabled in config
>=20
> On Mon, Sep 08, 2014 at 09:39:29PM +0000, Cooper Jr., Franklin wrote:
> > Should we make this variable specific to am335x some how then?
>=20
> I don't think there's easy way to control a config variable based on
> machine...
[Franklin] Maybe for now just check against the "machine" or some regexp am=
335x*?

Also can we update all the configs to use true for now? This way it doesn't=
 change the current behavior. With my above suggestion we can set things to=
 true and take advantage of it when it makes sense.

>=20
>=20
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > Sent: Monday, September 08, 2014 2:49 PM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [tisdk-build-scripts][PATCH 1/2] run-opentest: =
only
> > > pass u-boot and spl/uart when enabled in config
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Introduce new variable OPENTEST_BOOTLOADERS to control it, but
> defaults
> > > to false.
> > > This never worked as expected, since SPL/UART is only supported by
> am335x
> > > and on other platforms it causes OpenTest to miss the escape window
> and it
> > > can't stop boot sequence to configure the necessary parameters.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  configs/arago-core-tisdk-daisy-puget.txt |  4 ++++
> > >  lib/run-opentest                         | 17 ++++++++++-------
> > >  2 files changed, 14 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/configs/arago-core-tisdk-daisy-puget.txt b/configs/arago=
-
> core-
> > > tisdk-daisy-puget.txt
> > > index c132baf..f8bfb7a 100644
> > > --- a/configs/arago-core-tisdk-daisy-puget.txt
> > > +++ b/configs/arago-core-tisdk-daisy-puget.txt
> > > @@ -177,6 +177,10 @@ OPENTEST_TEE_IP=3D"none"
> > >  # Limit the board selection to official TI GT farm, avoiding persona=
l
> boards
> > > OPENTEST_HW_CAP=3D"linux_tigt_farm"
> > >
> > > +# Determine whether SPL/UART and U-boot binaries are passed to
> > > OpenTest
> > > +for # testing. Otherwise uses existing bootloaders on the board (SD,
> > > +NAND, etc) OPENTEST_BOOTLOADERS=3D"false"
> > > +
> > >  # This variable will allow control over whether to perform build tes=
ting or
> #
> > > skip it.  This should usually be set to true but may be changed for  =
#
> > > prototyping.
> > > diff --git a/lib/run-opentest b/lib/run-opentest index a64e4cc..1a71a=
e8
> > > 100644
> > > --- a/lib/run-opentest
> > > +++ b/lib/run-opentest
> > > @@ -206,15 +206,18 @@ run_target_side_test() {
> > >      fi
> > >
> > >      uboot=3D""
> > > -    if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-$m.*=
 ]
> > > -    then
> > > -        uboot=3D"~secondary_bootloader=3D$(ls $test_dir/temp/board-
> > > support/prebuilt-images/u-boot-$m.*)"
> > > -    fi
> > > -
> > >      spluart=3D""
> > > -    if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-spl.=
bin-
> $m ]
> > > +    if [ "$OPENTEST_BOOTLOADERS" =3D=3D "true" ]
> > >      then
> > > -        spluart=3D"~primary_bootloader=3D$(ls $test_dir/temp/board-
> > > support/prebuilt-images/u-boot-spl.bin-$m)"
> > > +        if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-=
$m.* ]
> > > +        then
> > > +            uboot=3D"~secondary_bootloader=3D$(ls $test_dir/temp/boa=
rd-
> > > support/prebuilt-images/u-boot-$m.*)"
> > > +        fi
> > > +
> > > +        if [ -f $test_dir/temp/board-support/prebuilt-images/u-boot-
> spl.bin-$m
> > > ]
> > > +        then
> > > +            spluart=3D"~primary_bootloader=3D$(ls $test_dir/temp/boa=
rd-
> > > support/prebuilt-images/u-boot-spl.bin-$m)"
> > > +        fi
> > >      fi
> > >
> > >      # Start the STAF process if not already started
> > > --
> > > 2.0.4
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

