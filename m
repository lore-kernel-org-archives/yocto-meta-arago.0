Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B3CCD52A12
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2020 19:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AAAC340C14;
	Wed,  4 Mar 2020 19:22:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ui8dgplxqNiQ; Wed,  4 Mar 2020 19:22:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 86F8D40951;
	Wed,  4 Mar 2020 19:22:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 35A7816BA7B;
	Wed,  4 Mar 2020 14:22:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  4 Mar 2020 14:22:09 -0500
Message-Id: <1583349729-46184-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] configs/farm: preset TISDK_VERSION="live" for zeus/master
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
X-List-Received-Date: Wed, 04 Mar 2020 19:24:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

This will default to "live" package feeds, but allows versioned builds with
dedicated feeds per-release.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/arago-master.txt      | 2 +-
 configs/farm/arago-zeus-next.txt   | 2 +-
 configs/farm/arago-zeus.txt        | 2 +-
 configs/farm/distroless-master.txt | 2 +-
 configs/farm/distroless-zeus.txt   | 2 +-
 configs/farm/poky-master.txt       | 2 +-
 configs/farm/poky-zeus.txt         | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/farm/arago-master.txt b/configs/farm/arago-master.txt
index 8d9d8de..b4e75ce 100644
--- a/configs/farm/arago-master.txt
+++ b/configs/farm/arago-master.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS NUM_AARCH64_BUILDS
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2019.09"
+TISDK_VERSION="live"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
diff --git a/configs/farm/arago-zeus-next.txt b/configs/farm/arago-zeus-next.txt
index 0a0f524..cbb965e 100644
--- a/configs/farm/arago-zeus-next.txt
+++ b/configs/farm/arago-zeus-next.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS NUM_AARCH64_BUILDS
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2020.01"
+TISDK_VERSION="live"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
diff --git a/configs/farm/arago-zeus.txt b/configs/farm/arago-zeus.txt
index 6452239..c725cc9 100644
--- a/configs/farm/arago-zeus.txt
+++ b/configs/farm/arago-zeus.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS NUM_AARCH64_BUILDS
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2020.01"
+TISDK_VERSION="live"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
diff --git a/configs/farm/distroless-master.txt b/configs/farm/distroless-master.txt
index e1a6f56..be00bf7 100644
--- a/configs/farm/distroless-master.txt
+++ b/configs/farm/distroless-master.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2017.05"
+TISDK_VERSION="live"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
diff --git a/configs/farm/distroless-zeus.txt b/configs/farm/distroless-zeus.txt
index 404bf0d..6f15fd7 100644
--- a/configs/farm/distroless-zeus.txt
+++ b/configs/farm/distroless-zeus.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2020.02"
+TISDK_VERSION="live"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
diff --git a/configs/farm/poky-master.txt b/configs/farm/poky-master.txt
index fcb405e..760d567 100644
--- a/configs/farm/poky-master.txt
+++ b/configs/farm/poky-master.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2017.05"
+TISDK_VERSION="live"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
diff --git a/configs/farm/poky-zeus.txt b/configs/farm/poky-zeus.txt
index aec9791..0dac29d 100644
--- a/configs/farm/poky-zeus.txt
+++ b/configs/farm/poky-zeus.txt
@@ -11,7 +11,7 @@ MANDATORY_INPUTS="MACHINES NUM_ARM9_BUILDS NUM_CORTEX_BUILDS BUILD_ID SCRIPTS_RO
 # This variable holds the SDK version you are building.  This will be picked
 # up in the installer name if you choose to package an installer.  You can
 # also use this in the CONFIG_FILE name below.
-TISDK_VERSION="2020.02"
+TISDK_VERSION="live"
 
 # This variable contains the list of machines to build an SDK for
 MACHINES=""
-- 
2.7.4


