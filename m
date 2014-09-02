Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C2A5F52ACB
	for <meta-arago@arago-project.org>;
	Tue,  2 Sep 2014 10:55:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s82AtLpU009467
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AtLOG032171
	for <meta-arago@arago-project.org>; Tue, 2 Sep 2014 05:55:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 05:55:20 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s82AsrZL026077;
	Tue, 2 Sep 2014 05:55:19 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Sep 2014 16:24:40 +0530
Message-ID: <1409655283-4899-10-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1409655283-4899-1-git-send-email-a0393906@ti.com>
References: <1409655283-4899-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [PATCH 09/12] recipes-connectivity: remove remaining unnecessary exec permissions
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
X-List-Received-Date: Tue, 02 Sep 2014 10:55:22 -0000
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


