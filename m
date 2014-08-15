Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 14DE452A1E
	for <meta-arago@arago-project.org>;
	Fri, 15 Aug 2014 12:12:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7FCCPAW026981;
	Fri, 15 Aug 2014 07:12:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7FCCPa3019640;
	Fri, 15 Aug 2014 07:12:25 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 15 Aug 2014 07:12:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] packagegroup-*-matrix-sdk-host: skip
	matrix-browser and refresh-screen for keystone
Thread-Index: AQHPuBJjm2uDLLnq7EWi/SpfTTR61ZvRlC2g
Date: Fri, 15 Aug 2014 12:12:24 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D1D5930@DLEE11.ent.ti.com>
References: <1408056698-4904-1-git-send-email-denis@denix.org>
In-Reply-To: <1408056698-4904-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-*-matrix-sdk-host: skip matrix-browser and refresh-screen for keystone
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
X-List-Received-Date: Fri, 15 Aug 2014 12:12:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ack

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Thursday, August 14, 2014 5:52 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] packagegroup-*-matrix-sdk-host: skip
>matrix-browser and refresh-screen for keystone
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Keystone doesn't use GUI pieces of the Matrix component, so don't
>pull
>sources in to the devkit.
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../packagegroup-arago-tisdk-matrix-sdk-host.bb              | 12
>+++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-matrix-sdk-host.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-matrix-sdk-host.bb
>index fa1036b..67f9eff 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-matrix-sdk-host.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-matrix-sdk-host.bb
>@@ -1,11 +1,17 @@
> DESCRIPTION =3D "Task to install Matrix v2 and associated
>applications sources in the SDK"
> LICENSE =3D "MIT"
>-PR =3D "r2"
>+PR =3D "r3"
>
> inherit packagegroup
>
>-RDEPENDS_${PN} =3D "\
>-    matrix-gui-src \
>+MATRIX_GUI =3D " \
>     matrix-gui-browser-src \
>     refresh-screen-src \
> "
>+
>+MATRIX_GUI_keystone =3D ""
>+
>+RDEPENDS_${PN} =3D "\
>+    matrix-gui-src \
>+    ${MATRIX_GUI} \
>+"
>--
>2.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

