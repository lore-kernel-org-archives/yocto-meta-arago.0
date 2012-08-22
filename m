Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 75AB8529FF
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 02:13:52 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7M2Dpkl030749
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2012 21:13:51 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7M2DpYY026324
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2012 21:13:51 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Tue, 21 Aug 2012 21:13:51 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago-distro][PATCH] recipes: correct the previous fix
	to properly pass options to the compiler
Thread-Index: AQHNgASgCufQsc3QCkatHqVZyImG6ZdlFvHQ
Date: Wed, 22 Aug 2012 02:13:50 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2A7E5D@DFLE09.ent.ti.com>
References: <1345599275-9169-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1345599275-9169-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [meta-arago-distro][PATCH] recipes: correct the previous fix to properly pass options to the compiler
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
X-List-Received-Date: Wed, 22 Aug 2012 02:13:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch. Apparently the compiler didn't like libatomics re=
ceiving this option.=20
I received the following error
cc1: error: unrecognized command line option '-mimplicit=3Dit=3Dthumb'
Any suggestions on how to properly pass in this variable?


-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Tuesday, August 21, 2012 8:35 PM
To: meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: [meta-arago-distro][PATCH] recipes: correct the previous fix to pr=
operly pass options to the compiler

* Correctly pass the options to the compiler instead of to make.
* For some reason the incorrect approach allowed the software to be compile=
d.
  Errors were being ignored which made it seem like everything was compilin=
g
  successfull until you realized files/libraries were missing.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../pulseaudio/libatomics-ops_1.2.bbappend         |    2 +-
 .../postgresql/postgresql_8.4.7.bbappend           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops=
_1.2.bbappend b/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-=
ops_1.2.bbappend
index 4c60634..57c9972 100644
--- a/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb=
append
+++ b/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb=
append
@@ -1,3 +1,3 @@
 PR_append =3D "-arago0"
=20
-EXTRA_OEMAKE +=3D "-mimplicit-it=3Dthumb"
+EXTRA_OEMAKE +=3D "CFLAGS+=3D'-Wa, -mimplicit-it=3Dthumb'"
diff --git a/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.=
bbappend b/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bb=
append
index 4c60634..57c9972 100644
--- a/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappen=
d
+++ b/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappen=
d
@@ -1,3 +1,3 @@
 PR_append =3D "-arago0"
=20
-EXTRA_OEMAKE +=3D "-mimplicit-it=3Dthumb"
+EXTRA_OEMAKE +=3D "CFLAGS+=3D'-Wa, -mimplicit-it=3Dthumb'"
--=20
1.7.0.4


