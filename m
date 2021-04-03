Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 23A7752AA1
	for <meta-arago@arago-project.org>;
	Sat,  3 Apr 2021 00:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E266E40C5E;
	Sat,  3 Apr 2021 00:11:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bqkwBrPdUqfF; Sat,  3 Apr 2021 00:11:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA8AA40C82;
	Sat,  3 Apr 2021 00:11:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D33C7174587;
	Fri,  2 Apr 2021 20:11:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  2 Apr 2021 20:10:30 -0400
Message-Id: <1617408644-2675-16-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408644-2675-1-git-send-email-denis@denix.org>
References: <1617408644-2675-1-git-send-email-denis@denix.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 15/29] linuxptp: update bbappend against latest upstream
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
X-List-Received-Date: Sat, 03 Apr 2021 00:10:59 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Upstream has moved to 3.1, but since this bbappend switches SRC_URI to a forked
version based on 3.0, update it to reflect the same and still build against
upstream recipe.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
---
 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
index b0552aa..e4fb109 100644
--- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -1,13 +1,13 @@
 PR_append = ".arago0"
-PV_append = "+git${SRCPV}"
+PV = "3.0+git${SRCPV}"
 
 BRANCH = "ti-linuxptp"
-SRCREV = "a06698a12e828a0372955c2d9c8d6604d8326811"
+SRCREV = "f155c21283a0421f5e1e0b5e850c8a9a71d72453"
 
 SRC_URI = " \
     git://git.ti.com/processor-sdk/linuxptp.git;branch=${BRANCH} \
     file://build-Allow-CC-and-prefix-to-be-overriden.patch \
-    file://no-incdefs-using-host-headers.patch \
+    file://Use-cross-cpp-in-incdefs.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


