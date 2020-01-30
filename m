Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1D3B8529D4
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2020 05:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5524240C06;
	Thu, 30 Jan 2020 05:12:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Gve-3DncnCQy; Thu, 30 Jan 2020 05:12:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 422FA40C0C;
	Thu, 30 Jan 2020 05:12:55 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 06A141711B3;
	Thu, 30 Jan 2020 00:12:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Jan 2020 00:12:47 -0500
Message-Id: <1580361172-41124-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580361172-41124-1-git-send-email-denis@denix.org>
References: <1580361172-41124-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 3/8] u-boot-k3-r5: rename against 2020.01 u-boot
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
X-List-Received-Date: Thu, 30 Jan 2020 05:14:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../u-boot/{u-boot-k3-r5_2019.01.bb => u-boot-k3-r5_2020.01.bb}           | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-bsp/u-boot/{u-boot-k3-r5_2019.01.bb => u-boot-k3-r5_2020.01.bb} (100%)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb
similarity index 100%
rename from meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2019.01.bb
rename to meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2020.01.bb
-- 
2.7.4


