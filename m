Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B8C83529D3
	for <meta-arago@arago-project.org>;
	Mon, 11 Nov 2019 22:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 81F3340C30;
	Mon, 11 Nov 2019 21:58:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pUzkMd10aoUi; Mon, 11 Nov 2019 21:58:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6B73540C27;
	Mon, 11 Nov 2019 21:58:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 25A9B1742DC;
	Mon, 11 Nov 2019 16:58:57 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 Nov 2019 16:58:56 -0500
Message-Id: <1573509536-46955-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] arago-zeus: add initial config for zeus builds
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
X-List-Received-Date: Mon, 11 Nov 2019 22:00:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/{arago-master.txt => arago-zeus.txt} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 copy configs/farm/{arago-master.txt => arago-zeus.txt} (99%)

diff --git a/configs/farm/arago-master.txt b/configs/farm/arago-zeus.txt
similarity index 99%
copy from configs/farm/arago-master.txt
copy to configs/farm/arago-zeus.txt
index 8d9d8de..8b2518c 100644
--- a/configs/farm/arago-master.txt
+++ b/configs/farm/arago-zeus.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS NUM_AARCH64_BUILDS
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2019.09"
+TISDK_VERSION="2019.11"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
@@ -62,7 +62,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-arago-master"
+BUILD_ROOT="/OE/farm-arago-zeus"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
@@ -126,7 +126,7 @@ CLEAN_ALL="false"
 
 # This is the configuration file to use in the oe-layertool-setup.sh script
 # to configure the build.
-CONFIG_FILE="${BUILD_ROOT}/configs/arago-master-config.txt"
+CONFIG_FILE="${BUILD_ROOT}/configs/arago-zeus-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
 # This includes:
-- 
2.7.4


