Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id D2CEE52092
	for <meta-arago@arago-project.org>;
	Thu,  8 Nov 2018 14:39:20 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA8EdAoh091219
	for <meta-arago@arago-project.org>; Thu, 8 Nov 2018 08:39:10 -0600
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA8EdAhF005762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 8 Nov 2018 08:39:10 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 8 Nov 2018 08:39:10 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1466.003; Thu, 8 Nov 2018 08:39:10 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] matrix-gui:
	sleep 1 second prior to weston shutdown
Thread-Index: AQHUdu3qa44fBZhagUKN1l8Lzs3YTKVF83iA
Date: Thu, 8 Nov 2018 14:39:10 +0000
Message-ID: <f8d89e6c76bf49a2aff5f90350c59654@ti.com>
References: <1541631711-4024-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1541631711-4024-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] matrix-gui: sleep 1 second prior to weston shutdown
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
X-List-Received-Date: Thu, 08 Nov 2018 14:39:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK

Please ignore this one! I got a better solution.

Eric


-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Ruei, Eric
Sent: Wednesday, November 07, 2018 6:02 PM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [meta-processor-sdk][PATCH] matrix-gui: sl=
eep 1 second prior to weston shutdown

 Update execute_command.sh:
 Wait 1 second to make sure the application freeing all SGX
 resources prior to weston shutdown

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...e_command-workaround-for-GUI-apps-with-weston.patch | 18 +++++++++++---=
----
 recipes-core/matrix/matrix-gui_2.0.bbappend            |  2 +-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/recipes-core/matrix/matrix-gui/0001-execute_command-workaround=
-for-GUI-apps-with-weston.patch b/recipes-core/matrix/matrix-gui/0001-execu=
te_command-workaround-for-GUI-apps-with-weston.patch
index f5399a0..2ddfed2 100644
--- a/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GU=
I-apps-with-weston.patch
+++ b/recipes-core/matrix/matrix-gui/0001-execute_command-workaround-for-GU=
I-apps-with-weston.patch
@@ -1,6 +1,6 @@
-From 5104914897db7ebad07d5c82302ad176bd84f4fe Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Mon, 16 Jul 2018 15:52:45 -0400
+From c8f2849adf7e02aa55ee70103c188b9dbf9b6f80 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Wed, 7 Nov 2018 14:55:35 -0500
 Subject: [PATCH] execute_command: workaround for GUI apps with weston
=20
 * For all GUI apps, shutdown matrix before launching
@@ -8,18 +8,20 @@ Subject: [PATCH] execute_command: workaround for GUI apps=
 with weston
     GUI app may get hidden behind matrix with no way to recover.
 * For MM and 3D and null window apps, shutdown weston before launching
   - These apps use KMS sink or DRM, which collides with weston
+  - Wait 1 second to make sure the application freeing all SGX resources
+    prior to weston shutdown
 * For qwindow window apps, use qwindow-compositor instead of weston
=20
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
- execute_command.sh | 51 +++++++++++++++++++++++++++++++++++++++++++++++++=
+-
+ execute_command.sh | 53 +++++++++++++++++++++++++++++++++++++++++++++++++=
+++-
  generate.php       |  4 ++++
  run_script.php     | 10 +++++++++-
- 3 files changed, 63 insertions(+), 2 deletions(-)
+ 3 files changed, 65 insertions(+), 2 deletions(-)
=20
 diff --git a/execute_command.sh b/execute_command.sh
-index 325dcb9..9769f4f 100755
+index 325dcb9..ffc347d 100755
 --- a/execute_command.sh
 +++ b/execute_command.sh
 @@ -63,7 +63,22 @@ do
@@ -46,7 +48,7 @@ index 325dcb9..9769f4f 100755
    then
      touch "lock/"$item
 =20
-@@ -72,10 +87,44 @@ do
+@@ -72,10 +87,46 @@ do
 =20
  done
 =20
@@ -56,10 +58,12 @@ index 325dcb9..9769f4f 100755
 +
 +  if [ $category =3D=3D 3d -o $category =3D=3D multimedia -o $category =
=3D=3D touch -o $win_type =3D=3D null ]
 +  then
++    sleep 1
 +    /etc/init.d/weston stop
 +    sleep 1
 +  elif [ $win_type =3D=3D qwindow ]
 +  then
++    sleep 1
 +    /etc/init.d/weston stop
 +    sleep 1
 +    /etc/init.d/qwindow start
diff --git a/recipes-core/matrix/matrix-gui_2.0.bbappend b/recipes-core/mat=
rix/matrix-gui_2.0.bbappend
index 8626d1f..112a4a6 100644
--- a/recipes-core/matrix/matrix-gui_2.0.bbappend
+++ b/recipes-core/matrix/matrix-gui_2.0.bbappend
@@ -1,4 +1,4 @@
-PR_append =3D ".tisdk0"
+PR_append =3D ".tisdk1"
=20
 FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
=20
--=20
1.9.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

