Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B4A6F52A2B
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 03:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 87D632091B;
	Thu, 22 Dec 2016 03:47:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qGh3e7y4ZEa0; Thu, 22 Dec 2016 03:47:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 64DB1207BD;
	Thu, 22 Dec 2016 03:47:33 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id A4BEF1621E2;
	Wed, 21 Dec 2016 22:47:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 21 Dec 2016 22:47:32 -0500
Message-Id: <1482378452-11605-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master/morty][PATCH] libnl: rename bbappend to version 3.2.28
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
X-List-Received-Date: Thu, 22 Dec 2016 03:47:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../libnl/{libnl_3.2.25.bbappend => libnl_3.2.28.bbappend}                | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-support/libnl/{libnl_3.2.25.bbappend => libnl_3.2.28.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend b/meta-arago-distro/recipes-support/libnl/libnl_3.2.28.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-support/libnl/libnl_3.2.25.bbappend
rename to meta-arago-distro/recipes-support/libnl/libnl_3.2.28.bbappend
-- 
2.7.4


