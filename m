Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3BC0A520DE
	for <meta-arago@arago-project.org>;
	Tue, 20 Aug 2019 07:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AA88940BD6;
	Tue, 20 Aug 2019 07:33:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YdQOmLjwVYcd; Tue, 20 Aug 2019 07:33:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7E96D40BB6;
	Tue, 20 Aug 2019 07:33:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A6760172F9D;
	Tue, 20 Aug 2019 03:33:07 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 20 Aug 2019 03:33:07 -0400
Message-Id: <1566286387-1518-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH v2] opencv: set PV to not include SRCPV
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
X-List-Received-Date: Tue, 20 Aug 2019 07:34:10 -0000

Since our bbappend makes opencv a machine-specific package, PV containing
SRCPV may lead to different versions of the package for different machines
due to AUTOINC part that gets assigned by a PR server. As opencv provides
libraries, packages that depend on those automatically specify (>= PV) and
may incorrectly specify the wrong one from sstate for non-machine-specific
packages. Dropping SRCPV makes PV generic to satisfy such dependencies.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - also bump PE to force rebuild/repackage

 meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
index d10ff9f..95880f2 100644
--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
@@ -1,3 +1,5 @@
+PE = "1"
+PV = "3.1"
 PR = "r3"
 
 BRANCH = "tiopencvrelease_3.1"
-- 
2.7.4


