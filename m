Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id DC9A952993
	for <meta-arago@arago-project.org>;
	Tue, 25 Apr 2017 13:29:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3PDSpxQ025872
	for <meta-arago@arago-project.org>; Tue, 25 Apr 2017 08:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493126931;
	bh=WG/9jmHfVm1INztYv7XGT409x/NhD25MU3hFfU5DR88=;
	h=From:To:Subject:Date;
	b=MN8zkE8HAZ+QMXgjSmRwnspXmhdCQoNaHJdkqYIrgzGOIQnl90u1GwZGYKS2KIgQY
	UnU65vFQftxmJ5cjJzpXY1yE03F3nmxLSxUtEaO3Yhxk4hVSraAgCjWC0qVkGPaztH
	Ablw48Mo9U0fJNnI5LYHQAIpbNR8+Q1bojt3rUbs=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PDSjK4009730
	for <meta-arago@arago-project.org>; Tue, 25 Apr 2017 08:28:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Apr 2017 08:28:45 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3PDSjLB017458	for <meta-arago@arago-project.org>;
	Tue, 25 Apr 2017 08:28:45 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 25 Apr 2017 09:28:40 -0400
Message-ID: <1493126920-27934-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-plugins-bad: gstwaylandsink: apply new callback for v5 of wl_pointer to AM3/4
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
X-List-Received-Date: Tue, 25 Apr 2017 13:29:03 -0000
Content-Type: text/plain

Pick the patch for AM3/4:
   0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend                   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
index 53cd834..97753be 100644
--- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bbappend
@@ -27,10 +27,12 @@ SRC_URI_append_ti43x = " \
     file://0002-kmssink-remove-DCE-dependencies.patch \
     file://0003-kmssink-add-YUYV-support.patch \
     file://0001-gstwaylandsink-add-input-format-I420-support.patch \
+    file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch \
 "
 
 SRC_URI_append_ti33x = " \
     file://0001-gstwaylandsink-Add-mouse-drag-and-drop-support.patch \
+    file://0005-gstwaylandsink-Implement-callbacks-for-version-5-of-.patch \
 "
 
 SRC_URI_append_omap-a15 = " \
-- 
1.9.1


