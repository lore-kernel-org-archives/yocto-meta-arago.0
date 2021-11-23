Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.7006.1637640070267445052
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 20:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B81A240CA7;
	Tue, 23 Nov 2021 04:01:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4SpvE51jVnB; Tue, 23 Nov 2021 04:01:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A489140C2B;
	Tue, 23 Nov 2021 04:01:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B64391746DD;
	Mon, 22 Nov 2021 23:01:04 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 09/10] If no configs specified, initialize LOG_DIR correctly
Date: Mon, 22 Nov 2021 23:00:46 -0500
Message-Id: <1637640060-31733-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637640060-31733-1-git-send-email-denis@denix.org>
References: <1637640060-31733-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 build-oesdk.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/build-oesdk.sh b/build-oesdk.sh
index fb5f725..9534d99 100755
--- a/build-oesdk.sh
+++ b/build-oesdk.sh
@@ -22,6 +22,11 @@ CORTEX_MACHINE=""
 # List of all the dynamically created architecture lists
 LISTS=""
 
+if [ -z $LOG_DIR ]
+then
+    LOG_DIR="."
+fi
+
 usage() {
     echo "write something"
     exit 0
-- 
2.7.4

