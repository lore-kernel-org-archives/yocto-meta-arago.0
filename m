Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D447552986
	for <meta-arago@arago-project.org>;
	Wed, 28 Oct 2020 23:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4BF4A40B5F;
	Wed, 28 Oct 2020 23:27:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3SAuXWijDtVE; Wed, 28 Oct 2020 23:27:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2435240A2A;
	Wed, 28 Oct 2020 23:27:43 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 607D81744B6;
	Wed, 28 Oct 2020 19:27:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 28 Oct 2020 19:27:37 -0400
Message-Id: <1603927657-53672-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH v4] websocketd: Add new recipe
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
X-List-Received-Date: Wed, 28 Oct 2020 23:30:53 -0000

From: Nikhil Devshatwar <nikhil.nd@ti.com>

websocketd is an application which allows to redirect output of
command line applications via a websocket so that web pages can
interact with them.

This is very useful for visualizing statistics information on
host machine browser.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v4 - export http_proxy with explanation

 .../recipes-devtools/websocketd/websocketd_0.3.1.bb    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb

diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
new file mode 100644
index 0000000..d2f3387
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Application for routing native applications via websockets"
+HOMEPAGE = "http://websocketd.com/"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
+
+inherit go-mod
+
+GO_IMPORT = "github.com/joewalnes/websocketd"
+
+SRC_URI = "git://${GO_IMPORT}"
+SRCREV = "0440211d7862dc76b5f2499d7dfcd4ef6a9c2fa2"
+
+# bitbake only exports proxy variables during fetching, but go handles
+# module fetching on its own during compile and needs proxy settings
+export http_proxy
+
+# Development package contains all the examples in different languages
+INSANE_SKIP_${PN}-dev = "file-rdeps"
-- 
2.7.4


