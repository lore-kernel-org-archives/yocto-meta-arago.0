Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A62BE52988
	for <meta-arago@arago-project.org>;
	Wed, 23 Sep 2020 19:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E26B340C29;
	Wed, 23 Sep 2020 19:35:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id G8pMWe48rB-4; Wed, 23 Sep 2020 19:35:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C8AE840AB7;
	Wed, 23 Sep 2020 19:35:33 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8E8301741D0;
	Wed, 23 Sep 2020 15:35:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Sep 2020 15:35:33 -0400
Message-Id: <1600889733-37827-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] README: add Dan Murphy to maintainers list
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
X-List-Received-Date: Wed, 23 Sep 2020 19:38:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/README | 4 +++-
 meta-arago-extras/README | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index 03157ae..42d189d 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -33,4 +33,6 @@ layers: meta-linaro-toolchain, meta-optee
 
 Send pull requests to meta-arago@arago-project.org
 
-Layer maintainer: Denys Dmytriyenko <denys@ti.com>
+Layer maintainers:
+Dan Murphy <dmurphy@ti.com>
+Denys Dmytriyenko <denys@ti.com>
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index 62416cd..ed7af0b 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -28,4 +28,6 @@ layers: meta-linaro-toolchain
 
 Send pull requests to meta-arago@arago-project.org
 
-Layer maintainer: Denys Dmytriyenko <denys@ti.com>
+Layer maintainers:
+Dan Murphy <dmurphy@ti.com>
+Denys Dmytriyenko <denys@ti.com>
-- 
2.7.4


