Return-Path: <vchengalvala@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 8F964529C7
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 22:00:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21M036n030102
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 16:00:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519941603;
	bh=TIVV443xlfXPqOM8RaRzzymF4rj4cmNJBoBTYvEE2hk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=txzXMSF8LwfNlqOjcnItqd/PQO9d8u4gdo6gn+0a1TiAQJRbXS9ftMCFwfxPRlZY+
	yOfx5FFoU1S5kwOeeYI8nDaMM54AGML6109HViclTTAcaINqwGdPoqUI2BsJLq1N9l
	M7xEJajZIh+/dtUwIAGe7sj5LteahFlKeObN/kZQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21M01ae004686
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 16:00:03 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 16:00:01 -0600
Received: from DLEE112.ent.ti.com ([fe80::65b1:e788:3000:d26d]) by
	DLEE112.ent.ti.com ([fe80::65b1:e788:3000:d26d%17]) with mapi id
	15.01.1261.035; Thu, 1 Mar 2018 16:00:01 -0600
From: "Chengalvala, Vivek" <vchengalvala@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] tiovx-app: Fix memory map for DSP firmware
Thread-Index: AQHTsY76f4XC4mv6LUWoXIQf0yG3uKO7vrfQgABl3oD//5uCgIAALXhA
Date: Thu, 1 Mar 2018 21:59:36 +0000
Deferred-Delivery: Thu, 1 Mar 2018 21:59:00 +0000
Message-ID: <67958d66ec734e39a72230a55db89090@ti.com>
References: <1519924373-4999-1-git-send-email-x0157990@ti.com>
	<20180301185615.GL22424@edge> <6be3d52ef55c43cbbd0070792708d988@ti.com>
	<20180301191445.GO22424@edge> <80c9c481ed834d489d2cb8eb7991fccd@ti.com>
In-Reply-To: <80c9c481ed834d489d2cb8eb7991fccd@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.101.140]
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
X-List-Received-Date: Thu, 01 Mar 2018 22:00:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure. We can stick with meta-processor-sdk for now and plan to upstream com=
plete tiovx to meta-arago.


-----Original Message-----
From: Senicic, Djordje=20
Sent: Thursday, March 1, 2018 2:18 PM
To: Dmytriyenko, Denys; Chengalvala, Vivek
Cc: meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH] tiovx-app: Fix memory map for DSP firmwar=
e

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

