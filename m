Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 41A1C529C6
	for <meta-arago@arago-project.org>;
	Fri,  9 Dec 2016 17:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3268A209D7;
	Fri,  9 Dec 2016 17:11:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uzGfjq8bHTBJ; Fri,  9 Dec 2016 17:11:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 186CF207AF;
	Fri,  9 Dec 2016 17:11:55 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 48C301621C7;
	Fri,  9 Dec 2016 12:11:54 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  9 Dec 2016 12:11:53 -0500
Message-Id: <1481303513-23799-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 3/3] optee-test: use own git repo
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
X-List-Received-Date: Fri, 09 Dec 2016 17:11:56 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend

diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
new file mode 100644
index 0000000..15f6d7e
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -0,0 +1,6 @@
+PR_append = ".arago0"
+
+SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
+
+BRANCH = "ti_optee_test"
+SRCREV = "6203b8769beff4eccf7104a6474991114691bf90"
-- 
2.7.4


