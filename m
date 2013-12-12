Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id F1B9852986
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2013 00:14:53 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXO00F833CT9J00@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 Dec 2013 18:14:53 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B7B6B20329; Wed,
	11 Dec 2013 19:14:52 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 Dec 2013 19:14:51 -0500
Message-id: <1386807291-21027-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [tisdk-build-scripts][PATCH] arago-core-tisdk-2013.12.00: add build config for ti2013.12.00 release
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
X-List-Received-Date: Thu, 12 Dec 2013 00:14:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...go-core-tisdk-2013.10.00.txt => arago-core-tisdk-2013.12.00.txt} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 copy configs/{arago-core-tisdk-2013.10.00.txt => arago-core-tisdk-2013.12.00.txt} (99%)

diff --git a/configs/arago-core-tisdk-2013.10.00.txt b/configs/arago-core-tisdk-2013.12.00.txt
similarity index 99%
copy from configs/arago-core-tisdk-2013.10.00.txt
copy to configs/arago-core-tisdk-2013.12.00.txt
index 94e3aa3..060c301 100644
--- a/configs/arago-core-tisdk-2013.10.00.txt
+++ b/configs/arago-core-tisdk-2013.12.00.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2013.10.00"
+TISDK_VERSION="2013.12.00"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES="am437x-evm am335x-evm omap5-evm dra7xx-evm"
@@ -116,7 +116,7 @@ CLEAN_ALL="false"
 
 # This is the configuration file to use in the oe-layertool-setup.sh script
 # to configure the build.
-CONFIG_FILE="${BUILD_ROOT}/configs/arago-dylan-config.txt"
+CONFIG_FILE="${BUILD_ROOT}/configs/coresdk/coresdk-2013.12.00-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
 # This includes:
@@ -273,7 +273,7 @@ COPY_DEPLOY_TO_WEB="false"
 # deploy contents should be placed.  This is best done if you have done a
 # key exchange between these systems so that your SCP command will not ask
 # for a password.
-WEB_HOST="lcpdbld@lsblogin02.dal.design.ti.com:/web/lcpd/htdocs/core-sdk/nightly"
+WEB_HOST="lcpdbld@lsblogin02.dal.design.ti.com:/web/lcpd/htdocs/core-sdk"
 
 # This variable determines whether the DEPLOY_ROOT will be cleaned after
 # the remote copy.  The reason for this is that if the files already exist
-- 
1.8.3.2


