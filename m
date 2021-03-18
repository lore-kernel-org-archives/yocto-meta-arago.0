Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D593952A22
	for <meta-arago@arago-project.org>;
	Thu, 18 Mar 2021 16:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9A31D40BE9
	for <meta-arago@arago-project.org>;
	Thu, 18 Mar 2021 16:15:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XSSVU2mNxnIb for <meta-arago@arago-project.org>;
	Thu, 18 Mar 2021 16:15:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8AB8940A47
	for <meta-arago@arago-project.org>;
	Thu, 18 Mar 2021 16:15:16 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 429FD17454E;
	Thu, 18 Mar 2021 12:15:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 18 Mar 2021 12:15:15 -0400
Message-Id: <1616084115-43128-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] configs/farm: update local mirror address
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
X-List-Received-Date: Thu, 18 Mar 2021 16:15:00 -0000

Only update active configs for dunfell and master.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
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
index f6913ab..5d8c6a2 100644
--- a/configs/farm/arago-dunfell-next.txt
+++ b/configs/farm/arago-dunfell-next.txt
@@ -147,7 +147,7 @@ DL_DIR="${BUILD_ROOT}/downloads"
 
 # Setting this variable will configure the builds to attempt to use a mirror to 
 # obtain the build sources.
-SOURCE_MIRROR_URL="http://lcpd.gt.design.ti.com/sources/"
+SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 
 # Seeting this variable to "1" configures the build to generate mirror tarballs
 # of the source repos.
diff --git a/configs/farm/arago-dunfell.txt b/configs/farm/arago-dunfell.txt
index e509920..dfa3afa 100644
--- a/configs/farm/arago-dunfell.txt
+++ b/configs/farm/arago-dunfell.txt
@@ -147,7 +147,7 @@ DL_DIR="${BUILD_ROOT}/downloads"
 
 # Setting this variable will configure the builds to attempt to use a mirror to 
 # obtain the build sources.
-SOURCE_MIRROR_URL="http://lcpd.gt.design.ti.com/sources/"
+SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 
 # Seeting this variable to "1" configures the build to generate mirror tarballs
 # of the source repos.
diff --git a/configs/farm/arago-master.txt b/configs/farm/arago-master.txt
index e2f0f00..22712dc 100644
--- a/configs/farm/arago-master.txt
+++ b/configs/farm/arago-master.txt
@@ -147,7 +147,7 @@ DL_DIR="${BUILD_ROOT}/downloads"
 
 # Setting this variable will configure the builds to attempt to use a mirror to 
 # obtain the build sources.
-SOURCE_MIRROR_URL="http://lcpd.gt.design.ti.com/sources/"
+SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 
 # Seeting this variable to "1" configures the build to generate mirror tarballs
 # of the source repos.
diff --git a/configs/farm/distroless-dunfell.txt b/configs/farm/distroless-dunfell.txt
index 93ce26b..7a42300 100644
--- a/configs/farm/distroless-dunfell.txt
+++ b/configs/farm/distroless-dunfell.txt
@@ -147,7 +147,7 @@ DL_DIR="${BUILD_ROOT}/downloads"
 
 # Setting this variable will configure the builds to attempt to use a mirror to 
 # obtain the build sources.
-SOURCE_MIRROR_URL="http://lcpd.gt.design.ti.com/sources/"
+SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 
 # Seeting this variable to "1" configures the build to generate mirror tarballs
 # of the source repos.
diff --git a/configs/farm/distroless-master.txt b/configs/farm/distroless-master.txt
index ac3e80f..c6b85aa 100644
--- a/configs/farm/distroless-master.txt
+++ b/configs/farm/distroless-master.txt
@@ -147,7 +147,7 @@ DL_DIR="${BUILD_ROOT}/downloads"
 
 # Setting this variable will configure the builds to attempt to use a mirror to 
 # obtain the build sources.
-SOURCE_MIRROR_URL="http://lcpd.gt.design.ti.com/sources/"
+SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 
 # Seeting this variable to "1" configures the build to generate mirror tarballs
 # of the source repos.
diff --git a/configs/farm/poky-dunfell.txt b/configs/farm/poky-dunfell.txt
index 4ee2ff9..a39ad5a 100644
--- a/configs/farm/poky-dunfell.txt
+++ b/configs/farm/poky-dunfell.txt
@@ -147,7 +147,7 @@ DL_DIR="${BUILD_ROOT}/downloads"
 
 # Setting this variable will configure the builds to attempt to use a mirror to 
 # obtain the build sources.
-SOURCE_MIRROR_URL="http://lcpd.gt.design.ti.com/sources/"
+SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 
 # Seeting this variable to "1" configures the build to generate mirror tarballs
 # of the source repos.
diff --git a/configs/farm/poky-master.txt b/configs/farm/poky-master.txt
index 0db3bab..7b8032e 100644
--- a/configs/farm/poky-master.txt
+++ b/configs/farm/poky-master.txt
@@ -147,7 +147,7 @@ DL_DIR="${BUILD_ROOT}/downloads"
 
 # Setting this variable will configure the builds to attempt to use a mirror to 
 # obtain the build sources.
-SOURCE_MIRROR_URL="http://lcpd.gt.design.ti.com/sources/"
+SOURCE_MIRROR_URL="http://lcpd.itg.ti.com/sources/"
 
 # Seeting this variable to "1" configures the build to generate mirror tarballs
 # of the source repos.
-- 
2.7.4


