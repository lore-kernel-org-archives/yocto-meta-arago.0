Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6CA21529AF
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:06:04 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K262RR010330
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:06:03 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K261ja023019
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:36:01 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:36:01 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epR026167;
	Wed, 20 Mar 2013 07:36:00 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:35 -0500
Message-ID: <1363745138-10288-14-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 14/17] ti-wifi-utils: Pull back in old r5.00.18 recipe.
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
X-List-Received-Date: Wed, 20 Mar 2013 02:06:04 -0000
Content-Type: text/plain

* Current am180x-evm ships with a PG 2 wilink 6 module that isn't supported in
  newer wilink 6 releases.
* A newer PG 3 wilink 6 module is available for am180x-evm but needs to be
  purchased separately..
* Bring old r5.00.18 ti-wifi-utils recipe with updated recipe name
  to add support for am180x-evm default wilink 6 module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils_r5.00.18.bb        |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.00.18.bb

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.00.18.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.00.18.bb
new file mode 100644
index 0000000..cdb1e91
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_r5.00.18.bb
@@ -0,0 +1,8 @@
+require ti-wifi-utils.inc
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
+
+PR_append ="a+gitr${SRCPV}"
+
+SRCREV = "ol_R5.00.18"
\ No newline at end of file
-- 
1.7.0.4


