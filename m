Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 7BFFB52092
	for <meta-arago@arago-project.org>;
	Thu,  8 Nov 2018 14:40:19 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA8Ee9Om078939
	for <meta-arago@arago-project.org>; Thu, 8 Nov 2018 08:40:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1541688009;
	bh=alU6gVkfWU6Tt/PabxNlxrXst20LTZIQsAvTfA7LxTk=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=qGKYIdo/LLl7fInuLKxc+HFxG+/g9fq0rreFaw41w2Xr1IU4uvFbfsRTsikJK9rQ8
	lgd1gcRqoAg+Gx0Y3PAml7QMcFdX36IM9lKkALdUsBOpylrDdHa4z7KkoparU3tRNA
	FCGfOrJfV/GR2mzitwJLTQtCAEe70AXnolZ61d5M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA8Ee92i073316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 8 Nov 2018 08:40:09 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 8 Nov 2018 08:40:09 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1466.003; Thu, 8 Nov 2018 08:40:09 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [PATCH] matrix-gui: sleep 1 second prior
	to weston shutdown
Thread-Index: AQHUdt2Y1j8cGhLtokWifwCOHGHuQ6VF8+oQ
Date: Thu, 8 Nov 2018 14:40:09 +0000
Message-ID: <64d6cb22d8a14a2f97f52d1ff8a2fbaf@ti.com>
References: <1541624710-59127-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1541624710-59127-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [PATCH] matrix-gui: sleep 1 second prior to weston shutdown
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
X-List-Received-Date: Thu, 08 Nov 2018 14:40:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK

Please ignore this one. There is a better solution!

Best regards,

Eric


-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Ruei, Eric
Sent: Wednesday, November 07, 2018 4:05 PM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [PATCH] matrix-gui: sleep 1 second prior t=
o weston shutdown

Update execute_command.sh:
Wait 1 second to make sure the application freeing all SGX
resources prior to weston shutdown


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...e_command-workaround-for-GUI-apps-with-weston.patch | 18 ++++++++++----=
----
 .../recipes-core/matrix/matrix-gui_2.0.bb              |  2 +-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_=
command-workaround-for-GUI-apps-with-weston.patch b/meta-arago-extras/recip=
es-core/matrix/matrix-gui/0001-execute_command-workaround-for-GUI-apps-with=
-weston.patch
index 5a85935..90a604e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command=
-workaround-for-GUI-apps-with-weston.patch
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/0001-execute_command=
-workaround-for-GUI-apps-with-weston.patch
@@ -1,6 +1,6 @@
-From 9647ddc10dc9424b1433db2f8184268523d829da Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Wed, 28 Feb 2018 12:20:32 -0500
+From 156ce8d8d9ee1b614b0079e1e9506af1835bdab7 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Wed, 7 Nov 2018 15:48:47 -0500
 Subject: [PATCH] execute_command: workaround for GUI apps with weston
=20
 * For all GUI apps, shutdown matrix before launching
@@ -8,17 +8,18 @@ Subject: [PATCH] execute_command: workaround for GUI apps=
 with weston
     GUI app may get hidden behind matrix with no way to recover.
 * For MM and 3D and null window apps, shutdown weston before launching
   - These apps use KMS sink or DRM, which collides with weston
-
+  - Wait 1 second to make sure the application freeing all SGX resources
+    prior to weston shutdown
 Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
- execute_command.sh | 39 ++++++++++++++++++++++++++++++++++++++-
+ execute_command.sh | 40 +++++++++++++++++++++++++++++++++++++++-
  generate.php       |  4 ++++
  run_script.php     | 10 +++++++++-
- 3 files changed, 51 insertions(+), 2 deletions(-)
+ 3 files changed, 52 insertions(+), 2 deletions(-)
=20
 diff --git a/execute_command.sh b/execute_command.sh
-index 325dcb9..180e71f 100755
+index 325dcb9..b8bb6da 100755
 --- a/execute_command.sh
 +++ b/execute_command.sh
 @@ -63,7 +63,22 @@ do
@@ -45,7 +46,7 @@ index 325dcb9..180e71f 100755
    then
      touch "lock/"$item
 =20
-@@ -72,10 +87,32 @@ do
+@@ -72,10 +87,33 @@ do
 =20
  done
 =20
@@ -55,6 +56,7 @@ index 325dcb9..180e71f 100755
 +
 +  if [ $category =3D=3D 3d -o $category =3D=3D multimedia -o $category =
=3D=3D touch -o $win_type =3D=3D null ]
 +  then
++    sleep 1
 +    /etc/init.d/weston stop
 +    sleep 1
 +  fi
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta=
-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index d8aa00b..4e335e7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da886c9ef769b2d82=
71115d2502512e5d"
=20
 SECTION =3D "multimedia"
=20
-PR =3D "r35"
+PR =3D "r36"
=20
 INITSCRIPT_NAME =3D "matrix-gui-2.0"
 INITSCRIPT_PARAMS =3D "defaults 97"
--=20
1.9.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

