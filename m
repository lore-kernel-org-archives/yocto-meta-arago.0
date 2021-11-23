Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.6954.1637640073481127091
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 20:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F008E40C87;
	Tue, 23 Nov 2021 04:01:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTADaNqYUrIE; Tue, 23 Nov 2021 04:01:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C290940C1C;
	Tue, 23 Nov 2021 04:01:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4C7081746EB;
	Mon, 22 Nov 2021 23:01:06 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 10/10] Adjust default BUILD_ROOT to be relative to SCRIPTS_ROOT
Date: Mon, 22 Nov 2021 23:01:00 -0500
Message-Id: <1637640060-31733-24-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637640060-31733-1-git-send-email-denis@denix.org>
References: <1637640060-31733-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 configs/farm/arago-dunfell-next.txt | 2 +-
 configs/farm/arago-dunfell.txt      | 2 +-
 configs/farm/arago-master.txt       | 2 +-
 configs/farm/distroless-dunfell.txt | 2 +-
 configs/farm/distroless-master.txt  | 2 +-
 configs/farm/poky-dunfell.txt       | 2 +-
 configs/farm/poky-master.txt        | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/farm/arago-dunfell-next.txt b/configs/farm/arago-dunfell-next.txt
index 5d8c6a2..74b1094 100644
--- a/configs/farm/arago-dunfell-next.txt
+++ b/configs/farm/arago-dunfell-next.txt
@@ -62,7 +62,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-arago-dunfell-next"
+BUILD_ROOT="$SCRIPTS_ROOT/farm-arago-dunfell-next-build"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
diff --git a/configs/farm/arago-dunfell.txt b/configs/farm/arago-dunfell.txt
index dfa3afa..e099df2 100644
--- a/configs/farm/arago-dunfell.txt
+++ b/configs/farm/arago-dunfell.txt
@@ -62,7 +62,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-arago-dunfell"
+BUILD_ROOT="$SCRIPTS_ROOT/farm-arago-dunfell-build"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
diff --git a/configs/farm/arago-master.txt b/configs/farm/arago-master.txt
index 22712dc..0779ded 100644
--- a/configs/farm/arago-master.txt
+++ b/configs/farm/arago-master.txt
@@ -62,7 +62,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-arago-master"
+BUILD_ROOT="$SCRIPTS_ROOT/farm-arago-master-build"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
diff --git a/configs/farm/distroless-dunfell.txt b/configs/farm/distroless-dunfell.txt
index 7a42300..16e0b69 100644
--- a/configs/farm/distroless-dunfell.txt
+++ b/configs/farm/distroless-dunfell.txt
@@ -62,7 +62,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-distroless-dunfell"
+BUILD_ROOT="$SCRIPTS_ROOT/farm-distroless-dunfell-build"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
diff --git a/configs/farm/distroless-master.txt b/configs/farm/distroless-master.txt
index c6b85aa..9684f03 100644
--- a/configs/farm/distroless-master.txt
+++ b/configs/farm/distroless-master.txt
@@ -62,7 +62,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-distroless-master"
+BUILD_ROOT="$SCRIPTS_ROOT/farm-distroless-master-build"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
diff --git a/configs/farm/poky-dunfell.txt b/configs/farm/poky-dunfell.txt
index a39ad5a..7a45515 100644
--- a/configs/farm/poky-dunfell.txt
+++ b/configs/farm/poky-dunfell.txt
@@ -62,7 +62,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-poky-dunfell"
+BUILD_ROOT="$SCRIPTS_ROOT/farm-poky-dunfell-build"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
diff --git a/configs/farm/poky-master.txt b/configs/farm/poky-master.txt
index 7b8032e..95d78d1 100644
--- a/configs/farm/poky-master.txt
+++ b/configs/farm/poky-master.txt
@@ -62,7 +62,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-poky-master"
+BUILD_ROOT="$SCRIPTS_ROOT/farm-poky-master-build"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
-- 
2.7.4

