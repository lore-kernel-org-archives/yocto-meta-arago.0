Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5EA1F52A35
	for <meta-arago@arago-project.org>;
	Mon, 18 Sep 2017 21:15:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8ILFkf8004875
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505769346;
	bh=/ejJRpz0lVQoZ6d0zmPW2JlTy7PVYOx7z15gwjfg6jk=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=uFy1UbbYrkOQpfgFaYHdsxSPKPkfK2HeVap6lQWh8LRIDe+sD/9HfQktygbQvEHrm
	bbBVu9ZCI0q9w8yJ5yWmSVTVJbJoCxTLVvRfPvbj9eoFf0b7oXtKcxlpwb5vJKddQw
	5RoqaaJv4ryj7gPmiGUnfpW+zxb7k4C6frnY5lXE=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8ILFkOs005664
	for <meta-arago@arago-project.org>; Mon, 18 Sep 2017 16:15:46 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 16:15:45 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH]
	posix-smp-demo: Update to new version 01.00.01.07
Thread-Index: AQHTML8bb9eojuMT9U6Nxi1CMZj1rqK7JQpw
Date: Mon, 18 Sep 2017 21:15:45 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95825454165@DFLE09.ent.ti.com>
References: <1505767537-63341-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1505767537-63341-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] posix-smp-demo: Update to new version 01.00.01.07
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
X-List-Received-Date: Mon, 18 Sep 2017 21:15:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pushed. Thank you.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Monday, September 18, 2017 4:46 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] posix-smp-
> demo: Update to new version 01.00.01.07
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> ---
> Also sent to meta-arago
> Needed also in meta-processor-sdk for upcoming release
> ---
> ---
>  recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 recipes-apps/posix-smp-demo/posix-smp-
> demo_git.bbappend
>=20
> diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
> b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
> new file mode 100644
> index 0000000..30a77ab
> --- /dev/null
> +++ b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
> @@ -0,0 +1,6 @@
> +PR_append =3D ".tisdk0"
> +
> +# Below commit ID corresponds to "DEV.POSIX-SMP.01.00.01.07"
> +POSIX_SMP_SRCREV =3D "2614d4cbe9d83c8345e051c7f3767f86226398ea"
> +
> +PV =3D "01.00.01.07"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

