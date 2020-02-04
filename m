Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A0521529E3
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2020 18:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CBD2740C21;
	Tue,  4 Feb 2020 18:26:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ao_fq6bnakgw; Tue,  4 Feb 2020 18:26:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AEFB340C0A;
	Tue,  4 Feb 2020 18:26:53 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 519F11743D1;
	Tue,  4 Feb 2020 13:26:53 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  4 Feb 2020 13:26:50 -0500
Message-Id: <1580840811-31861-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH 1/2] distroless-zeus: add build config
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
X-List-Received-Date: Tue, 04 Feb 2020 18:28:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/distroless-master.txt                          | 2 ++
 configs/farm/{distroless-master.txt => distroless-zeus.txt} | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)
 copy configs/farm/{distroless-master.txt => distroless-zeus.txt} (98%)

diff --git a/configs/farm/distroless-master.txt b/configs/farm/distroless-master.txt
index 542a98f..e1a6f56 100644
--- a/configs/farm/distroless-master.txt
+++ b/configs/farm/distroless-master.txt
@@ -30,11 +30,13 @@ MACHINES=""
 #      depending on your system resources
 NUM_ARM9_BUILDS="1"
 NUM_CORTEX_BUILDS="1"
+NUM_AARCH64_BUILDS="1"
 
 # These variables contain the location of the bin directory where the toolchain
 # for each architecture is installed.
 TOOLCHAIN_ROOT_ARM9=""
 TOOLCHAIN_ROOT_CORTEX=""
+TOOLCHAIN_ROOT_AARCH64=""
 
 # SECDEV variables for CAT and AUTO
 #TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
diff --git a/configs/farm/distroless-master.txt b/configs/farm/distroless-zeus.txt
similarity index 98%
copy from configs/farm/distroless-master.txt
copy to configs/farm/distroless-zeus.txt
index 542a98f..404bf0d 100644
--- a/configs/farm/distroless-master.txt
+++ b/configs/farm/distroless-zeus.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2017.05"
+TISDK_VERSION="2020.02"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
@@ -30,11 +30,13 @@ MACHINES=""
 #      depending on your system resources
 NUM_ARM9_BUILDS="1"
 NUM_CORTEX_BUILDS="1"
+NUM_AARCH64_BUILDS="1"
 
 # These variables contain the location of the bin directory where the toolchain
 # for each architecture is installed.
 TOOLCHAIN_ROOT_ARM9=""
 TOOLCHAIN_ROOT_CORTEX=""
+TOOLCHAIN_ROOT_AARCH64=""
 
 # SECDEV variables for CAT and AUTO
 #TI_SECURE_DEV_PKG_CAT="/opt/secdev-cat"
@@ -59,7 +61,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-distroless-master"
+BUILD_ROOT="/OE/farm-distroless-zeus"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
@@ -123,7 +125,7 @@ CLEAN_ALL="false"
 
 # This is the configuration file to use in the oe-layertool-setup.sh script
 # to configure the build.
-CONFIG_FILE="${BUILD_ROOT}/configs/distroless-master-config.txt"
+CONFIG_FILE="${BUILD_ROOT}/configs/distroless-zeus-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
 # This includes:
-- 
2.7.4


