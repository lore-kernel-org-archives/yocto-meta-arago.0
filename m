Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id EE63E52A2C
	for <meta-arago@arago-project.org>;
	Wed, 22 Apr 2020 18:28:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03MIPvtR043072
	for <meta-arago@arago-project.org>; Wed, 22 Apr 2020 13:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587579957;
	bh=6x4gRkvwcizgUH4nGpeIWckELlsygKXWHiV79LioQ7g=;
	h=From:To:CC:Subject:Date;
	b=EqTWOXwIr/IaUqxRyi3h58kg0P6K2dZ8Lo+epkAs8jUxjaADBn9K94GiHBEUqqDkP
	1v3RjstfFfc0GiXSHUBR4samnIqrz5Jq3a/nklFqDdAh7jQXBZ4SNEH9D7VJOC6McF
	B9MToQb0o6cMmbpML+eS8KUz3Q7zcQ8SesJxtyKU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03MIPvCx073042
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 22 Apr 2020 13:25:57 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 22 Apr 2020 13:25:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 22 Apr 2020 13:25:57 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03MIPu8k126247;
	Wed, 22 Apr 2020 13:25:57 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Apr 2020 14:25:54 -0400
Message-ID: <1587579954-32688-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH] open62541: prevent installation of git directories
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
X-List-Received-Date: Wed, 22 Apr 2020 18:28:17 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...CMakeLists-do-not-install-git-directories.patch | 27 ++++++++++++++++++++++
 .../open62541/open62541_git.bb                     |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541/0001-CMakeLists-do-not-install-git-directories.patch

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-CMakeLists-do-not-install-git-directories.patch b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-CMakeLists-do-not-install-git-directories.patch
new file mode 100644
index 0000000..8423507
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-CMakeLists-do-not-install-git-directories.patch
@@ -0,0 +1,27 @@
+From a80cd1702055086e2197851047e2eb65323b7656 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Thu, 19 Mar 2020 07:40:42 -0400
+Subject: [PATCH] CMakeLists: do not install git directories
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+
+Upstream-status: Pending
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a7b15c6..264d484 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1350,6 +1350,7 @@ install(DIRECTORY ${UA_install_tools_dirs}
+     FILES_MATCHING
+     PATTERN "*"
+     PATTERN "*.pyc" EXCLUDE
++    PATTERN ".git" EXCLUDE
+     )
+ 
+ install(FILES ${UA_install_tools_files} DESTINATION ${open62541_install_tools_dir})
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
index c9452c2..e28f96f 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/open62541/open62541.git;protocol=https;branch=${BRAN
            git://github.com/OPCFoundation/UA-Nodeset.git;protocol=https;branch=v1.04;destsuffix=git/deps/ua-nodeset;name=ua-nodeset \
            git://github.com/Pro/mdnsd.git;protocol=https;branch=master;destsuffix=git/deps/mdnsd;name=mdnsd \
            file://0001-examples-client-allow-configurable-server.patch \
+           file://0001-CMakeLists-do-not-install-git-directories.patch \
 "
 
 BRANCH = "1.0"
-- 
2.7.4


