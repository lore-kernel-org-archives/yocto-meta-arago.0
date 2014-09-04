Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 95B3D52A04
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 19:08:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84J8Wxd000926
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 14:08:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84J8WRh024611
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 14:08:32 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 4 Sep 2014 14:08:32 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 3/4]
	bitbake-test-sdk-image: Add support to control verbosity of build
	logging.
Thread-Index: AQHPyGcXu2e4OtfC20q4NVzjpvdeEJvxmIGAgAAQOYD//6y30A==
Date: Thu, 4 Sep 2014 19:08:31 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C728CB1@DFLE08.ent.ti.com>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
	<1409851868-7389-3-git-send-email-j-stiffler@ti.com>
	<20140904173842.GL18620@edge>
	<4B26FB5A64EBA14C87266869E037F958140B10AE@DFLE09.ent.ti.com>
	<20140904190305.GR18620@edge>
In-Reply-To: <20140904190305.GR18620@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH 3/4] bitbake-test-sdk-image: Add support to control verbosity of build logging.
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
X-List-Received-Date: Thu, 04 Sep 2014 19:08:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, September 04, 2014 2:03 PM
> To: Stiffler, Jacob
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 3/4] bitbake-test-s=
dk-
> image: Add support to control verbosity of build logging.
>=20
> On Thu, Sep 04, 2014 at 02:05:01PM -0400, Stiffler, Jacob wrote:
> > This change is to capture stderr and stdout to a file. I could not
> > find anywhere that the stderr and stdout of the bitbake command was
> > logged.  From what I see, results.html only shows the configuration
> > parameters. In the log directory, the $m-build-log.txt only contains a
> > single line: " executing bitbake command arago-amsdk-image for machine
> am57xx-evm".
>=20
> Yes, you are right, it's captured by Jenkins, not results.html...
> I've been meaning to add the per-machine logs to the output and email, bu=
t
> never had time. This basically makes it possible - thanks!
[Franklin] Took me awhile to realize we never actually do anything with tha=
t build-log file.
Jacob,

How are you uploading your builds to your server? We don't upload this log =
file so having your patch upload that file also along with the results file=
 would make things very useful for all of us.                              =
                                                                           =
                                                                   =20
>=20
>=20
> > Without this, the only place I can find the complete log is the Jenkins
> > console in a browser window. Here is an example of what I would like to
> > enable with this change:
> > http://158.218.103.230/nightly_builds/mcsdk-8.0.x/75-2014-09-03_13-16-
> 59/artifacts/logs/log-files/am57xx-evm-build-log.txt
> >
> >
> >
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Thursday, September 04, 2014 1:39 PM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 3/4] bitbake-test=
-
> sdk-image: Add support to control verbosity of build logging.
> >
> > Can you please elaborate on this change? You don't seem to be increasin=
g
> Bitbake's verbosity level, just enabling capturing stdout and stderr into=
 a file,
> which gets captured by results.html anyway. What's the purpose?
> >
> >
> > On Thu, Sep 04, 2014 at 01:31:07PM -0400, Jacob Stiffler wrote:
> > > * Setting BUILD_LOG_VERBOSE=3D"true" (case sensitive) will enable
> logging stdout
> > >   and stderr for the bitbake command to the build log.
> > >
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > >  lib/oesdk/bitbake-test-sdk-image |    8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/lib/oesdk/bitbake-test-sdk-image
> > > b/lib/oesdk/bitbake-test-sdk-image
> > > index cff86e4..7d8d093 100644
> > > --- a/lib/oesdk/bitbake-test-sdk-image
> > > +++ b/lib/oesdk/bitbake-test-sdk-image
> > > @@ -375,12 +375,16 @@ bitbake_sdk_images(){
> > >          for c in "${bitbake_command_list[@]}"
> > >          do
> > >              log $machine_build_log echo "executing bitbake command $=
c for
> machine $m"
> > > -            MACHINE=3D$m
> EXTRA_TISDK_FILES=3D"${INSTALLER_EXTRAS_ROOT}/${MACHINE}"
> TISDK_VERSION=3D"${TISDK_VERSION}" bitbake $c
> > > +            if [ "${BUILD_LOG_VERBOSE}" =3D "true" ]; then
> > > +                MACHINE=3D$m
> EXTRA_TISDK_FILES=3D"${INSTALLER_EXTRAS_ROOT}/${MACHINE}"
> TISDK_VERSION=3D"${TISDK_VERSION}" bitbake $c 2>&1 | eval tee -a
> $machine_build_log
> > > +            else
> > > +                MACHINE=3D$m
> EXTRA_TISDK_FILES=3D"${INSTALLER_EXTRAS_ROOT}/${MACHINE}"
> TISDK_VERSION=3D"${TISDK_VERSION}" bitbake $c
> > > +            fi
> > >
> > >              # Check the return status of the build process.  If the =
build
> returned
> > >              # a non-zero exit value then log the failure and continu=
e (without
> > >              # testing).  A lack of a test file will indicate a test =
skip
> > > -            if [ "$?" !=3D "0" ]
> > > +            if [ "${PIPESTATUS[0]}" !=3D "0" ]
> > >              then
> > >                  echo "FAILED" > $LOG_DIR/$m-build-result.txt
> > >                  build_status=3D"fail"
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

