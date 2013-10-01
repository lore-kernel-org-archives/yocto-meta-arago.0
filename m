Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CF17B52099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:13:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DDsvl025047;
	Tue, 1 Oct 2013 08:13:54 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DDrRg020844;
	Tue, 1 Oct 2013 08:13:53 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 08:13:53 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 04/13] icu: disable LDFLAGSICUDT that
	prevents loading libicudata.so
Thread-Index: AQHOvnWBeQxxFgBiuUCeYRknKZITQZnf0zvt
Date: Tue, 1 Oct 2013 13:13:52 +0000
Message-ID: <CE6783B7-0F69-4E25-B658-1B7EA86255AC@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>,
	<1380611472-23600-5-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-5-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 04/13] icu: disable LDFLAGSICUDT that prevents loading libicudata.so
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
X-List-Received-Date: Tue, 01 Oct 2013 13:13:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack

> On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> It seems there is a problem loading libicudata.so library (on ARM?) when =
it's
> built with default -nodefaultlibs and -nostdlib LDFLAGS, disable them.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> .../recipes-support/icu/icu-51.2/disable-ldflagsicudt.patch  | 12 +++++++=
+++++
> meta-arago-distro/recipes-support/icu/icu_51.2.bb            |  3 ++-
> 2 files changed, 14 insertions(+), 1 deletion(-)
> create mode 100644 meta-arago-distro/recipes-support/icu/icu-51.2/disable=
-ldflagsicudt.patch
>=20
> diff --git a/meta-arago-distro/recipes-support/icu/icu-51.2/disable-ldfla=
gsicudt.patch b/meta-arago-distro/recipes-support/icu/icu-51.2/disable-ldfl=
agsicudt.patch
> new file mode 100644
> index 0000000..b26d388
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/icu/icu-51.2/disable-ldflagsicudt=
.patch
> @@ -0,0 +1,12 @@
> +diff -uNr icu-orig/config/mh-linux icu/config/mh-linux
> +--- icu-orig/config/mh-linux    2013-05-23 16:02:40.000000000 -0400
> ++++ icu/config/mh-linux    2013-09-30 00:19:13.772269345 -0400
> +@@ -21,7 +21,7 @@
> + LD_RPATH_PRE =3D -Wl,-rpath,
> +=20
> + ## These are the library specific LDFLAGS
> +-LDFLAGSICUDT=3D-nodefaultlibs -nostdlib
> ++#LDFLAGSICUDT=3D-nodefaultlibs -nostdlib
> +=20
> + ## Compiler switch to embed a library name
> + # The initial tab in the next line is to prevent icu-config from readin=
g it.
> diff --git a/meta-arago-distro/recipes-support/icu/icu_51.2.bb b/meta-ara=
go-distro/recipes-support/icu/icu_51.2.bb
> index 1278d22..9a6fd70 100644
> --- a/meta-arago-distro/recipes-support/icu/icu_51.2.bb
> +++ b/meta-arago-distro/recipes-support/icu/icu_51.2.bb
> @@ -2,11 +2,12 @@ require icu.inc
>=20
> LIC_FILES_CHKSUM =3D "file://../license.html;md5=3D443a74288a72fad9069a74=
e7637192c1"
>=20
> -PR =3D "r0"
> +PR =3D "r1"
>=20
> BASE_SRC_URI =3D "http://download.icu-project.org/files/icu4c/${PV}/icu4c=
-51_2-src.tgz"
> SRC_URI =3D "${BASE_SRC_URI} \
>            file://icu-pkgdata-large-cmd.patch \
> +           file://disable-ldflagsicudt.patch \
>           "
>=20
> SRC_URI[md5sum] =3D "072e501b87065f3a0ca888f1b5165709"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

