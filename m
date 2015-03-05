Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 605D65297F
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 17:54:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25HsdoE021187
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 11:54:39 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25Hsc3k012073
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 11:54:38 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 5 Mar 2015 11:54:38 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] arago-prefs: wpa-supplicant
	PREFERRED_PROVIDER to wpa-supplicant-wl18xx for omap-a15 family.
Thread-Index: AQHQV12YWyhz+oMmOkmojuBHAC74+p0Oj0QA//+cYvA=
Date: Thu, 5 Mar 2015 17:54:38 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958141055EF@DFLE09.ent.ti.com>
References: <1425571261-18353-1-git-send-email-j-stiffler@ti.com>
	<20150305174919.GP6052@edge>
In-Reply-To: <20150305174919.GP6052@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago-prefs: wpa-supplicant PREFERRED_PROVIDER to wpa-supplicant-wl18xx for omap-a15 family.
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
X-List-Received-Date: Thu, 05 Mar 2015 17:54:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I noticed this, but I wasn't sure if it would be better to do it this way, =
or specify both PREFERRED_PROVIDER_wpa-supplicant_dra7xx-evm and PREFERRED_=
PROVIDER_wpa-supplicant_am57xx-evm. I attempted to specify PREFERRED_PROVID=
ER_wpa-supplicant_dra7xx, but this was not working.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 05, 2015 12:49 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] arago-prefs: wpa-supplicant PREFERRED_PRO=
VIDER to wpa-supplicant-wl18xx for omap-a15 family.

On Thu, Mar 05, 2015 at 11:01:01AM -0500, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc            |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc=20
> b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index e689f8b..c872d9a 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -119,7 +119,7 @@ PREFERRED_VERSION_m4 =3D "1.4.9"
>  PREFERRED_PROVIDER_wpa-supplicant =3D "wpa-supplicant"
>  PREFERRED_PROVIDER_wpa-supplicant_ti33x =3D "wpa-supplicant-wl18xx"
>  PREFERRED_PROVIDER_wpa-supplicant_ti43x =3D "wpa-supplicant-wl18xx"
> -PREFERRED_PROVIDER_wpa-supplicant_dra7xx-evm =3D "wpa-supplicant-wl18xx"
> +PREFERRED_PROVIDER_wpa-supplicant_omap-a15 =3D "wpa-supplicant-wl18xx"

I'm fine with this. Although, omap-a15 also includes OMAP5 EVM, but it's no=
t enabled in bt-firmware nor connectivity packagegroup, which only enable d=
ra7xx


>  PREFERRED_PROVIDER_gstreamer =3D "${@base_contains('MACHINE_FEATURES', '=
mmip', 'gstreamer-mm-accel', 'gstreamer', d)}"
>  PREFERRED_PROVIDER_gstreamer-dev =3D "${@base_contains('MACHINE_FEATURES=
', 'mmip', 'gstreamer-mm-accel-dev', 'gstreamer-dev', d)}"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

