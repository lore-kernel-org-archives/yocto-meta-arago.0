Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 9E66E52A3F
	for <meta-arago@arago-project.org>;
	Sun, 26 Apr 2020 21:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CB4D640BAC;
	Sun, 26 Apr 2020 21:02:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QNPmQoXcs7Z7; Sun, 26 Apr 2020 21:02:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6DD240A9E;
	Sun, 26 Apr 2020 21:02:49 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7F1C716E247;
	Sun, 26 Apr 2020 17:02:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 26 Apr 2020 17:02:49 -0400
Message-Id: <1587934969-45177-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] config-build-env: set DEPLOY_DIR explicitly
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
X-List-Received-Date: Sun, 26 Apr 2020 21:05:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/config-build-env | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 2d1d74e..6e9ff4e 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -49,6 +49,7 @@ configure_build_root() {
 #       - DL_DIR = DL_DIR
 #       - SSTATE_DIR = BUILD_ROOT/sstate-cache
 #       - TMPDIR = BUILD_ROOT/<build dir>/arago-tmp
+#       - DEPLOY_DIR = BUILD_ROOT/<build dir>/deploy
 #   3. Modify the conf/setenv file to point to the following:
 #       - BUILDDIR=BUILD_ROOT/<build dir>
 config_build_dir() {
@@ -73,6 +74,7 @@ config_build_dir() {
     sed -i "s+^DL_DIR =.*+DL_DIR = \"$DL_DIR\"+" local.conf
     sed -i "s+^SSTATE_DIR =.*+STATE_DIR = \"$BUILD_ROOT/sstate-cache\"+" local.conf
     sed -i "s+^TMPDIR =.*+TMPDIR = \"$BUILD_ROOT/$build_dir/arago-tmp\"+" local.conf
+    sed -i "s+^DEPLOY_DIR =.*+DEPLOY_DIR = \"$BUILD_ROOT/$build_dir/deploy\"+" local.conf
     sed -i "s+^export BUILDDIR=.*+export BUILDDIR=\"$BUILD_ROOT/$build_dir\"+" setenv
 
     if [ ! -z "$SOURCE_MIRROR_URL" ]; then
-- 
2.7.4


