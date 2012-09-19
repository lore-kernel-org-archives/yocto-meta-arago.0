Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 98CF1529A1
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2012 05:23:20 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8J5NJ5D012286;
	Wed, 19 Sep 2012 00:23:19 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8J5NJZR010077;
	Wed, 19 Sep 2012 00:23:19 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 19 Sep 2012 00:23:19 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago-distro][PATCH v3] task-arago-tisdk-addons: Port
	task-arago-tisdk-addons-sdk-host from arago
Thread-Index: AQHNliZFVrbhDOSkDkSw8oYbPL19/5eRIE0A
Date: Wed, 19 Sep 2012 05:23:18 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2D815B@DFLE09.ent.ti.com>
References: <1348033279-2846-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1348033279-2846-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [meta-arago-distro][PATCH v3] task-arago-tisdk-addons: Port task-arago-tisdk-addons-sdk-host from arago
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
X-List-Received-Date: Wed, 19 Sep 2012 05:23:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Finally I sent the patch for this recipe correctly....=20

I am using the format task-arago-tisdk-xxxx and task-arago-tisdk-xxxx-sdk-x=
xx for all my tasks. I was originally going to leave out the tisdk part but=
 Chase felt it was better to leave it in. Once this patch is commited and I=
 know that everyone is ok with this new naming convention I will go ahead a=
nd slowly submit the rest of my task related patches.

-----Original Message-----
From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]=20
Sent: Wednesday, September 19, 2012 12:41 AM
To: meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: [meta-arago-distro][PATCH v3] task-arago-tisdk-addons: Port task-a=
rago-tisdk-addons-sdk-host from arago

From: Franklin S Cooper Jr <fcooper@ti.com>

* This is a initial port of task-arago-tisdk-addons-sdk-host from arago to
  meta-arago. In arago, this task was originally called
  task-arago-toolchain-tisdk-addons-host.
* Remove references to Matrix applications since the new Matrix task should
  handle Matrix related applications
* Add additional recipes to this task.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 3 addresses the following issues:
 Using new naming convention.
 Update commit message to reflect naming convention changes.

 .../tasks/task-arago-tisdk-addons-sdk-host.bb      |   21 ++++++++++++++++=
++++
 .../recipes-core/tasks/task-arago-tisdk-addons.bb  |   19 +++++++++++-----=
-
 2 files changed, 33 insertions(+), 7 deletions(-)  create mode 100644 meta=
-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-sdk-host.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-s=
dk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-s=
dk-host.bb
new file mode 100644
index 0000000..3856197
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons-sdk-h
+++ ost.bb
@@ -0,0 +1,21 @@
+DESCRIPTION =3D "Task to install sources for additional utilities/demos fo=
r SDKs"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+PR =3D "r0"
+
+inherit task
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+UTILS =3D " \
+    am-sysinfo-src \
+    arm-benchmarks-src \
+"
+
+# Add pru and profibus sources for omapl138 devices=20
+UTILS_append_am180x-evm =3D " \
+    ti-pru-sw-examples-src \
+"
+
+RDEPENDS_${PN} =3D "\
+    ${UTILS} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.b=
b b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
index 789700d..d8eec2b 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-addons.bb
@@ -1,22 +1,27 @@
 DESCRIPTION =3D "Task to install additional utilities/demos for SDKs"
-PR =3D "r0"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+PR =3D "r1"
=20
 inherit task
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 UTILS =3D " \
-    matrix-gui-settings-demos \
-    matrix-gui-armbenchmarks-demos \
+    am-sysinfo \
+    dt \
     task-arago-test \
     gdbserver \
-    matrix-gui-oprofile-demos \
-    "
+    oprofile \
+    nbench-byte \
+    trace-cmd \
+    arm-benchmarks \
+    dropbear \
+    openssh-sftp-server \
+"
=20
 # Add PRU examples for am180x-evm devices -# UTILS_append_am180x-evm =3D "=
 ti-pru-sw-examples"
+UTILS_append_am180x-evm =3D " ti-pru-sw-examples"
=20
 RDEPENDS_${PN} =3D "\
     ${UTILS} \
-    "
+"
--
1.7.0.4


