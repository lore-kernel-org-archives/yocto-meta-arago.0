Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 858CE52C18
	for <meta-arago@arago-project.org>;
	Tue,  6 Apr 2021 16:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 550BE40C22;
	Tue,  6 Apr 2021 16:02:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id O1Xqx4lwKkUO; Tue,  6 Apr 2021 16:02:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3FC16409AE;
	Tue,  6 Apr 2021 16:02:19 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 052AC1745A6;
	Tue,  6 Apr 2021 12:02:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  6 Apr 2021 12:02:18 -0400
Message-Id: <1617724938-49136-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] README: update maintainers
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
X-List-Received-Date: Tue, 06 Apr 2021 16:01:59 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

Noticed maintainers list was outdated.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/README | 4 ++--
 meta-arago-extras/README | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index cf37459..39acade 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -34,5 +34,5 @@ layers: meta-arago-extras
 Send pull requests to meta-arago@arago-project.org
 
 Layer maintainers:
-Dan Murphy <dmurphy@ti.com>
-Denys Dmytriyenko <denys@ti.com>
+Praneeth Bajjuri <praneeth@ti.com>
+Denys Dmytriyenko <denys@konsulko.com>
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index b0eb76c..91d257e 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -29,5 +29,5 @@ revision: HEAD
 Send pull requests to meta-arago@arago-project.org
 
 Layer maintainers:
-Dan Murphy <dmurphy@ti.com>
-Denys Dmytriyenko <denys@ti.com>
+Praneeth Bajjuri <praneeth@ti.com>
+Denys Dmytriyenko <denys@konsulko.com>
-- 
2.7.4


