Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D44CE52988
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 02:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 41E6A40C04;
	Thu, 20 Feb 2020 02:48:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DSKfPnTvDvf5; Thu, 20 Feb 2020 02:48:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2466E40A41;
	Thu, 20 Feb 2020 02:48:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6EB4417440A;
	Wed, 19 Feb 2020 21:48:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Feb 2020 21:48:18 -0500
Message-Id: <1582166898-5295-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] machine_features_check: move class from distro to extras, as barcode-roi uses it
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
X-List-Received-Date: Thu, 20 Feb 2020 02:50:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../classes/machine_features_check.bbclass                                | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arago-distro => meta-arago-extras}/classes/machine_features_check.bbclass (100%)

diff --git a/meta-arago-distro/classes/machine_features_check.bbclass b/meta-arago-extras/classes/machine_features_check.bbclass
similarity index 100%
rename from meta-arago-distro/classes/machine_features_check.bbclass
rename to meta-arago-extras/classes/machine_features_check.bbclass
-- 
2.7.4


