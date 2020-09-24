Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C5B57529A0
	for <meta-arago@arago-project.org>;
	Thu, 24 Sep 2020 19:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 09DE740C23;
	Thu, 24 Sep 2020 19:35:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PP2aUk6CQunO; Thu, 24 Sep 2020 19:35:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 429CD40A2A;
	Thu, 24 Sep 2020 19:35:03 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B11D41741D0;
	Thu, 24 Sep 2020 15:35:03 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 24 Sep 2020 15:35:03 -0400
Message-Id: <1600976103-43855-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] config-build-env: reset from origin to avoid merge/rebase conflicts
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
X-List-Received-Date: Thu, 24 Sep 2020 19:38:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/config-build-env | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 6e9ff4e..ec40f36 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -26,7 +26,8 @@ checkout_layer_scripts() {
     then
         #This looks to be a git repo.  Hopefully it is the right one :)
         cd $BUILD_ROOT
-        git pull
+        git fetch
+        git reset --hard origin
     else
         echo "The $BUILD_ROOT directory is not empty and is not a git repo"
         exit 1
-- 
2.7.4


