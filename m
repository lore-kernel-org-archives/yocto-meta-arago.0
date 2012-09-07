Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 03457529B9
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 18:52:56 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q87Iqt3G008387;
	Fri, 7 Sep 2012 13:52:56 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q87Iqt2O013884;
	Fri, 7 Sep 2012 13:52:55 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 7 Sep 2012 13:52:55 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH 2/2] pinmux-utility:
	Add	temporary license file
Thread-Index: AQHNjSnkzNhlbvk2bk6WgG+HON/gW5d/OaNA
Date: Fri, 7 Sep 2012 18:52:55 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B7D50@DFLE09.ent.ti.com>
References: <1347040028-10047-1-git-send-email-fcooper27jr@gmail.com>
	<1347040028-10047-2-git-send-email-fcooper27jr@gmail.com>
In-Reply-To: <1347040028-10047-2-git-send-email-fcooper27jr@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: Re: [meta-arago-distro][PATCH 2/2] pinmux-utility: Add	temporary license file
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
X-List-Received-Date: Fri, 07 Sep 2012 18:52:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch. A version 2 of this patch will be submitted soon.

-----Original Message-----
From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]=20
Sent: Friday, September 07, 2012 12:47 PM
To: meta-arago@arago-project.org
Cc: Franklin S. Cooper Jr
Subject: [meta-arago] [meta-arago-distro][PATCH 2/2] pinmux-utility: Add te=
mporary license file

* Add temporary license file to the pinmux-utility. This file was
  grabbed from the license agreement screen when installing the non
  am18x version of the pinmux utility. A proper license file needs to
  be added to the zip file that is apart of the offical pinmux utility
  release.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../pinmux-utility/pinmux-utility_2.3.1.0.bb       |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_=
2.3.1.0.bb b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_=
2.3.1.0.bb
index 624ffae..fadbdc6 100644
--- a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0=
.bb
+++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.
+++ 1.0.bb
@@ -1,6 +1,6 @@
 require pinmux-utility.inc
=20
-PR_append =3D "-arago0"
+PR_append =3D "-arago1"
=20
 SRC_URI =3D "https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxU=
tility_v2_03_01_00.zip;name=3Dbase"
=20
@@ -22,3 +22,8 @@ do_install_omapl138() {
=20
 SRC_URI[omapl138.md5sum] =3D "5a4eb834bde44c662aaf669882adbfe6"
 SRC_URI[omapl138.sha256sum] =3D "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcd=
c0bd18c34cd0221d9d450d0"
+
+# Temporarily add LICENSE file here since zip files don't contain any=20
+license information. This file was grabbed # from the License Agreement sc=
reen when installing the non am18x version of the pinmux utility.
+SRC_URI +=3D "file://LICENSE"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7f400ac8ac09799ccf153aab40deff9=
4"
--
1.7.0.4



