Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9188A52A81
	for <meta-arago@arago-project.org>;
	Wed,  1 Feb 2017 21:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 770A320B64;
	Wed,  1 Feb 2017 21:20:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uaTMoQa_YX4v; Wed,  1 Feb 2017 21:20:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 562A1208D1;
	Wed,  1 Feb 2017 21:20:32 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id D2DEC1621BE;
	Wed,  1 Feb 2017 16:20:31 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  1 Feb 2017 16:20:31 -0500
Message-Id: <1485984031-7864-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty][PATCH] openssl: update bbappend to the latest version
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
X-List-Received-Date: Wed, 01 Feb 2017 21:20:33 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../openssl/{openssl_1.0.2h.bbappend => openssl_1.0.2j.bbappend}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl_1.0.2h.bbappend => openssl_1.0.2j.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2h.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2j.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2h.bbappend
rename to meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2j.bbappend
-- 
2.7.4


