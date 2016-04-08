Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTPS id 10FCD5296D
	for <meta-arago@arago-project.org>;
	Fri,  8 Apr 2016 17:13:45 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.150])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5B00G4YRUH9L40@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 08 Apr 2016 12:13:30 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=0tGySW8maceftNfHUCUfCA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=uRynIq1UqVoFLtX8Zn0A:9
Received: by 100.15.86.14 with SMTP id 79804627; Fri, 08 Apr 2016 17:13:29 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5633F161F78;	Fri,
	8 Apr 2016 13:13:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 08 Apr 2016 13:13:28 -0400
Message-id: <1460135608-5777-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] linalg-examples: fix do_unpack() and correct args to getVar()
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
X-List-Received-Date: Fri, 08 Apr 2016 17:13:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb b/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
index acafb36..38fcdb7 100644
--- a/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
@@ -31,7 +31,7 @@ python do_unpack_append() {
     shutil.copy(os.path.join(git_dir,"Makefile"),s)
     shutil.copy(os.path.join(git_dir,"make.inc"),s)
     shutil.copy(os.path.join(git_dir,"run_tests_evm.sh"),s)
-    for example in d.getVar("LINALG_EXAMPLE_LIST").split():
+    for example in d.getVar("LINALG_EXAMPLE_LIST", True).split():
         shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
 }
 
-- 
2.2.0


