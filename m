Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 799D552A08
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:30 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00B6S5S5V690@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Jp0M15MC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=yUKrZNkp65XbX2WW9FQA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3C809161AEA;	Thu,
	2 Jul 2015 23:02:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:02:00 -0400
Message-id: <1435892533-6046-42-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 41/54] strongswan: move from extras to distro
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/strongswan/files/strongswan_libsecstore.patch         | 0
 .../recipes-support/strongswan/strongswan_%.bbappend                      | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arago-extras => meta-arago-distro}/recipes-support/strongswan/files/strongswan_libsecstore.patch (100%)
 rename meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend => meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend (100%)

diff --git a/meta-arago-extras/recipes-support/strongswan/files/strongswan_libsecstore.patch b/meta-arago-distro/recipes-support/strongswan/files/strongswan_libsecstore.patch
similarity index 100%
rename from meta-arago-extras/recipes-support/strongswan/files/strongswan_libsecstore.patch
rename to meta-arago-distro/recipes-support/strongswan/files/strongswan_libsecstore.patch
diff --git a/meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend b/meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-support/strongswan/strongswan_5.1.1.bbappend
rename to meta-arago-distro/recipes-support/strongswan/strongswan_%.bbappend
-- 
2.2.0


