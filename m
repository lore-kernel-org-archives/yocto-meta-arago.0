Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7CFD6529EC
	for <meta-arago@arago-project.org>;
	Thu, 15 Feb 2018 17:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 65D8D20B67;
	Thu, 15 Feb 2018 17:13:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4xn0cBdAjdjV; Thu, 15 Feb 2018 17:13:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 31C6520B65;
	Thu, 15 Feb 2018 17:13:37 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3C3961632AC;
	Thu, 15 Feb 2018 12:13:35 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Feb 2018 12:13:27 -0500
Message-Id: <1518714813-23100-6-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518714813-23100-1-git-send-email-denys@ti.com>
References: <1518714813-23100-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 06/12] iproute2: local patch no longer applies to 4.14.1
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
X-List-Received-Date: Thu, 15 Feb 2018 17:13:58 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/iproute2/iproute2_4.14.1.bbappend            | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.14.1.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.14.1.bbappend
index 327b85b..8fa4c1e 100644
--- a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.14.1.bbappend
+++ b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.14.1.bbappend
@@ -2,6 +2,4 @@ PR_append = ".arago0"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI_append = " \
-           file://0001-add-support-for-prp-similar-to-hsr.patch \
-          "
+# SRC_URI += "file://0001-add-support-for-prp-similar-to-hsr.patch"
-- 
2.7.4


