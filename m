Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 4C77C52094
	for <meta-arago@arago-project.org>;
	Mon,  9 Jan 2017 22:23:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v09MNQNO021942
	for <meta-arago@arago-project.org>; Mon, 9 Jan 2017 16:23:26 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v09MNQVl004362
	for <meta-arago@arago-project.org>; Mon, 9 Jan 2017 16:23:26 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 9 Jan 2017 16:23:25 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v09MNPXd014923;	Mon, 9 Jan 2017 16:23:25 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Jan 2017 17:22:51 -0500
Message-ID: <1484000571-26874-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: charlsie@ti.com, j-manbeck2@ti.com, dkay@ti.com
Subject: [PATCH] tisdk-image: update ECCN in software manifest to replace "5D002 TSU" with "Publically Available"
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
X-List-Received-Date: Mon, 09 Jan 2017 22:23:33 -0000
Content-Type: text/plain

* The recent regulation changes eliminate the 5D002 with TSU license exception
  designation. Software previously classified as publically available encryption
  source code (i.e. 5D002 TSU) should be replaced with Publically Available.

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 78393ce..94c2718 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -168,11 +168,11 @@ Your company is responsible for confirming the applicable license terms for any
 
 <h2><b>Export Information</b></h2>
 <p>
-ECCN for Software included in this release: 5D002 License Exception TSU
+ECCN for Software included in this release: Publicly Available
 </p>
 
 <p>
-ECCN for Technology (e.g., user documentation, specifications) included in this release: 5D002 License Exception TSU
+ECCN for Technology (e.g., user documentation, specifications) included in this release: Publicly Available
 </p>
 
 <h2><b>Manifest</b></h2>
-- 
1.9.1


