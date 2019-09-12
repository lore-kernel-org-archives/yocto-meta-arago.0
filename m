Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 205B752992
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2216340C0D;
	Thu, 12 Sep 2019 15:38:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rqGJlA1_yejT; Thu, 12 Sep 2019 15:38:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0B46640C07;
	Thu, 12 Sep 2019 15:38:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id ADABE173D67;
	Thu, 12 Sep 2019 11:38:43 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:11 -0400
Message-Id: <1568302717-46518-7-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 06/32] external-*-bfd-version: replace tabs with spaces in python code
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
X-List-Received-Date: Thu, 12 Sep 2019 15:39:57 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc    | 6 +++---
 meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc b/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
index 22f1033..1d8eed1 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
+++ b/meta-arago-extras/recipes-core/meta/external-arm-bfd-version.inc
@@ -1,8 +1,8 @@
 TOOLCHAIN_PATH ??= "${STAGING_BINDIR_TOOLCHAIN}"
 
 def eat_get_bfd_version(d):
-	import subprocess,os,bb
-	if os.path.exists(d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as'):
-		return subprocess.Popen([d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as', '-v', '--version'], stderr=subprocess.STDOUT,stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
+    import subprocess,os,bb
+    if os.path.exists(d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as'):
+        return subprocess.Popen([d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as', '-v', '--version'], stderr=subprocess.STDOUT,stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
 
 EAT_VER_BFD := "${@eat_get_bfd_version(d)}"
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc b/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
index bbc3604..9dc6e37 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-bfd-version.inc
@@ -1,8 +1,8 @@
 TOOLCHAIN_PATH ??= "${STAGING_BINDIR_TOOLCHAIN}"
 
 def elt_get_bfd_version(d):
-	import subprocess,os,bb
-	if os.path.exists(d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as'):
-		return subprocess.Popen([d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as', '-v', '--version'], stderr=subprocess.STDOUT,stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
+    import subprocess,os,bb
+    if os.path.exists(d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as'):
+        return subprocess.Popen([d.getVar('TOOLCHAIN_PATH')+'/bin/'+d.getVar('TARGET_PREFIX')+'as', '-v', '--version'], stderr=subprocess.STDOUT,stdout=subprocess.PIPE).communicate()[0].splitlines()[0].split()[3]
 
 ELT_VER_BFD := "${@elt_get_bfd_version(d)}"
-- 
2.7.4


