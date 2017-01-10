Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 57D4152A05
	for <meta-arago@arago-project.org>;
	Tue, 10 Jan 2017 15:32:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v0AFWfv8001039
	for <meta-arago@arago-project.org>; Tue, 10 Jan 2017 09:32:41 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v0AFWabP020951
	for <meta-arago@arago-project.org>; Tue, 10 Jan 2017 09:32:36 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Tue, 10 Jan 2017 09:32:36 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Kay, Doug" <dkay@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] tisdk-image: update ECCN in software
	manifest to replace "5D002 TSU" with "Publically Available"
Thread-Index: AQHSasb/mpF0Ueb2NUyb3NgpocVqcKEwvBvQgAEY1kA=
Date: Tue, 10 Jan 2017 15:32:35 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926CBD111@DLEE08.ent.ti.com>
References: <1484000571-26874-1-git-send-email-h-gou@ti.com>
	<1A6FEBBC20441C4FAFB00BAED02AB1AA436B301A@DLEE10.ent.ti.com>
In-Reply-To: <1A6FEBBC20441C4FAFB00BAED02AB1AA436B301A@DLEE10.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "James, Charlsie" <charlsie@ti.com>, "Manbeck, Jack" <j-manbeck2@ti.com>
Subject: Re: [PATCH] tisdk-image: update ECCN in software manifest to replace "5D002 TSU" with "Publically Available"
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
X-List-Received-Date: Tue, 10 Jan 2017 15:32:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

Below is what will show in software manifest with the patch submitted:

Export Information

ECCN for Software included in this release: Publicly Available

ECCN for Technology (e.g., user documentation, specifications) included in =
this release: Publicly Available

Are you suggesting replace both ECCN lines above with a single line of "ECC=
N =3D Publicly Available" as shown below?

Export Information

ECCN =3D Publicly Available

Meanwhile, I will update the commit message to use "Publicly Available" ins=
tead of "Publically Available".

Thanks,
Hongmei

> -----Original Message-----
> From: Kay, Doug
> Sent: Monday, January 09, 2017 5:39 PM
> To: Gou, Hongmei; meta-arago@arago-project.org
> Cc: Chengalvala, Vivek; Manbeck, Jack; James, Charlsie
> Subject: RE: [meta-arago] [PATCH] tisdk-image: update ECCN in software
> manifest to replace "5D002 TSU" with "Publically Available"
>=20
> Hongmei and All,
>=20
> To be consistent with the US Government, let's spell "Publicly Available"=
 the
> way they do.
>=20
> 	ECCN =3D Publicly Available
>=20
> Thanks.
> Doug
>=20
> -----Original Message-----
> From: Gou, Hongmei
> Sent: Monday, January 09, 2017 5:23 PM
> To: meta-arago@arago-project.org
> Cc: Chengalvala, Vivek; Kay, Doug; Manbeck, Jack; James, Charlsie; Gou,
> Hongmei
> Subject: [meta-arago] [PATCH] tisdk-image: update ECCN in software
> manifest to replace "5D002 TSU" with "Publically Available"
>=20
> * The recent regulation changes eliminate the 5D002 with TSU license
> exception
>   designation. Software previously classified as publically available enc=
ryption
>   source code (i.e. 5D002 TSU) should be replaced with Publically Availab=
le.
>=20
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  meta-arago-distro/classes/tisdk-image.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-
> distro/classes/tisdk-image.bbclass
> index 78393ce..94c2718 100644
> --- a/meta-arago-distro/classes/tisdk-image.bbclass
> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> @@ -168,11 +168,11 @@ Your company is responsible for confirming the
> applicable license terms for any
>=20
>  <h2><b>Export Information</b></h2>
>  <p>
> -ECCN for Software included in this release: 5D002 License Exception TSU
> +ECCN for Software included in this release: Publicly Available
>  </p>
>=20
>  <p>
> -ECCN for Technology (e.g., user documentation, specifications) included =
in
> this release: 5D002 License Exception TSU
> +ECCN for Technology (e.g., user documentation, specifications) included =
in
> this release: Publicly Available
>  </p>
>=20
>  <h2><b>Manifest</b></h2>
> --
> 1.9.1


