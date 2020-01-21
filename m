Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id ABB1452994
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2020 21:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E3F8D40BF4;
	Tue, 21 Jan 2020 21:13:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8OdRxpwyzFyx; Tue, 21 Jan 2020 21:13:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C99D040AB5;
	Tue, 21 Jan 2020 21:13:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5A7821743A7;
	Tue, 21 Jan 2020 16:13:30 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 21 Jan 2020 16:13:26 -0500
Message-Id: <1579641208-15555-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH 1/3] mbedtls: make trivial bbappend version-agnostic
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
X-List-Received-Date: Tue, 21 Jan 2020 21:15:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../mbedtls/{mbedtls_2.16.2.bbappend => mbedtls_%.bbappend}               | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/mbedtls/{mbedtls_2.16.2.bbappend => mbedtls_%.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.16.2.bbappend b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_2.16.2.bbappend
rename to meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
-- 
2.7.4


