Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BA58152A7A
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2012 15:51:20 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7DFpJJX020126
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 10:51:20 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7DFpJ8e023868
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 10:51:19 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 13 Aug 2012 10:51:19 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-argo][PATCH] am-sysinfo: Remove oprofile-example
Thread-Index: AQHNeWsUxjB6S5bnYUSeO7XYdJGOUJdX49gA
Date: Mon, 13 Aug 2012 15:51:19 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C29D32D@DFLE09.ent.ti.com>
References: <1344873428-7710-1-git-send-email-fcooper@ti.com>
	<1344873428-7710-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1344873428-7710-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [meta-argo][PATCH] am-sysinfo: Remove oprofile-example
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
X-List-Received-Date: Mon, 13 Aug 2012 15:51:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch. Updated patch has been sent.

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Monday, August 13, 2012 10:57 AM
To: meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: [meta-argo][PATCH] am-sysinfo: Remove oprofile-example

* The application oprofile-example has been removed from within am-sysinfo

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/am-sysinfo/am-sysinfo_svn.bb      |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb b/=
meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
index 40daafa..78d8a97 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_svn.bb
@@ -7,9 +7,9 @@ SECTION =3D "system"
=20
 PACKAGE_STRIP =3D "no"
=20
-SRCREV =3D "16"
+SRCREV =3D "17"
 PV =3D "1.0"
-PR =3D "r3+svnr${SRCPV}"
+PR =3D "r4+svnr${SRCPV}"
=20
 SRC_URI =3D "svn://gforge.ti.com/svn/am_sysinfo/;module=3Dtrunk;protocol=
=3Dhttps;user=3Danonymous;pswd=3D''"
=20
@@ -17,13 +17,9 @@ S =3D "${WORKDIR}/trunk"
=20
 do_compile() {
 	${CC} ${CFLAGS} ${LDFLAGS} -o mem_util/mem_util mem_util/mem_util.c
-	${CC} ${CFLAGS} ${LDFLAGS} -o oprofile_example/Debug/signal_parent oprofi=
le_example/signal_parent.c
-	${CC} ${CFLAGS} -DUSE_SIGNALS ${LDFLAGS} -o oprofile_example/Debug1/signa=
l_parent.opt oprofile_example/signal_parent.c
 }
=20
 do_install() {
 	install -d ${D}/${bindir}
 	install -m 0755 ${S}/mem_util/mem_util ${D}/${bindir}
-	install -m 0755 ${S}/oprofile_example/Debug/signal_parent ${D}/${bindir}
-	install -m 0755 ${S}/oprofile_example/Debug1/signal_parent.opt ${D}/${bin=
dir}
 }
--=20
1.7.0.4


