Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D615C52A48
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 12:31:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OCVt1D009898;
	Thu, 24 Apr 2014 07:31:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OCVsdZ011021;
	Thu, 24 Apr 2014 07:31:55 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 07:31:54 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/8] arago.conf: minor cleanup, version bump
Thread-Index: AQHPX1/GDXe1WIzXakiRPfwr+f0UT5sgs4EA
Date: Thu, 24 Apr 2014 12:31:54 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFB1E8D@DLEE11.ent.ti.com>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
In-Reply-To: <1398304280-15426-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] arago.conf: minor cleanup, version bump
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
X-List-Received-Date: Thu, 24 Apr 2014 12:31:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, April 23, 2014 8:51 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/8] arago.conf: minor cleanup,
>version bump
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/conf/distro/arago.conf | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-
>arago-distro/conf/distro/arago.conf
>index cc3cedf..1c8c572 100644
>--- a/meta-arago-distro/conf/distro/arago.conf
>+++ b/meta-arago-distro/conf/distro/arago.conf
>@@ -1,6 +1,6 @@
> # Name and version of the distribution
> DISTRO_NAME =3D "Arago"
>-DISTRO_VERSION =3D "2014.03"
>+DISTRO_VERSION =3D "2014.05"
>
> # SDK paths and names
> SDK_NAME_PREFIX =3D "arago"
>@@ -10,8 +10,8 @@ SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_VERSION}"
> SDKPATH_REAL =3D "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
> SDKPATH =3D "${@"/tmp/"+"x"*96+"/"+"y"*96}"
>
>-# Mask some broken recipes
>-BBMASK =3D "meta-ti/recipes-misc|meta-linaro/recipes-lamp|meta-
>oe/recipes-extended/lighttpd|meta-linaro/recipes-core/netbase"
>+# Mask any broken recipes (currently none)
>+#BBMASK =3D ""
>
> # Bump the connection timeout to 5 minutes to overcome slow proxy
>servers
> FETCHCMD_wget =3D "/usr/bin/env wget -t 2 -T 300 -nv --passive-ftp
>--no-check-certificate"
>--
>1.9.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

