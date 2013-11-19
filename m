Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EFBEA52A76
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 20:19:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJKJSHA031748
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:19:28 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJKJS6D028519
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:19:28 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 19 Nov 2013 14:19:28 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 7/7] packagegroup-arago-tisdk-matrix: Add
	additional example application for AM43x
Thread-Index: AQHO5VFc+QnZEJLQSUex/2NDcsbtIZos/lbw
Date: Tue, 19 Nov 2013 20:19:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159839E33@DLEE11.ent.ti.com>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
	<1384887728-8628-7-git-send-email-fcooper@ti.com>
In-Reply-To: <1384887728-8628-7-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] packagegroup-arago-tisdk-matrix: Add	additional example application for AM43x
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
X-List-Received-Date: Tue, 19 Nov 2013 20:19:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, November 19, 2013 1:02 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 7/7] packagegroup-arago-tisdk-matrix:
>Add additional example application for AM43x
>
>* Add additional example applications for AM43x.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../packagegroup-arago-tisdk-matrix.bb             |    8
>+++++++-
> 1 files changed, 7 insertions(+), 1 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-
>arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
>matrix.bb
>index 95054b2..c3143d3 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-matrix.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-matrix.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to include Matrix v2"
> LICENSE =3D "MIT"
>-PR =3D "r22"
>+PR =3D "r23"
>
> inherit packagegroup
>
>@@ -72,10 +72,16 @@ MATRIX_APPS_append_ti33x =3D "        \
> #    matrix-gui-wifi-direct-demo
>
> MATRIX_APPS_append_ti43x =3D "        \
>+
>${@base_contains('MACHINE_FEATURES','sgx','${MATRIX_SGX_DEMOS}',''
>,d)} \
>+                                    \
>     matrix-multimedia-demo-aac      \
>     matrix-multimedia-demo-h264dec  \
>     matrix-multimedia-demo-mpeg4aacdec \
>     matrix-multimedia-demo-mpeg4dec \
>+                                    \
>+    matrix-gui-generic-pm           \
>+    matrix-gui-pm-demos-suspend     \
>+    matrix-gui-clocks               \
> "
>
> MATRIX_APPS_append_omap-a15 =3D "     \
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

