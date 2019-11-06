Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id BEB2752A29
	for <meta-arago@arago-project.org>;
	Wed,  6 Nov 2019 19:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D42E40C29;
	Wed,  6 Nov 2019 19:02:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xPcWOZEcSy5F; Wed,  6 Nov 2019 19:02:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 306AF40BFD;
	Wed,  6 Nov 2019 19:02:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C61DC1742DE;
	Wed,  6 Nov 2019 14:02:28 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  6 Nov 2019 14:02:18 -0500
Message-Id: <1573066944-48181-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573066944-48181-1-git-send-email-denys@ti.com>
References: <1573066944-48181-1-git-send-email-denys@ti.com>
Subject: [RFC][PATCH 3/9] arago-console-image: drop unused image recipe
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
X-List-Received-Date: Wed, 06 Nov 2019 19:03:56 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-base-image.bb | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/arago-base-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-base-image.bb b/meta-arago-distro/recipes-core/images/arago-base-image.bb
deleted file mode 100644
index 57ca93a..0000000
--- a/meta-arago-distro/recipes-core/images/arago-base-image.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-# Arago base image
-# gives you a small image with package manager
-
-require arago-image.inc
-
-IMAGE_INSTALL += "packagegroup-arago-base"
-
-export IMAGE_BASENAME = "arago-base-image"
-- 
2.7.4


