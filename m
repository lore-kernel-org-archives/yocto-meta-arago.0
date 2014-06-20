Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8A31D529D7
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 19:08:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KJ7xu2029709;
	Fri, 20 Jun 2014 14:07:59 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KJ7xQd015817;
	Fri, 20 Jun 2014 14:07:59 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 14:07:59 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 08/19] icu: remove bbappend and patch to
	disable LDFLAGSICUDT, applied upstream
Thread-Index: AQHPjLEbCy8kUsrGbkeB8j2KpNDMlZt6XH8A
Date: Fri, 20 Jun 2014 19:07:59 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0D91BF@DLEE11.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-9-git-send-email-denis@denix.org>
In-Reply-To: <1403287009-11256-9-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 08/19] icu: remove bbappend and patch to disable LDFLAGSICUDT, applied upstream
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
X-List-Received-Date: Fri, 20 Jun 2014 19:08:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, June 20, 2014 12:57 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 08/19] icu: remove bbappend and patch
>to disable LDFLAGSICUDT, applied upstream
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-support/icu/icu/disable-ldflagsicudt.patch       | 12
>------------
> meta-arago-distro/recipes-support/icu/icu_51.2.bbappend      |  5
>-----
> 2 files changed, 17 deletions(-)
> delete mode 100644 meta-arago-distro/recipes-
>support/icu/icu/disable-ldflagsicudt.patch
> delete mode 100644 meta-arago-distro/recipes-
>support/icu/icu_51.2.bbappend
>
>diff --git a/meta-arago-distro/recipes-support/icu/icu/disable-
>ldflagsicudt.patch b/meta-arago-distro/recipes-
>support/icu/icu/disable-ldflagsicudt.patch
>deleted file mode 100644
>index b26d388..0000000
>--- a/meta-arago-distro/recipes-support/icu/icu/disable-
>ldflagsicudt.patch
>+++ /dev/null
>@@ -1,12 +0,0 @@
>-diff -uNr icu-orig/config/mh-linux icu/config/mh-linux
>---- icu-orig/config/mh-linux	2013-05-23 16:02:40.000000000 -0400
>-+++ icu/config/mh-linux	2013-09-30 00:19:13.772269345 -0400
>-@@ -21,7 +21,7 @@
>- LD_RPATH_PRE =3D -Wl,-rpath,
>-
>- ## These are the library specific LDFLAGS
>--LDFLAGSICUDT=3D-nodefaultlibs -nostdlib
>-+#LDFLAGSICUDT=3D-nodefaultlibs -nostdlib
>-
>- ## Compiler switch to embed a library name
>- # The initial tab in the next line is to prevent icu-config from
>reading it.
>diff --git a/meta-arago-distro/recipes-
>support/icu/icu_51.2.bbappend b/meta-arago-distro/recipes-
>support/icu/icu_51.2.bbappend
>deleted file mode 100644
>index f812148..0000000
>--- a/meta-arago-distro/recipes-support/icu/icu_51.2.bbappend
>+++ /dev/null
>@@ -1,5 +0,0 @@
>-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>-
>-PR_append =3D "-arago0"
>-
>-SRC_URI +=3D "file://disable-ldflagsicudt.patch"
>--
>2.0.0
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

