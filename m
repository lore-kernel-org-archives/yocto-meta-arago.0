Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5C28952994
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 16:19:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OGJG3a017000;
	Thu, 24 Jul 2014 11:19:16 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OGJGBo005628;
	Thu, 24 Jul 2014 11:19:16 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Thu, 24 Jul 2014 11:19:16 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH]
	arago-core-tisdk-2014.08.00: use the right opentest CLI
Thread-Index: AQHPp1hHDbCNa5JWpkGZxua5A+cWUpuveBcA
Date: Thu, 24 Jul 2014 16:19:15 +0000
Message-ID: <CFF6A9D0.4B17%chase.maupin@ti.com>
References: <1406217554-27757-1-git-send-email-denis@denix.org>
In-Reply-To: <1406217554-27757-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.1.140326
x-originating-ip: [157.170.170.90]
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
X-List-Received-Date: Thu, 24 Jul 2014 16:19:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <389101ACD5781441AD534574DAD4E988@owa.mail.ti.com>
Content-Transfer-Encoding: quoted-printable

ACK.  This would also explain why I see the error when moving client/*
because the old version didn=B9t have it.

On 7/24/14, 11:59 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:

>From: Denys Dmytriyenko <denys@ti.com>
>
>TMC IP has changed and the old CLI uses the wrong one now.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> configs/coresdk/arago-core-tisdk-2014.08.00.txt | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
>b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
>index 000f903..3b00504 100644
>--- a/configs/coresdk/arago-core-tisdk-2014.08.00.txt
>+++ b/configs/coresdk/arago-core-tisdk-2014.08.00.txt
>@@ -164,7 +164,7 @@ TEST_LOCAL_IFACE=3D""
>=20
> # This variable contains the tarball name for the opentest CLI which is
> # required to do target side testing.
>-OPENTEST_CLI=3D"$SCRIPTS_ROOT/opentest_cli_0.7.tar.gz"
>+OPENTEST_CLI=3D"$SCRIPTS_ROOT/linux-devtest.tgz"
>=20
> # This variable specifies the IP address of the TEE to be used with
>OpenTest
> # Defaults to 128.247.105.11 if not set
>--=20
>2.0.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


