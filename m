Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 12B6152976
	for <meta-arago@arago-project.org>;
	Sat,  2 Apr 2016 18:49:51 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5000ME3SAQ3B40@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Sat, 02 Apr 2016 13:49:39 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=SnArwN7vLeUm9ogHLxEA:9
Received: by 100.15.86.14 with SMTP id 53d77ce5; Sat, 02 Apr 2016 18:49:38 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E8D53161F59;	Sat,
	2 Apr 2016 14:49:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 02 Apr 2016 14:49:37 -0400
Message-id: <1459622977-387-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] opencl-examples, openmpacc-examples: fix do_unpack() and correct args to getVar()
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
X-List-Received-Date: Sat, 02 Apr 2016 18:49:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb          | 2 +-
 meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
index c067085..981e5ad 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
@@ -45,7 +45,7 @@ python do_unpack_append() {
     os.makedirs(s)
     shutil.copy(os.path.join(git_dir,"Makefile"),s)
     shutil.copy(os.path.join(git_dir,"make.inc"),s)
-    for example in d.getVar("OCL_EXAMPLE_LIST").split():
+    for example in d.getVar("OCL_EXAMPLE_LIST", True).split():
         shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
 }
 
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
index 9c7e85e..703e754 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc-examples_git.bb
@@ -36,7 +36,7 @@ python do_unpack_append() {
     shutil.copy(os.path.join(git_dir,"Makefile"),s)
     shutil.copy(os.path.join(git_dir,"make.inc"),s)
     shutil.copy(os.path.join(git_dir,"ompacc_env.sh"),s)
-    for example in d.getVar("OMPACC_EXAMPLE_LIST").split():
+    for example in d.getVar("OMPACC_EXAMPLE_LIST", True).split():
         shutil.copytree(os.path.join(git_dir,example), os.path.join(s,example))
 }
 
-- 
2.2.0


