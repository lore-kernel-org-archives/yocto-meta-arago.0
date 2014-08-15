Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0838252A1E
	for <meta-arago@arago-project.org>;
	Fri, 15 Aug 2014 12:12:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7FCCGxE015201;
	Fri, 15 Aug 2014 07:12:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7FCCG0Q019593;
	Fri, 15 Aug 2014 07:12:16 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Fri, 15 Aug 2014 07:12:15 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] packagegroups*: install omapconf for
	ti33x platforms as well
Thread-Index: AQHPuBR9oKcDvF1EeEuZ7bT7DllgXJvRlBtQ
Date: Fri, 15 Aug 2014 12:12:15 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D1D5903@DLEE11.ent.ti.com>
References: <1408057607-15900-1-git-send-email-denis@denix.org>
	<1408057607-15900-2-git-send-email-denis@denix.org>
In-Reply-To: <1408057607-15900-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] packagegroups*: install omapconf for ti33x platforms as well
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
X-List-Received-Date: Fri, 15 Aug 2014 12:12:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ack


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Thursday, August 14, 2014 6:07 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 2/2] packagegroups*: install omapconf
>for ti33x platforms as well
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-core/packagegroups/packagegroup-arago-test.bb
>| 6 +++++-
> .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>| 6 +++++-
> 2 files changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-test.bb b/meta-arago-
>distro/recipes-core/packagegroups/packagegroup-arago-test.bb
>index fdca3fb..0f3d01e 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-test.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-test.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Extended task to get System Test specific apps"
> LICENSE =3D "MIT"
>-PR =3D "r19"
>+PR =3D "r20"
>
> inherit packagegroup
>
>@@ -31,6 +31,10 @@ ARAGO_TI_TEST =3D "\
>     cpuloadgen \
>     "
>
>+ARAGO_TI_TEST_append_ti33x =3D " \
>+    omapconf \
>+    "
>+
> ARAGO_TI_TEST_append_omap-a15 =3D " \
>     omapconf \
>     ipc-test-fw \
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-addons-sdk-host.bb
>index 1285d68..298ba57 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-addons-sdk-host.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-addons-sdk-host.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to install sources for additional
>utilities/demos for SDKs"
> LICENSE =3D "MIT"
>-PR =3D "r6"
>+PR =3D "r7"
>
> inherit packagegroup
>
>@@ -21,6 +21,10 @@ UTILS_append_omap-a15 =3D " \
>     omapconf-src \
> "
>
>+UTILS_append_ti33x =3D " \
>+    omapconf-src \
>+"
>+
> RDEPENDS_${PN} =3D "\
>     ${UTILS} \
> "
>--
>2.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

