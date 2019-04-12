Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EF60052974
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2019 17:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 805B840BA5;
	Fri, 12 Apr 2019 17:23:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id loUNPwfJG2kE; Fri, 12 Apr 2019 17:23:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6C74B40A9E;
	Fri, 12 Apr 2019 17:23:03 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3276316DFE1;
	Fri, 12 Apr 2019 13:23:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Apr 2019 13:23:02 -0400
Message-Id: <1555089782-28426-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] mbedtls: make bbappend version agnostic
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
X-List-Received-Date: Fri, 12 Apr 2019 17:23:29 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../mbedtls/{mbedtls_2.13.0.bbappend => mbedtls_%.bbappend}               | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/mbedtls/{mbedtls_2.13.0.bbappend => mbedtls_%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bbappend b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.13.0.bbappend
rename to meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
-- 
2.7.4


