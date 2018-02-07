Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id DE22E5298F
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 20:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1FD6820B55;
	Wed,  7 Feb 2018 20:32:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QdajRz_J6hb2; Wed,  7 Feb 2018 20:32:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EBDF320AA4;
	Wed,  7 Feb 2018 20:32:39 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7130E163284;
	Wed,  7 Feb 2018 15:32:39 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Feb 2018 15:32:37 -0500
Message-Id: <1518035557-38200-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518035557-38200-1-git-send-email-denys@ti.com>
References: <1518035557-38200-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/2] hevc-arm-decoder: skip ldflags QA check
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
X-List-Received-Date: Wed, 07 Feb 2018 20:32:51 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
index b5f6ead..c942e2e 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
@@ -46,3 +46,5 @@ do_install() {
 FILES_${PN} += "\
     ${datadir}/ti/*  \
 "
+
+INSANE_SKIP_${PN} += "ldflags"
-- 
2.7.4


