Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3371352972
	for <meta-arago@arago-project.org>;
	Tue, 15 Apr 2014 15:40:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3FFeQD8025521
	for <meta-arago@arago-project.org>; Tue, 15 Apr 2014 10:40:26 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3FFeQiM032075
	for <meta-arago@arago-project.org>; Tue, 15 Apr 2014 10:40:26 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 15 Apr 2014 10:40:26 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH]
	bitbake-test-sdk-image: use tmp/deploy/images/machine/ structure
Thread-Index: AQHPVcItEZOJJB4jh0qaS5vwtWOVO5sRp58AgAAi2QCAAQwC0A==
Date: Tue, 15 Apr 2014 15:40:24 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6892F8@DFLE08.ent.ti.com>
References: <1397247019-15012-1-git-send-email-denis@denix.org>
	<20140414163618.GD12929@edge>
	<7D46E86EC0A8354091174257B2FED1015CF92E55@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CF92E55@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image: use tmp/deploy/images/machine/ structure
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
X-List-Received-Date: Tue, 15 Apr 2014 15:40:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Monday, April 14, 2014 1:41 PM
> To: Dmytriyenko, Denys; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH] bitbake-test-sdk-i=
mage:
> use tmp/deploy/images/machine/ structure
>=20
> Ack
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> >Sent: Monday, April 14, 2014 11:36 AM
> >To: meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH] bitbake-
> >test-sdk-image: use tmp/deploy/images/machine/ structure
> >
> >Any comments?
> >
> >On Fri, Apr 11, 2014 at 04:10:19PM -0400, Denys Dmytriyenko wrote:
> >> From: Denys Dmytriyenko <denys@ti.com>
> >>
> >> From Dora and up, images are deployed into corresponding machine
> >subdirs.
> >>
> >> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >> ---
> >>  lib/oesdk/bitbake-test-sdk-image |    6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/lib/oesdk/bitbake-test-sdk-image
> >b/lib/oesdk/bitbake-test-sdk-image
> >> index 8df9a5b..cff86e4 100644
> >> --- a/lib/oesdk/bitbake-test-sdk-image
> >> +++ b/lib/oesdk/bitbake-test-sdk-image
> >> @@ -125,6 +125,12 @@ extract_sdk_image() {
> >>          return 1
> >>      fi
> >>
> >> +    # prefer sdk_path/m, if exists - Dora and up
> >> +    if [ -d $sdk_path/$m ]
> >> +    then
> >> +        sdk_path=3D"$sdk_path/$m"
> >> +    fi
> >> +
> >>
> >################################################################
> ##
> >##############
> >>  # SDK_FILTER variable is used to specify the SDK image produced
> >by the build,
> >>  # that includes bootloaders, kernel, rootfs, devkit and host
> >tools.
> >> --
> >> 1.7.9.5
> >>
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

