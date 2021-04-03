Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 331F552AA7
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 118F240BE9;
	Sat,  3 Apr 2021 00:11:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xs8vjmP1Xre1; Sat,  3 Apr 2021 00:11:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C50E540C92;
	Sat,  3 Apr 2021 00:11:01 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A33E8174583;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:26 -0400
Message-Id: <1617408644-2675-12-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 11/29] branding-core: remove mmip, as gstreamer patches need porting to 1.18
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
X-List-Received-Date: Sat, 03 Apr 2021 00:11:00 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Following patches need porting to 1.18: DRM allocator, KMS sink, Wayland sink.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 2e3759e..10853d8 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -16,3 +16,6 @@ PREFERRED_VERSION_linux-ti-staging = "5.4%"
 PREFERRED_VERSION_linux-ti-staging-rt = "5.4%"
 PREFERRED_VERSION_linux-ti-staging-systest = "5.4%"
 PREFERRED_VERSION_u-boot-ti-staging = "2020.01%"
+
+# Remove mmip - DRM allocator, KMS sink, Wayland sink need porting to GST 1.18
+MACHINE_FEATURES_remove = "mmip"
-- 
2.7.4


