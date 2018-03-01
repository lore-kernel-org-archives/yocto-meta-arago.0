Return-Path: <d-senicic1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 83CB0529C7
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:12:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21JBs8t025421
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:11:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519931514;
	bh=pegx3tkWsWNoQ7yFu5OVPHWJCUCnfy7spna+Dq8/10E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=uls9gjw0amTLf3X25Wvkdvtcg0GznU8mSycOpfeCQKIFsiMbj9h4XvTvsyswUhQni
	jx4oWfyHzhnKVJNARbs7aI92tyDda9bI1McFRVDRlmeYMPhm45UVh41srXarUergVF
	7UdGC1rf0kO1chfC/hBUfxURnwldfUI6uSx4/9zc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JBs3P017338
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:11:54 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:11:54 -0600
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1261.035; Thu, 1 Mar 2018 13:11:54 -0600
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] tiovx-app: Fix memory map for DSP firmware
Thread-Index: AQHTsY76f4XC4mv6LUWoXIQf0yG3uKO7vrfQ
Date: Thu, 1 Mar 2018 19:11:54 +0000
Message-ID: <6be3d52ef55c43cbbd0070792708d988@ti.com>
References: <1519924373-4999-1-git-send-email-x0157990@ti.com>
	<20180301185615.GL22424@edge>
In-Reply-To: <20180301185615.GL22424@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.102.235]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tiovx-app: Fix memory map for DSP firmware
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
X-List-Received-Date: Thu, 01 Mar 2018 19:12:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Earlier I sent one for meta-processor-sdk.
This is the same one for meta-arago (I think you asked if we are going to u=
pstream).

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 01, 2018 1:56 PM
To: Senicic, Djordje
Cc: meta-arago@arago-project.org; Senicic, Djordje
Subject: Re: [meta-arago] [PATCH] tiovx-app: Fix memory map for DSP firmwar=
e

Is this for processor-sdk layer?


On Thu, Mar 01, 2018 at 12:12:53PM -0500, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  recipes-ti/tiovx/tiovx-sys.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-ti/tiovx/tiovx-sys.inc=20
> b/recipes-ti/tiovx/tiovx-sys.inc index fc24947..43c4e1d 100644
> --- a/recipes-ti/tiovx/tiovx-sys.inc
> +++ b/recipes-ti/tiovx/tiovx-sys.inc
> @@ -1,5 +1,5 @@
>  PV =3D "01.00.00.00"
> =20
>  BRANCH=3D"master"
> -SRCREV =3D "c208217c5c3788c78d10ff0d25e5db9782e00be9"
> +SRCREV =3D "375fa639773970e433171686f01f360a9a5b2ad4"
>  SRC_URI =3D "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=3Dgit=
;branch=3D${BRANCH}"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

