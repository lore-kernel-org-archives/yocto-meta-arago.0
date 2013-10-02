Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 605495296F
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 12:55:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92CtauP001484;
	Wed, 2 Oct 2013 07:55:36 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92CtaZE015575;
	Wed, 2 Oct 2013 07:55:36 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 07:55:36 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 04/13] icu: disable LDFLAGSICUDT that
	prevents loading libicudata.so
Thread-Index: AQHOvnWBLYGOAgv7d0qZuJIwfKO1V5nhYGlQ
Date: Wed, 2 Oct 2013 12:55:35 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A520@DLEE11.ent.ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-5-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-5-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 02 Oct 2013 12:55:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 01, 2013 2:11 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 04/13] icu: disable LDFLAGSICUDT that
>prevents loading libicudata.so
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>It seems there is a problem loading libicudata.so library (on
>ARM?) when it's
>built with default -nodefaultlibs and -nostdlib LDFLAGS, disable
>them.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-support/icu/icu-51.2/disable-ldflagsicudt.patch  | 12
>++++++++++++
> meta-arago-distro/recipes-support/icu/icu_51.2.bb            |  3
>++-
> 2 files changed, 14 insertions(+), 1 deletion(-)
> create mode 100644 meta-arago-distro/recipes-support/icu/icu-
>51.2/disable-ldflagsicudt.patch
>
>diff --git a/meta-arago-distro/recipes-support/icu/icu-
>51.2/disable-ldflagsicudt.patch b/meta-arago-distro/recipes-
>support/icu/icu-51.2/disable-ldflagsicudt.patch
>new file mode 100644
>index 0000000..b26d388
>--- /dev/null
>+++ b/meta-arago-distro/recipes-support/icu/icu-51.2/disable-
>ldflagsicudt.patch
>@@ -0,0 +1,12 @@
>+diff -uNr icu-orig/config/mh-linux icu/config/mh-linux
>+--- icu-orig/config/mh-linux	2013-05-23 16:02:40.000000000 -0400
>++++ icu/config/mh-linux	2013-09-30 00:19:13.772269345 -0400
>+@@ -21,7 +21,7 @@
>+ LD_RPATH_PRE =3D -Wl,-rpath,
>+
>+ ## These are the library specific LDFLAGS
>+-LDFLAGSICUDT=3D-nodefaultlibs -nostdlib
>++#LDFLAGSICUDT=3D-nodefaultlibs -nostdlib
>+
>+ ## Compiler switch to embed a library name
>+ # The initial tab in the next line is to prevent icu-config from
>reading it.
>diff --git a/meta-arago-distro/recipes-support/icu/icu_51.2.bb
>b/meta-arago-distro/recipes-support/icu/icu_51.2.bb
>index 1278d22..9a6fd70 100644
>--- a/meta-arago-distro/recipes-support/icu/icu_51.2.bb
>+++ b/meta-arago-distro/recipes-support/icu/icu_51.2.bb
>@@ -2,11 +2,12 @@ require icu.inc
>
> LIC_FILES_CHKSUM =3D
>"file://../license.html;md5=3D443a74288a72fad9069a74e7637192c1"
>
>-PR =3D "r0"
>+PR =3D "r1"
>
> BASE_SRC_URI =3D "http://download.icu-
>project.org/files/icu4c/${PV}/icu4c-51_2-src.tgz"
> SRC_URI =3D "${BASE_SRC_URI} \
>            file://icu-pkgdata-large-cmd.patch \
>+           file://disable-ldflagsicudt.patch \
>           "
>
> SRC_URI[md5sum] =3D "072e501b87065f3a0ca888f1b5165709"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

