Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id CD97B52A86
	for <meta-arago@arago-project.org>;
	Tue, 14 Jan 2014 21:10:54 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.138.84])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MZE00E3WTI3UTA1@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 14 Jan 2014 15:10:54 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C5DA120076; Tue,
	14 Jan 2014 16:10:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 14 Jan 2014 16:10:43 -0500
Message-id: <1389733843-16055-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1389733843-16055-1-git-send-email-denis@denix.org>
References: <1389733843-16055-1-git-send-email-denis@denix.org>
Subject: [tisdk-build-scripts][PATCH] arago-core-tisdk-2013.12.01: add new config for point-release
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
X-List-Received-Date: Tue, 14 Jan 2014 21:10:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...3.12.00.txt => arago-core-tisdk-2013.12.01.txt} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 copy configs/{arago-core-tisdk-2013.12.00.txt => arago-core-tisdk-2013.12.01.txt} (99%)

diff --git a/configs/arago-core-tisdk-2013.12.00.txt b/configs/arago-core-tisdk-2013.12.01.txt
similarity index 99%
copy from configs/arago-core-tisdk-2013.12.00.txt
copy to configs/arago-core-tisdk-2013.12.01.txt
index 060c301..9e48c92 100644
--- a/configs/arago-core-tisdk-2013.12.00.txt
+++ b/configs/arago-core-tisdk-2013.12.01.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2013.12.00"
+TISDK_VERSION="2013.12.01"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES="am437x-evm am335x-evm omap5-evm dra7xx-evm"
@@ -116,7 +116,7 @@ CLEAN_ALL="false"
 
 # This is the configuration file to use in the oe-layertool-setup.sh script
 # to configure the build.
-CONFIG_FILE="${BUILD_ROOT}/configs/coresdk/coresdk-2013.12.00-config.txt"
+CONFIG_FILE="${BUILD_ROOT}/configs/coresdk/coresdk-2013.12.01-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
 # This includes:
-- 
1.7.9.5


