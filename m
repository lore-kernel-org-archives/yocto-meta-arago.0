Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 8240E529DC
	for <meta-arago@arago-project.org>;
	Thu,  9 Aug 2018 02:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1569120C5E;
	Thu,  9 Aug 2018 02:01:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id m2ea8UoLhJxP; Thu,  9 Aug 2018 02:00:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C37A320C29;
	Thu,  9 Aug 2018 02:00:58 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 16D39163579;
	Wed,  8 Aug 2018 22:00:58 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  8 Aug 2018 22:00:42 -0400
Message-Id: <1533780054-50159-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533780054-50159-1-git-send-email-denys@ti.com>
References: <1533780054-50159-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 02/14] iproute2: 4.14.1 -> 4.17.0
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
X-List-Received-Date: Thu, 09 Aug 2018 02:01:08 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../iproute2/{iproute2_4.14.1.bbappend => iproute2_4.17.0.bbappend}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/iproute2/{iproute2_4.14.1.bbappend => iproute2_4.17.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.14.1.bbappend b/meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.17.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.14.1.bbappend
rename to meta-arago-distro/recipes-connectivity/iproute2/iproute2_4.17.0.bbappend
-- 
2.7.4


