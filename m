Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 21E0052A66
	for <meta-arago@arago-project.org>;
	Tue,  4 Nov 2014 01:43:20 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEH00116RFRV460@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Nov 2014 19:43:04 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=GLe/yVJP c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=-xlIJ6rxJlj3uTXPLwYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8A0C2203DA;	Mon,
	3 Nov 2014 20:43:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Nov 2014 20:42:51 -0500
Message-id: <1415065371-27167-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
In-reply-to: <1415065371-27167-1-git-send-email-denis@denix.org>
References: <1415065371-27167-1-git-send-email-denis@denix.org>
Subject: [PATCH 6/6] arago.conf: select version 5.4 of Qt
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
X-List-Received-Date: Tue, 04 Nov 2014 01:43:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index cc49224..5965ceb 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -24,6 +24,7 @@ DISTRO_FEATURES += "pam"
 
 # Set preferred Qt version
 QT_PROVIDER = "qt5"
+QT5_VERSION = "5.3.99+5.4.0-beta1+git%"
 
 # Distro-specific package configuration
 # Weston - use fbdev compositor and provide launcher
-- 
2.1.2


