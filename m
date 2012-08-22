Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B938552A75
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2012 18:06:44 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7MI6hC1023814
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 13:06:43 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7MI6h3I019476
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2012 13:06:43 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 22 Aug 2012 13:06:43 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago][PATCH] psplash: Update to latest version of
	psplash. Tweak LIC_FILES_CHKSUM variable
Thread-Index: AQHNeZGesn2jBXU1kk6hl1577QvxOJdmLm0Q
Date: Wed, 22 Aug 2012 18:06:43 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2A8788@DFLE09.ent.ti.com>
References: <1344889987-31288-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1344889987-31288-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] psplash: Update to latest version of psplash. Tweak LIC_FILES_CHKSUM variable
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
X-List-Received-Date: Wed, 22 Aug 2012 18:06:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore this patch. A new patch will be sent out that addresses the concern =
of patch [meta-arago] [PATCH] meta-arago-upstream: Create new upstream laye=
r

-----Original Message-----
From: Cooper Jr., Franklin=20
Sent: Monday, August 13, 2012 3:33 PM
To: meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: [meta-arago][PATCH] psplash: Update to latest version of psplash. =
Tweak LIC_FILES_CHKSUM variable

* Add the change to the variable LIC_FILES_CHKSUM to insure that only
  the lines that contains license information are used for the checksum
* Update to the latest version of psplash.
* The above changes are already found in the psplash recipe located in oe-c=
ore
  master

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/psplash/psplash_git.bbappend      |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-upstream/recipes-core/psplash/psplash_git.bb=
append

diff --git a/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend =
b/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend
new file mode 100644
index 0000000..0ddbd6a
--- /dev/null
+++ b/meta-arago-upstream/recipes-core/psplash/psplash_git.bbappend
@@ -0,0 +1,4 @@
+LIC_FILES_CHKSUM =3D "file://psplash.h;beginline=3D1;endline=3D16;md5=3D84=
0fb2356b10a85bed78dd09dc7745c6"
+
+SRCREV =3D "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
+PRINC :=3D "${@int(PRINC) + 1}"
--=20
1.7.0.4


