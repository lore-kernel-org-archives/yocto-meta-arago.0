Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 20E3852A93
	for <meta-arago@arago-project.org>;
	Fri, 10 Nov 2017 20:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 04D0820A40;
	Fri, 10 Nov 2017 20:20:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EYKKXQzKZDfp; Fri, 10 Nov 2017 20:20:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D875D204B1;
	Fri, 10 Nov 2017 20:20:24 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 584D1162717;
	Fri, 10 Nov 2017 15:20:24 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 10 Nov 2017 15:20:23 -0500
Message-Id: <1510345223-37009-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] openssl: update bbappend to version 1.0.2l
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
X-List-Received-Date: Fri, 10 Nov 2017 20:20:26 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../openssl/{openssl_1.0.2k.bbappend => openssl_1.0.2l.bbappend}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl_1.0.2k.bbappend => openssl_1.0.2l.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2k.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2l.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2k.bbappend
rename to meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2l.bbappend
-- 
2.7.4


