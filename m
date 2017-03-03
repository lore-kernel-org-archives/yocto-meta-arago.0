Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 0781552AE2
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 01:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E65C820BA8
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 01:27:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ouOCW7GfDxvp for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 01:27:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C495A20B64
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 01:27:15 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 11F701623A6;
	Thu,  2 Mar 2017 20:27:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  2 Mar 2017 20:27:01 -0500
Message-Id: <1488504432-12167-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488504432-12167-1-git-send-email-denis@denix.org>
References: <1488504432-12167-1-git-send-email-denis@denix.org>
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
X-List-Received-Date: Fri, 03 Mar 2017 01:27:17 -0000

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


