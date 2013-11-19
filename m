Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 417F152A76
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 20:15:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJKFLad006504
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:15:21 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJKFKOp020735
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:15:21 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 19 Nov 2013 14:15:21 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/7]
	packagegroup-arago-tisdk-amsdk-sdk-host:	Remove board port git
	repositories
Thread-Index: AQHO5VFVvKpAFfPIz0+w8+DXS3K88pos/WNQ
Date: Tue, 19 Nov 2013 20:15:20 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159839CEC@DLEE11.ent.ti.com>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1384887728-8628-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] packagegroup-arago-tisdk-amsdk-sdk-host:	Remove board port git repositories
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
X-List-Received-Date: Tue, 19 Nov 2013 20:15:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sad but

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, November 19, 2013 1:02 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 1/7] packagegroup-arago-tisdk-amsdk-
>sdk-host: Remove board port git repositories
>
>* Unfortunately, the board port repositories are very difficult to
>update by our
>  SDK's code freeze date.
>* Therefore, we will be removing the board port repositories from
>being bundled
>  within the SDK.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    4 +---
> 1 files changed, 1 insertions(+), 3 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-amsdk-sdk-host.bb
>index 4654a96..89da2ff 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-amsdk-sdk-host.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-amsdk-sdk-host.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to install additional scripts and
>applications into the SDK"
> LICENSE =3D "MIT"
>-PR =3D "r15"
>+PR =3D "r16"
>
> inherit packagegroup
>
>@@ -26,8 +26,6 @@ RDEPENDS_${PN} =3D "\
>     ${TOOLS} \
>     ti-tisdk-setup \
>     ${EXTRA_FILES} \
>-    board-port-labs-u-boot-src \
>-    board-port-labs-linux-src \
>     oe-layersetup-src \
>     ti-tisdk-makefile \
>     ${U-BOOT_SRC} \
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

