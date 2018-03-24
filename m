Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 68EFB520C0
	for <meta-arago@arago-project.org>;
	Sun, 25 Mar 2018 02:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C23220BA8;
	Sat, 24 Mar 2018 23:16:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Qf00R1uLO7T6; Sat, 24 Mar 2018 23:16:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CEC4120B73;
	Sat, 24 Mar 2018 23:16:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 367A0163398;
	Sat, 24 Mar 2018 19:16:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sat, 24 Mar 2018 19:16:52 -0400
Message-Id: <1521933412-44751-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521933412-44751-1-git-send-email-denys@ti.com>
References: <1521933412-44751-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 4/4] timestamping: suppress no GNU_HASH warning
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
X-List-Received-Date: Sun, 25 Mar 2018 02:52:42 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb b/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
index 077b888..f801cf0 100644
--- a/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
+++ b/meta-arago-extras/recipes-kernel/timestamping/timestamping_4.1.bb
@@ -20,3 +20,5 @@ do_install () {
 	install -d ${D}${bindir}
 	install -m 0755 ${S}/Documentation/networking/timestamping/timestamping ${D}${bindir}
 }
+
+INSANE_SKIP_${PN} = "ldflags"
-- 
2.7.4


