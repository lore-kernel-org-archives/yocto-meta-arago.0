Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9061752A9A
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 18:05:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84I51ZW022703
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 13:05:01 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84I505R021558
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 13:05:01 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 4 Sep 2014 13:05:01 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 3/4]
	bitbake-test-sdk-image: Add support to control verbosity of build
	logging.
Thread-Index: AQHPyGYGrwOk/Cu2W0GWNA4bCtGmZ5vxkSgA//+xFJA=
Date: Thu, 4 Sep 2014 18:05:01 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140B10AE@DFLE09.ent.ti.com>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
	<1409851868-7389-3-git-send-email-j-stiffler@ti.com>
	<20140904173842.GL18620@edge>
In-Reply-To: <20140904173842.GL18620@edge>
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
X-List-Received-Date: Thu, 04 Sep 2014 18:05:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This change is to capture stderr and stdout to a file. I could not find any=
where that the stderr and stdout of the bitbake command was logged.  From w=
hat I see, results.html only shows the configuration parameters. In the log=
 directory, the $m-build-log.txt only contains a single line: " executing b=
itbake command arago-amsdk-image for machine am57xx-evm".=20

Without this, the only place I can find the complete log is the Jenkins con=
sole in a browser window. Here is an example of what I would like to enable=
 with this change: http://158.218.103.230/nightly_builds/mcsdk-8.0.x/75-201=
4-09-03_13-16-59/artifacts/logs/log-files/am57xx-evm-build-log.txt=20



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, September 04, 2014 1:39 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 3/4] bitbake-test-sdk=
-image: Add support to control verbosity of build logging.

Can you please elaborate on this change? You don't seem to be increasing Bi=
tbake's verbosity level, just enabling capturing stdout and stderr into a f=
ile, which gets captured by results.html anyway. What's the purpose?


On Thu, Sep 04, 2014 at 01:31:07PM -0400, Jacob Stiffler wrote:
> * Setting BUILD_LOG_VERBOSE=3D"true" (case sensitive) will enable logging=
 stdout
>   and stderr for the bitbake command to the build log.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  lib/oesdk/bitbake-test-sdk-image |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/oesdk/bitbake-test-sdk-image=20
> b/lib/oesdk/bitbake-test-sdk-image
> index cff86e4..7d8d093 100644
> --- a/lib/oesdk/bitbake-test-sdk-image
> +++ b/lib/oesdk/bitbake-test-sdk-image
> @@ -375,12 +375,16 @@ bitbake_sdk_images(){
>          for c in "${bitbake_command_list[@]}"
>          do
>              log $machine_build_log echo "executing bitbake command $c fo=
r machine $m"
> -            MACHINE=3D$m EXTRA_TISDK_FILES=3D"${INSTALLER_EXTRAS_ROOT}/$=
{MACHINE}" TISDK_VERSION=3D"${TISDK_VERSION}" bitbake $c
> +            if [ "${BUILD_LOG_VERBOSE}" =3D "true" ]; then
> +                MACHINE=3D$m EXTRA_TISDK_FILES=3D"${INSTALLER_EXTRAS_ROO=
T}/${MACHINE}" TISDK_VERSION=3D"${TISDK_VERSION}" bitbake $c 2>&1 | eval te=
e -a $machine_build_log
> +            else
> +                MACHINE=3D$m EXTRA_TISDK_FILES=3D"${INSTALLER_EXTRAS_ROO=
T}/${MACHINE}" TISDK_VERSION=3D"${TISDK_VERSION}" bitbake $c
> +            fi
> =20
>              # Check the return status of the build process.  If the buil=
d returned
>              # a non-zero exit value then log the failure and continue (w=
ithout
>              # testing).  A lack of a test file will indicate a test skip
> -            if [ "$?" !=3D "0" ]
> +            if [ "${PIPESTATUS[0]}" !=3D "0" ]
>              then
>                  echo "FAILED" > $LOG_DIR/$m-build-result.txt
>                  build_status=3D"fail"
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

