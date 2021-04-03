Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3935752AA5
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E30EE40C8E;
	Sat,  3 Apr 2021 00:11:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id koTCbWkxnOAl; Sat,  3 Apr 2021 00:11:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C872C40BE9;
	Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DF022174588;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:31 -0400
Message-Id: <1617408644-2675-17-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 16/29] kmscube: pin down version before GL3+ features were merged
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

More and more GL3+ features are being added to kmscube w/o easy way to disable
them. Pin down older version from dunfell, until GL3+ code can be patched out.

Also, suppress gcc10 multiple definition of 'gl' error for now.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Cc: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
index d11012a..2d43a6b 100644
--- a/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
+++ b/meta-arago-distro/recipes-graphics/kmscube/kmscube_%.bbappend
@@ -1,7 +1,11 @@
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
 
+SRCREV = "76bb57d539cb43d267e561024c34e031bf351e04"
+
 SRC_URI += " \
 file://0001-meson-check-for-gles3-support.patch \
 "
 
-PR_append = ".arago1"
+CFLAGS += "-fcommon"
+
+PR_append = ".arago2"
-- 
2.7.4


