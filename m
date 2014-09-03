Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 08B0F52AC9
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 12:42:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83Cg9EK013464
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:09 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83Cg9iC015092
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 07:42:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 07:42:09 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83CfZhn031656;
	Wed, 3 Sep 2014 07:42:08 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Sep 2014 18:11:28 +0530
Message-ID: <1409748091-12617-10-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409748091-12617-1-git-send-email-a0393906@ti.com>
References: <1409748091-12617-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for dora] [PATCH v2 09/12] recipes-connectivity: remove remaining unnecessary exec permissions
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
X-List-Received-Date: Wed, 03 Sep 2014 12:42:11 -0000
Content-Type: text/plain

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Karthik Ramanan <a0393906@ti.com>
---
 .../bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch     | 0
 .../obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch        | 0
 .../wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb               | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
 mode change 100755 => 100644 meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch
 mode change 100755 => 100644 meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb

diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch b/meta-arago-distro/recipes-connectivity/bluez/bluez4/bluez4-fix-synchronization-between-bluetoothd-and-dr.patch
old mode 100755
new mode 100644
diff --git a/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch b/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch
old mode 100755
new mode 100644
diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
old mode 100755
new mode 100644
-- 
2.0.1


