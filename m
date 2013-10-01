Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id 9D7B152099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 07:12:28 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTZ00IRWAORS0S0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 01 Oct 2013 02:12:28 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 05D2B20179; Tue,
	01 Oct 2013 03:12:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 01 Oct 2013 03:12:25 -0400
Message-id: <1380611545-23840-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1380611545-23840-1-git-send-email-denis@denix.org>
References: <1380611545-23840-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] arago-core-tisdk-puget: enable productization and bump the version
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
X-List-Received-Date: Tue, 01 Oct 2013 07:12:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-core-tisdk-puget.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arago-core-tisdk-puget.txt b/configs/arago-core-tisdk-puget.txt
index 8e1fd98..4e2d358 100644
--- a/configs/arago-core-tisdk-puget.txt
+++ b/configs/arago-core-tisdk-puget.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2013.05"
+TISDK_VERSION="2013.10"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES="am335x-evm am37x-evm am3517-evm omap5-evm dra7xx-evm beagleboard am180x-evm"
@@ -199,7 +199,7 @@ SKIP_TEST_FAILURES="false"
 # and project file created to package it.  If not then you can use
 # the simple SDK tarball that was created during the build as your
 # SDK.
-PRODUCTIZE_SDK="false"
+PRODUCTIZE_SDK="true"
 
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
-- 
1.7.9.5


