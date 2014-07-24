Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1AB0552A2F
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 16:51:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OGplva030787;
	Thu, 24 Jul 2014 11:51:47 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OGplWP030614;
	Thu, 24 Jul 2014 11:51:47 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 24 Jul 2014 11:51:47 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH]
	arago-core-tisdk-2014.08.00: use the right opentest CLI
Thread-Index: AQHPp1hH3kJGRtArS0iLZbT6mbmuCJuvuyaA//+1PLA=
Date: Thu, 24 Jul 2014 16:51:46 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6E9A37@DFLE08.ent.ti.com>
References: <1406217554-27757-1-git-send-email-denis@denix.org>
	<CFF6A9D0.4B17%chase.maupin@ti.com>
In-Reply-To: <CFF6A9D0.4B17%chase.maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [tisdk-build-scripts][PATCH] arago-core-tisdk-2014.08.00: use the right opentest CLI
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
X-List-Received-Date: Thu, 24 Jul 2014 16:51:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Thursday, July 24, 2014 12:19 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH] arago-core-tisdk-
> 2014.08.00: use the right opentest CLI
>=20
> ACK.  This would also explain why I see the error when moving client/*
> because the old version didn=B9t have it.
>=20
> On 7/24/14, 11:59 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >TMC IP has changed and the old CLI uses the wrong one now.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > configs/coresdk/arago-core-tisdk-2014.08.00.txt | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> >b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> >index 000f903..3b00504 100644
> >--- a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> >+++ b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
> >@@ -164,7 +164,7 @@ TEST_LOCAL_IFACE=3D""
> >
> > # This variable contains the tarball name for the opentest CLI which
> >is  # required to do target side testing.
> >-OPENTEST_CLI=3D"$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
> >+OPENTEST_CLI=3D"$SCRIPTS_ROOT/linux-devtest.tgz"
> >
> > # This variable specifies the IP address of the TEE to be used with
> >OpenTest  # Defaults to 128.247.105.11 if not set
> >--
> >2.0.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

