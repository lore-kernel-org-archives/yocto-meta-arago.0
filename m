Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 79C33529A1
	for <meta-arago@arago-project.org>;
	Mon, 27 Aug 2012 14:53:28 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7RErO7E031504
	for <meta-arago@arago-project.org>; Mon, 27 Aug 2012 09:53:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7RErOi4026678
	for <meta-arago@arago-project.org>; Mon, 27 Aug 2012 09:53:24 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 27 Aug 2012 09:53:24 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago-distro][PATCH] task-arago-base-tisdk: Change the
	psplash recipe used and add LICENSE information
Thread-Index: AQHNfJUY0gFNtk6I+U+jqrBg1/BUo5dtzhGA
Date: Mon, 27 Aug 2012 14:53:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2A9E98@DFLE09.ent.ti.com>
References: <1345221422-17662-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1345221422-17662-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [meta-arago-distro][PATCH] task-arago-base-tisdk: Change the psplash recipe used and add LICENSE information
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
X-List-Received-Date: Mon, 27 Aug 2012 14:53:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Friday, August 17, 2012 11:37 AM
To: meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: [meta-arago-distro][PATCH] task-arago-base-tisdk: Change the pspla=
sh recipe used and add LICENSE information

* As of now we are no longer using psplash-ti. Will be using the base pspla=
sh
  recipe with overrides from within this layer.
* Task was missing LICENSE information. Copied the LICENSE information that=
 was
  used in other tasks in this layer.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-base-tisdk.bb    |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-base-tisdk.bb =
b/meta-arago-distro/recipes-core/tasks/task-arago-base-tisdk.bb
index ce16835..c884352 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-base-tisdk.bb
@@ -1,6 +1,7 @@
 DESCRIPTION =3D "Additional packages beyond console packages shared by TI =
SDKs"
 LICENSE =3D "MIT"
-PR =3D "r8"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+PR =3D "r9"
=20
 inherit task
=20
@@ -19,7 +20,7 @@ RDEPENDS_${PN} =3D "\
     libpcre \
     iptables \
     iperf \
-    psplash-ti \
+    psplash \
     u-boot \
     arago-gpl-notice \
     nfs-utils-client \
--=20
1.7.7


