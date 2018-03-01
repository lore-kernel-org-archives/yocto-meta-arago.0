Return-Path: <d-senicic1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 86896529C7
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:18:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21JIM7J022009
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:18:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519931902;
	bh=D0K2yvze8cjcD4JBDQGkEmirByOtiFZom/5MXaPEYo0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=PmgPxKudTMtq8QQONX1RVfzHjAfGCkdG8wbLSaUDQpzH3da+7BmR2s98pSkv7INVA
	BPeHvfNMZ3bA/kzdFnLiKPycqf3zpCLCggJpXSNKcUa0uxhsHD8a+BgGaLop9YW2gD
	ZmrkLEhC0iIkvIqQBhVwBMHvn/LH1DdVbEFjyEfY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JIM4H018250
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:18:22 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:18:22 -0600
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1261.035; Thu, 1 Mar 2018 13:18:22 -0600
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Chengalvala, Vivek"
	<vchengalvala@ti.com>
Thread-Topic: [meta-arago] [PATCH] tiovx-app: Fix memory map for DSP firmware
Thread-Index: AQHTsY76f4XC4mv6LUWoXIQf0yG3uKO7vrfQgABl3oD//5uCgA==
Date: Thu, 1 Mar 2018 19:18:22 +0000
Message-ID: <80c9c481ed834d489d2cb8eb7991fccd@ti.com>
References: <1519924373-4999-1-git-send-email-x0157990@ti.com>
	<20180301185615.GL22424@edge> <6be3d52ef55c43cbbd0070792708d988@ti.com>
	<20180301191445.GO22424@edge>
In-Reply-To: <20180301191445.GO22424@edge>
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
X-List-Received-Date: Thu, 01 Mar 2018 19:18:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

As this is for TIOVX  DSP firmware, I do not think this needs to be upstrea=
med (i.e. just in meta-processor-sdk).
Vivek, you flagged  this - are you ok we stick w/ meta-processor-sdk only (=
patch was sent yesterday)?

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 01, 2018 2:15 PM
To: Senicic, Djordje
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] tiovx-app: Fix memory map for DSP firmwar=
e

Well, have you tried this patch on meta-arago? The path is wrong, there's n=
o tiovx and my question was whether tiovx itself will be upstreamed or not.

--
Denys


On Thu, Mar 01, 2018 at 02:11:54PM -0500, Senicic, Djordje wrote:
>    Earlier I sent one for meta-processor-sdk.
>    This is the same one for meta-arago (I think you asked if we are going=
 to
>    upstream).
>=20
>    -----Original Message-----
>    From: Dmytriyenko, Denys
>    Sent: Thursday, March 01, 2018 1:56 PM
>    To: Senicic, Djordje
>    Cc: meta-arago@arago-project.org; Senicic, Djordje
>    Subject: Re: [meta-arago] [PATCH] tiovx-app: Fix memory map for DSP
>    firmware
>=20
>    Is this for processor-sdk layer?
>=20
>    On Thu, Mar 01, 2018 at 12:12:53PM -0500, Djordje Senicic wrote:
>    > Signed-off-by: Djordje Senicic <x0157990@ti.com>
>    > ---
>    >  recipes-ti/tiovx/tiovx-sys.inc | 2 +-
>    >  1 file changed, 1 insertion(+), 1 deletion(-)
>    >
>    > diff --git a/recipes-ti/tiovx/tiovx-sys.inc
>    > b/recipes-ti/tiovx/tiovx-sys.inc index fc24947..43c4e1d 100644
>    > --- a/recipes-ti/tiovx/tiovx-sys.inc
>    > +++ b/recipes-ti/tiovx/tiovx-sys.inc
>    > @@ -1,5 +1,5 @@
>    >  PV =3D "01.00.00.00"
>    >=20
>    >  BRANCH=3D"master"
>    > -SRCREV =3D "c208217c5c3788c78d10ff0d25e5db9782e00be9"
>    > +SRCREV =3D "375fa639773970e433171686f01f360a9a5b2ad4"
>    >  SRC_URI =3D
>    "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=3Dgit;branch=3D=
${BRANCH}"
>    > --
>    > 1.9.1
>    >
>    > _______________________________________________
>    > meta-arago mailing list
>    > meta-arago@arago-project.org
>    > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

