Return-Path: <denys@ti.com>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 4C2845208C
	for <meta-arago@arago-project.org>;
	Wed, 15 Jun 2016 03:47:00 +0000 (UTC)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O8S006WVNTX1T10@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 14 Jun 2016 22:46:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=jastHRNINfc70n5Oe5oA:9
Received: by 100.15.86.14 with SMTP id 5f6afe3f; Wed, 15 Jun 2016 03:46:46 GMT
Received: from aragorn.denix.denix (aragorn [192.168.0.3])
	by gandalf.denix.org (Postfix) with ESMTP id 65CCB162048;	Tue,
	14 Jun 2016 23:46:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 15 Jun 2016 03:51:00 -0400
Message-id: <1465977060-3376-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.8.0
In-reply-to: <1465977060-3376-1-git-send-email-denys@ti.com>
References: <1465977060-3376-1-git-send-email-denys@ti.com>
Subject: [PATCH 4/4] meta-toolchain-arago: do devkit fixups first in postprocess list
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
X-List-Received-Date: Wed, 15 Jun 2016 03:47:00 -0000

Otherwise devkit packaging happens before fixups are done.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 749085b..014bc76 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -64,7 +64,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
 
-SDK_POSTPROCESS_COMMAND += "arago_sdk_fixup; "
+SDK_POSTPROCESS_COMMAND_prepend = "arago_sdk_fixup; "
 
 arago_sdk_fixup () {
 	# Remove broken .la files
-- 
1.7.9.5


