Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A53DB52995
	for <meta-arago@arago-project.org>;
	Mon,  8 Sep 2014 21:37:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s88LbO6T015643;
	Mon, 8 Sep 2014 16:37:24 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s88LbOjP025525;
	Mon, 8 Sep 2014 16:37:24 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Mon, 8 Sep 2014 16:37:24 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 2/2] test-files:
	disable Qt4 specific test cases, may add Qt5 in the future
Thread-Index: AQHPy54Q/xy6HbDlh0OBNZG836QbuJv3viaQ
Date: Mon, 8 Sep 2014 21:37:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C72C4CA@DFLE08.ent.ti.com>
References: <1410205737-7590-1-git-send-email-denis@denix.org>
	<1410205737-7590-2-git-send-email-denis@denix.org>
In-Reply-To: <1410205737-7590-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [tisdk-build-scripts][PATCH 2/2] test-files: disable Qt4 specific test cases, may add Qt5 in the future
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
X-List-Received-Date: Mon, 08 Sep 2014 21:37:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

Although I don't think these test make much sense. Maybe we should just use=
 a simple boot "testplan" and don't even worry about these scripts unless w=
e plan on doing a bit more testing.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, September 08, 2014 2:49 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [tisdk-build-scripts][PATCH 2/2] test-files: disabl=
e Qt4
> specific test cases, may add Qt5 in the future
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  test-scripts/test-files/mandatory-oesdk-armv7a.txt | 2 +-
>  test-scripts/test-files/mandatory-oesdk.txt        | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/test-scripts/test-files/mandatory-oesdk-armv7a.txt b/test-
> scripts/test-files/mandatory-oesdk-armv7a.txt
> index 4931d1f..51832d3 100644
> --- a/test-scripts/test-files/mandatory-oesdk-armv7a.txt
> +++ b/test-scripts/test-files/mandatory-oesdk-armv7a.txt
> @@ -1 +1 @@
> -check_app.sh -a
> /usr/bin/qtopia/examples/animation/moveblocks/moveblocks -x
> +#check_app.sh -a
> +/usr/bin/qtopia/examples/animation/moveblocks/moveblocks -x
> diff --git a/test-scripts/test-files/mandatory-oesdk.txt b/test-scripts/t=
est-
> files/mandatory-oesdk.txt
> index 91aece1..ac85a72 100644
> --- a/test-scripts/test-files/mandatory-oesdk.txt
> +++ b/test-scripts/test-files/mandatory-oesdk.txt
> @@ -1,7 +1,7 @@
>  check_app.sh -a runDhrystone
>  check_app.sh -a runLinpack
>  check_app.sh -a runWhetstone
> -check_app.sh -a /usr/bin/qtopia/examples/widgets/calculator/calculator -=
x
> -check_app.sh -a /usr/bin/qtopia/demos/deform/deform -x -check_app.sh -
> a /usr/bin/qtopia/examples/animation/animatedtiles/animatedtiles -x -
> check_app.sh -a
> /usr/bin/qtopia/examples/graphicsview/elasticnodes/elasticnodes -x
> +#check_app.sh -a /usr/bin/qtopia/examples/widgets/calculator/calculator
> +-x #check_app.sh -a /usr/bin/qtopia/demos/deform/deform -x
> +#check_app.sh -a
> +/usr/bin/qtopia/examples/animation/animatedtiles/animatedtiles -x
> +#check_app.sh -a
> +/usr/bin/qtopia/examples/graphicsview/elasticnodes/elasticnodes -x
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

