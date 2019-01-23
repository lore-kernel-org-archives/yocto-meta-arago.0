Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1F129529D9
	for <meta-arago@arago-project.org>;
	Wed, 23 Jan 2019 04:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C332340AD5;
	Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VA9d5_LAbMV3; Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D4C5E40AD8;
	Wed, 23 Jan 2019 04:52:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D2DAE169638;
	Tue, 22 Jan 2019 23:52:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 23:52:01 -0500
Message-Id: <1548219129-12459-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/9] iproute2: update bbappend to 4.19.0
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
X-List-Received-Date: Wed, 23 Jan 2019 04:52:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../iproute2/{iproute2_4.18.0.bbappend => iproute2_4.19.0.bbappend}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/iproute2/{iproute2_4.18.0.bbappend => iproute2_4.19.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.18.0.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.18.0.bbappend
rename to meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.19.0.bbappend
-- 
2.7.4


