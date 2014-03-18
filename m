Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 73ED852A61
	for <meta-arago@arago-project.org>;
	Tue, 18 Mar 2014 14:20:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2IEKT76011166;
	Tue, 18 Mar 2014 09:20:29 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IEKSb6030442;
	Tue, 18 Mar 2014 09:20:29 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 18 Mar 2014 09:20:29 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 5/5]
	arago-core-tisdk-dylan-puget: update to use new CLI
Thread-Index: AQHPNzl72VKES90Ad0msB767J7UNhprm+vpA
Date: Tue, 18 Mar 2014 14:20:28 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C66853C@DFLE08.ent.ti.com>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<1393889779-3995-6-git-send-email-denis@denix.org>
In-Reply-To: <1393889779-3995-6-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [tisdk-build-scripts][PATCH 5/5] arago-core-tisdk-dylan-puget: update to use new CLI
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
X-List-Received-Date: Tue, 18 Mar 2014 14:20:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, March 03, 2014 5:36 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [tisdk-build-scripts][PATCH 5/5] arago-core-tisdk-d=
ylan-
> puget: update to use new CLI
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  configs/arago-core-tisdk-dylan-puget.txt |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/configs/arago-core-tisdk-dylan-puget.txt b/configs/arago-cor=
e-tisdk-
> dylan-puget.txt
> index f4ccb26..e24ab70 100644
> --- a/configs/arago-core-tisdk-dylan-puget.txt
> +++ b/configs/arago-core-tisdk-dylan-puget.txt
> @@ -164,11 +164,11 @@ TEST_LOCAL_IFACE=3D"eth1"
>=20
>  # This variable contains the tarball name for the opentest CLI which is =
 #
> required to do target side testing.
> -OPENTEST_CLI=3D"$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
> +OPENTEST_CLI=3D"$SCRIPTS_ROOT/linux-devtest.tgz"
[Franklin] Would it make sense to make this update to all the different con=
figs?
>=20
>  # This variable specifies the IP address of the TEE to be used with Open=
Test  #
> Defaults to 128.247.105.11 if not set -OPENTEST_TEE_IP=3D"10.218.102.142"
> +OPENTEST_TEE_IP=3D"none"
>=20
>  # This variable specifies the hardware capabilities to be used with Open=
Test
> # Capabilities are separated by underscores, some excamples are here:
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

