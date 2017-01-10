Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 4461452A5F
	for <meta-arago@arago-project.org>;
	Tue, 10 Jan 2017 15:56:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v0AFu7bR011380
	for <meta-arago@arago-project.org>; Tue, 10 Jan 2017 09:56:07 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v0AFu7DS025228
	for <meta-arago@arago-project.org>; Tue, 10 Jan 2017 09:56:07 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 10 Jan 2017 09:56:07 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v0AFu6jQ002337;	Tue, 10 Jan 2017 09:56:07 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Jan 2017 10:55:53 -0500
Message-ID: <1484063753-23523-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: charlsie@ti.com, j-manbeck2@ti.com, dkay@ti.com
Subject: [PATCH v2] tisdk-image: update ECCN in software manifest to replace "5D002 TSU" with "Publicly Available"
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
X-List-Received-Date: Tue, 10 Jan 2017 15:56:08 -0000
Content-Type: text/plain

* The recent regulation changes eliminate the 5D002 with TSU license exception
  designation. Software previously classified as publicly available encryption
  source code (i.e. 5D002 TSU) should be replaced with Publicly Available.

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
v2 changes:
* Use correct spelling of "Publicly" in the commit message

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


