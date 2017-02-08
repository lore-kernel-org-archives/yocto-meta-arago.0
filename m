Return-Path: <poojaprajod@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id A094552A71
	for <meta-arago@arago-project.org>;
	Wed,  8 Feb 2017 07:21:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v187LdrI004925
	for <meta-arago@arago-project.org>; Wed, 8 Feb 2017 01:21:39 -0600
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v187LcBU005333
	for <meta-arago@arago-project.org>; Wed, 8 Feb 2017 01:21:38 -0600
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v187LZFZ032279
	for <meta-arago@arago-project.org>; Wed, 8 Feb 2017 12:51:36 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0294.000; Wed, 8 Feb 2017 12:51:35 +0530
From: "Prajod, Pooja" <poojaprajod@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago krogoth] gstreamer: Update gst-bad
	recipe
Thread-Index: AQHSgSypbbZMx7CoOUqItjCn27bkpKFdc08AgAFBP4A=
Date: Wed, 8 Feb 2017 07:21:35 +0000
Message-ID: <6878EA727B2FBD4093953DF6369C4A0F81333A12@DBDE04.ent.ti.com>
References: <1486463187-89615-1-git-send-email-a0132412@ti.com>
	<20170207173802.GQ25590@edge>
In-Reply-To: <20170207173802.GQ25590@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.171.115]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago krogoth] gstreamer: Update gst-bad recipe
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
X-List-Received-Date: Wed, 08 Feb 2017 07:21:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the fast response. This patch is already picked up by gst 1.8 pa=
tches that I sent. So this is applicable only for krogoth, gst 1.6

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, February 07, 2017 11:08 PM
To: Prajod, Pooja
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [meta-arago krogoth] gstreamer: Update gst-bad re=
cipe

Thanks. Is it also needed for morty and gst 1.8.3?

On Tue, Feb 07, 2017 at 03:56:27PM +0530, Pooja Prajod wrote:
> Updated gst-bad recipe to pick
> * gstwaylandsink: Fix same process looping issue
>=20
> Signed-off-by: Pooja Prajod <a0132412@ti.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bbappend                 | =
4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-=
plugins-bad_1.6.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-bad_1.6.3.bbappend
> index 7ceb1b3..b5ccebf 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad_1.6.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins=
-bad_1.6.3.bbappend
> @@ -37,7 +37,7 @@ SRC_URI =3D "git://git.ti.com/glsdk/gstreamer1-0-plugin=
s-bad.git;protocol=3Dgit;bran
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -SRCREV_omap-a15 =3D "07050013051af00828be115eb7bce0fc08abb79f"
> +SRCREV_omap-a15 =3D "eb41f1c8fde05f87587c83d157835e3b2d19a298"
>  SRCREV =3D "d0160ca810be30bf2b2e7681f5047933402efb52"
> =20
> -PR =3D "r24"
> +PR =3D "r25"
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

