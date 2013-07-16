Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id F05B152A07
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 13:01:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6GD1Ca5011211
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 08:01:12 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6GD1CNJ010125
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2013 08:01:12 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 16 Jul 2013 08:01:12 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 3/5] board-port-labs: Pull
	in	updated board-port-labs for SDK 6.0
Thread-Index: AQHOfnIEm/ZGG+iK4UWpLvqvVwuEBJlnTCug
Date: Tue, 16 Jul 2013 13:01:11 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015965776D@DLEE11.ent.ti.com>
References: <1373574210-4398-1-git-send-email-fcooper@ti.com>
	<1373574210-4398-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1373574210-4398-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 3/5] board-port-labs: Pull in	updated board-port-labs for SDK 6.0
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
X-List-Received-Date: Tue, 16 Jul 2013 13:01:13 -0000
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
>Subject: [meta-arago] [master & danny][PATCH 3/5] board-port-labs:
>Pull in updated board-port-labs for SDK 6.0
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../board-port-labs/board-port-labs_git.bb         |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-tisdk/board-port-
>labs/board-port-labs_git.bb b/meta-arago-distro/recipes-
>tisdk/board-port-labs/board-port-labs_git.bb
>index 82a4fd7..b7f7d29 100644
>--- a/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>labs_git.bb
>+++ b/meta-arago-distro/recipes-tisdk/board-port-labs/board-port-
>labs_git.bb
>@@ -11,7 +11,7 @@ inherit allarch
> CREATE_SRCIPK =3D "1"
> SRCIPK_INSTALL_DIR =3D "board-support/board-port-labs"
>
>-PR =3D "r4"
>+PR =3D "r5"
>
> REPOS ?=3D "git://gitorious.org/sitara-board-port/sitara-board-
>port-linux.git \
>           git://gitorious.org/sitara-board-port/sitara-board-
>port-uboot.git \
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

