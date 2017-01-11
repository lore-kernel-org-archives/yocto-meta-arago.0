Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id DC86B52A79
	for <meta-arago@arago-project.org>;
	Wed, 11 Jan 2017 20:33:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v0BKX8hR012774
	for <meta-arago@arago-project.org>; Wed, 11 Jan 2017 14:33:08 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v0BKX2ZJ010128
	for <meta-arago@arago-project.org>; Wed, 11 Jan 2017 14:33:02 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Wed, 11 Jan 2017 14:33:02 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] tisdk-image: update ECCN in software
	manifest to replace "5D002 TSU" with "Publicly Available"
Thread-Index: AQHSa1oOhoBOCI44p02dDsKKdHJLHKEzvQhQ
Date: Wed, 11 Jan 2017 20:33:01 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926CBDCEA@DLEE08.ent.ti.com>
References: <1484063753-23523-1-git-send-email-h-gou@ti.com>
In-Reply-To: <1484063753-23523-1-git-send-email-h-gou@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "James, Charlsie" <charlsie@ti.com>, "Manbeck, Jack" <j-manbeck2@ti.com>,
	"Kay, Doug" <dkay@ti.com>
Subject: Re: [PATCH v2] tisdk-image: update ECCN in software manifest to replace "5D002 TSU" with "Publicly Available"
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
X-List-Received-Date: Wed, 11 Jan 2017 20:33:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping

> -----Original Message-----
> From: Gou, Hongmei
> Sent: Tuesday, January 10, 2017 10:56 AM
> To: meta-arago@arago-project.org
> Cc: Chengalvala, Vivek; Kay, Doug; Manbeck, Jack; James, Charlsie; Gou,
> Hongmei
> Subject: [meta-arago] [PATCH v2] tisdk-image: update ECCN in software
> manifest to replace "5D002 TSU" with "Publicly Available"
>=20
> * The recent regulation changes eliminate the 5D002 with TSU license
> exception
>   designation. Software previously classified as publicly available encry=
ption
>   source code (i.e. 5D002 TSU) should be replaced with Publicly Available=
.
>=20
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
> v2 changes:
> * Use correct spelling of "Publicly" in the commit message
>=20
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


