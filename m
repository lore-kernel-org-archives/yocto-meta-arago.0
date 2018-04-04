Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by arago-project.org (Postfix) with ESMTP id 00C1952998
	for <meta-arago@arago-project.org>;
	Wed,  4 Apr 2018 09:27:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38608415"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Apr 2018 17:27:24 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 32EBD472400E
	for <meta-arago@arago-project.org>;
	Wed,  4 Apr 2018 17:27:20 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 4 Apr 2018 17:27:20 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Apr 2018 17:27:26 +0800
Message-ID: <1522834047-15232-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 32EBD472400E.A5F58
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] remove the layer directories
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
X-List-Received-Date: Wed, 04 Apr 2018 09:27:35 -0000
Content-Type: text/plain

Meta-arago writes all the dependent layer directories to the bblayer, which caused to
add these dependent layers to build environment even though only need one of them.
This is obviously unreasonable.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-arago-distro/conf/layer.conf | 13 -------------
 meta-arago-extras/conf/layer.conf | 10 ----------
 2 files changed, 23 deletions(-)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index c175bd8..260efed 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -8,19 +8,6 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
 BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arago-distro = "10"
 
-LAYERDEPENDS_meta-arago-distro = " \
-    core \
-    meta-ti \
-    openembedded-layer \
-    networking-layer \
-    meta-python \
-    linaro-toolchain \
-    meta-optee \
-    qt5-layer \
-    browser-layer \
-    meta-arago-extras \
-"
-
 BB_DANGLINGAPPENDS_WARNONLY = "true"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 83ac107..605d083 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -13,16 +13,6 @@ ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-LAYERDEPENDS_meta-arago-extras = " \
-    core \
-    meta-ti \
-    openembedded-layer \
-    networking-layer \
-    meta-python \
-    linaro-toolchain \
-    qt5-layer \
-"
-
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
     matrix-gui-multimedia-demos->amsdk-av-files \
     matrix-gui-oprofile-demos->oprofile \
-- 
2.7.4




