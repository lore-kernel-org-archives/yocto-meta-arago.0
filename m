Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 89E3352998
	for <meta-arago@arago-project.org>;
	Tue, 20 Feb 2018 23:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BCE5120B09;
	Tue, 20 Feb 2018 23:18:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TAJOnHJcJ_MC; Tue, 20 Feb 2018 23:18:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9AC5020059;
	Tue, 20 Feb 2018 23:18:51 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1DCBE1632C0;
	Tue, 20 Feb 2018 18:18:51 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 20 Feb 2018 18:18:50 -0500
Message-Id: <1519168730-56162-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] openssl: make bbappend version agnostic
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
X-List-Received-Date: Tue, 20 Feb 2018 23:19:18 -0000

Upstream updated again from 1.0.2m to 1.0.2n...

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../openssl/{openssl_1.0.2m.bbappend => openssl_%.bbappend}               | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/openssl/{openssl_1.0.2m.bbappend => openssl_%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2m.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.2m.bbappend
rename to meta-arago-distro/recipes-connectivity/openssl/openssl_%.bbappend
-- 
2.7.4


