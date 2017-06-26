Return-Path: <sam.nelson@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 4FC5152961
	for <meta-arago@arago-project.org>;
	Mon, 26 Jun 2017 17:43:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5QHhK4Z010898
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 12:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498499000;
	bh=nE+vZTXoBeprJYjvoWSLobMrMSk20Se76n/fjICbB90=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f9RBc+OMt6iuM9PrA1ogiy/TqONuUygBARJcsy0mRRg3yCUoYvVZHJo7idwYclDc8
	GtYqLb2uOrs+6HiF/t/hDBxaG5vTyqwfsdyLJXdbIEMk8CQsK691Hmn0T7hOaNc6cR
	e4juXTjsgCtJD08z77BG4pyMxNbtEmMKmG92azVg=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5QHhKtK009995
	for <meta-arago@arago-project.org>; Mon, 26 Jun 2017 12:43:20 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 26 Jun 2017 12:43:19 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5QHhIYF027938;	Mon, 26 Jun 2017 12:43:19 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 26 Jun 2017 13:43:17 -0400
Message-ID: <1498498997-30316-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1498498997-30316-1-git-send-email-sam.nelson@ti.com>
References: <1498498997-30316-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v3 2/2] arago-tisdk-addons: Add big-data-ipc-demo for host linux
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
X-List-Received-Date: Mon, 26 Jun 2017 17:43:20 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index c623b37..360890b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r60"
+PR = "r61"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -119,7 +119,10 @@ EXTRA_PACKAGES_omapl138 = " \
 
 EXTRA_PACKAGES_append_ti33x = " voxelsdk"
 EXTRA_PACKAGES_append_ti43x = " voxelsdk"
-EXTRA_PACKAGES_append_omap-a15 = " voxelsdk"
+EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
+                                   big-data-ipc-demo-linux \
+                                   big-data-ipc-demo-linux-firmware \
+"
 
 EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
-- 
1.9.1


