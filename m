Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2324D52AA7
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 02:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1979620BA8;
	Fri,  3 Mar 2017 02:59:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DFHcZ_gi8QJE; Fri,  3 Mar 2017 02:59:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E23F92014F;
	Fri,  3 Mar 2017 02:59:06 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DF4E71623AB;
	Thu,  2 Mar 2017 21:59:05 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  2 Mar 2017 21:58:54 -0500
Message-Id: <1488509945-12853-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488509945-12853-1-git-send-email-denis@denix.org>
References: <1488509945-12853-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 01/12] libnl: update bbappend for 3.2.29
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
X-List-Received-Date: Fri, 03 Mar 2017 02:59:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../libnl/{libnl_3.2.28.bbappend => libnl_3.2.29.bbappend}                | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-support/libnl/{libnl_3.2.28.bbappend => libnl_3.2.29.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-support/libnl/libnl_3.2.28.bbappend b/meta-arago-distro/recipes-support/libnl/libnl_3.2.29.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-support/libnl/libnl_3.2.28.bbappend
rename to meta-arago-distro/recipes-support/libnl/libnl_3.2.29.bbappend
-- 
2.7.4


