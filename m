Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id AC93052A76
	for <meta-arago@arago-project.org>;
	Thu,  6 Oct 2016 19:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8E02A20A41;
	Thu,  6 Oct 2016 19:34:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oT6u7u-kNPlX; Thu,  6 Oct 2016 19:34:42 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 52B9020A33;
	Thu,  6 Oct 2016 19:34:41 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 6462F16215F;
	Thu,  6 Oct 2016 15:34:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  6 Oct 2016 15:34:37 -0400
Message-Id: <1475782479-31904-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475782479-31904-1-git-send-email-denis@denix.org>
References: <1475782479-31904-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/4] libdrm: setup kmstest binary to be alternative provider
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
X-List-Received-Date: Thu, 06 Oct 2016 19:34:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
index 0ef183e..978231f 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm_%.bbappend
@@ -2,4 +2,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://0001-Add-option-to-run-a-test-indefinitely.patch"
 
-PR_append = ".arago0"
+PR_append = ".arago1"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "10"
+ALTERNATIVE_${PN} = "kmstest"
+ALTERNATIVE_LINK_NAME[kmstest] = "${bindir}/kmstest"
-- 
2.7.4


