Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 4339552987
	for <meta-arago@arago-project.org>;
	Sat, 16 Jun 2018 01:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 99E3E20BD9;
	Sat, 16 Jun 2018 01:12:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id n_GiztKzdsyE; Sat, 16 Jun 2018 01:12:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 732CC20B0C;
	Sat, 16 Jun 2018 01:12:25 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 00B2A1634A4;
	Fri, 15 Jun 2018 21:12:24 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 15 Jun 2018 21:12:24 -0400
Message-Id: <1529111544-29918-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] iperf: update to 2.0.11
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
X-List-Received-Date: Sat, 16 Jun 2018 01:12:32 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-benchmark/iperf/{iperf_2.0.10.bb => iperf_2.0.11.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-benchmark/iperf/{iperf_2.0.10.bb => iperf_2.0.11.bb} (83%)

diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.10.bb b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.11.bb
similarity index 83%
rename from meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.10.bb
rename to meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.11.bb
index 737efba..c6ba7dc 100644
--- a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.10.bb
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.11.bb
@@ -9,8 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/iperf2/${BP}.tar.gz \
         file://0002-fix-bool-size-m4.patch \
 "
 
-SRC_URI[md5sum] = "097cf0754bc1afa165975c06a91e6906"
-SRC_URI[sha256sum] = "7fe4348dcca313b74e0aa9c34a8ccd713b84a5615b8578f4aa94cedce9891ef2"
+SRC_URI[md5sum] = "c63766d275b4537f419db096b9dfe4dc"
+SRC_URI[sha256sum] = "b7d650d07c6bb0e357b5938a20e4ac33876012fddb952299c5d321e6958da5d2"
 
 S = "${WORKDIR}/${BP}"
 
-- 
2.7.4


