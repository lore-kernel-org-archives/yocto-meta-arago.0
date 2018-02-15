Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 93DD6529FB
	for <meta-arago@arago-project.org>;
	Thu, 15 Feb 2018 17:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 714FE20B62;
	Thu, 15 Feb 2018 17:13:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0AUGUnXWYQIV; Thu, 15 Feb 2018 17:13:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 509F420B48;
	Thu, 15 Feb 2018 17:13:37 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5479F1632AE;
	Thu, 15 Feb 2018 12:13:35 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Feb 2018 12:13:29 -0500
Message-Id: <1518714813-23100-8-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518714813-23100-1-git-send-email-denys@ti.com>
References: <1518714813-23100-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 08/12] openssl: update bbappend to 1.0.2n
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
X-List-Received-Date: Thu, 15 Feb 2018 17:13:57 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../openssl/{openssl_1.0.2m.bbappend => openssl_1.0.2n.bbappend}          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl_1.0.2m.bbappend => openssl_1.0.2n.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2m.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2n.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2m.bbappend
rename to meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2n.bbappend
-- 
2.7.4


