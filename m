Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 64EF652099
	for <meta-arago@arago-project.org>;
	Tue, 20 Jan 2015 03:43:51 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0K3hnsF024292
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 21:43:50 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0K3hksR001984
	for <meta-arago@arago-project.org>; Tue, 20 Jan 2015 09:13:48 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0174.001; Tue, 20 Jan 2015 09:13:46 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [for daisy] packagegroup-arago-test: Deprecate
	bltsville test
Thread-Index: AQHQM5VDqVs5rs7/40izvOTCi/U0D5zHvw+AgACfvuA=
Date: Tue, 20 Jan 2015 03:43:45 +0000
Message-ID: <24B88602B5904F49971CAF899152529B34B99189@DBDE04.ent.ti.com>
References: <1421636929-10691-1-git-send-email-a0393906@ti.com>
	<20150119233949.GN16771@edge>
In-Reply-To: <20150119233949.GN16771@edge>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [for daisy] packagegroup-arago-test: Deprecate bltsville test
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
X-List-Received-Date: Tue, 20 Jan 2015 03:43:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

We are going to bring in a different version of the driver for the GC320 an=
d the related test suite.
Didn't want to be very verbose about this as the alignment for the new driv=
er is still in the works.

Note that the current GC320 driver and the test suite is not supported any =
longer.
Infact the 3.14 kernel does not even have the GC320 driver so this test sui=
te is not needed.

Let me know if you want some additional details to be captured in the patch=
.

Regards
Karthik

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, January 20, 2015 5:10 AM
To: R, Karthik
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [for daisy] packagegroup-arago-test: Deprecate bl=
tsville test

Any particular reason you want to mention in the description?


On Mon, Jan 19, 2015 at 08:38:48AM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-test.bb       |    1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-ara=
go-test.bb
> index 6af1321..67f51e4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tes=
t.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tes=
t.bb
> @@ -40,7 +40,6 @@ ARAGO_TI_TEST_append_omap-a15 =3D " \
>      omapconf \
>      ipc-test-fw \
>      ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} =
\
> -    bvtest \
>      "
> =20
>  ARAGO_TI_TEST_append_dra7xx =3D " \
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

