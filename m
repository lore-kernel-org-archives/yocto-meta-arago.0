Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2FC1B52A07
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 13:00:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6GD06pr015720
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 08:00:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6GD04EW006973
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 08:00:06 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 16 Jul 2013 08:00:01 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Tue, 16 Jul 2013 08:00:01 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 2/5] matrix-gui-apps-git:
	Update crypto .desktop to correct description page path
Thread-Index: AQHOfnIDgYwjNTvyrki26ZINn3oimplnS9ig
Date: Tue, 16 Jul 2013 13:00:00 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159657722@DLEE11.ent.ti.com>
References: <1373574210-4398-1-git-send-email-fcooper@ti.com>
	<1373574210-4398-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1373574210-4398-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 2/5] matrix-gui-apps-git:	Update crypto .desktop to correct description page path
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
X-List-Received-Date: Tue, 16 Jul 2013 13:00:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, July 11, 2013 3:23 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [master & danny][PATCH 2/5] matrix-gui-apps-
>git: Update crypto .desktop to correct description page path
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>apps-git.inc
>index a6004c8..8e8d6e8 100644
>--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
>git.inc
>+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-
>git.inc
>@@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D
>"LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9"
> LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
>
> SRC_URI =3D "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-
>apps.git;protocol=3Dgit;branch=3D${BRANCH}"
>-SRCREV =3D "c3ffe73dbbc911742ef87217a060cac1d119c531"
>+SRCREV =3D "51fcfea807159c36298c886ed95e48dd12e491a3"
> BRANCH =3D "master"
>-INC_PR =3D "r14"
>+INC_PR =3D "r15"
>
> # Pull in the base package for installing matrix applications
> require matrix-gui-apps.inc
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

